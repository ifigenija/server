--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-27 08:31:46 CEST

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
-- TOC entry 177 (class 1259 OID 15763328)
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
-- TOC entry 223 (class 1259 OID 15763843)
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
-- TOC entry 222 (class 1259 OID 15763826)
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
-- TOC entry 216 (class 1259 OID 15763738)
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
-- TOC entry 239 (class 1259 OID 15764092)
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
-- TOC entry 191 (class 1259 OID 15763506)
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
-- TOC entry 194 (class 1259 OID 15763540)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15763994)
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
-- TOC entry 186 (class 1259 OID 15763449)
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
-- TOC entry 224 (class 1259 OID 15763856)
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
-- TOC entry 210 (class 1259 OID 15763673)
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
-- TOC entry 189 (class 1259 OID 15763486)
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
-- TOC entry 193 (class 1259 OID 15763534)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15763466)
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
-- TOC entry 199 (class 1259 OID 15763588)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15764073)
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
-- TOC entry 238 (class 1259 OID 15764085)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15764107)
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
-- TOC entry 203 (class 1259 OID 15763613)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15763423)
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
-- TOC entry 178 (class 1259 OID 15763337)
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
-- TOC entry 179 (class 1259 OID 15763348)
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
-- TOC entry 174 (class 1259 OID 15763302)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15763321)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15763620)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15763653)
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
-- TOC entry 219 (class 1259 OID 15763777)
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
-- TOC entry 181 (class 1259 OID 15763381)
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
-- TOC entry 183 (class 1259 OID 15763415)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15763594)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15763400)
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
-- TOC entry 188 (class 1259 OID 15763478)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15763606)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15763955)
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
-- TOC entry 227 (class 1259 OID 15763965)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15763911)
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
-- TOC entry 228 (class 1259 OID 15763973)
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
-- TOC entry 206 (class 1259 OID 15763635)
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
-- TOC entry 198 (class 1259 OID 15763579)
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
-- TOC entry 197 (class 1259 OID 15763569)
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
-- TOC entry 218 (class 1259 OID 15763766)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15763705)
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
-- TOC entry 171 (class 1259 OID 15763273)
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
-- TOC entry 170 (class 1259 OID 15763271)
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
-- TOC entry 207 (class 1259 OID 15763647)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15763311)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15763295)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15763661)
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
-- TOC entry 201 (class 1259 OID 15763600)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15763545)
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
-- TOC entry 233 (class 1259 OID 15764014)
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
-- TOC entry 232 (class 1259 OID 15764006)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15764001)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15763715)
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
-- TOC entry 180 (class 1259 OID 15763373)
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
-- TOC entry 196 (class 1259 OID 15763555)
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
-- TOC entry 217 (class 1259 OID 15763755)
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
-- TOC entry 229 (class 1259 OID 15763983)
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
-- TOC entry 185 (class 1259 OID 15763435)
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
-- TOC entry 172 (class 1259 OID 15763282)
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
-- TOC entry 221 (class 1259 OID 15763803)
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
-- TOC entry 190 (class 1259 OID 15763497)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15763627)
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
-- TOC entry 215 (class 1259 OID 15763729)
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
-- TOC entry 235 (class 1259 OID 15764053)
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
-- TOC entry 234 (class 1259 OID 15764025)
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
-- TOC entry 236 (class 1259 OID 15764065)
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
-- TOC entry 212 (class 1259 OID 15763698)
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
-- TOC entry 192 (class 1259 OID 15763529)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15763793)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15763688)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15763276)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 15763328)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15763843)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55de-aed0-2df8-65fd32c8ff81	000d0000-55de-aed0-fe91-f369f836cc4e	\N	00090000-55de-aed0-a310-c79bbc179e60	000b0000-55de-aed0-2e01-fabd9dc6a58e	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55de-aed0-89be-f6caab40b593	000d0000-55de-aed0-3617-dad492e4dd11	00100000-55de-aed0-deab-b0a271a95854	00090000-55de-aed0-3008-35a5b55da157	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55de-aed0-6565-4aefb896b174	000d0000-55de-aed0-47af-126d86d7baaf	00100000-55de-aed0-5723-f1560be19cb3	00090000-55de-aed0-a619-18ea1dcc62f4	\N	0003	t	\N	2015-08-27	\N	2	\N	\N	f	f
000c0000-55de-aed0-d794-c5cef5309d10	000d0000-55de-aed0-ac9e-83bf619c41c5	\N	00090000-55de-aed0-27d4-b81f7e6c65b1	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55de-aed0-8657-1d62e3b5fa40	000d0000-55de-aed0-b2a3-8ec2e2e73579	\N	00090000-55de-aed0-d288-6550bd9d8592	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55de-aed0-4f7e-d25a0db70da9	000d0000-55de-aed0-27a4-c84cb1a9be08	\N	00090000-55de-aed0-fedc-f4429e1fa58f	000b0000-55de-aed0-2a0d-6eb1f1f56f94	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55de-aed0-d6f1-5eac1c915e63	000d0000-55de-aed0-cca0-6bad9d68a12e	00100000-55de-aed0-8047-2ce817197a91	00090000-55de-aed0-2538-d5355e59ee6e	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55de-aed0-755b-907f47568d20	000d0000-55de-aed0-4ce7-13dfabec34ee	\N	00090000-55de-aed0-4a18-f96ef5e5d3d0	000b0000-55de-aed0-845d-0b62aa07731b	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55de-aed0-7f9d-73fa7b7eb02c	000d0000-55de-aed0-cca0-6bad9d68a12e	00100000-55de-aed0-f071-2c5f545ecb69	00090000-55de-aed0-7eed-9fd9192ee7a9	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55de-aed0-4773-e3da07cbfbb4	000d0000-55de-aed0-cca0-6bad9d68a12e	00100000-55de-aed0-f581-03f1eabf251d	00090000-55de-aed0-1ea8-a4424e33bd26	\N	0010	t	\N	2015-08-27	\N	16	\N	\N	f	t
000c0000-55de-aed0-8d9b-d3661dafdc00	000d0000-55de-aed0-cca0-6bad9d68a12e	00100000-55de-aed0-d04b-44324a75a258	00090000-55de-aed0-4e2d-cadccf9ba3fe	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 15763826)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15763738)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55de-aed0-6ca4-015782267aa4	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55de-aed0-af76-75b9a4e5ec84	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55de-aed0-1a3a-2b1053121fc8	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 15764092)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15763506)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55de-aed0-d644-55aa713c3490	\N	\N	00200000-55de-aed0-06e0-45faaf0758f2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55de-aed0-5ddc-fe1d25b54ded	\N	\N	00200000-55de-aed0-02f1-84280082a522	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55de-aed0-692f-258f52ddb2d7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55de-aed0-e188-eb2892167f0d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55de-aed0-f5c6-e3d596b7bfab	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 15763540)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 15763994)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15763449)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55de-aecf-cb6a-ea194723f2d8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55de-aecf-addb-cf8547559824	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55de-aecf-6df1-9e14cfb34520	AL	ALB	008	Albania 	Albanija	\N
00040000-55de-aecf-af8d-c18e23f3135e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55de-aecf-ef6c-c57c7534997a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55de-aecf-d3d0-161c169fc9b7	AD	AND	020	Andorra 	Andora	\N
00040000-55de-aecf-19ab-e593aa33987c	AO	AGO	024	Angola 	Angola	\N
00040000-55de-aecf-8fa1-821eb5342951	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55de-aecf-82ca-3376febafa8b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55de-aecf-4485-74bf122eef3b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55de-aecf-b6c0-7c0504b4430f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55de-aecf-0dea-32ee3ef30318	AM	ARM	051	Armenia 	Armenija	\N
00040000-55de-aecf-666d-eab273cb4513	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55de-aecf-c6f6-a2d6f176fb70	AU	AUS	036	Australia 	Avstralija	\N
00040000-55de-aecf-faea-4282782d5b57	AT	AUT	040	Austria 	Avstrija	\N
00040000-55de-aecf-747e-889475a7b90e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55de-aecf-bf54-f213bbe30973	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55de-aecf-f1c9-8a7aed58a39f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55de-aecf-80d5-36349467f26a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55de-aecf-c06d-3ed0a35b50f4	BB	BRB	052	Barbados 	Barbados	\N
00040000-55de-aecf-c8ed-cc9bd1315351	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55de-aecf-b9f8-6aa000c7a5f6	BE	BEL	056	Belgium 	Belgija	\N
00040000-55de-aecf-9519-b210a7acaf66	BZ	BLZ	084	Belize 	Belize	\N
00040000-55de-aecf-83be-d2bb68d8b1fb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55de-aecf-943c-826f383c5b67	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55de-aecf-b035-d59f47cdeee1	BT	BTN	064	Bhutan 	Butan	\N
00040000-55de-aecf-b9b3-374512782a7d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55de-aecf-9e05-d411a6803f50	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55de-aecf-330f-a90e8d8cddcb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55de-aecf-6893-930497726008	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55de-aecf-6893-736c7f1a2710	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55de-aecf-35ff-613c1730a41a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55de-aecf-46b9-d454a7ba584b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55de-aecf-25a7-49c941fe926e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55de-aecf-6a44-c8b9bc3fe8f7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55de-aecf-8356-a6c70f014843	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55de-aecf-7620-8eed5a94cc29	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55de-aecf-d5c3-ac839f1e18dd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55de-aecf-7e51-4d2caeb5f03e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55de-aecf-1410-518ab88feec3	CA	CAN	124	Canada 	Kanada	\N
00040000-55de-aecf-5203-6d422596abbe	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55de-aecf-f94f-98715585750b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55de-aecf-57bc-5f127951eb47	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55de-aecf-b83e-272925af31dc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55de-aecf-4eaa-1f9ced5958fd	CL	CHL	152	Chile 	Čile	\N
00040000-55de-aecf-6930-ffb175908497	CN	CHN	156	China 	Kitajska	\N
00040000-55de-aecf-28e6-9b7b7470a8e0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55de-aecf-3288-c005d1cc3b39	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55de-aecf-83c8-a13348491474	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55de-aecf-15ab-e80b4c6fc2f5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55de-aecf-fce7-765d8ae9b165	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55de-aecf-4f3c-86d98cca38f6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55de-aecf-9c75-48d7fa783c49	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55de-aecf-0267-c0c1c6178c73	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55de-aecf-a629-5e1ed2ff5d45	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55de-aecf-b4c7-cf202f2c2ee5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55de-aecf-39af-3e682571c765	CU	CUB	192	Cuba 	Kuba	\N
00040000-55de-aecf-d3fc-83a0e0d8434e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55de-aecf-5647-3054831dfe27	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55de-aecf-464e-8577913b1e86	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55de-aecf-baaa-e8769f148460	DK	DNK	208	Denmark 	Danska	\N
00040000-55de-aecf-b7cb-bcacb003dda5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55de-aecf-b97c-34083fbd9647	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55de-aecf-cff0-497e9e270b6b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55de-aecf-967f-5b5b005d2c25	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55de-aecf-015c-9fada8cf859c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55de-aecf-068c-6fa8e35e2916	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55de-aecf-5d24-d3c34fdd9151	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55de-aecf-3edb-24d08cb8484d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55de-aecf-deef-c0be888feee0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55de-aecf-0088-889efaaeb929	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55de-aecf-7a50-52fa57340782	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55de-aecf-9651-889a859707c5	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55de-aecf-4b8d-265036d1b99c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55de-aecf-88f2-c0e41832b869	FI	FIN	246	Finland 	Finska	\N
00040000-55de-aecf-9b15-8a0fecdef0af	FR	FRA	250	France 	Francija	\N
00040000-55de-aecf-c68c-d74f2f7ceca3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55de-aecf-399b-d39fe7ab49d3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55de-aecf-799b-8943765917cf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55de-aecf-1ccc-e5c75759dd14	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55de-aecf-3c73-ee09db5ccd9f	GA	GAB	266	Gabon 	Gabon	\N
00040000-55de-aecf-80cf-2b4f71c8cf6a	GM	GMB	270	Gambia 	Gambija	\N
00040000-55de-aecf-44c4-f1d9a9a6218b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55de-aecf-3bd0-d718eabaaa5f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55de-aecf-5809-cdb27c4a7be7	GH	GHA	288	Ghana 	Gana	\N
00040000-55de-aecf-1cad-8db187024bf7	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55de-aecf-fc26-d29fde61a255	GR	GRC	300	Greece 	Grčija	\N
00040000-55de-aecf-0d74-8ff0531164e2	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55de-aecf-3335-fa7b0b631869	GD	GRD	308	Grenada 	Grenada	\N
00040000-55de-aecf-1cad-32d775e04200	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55de-aecf-73d6-19cf7b96ccf7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55de-aecf-e86c-90c0b599950c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55de-aecf-6ddc-2610387cb761	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55de-aecf-057d-9420cac04ba2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55de-aecf-ef8f-4aeb6236897f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55de-aecf-4893-8ff2b798bdbf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55de-aecf-67d8-b75fc802e3f0	HT	HTI	332	Haiti 	Haiti	\N
00040000-55de-aecf-1f27-9d0c6b72bb3e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55de-aecf-9f92-5e392c7252a7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55de-aecf-594d-0c60be990e2c	HN	HND	340	Honduras 	Honduras	\N
00040000-55de-aecf-925f-bcf918c099f8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55de-aecf-f45e-e9e05f6dd105	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55de-aecf-e6fb-13d2c19270a0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55de-aecf-1afb-b5745ff38c9b	IN	IND	356	India 	Indija	\N
00040000-55de-aecf-def2-f4638e40e785	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55de-aecf-4600-45b5314deba4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55de-aecf-b032-ff2ff85162c3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55de-aecf-6476-b252536fccf1	IE	IRL	372	Ireland 	Irska	\N
00040000-55de-aecf-41e3-455fb3470058	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55de-aecf-c8d7-dea773409e91	IL	ISR	376	Israel 	Izrael	\N
00040000-55de-aecf-5578-d85399e43ade	IT	ITA	380	Italy 	Italija	\N
00040000-55de-aecf-09fc-76d2b5692aa2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55de-aecf-a6e9-67c7b6c11b5b	JP	JPN	392	Japan 	Japonska	\N
00040000-55de-aecf-15f8-195ef835a5b3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55de-aecf-050d-efa72b6edfa3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55de-aecf-3b3f-730e03b0f42c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55de-aecf-7d99-25e0beb6671f	KE	KEN	404	Kenya 	Kenija	\N
00040000-55de-aecf-e1d0-ad9d38844f86	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55de-aecf-8a5f-581f10a6ee7e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55de-aecf-f0ff-8882838d2a56	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55de-aecf-e7a9-672b8f10a569	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55de-aecf-d096-fd2b6813f2be	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55de-aecf-eabb-2f9474265e26	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55de-aecf-7ffb-12d9224bdf27	LV	LVA	428	Latvia 	Latvija	\N
00040000-55de-aecf-4393-6e21ebc6f780	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55de-aecf-171e-36a43cb41a89	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55de-aecf-1e18-7a64589c43de	LR	LBR	430	Liberia 	Liberija	\N
00040000-55de-aecf-6e2d-47a8c2cb9dd8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55de-aecf-4ad1-0942fc824cae	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55de-aecf-7263-e01b85cfdd7b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55de-aecf-6076-fe22bdbe9a64	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55de-aecf-6dfa-535efe447fea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55de-aecf-d399-4f71c482e0a1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55de-aecf-9667-080425f73d0d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55de-aecf-4c04-3ecfa678fda4	MW	MWI	454	Malawi 	Malavi	\N
00040000-55de-aecf-c442-513286c21ea1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55de-aecf-d4f0-7ec15470a06b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55de-aecf-603c-c825a3ab9c75	ML	MLI	466	Mali 	Mali	\N
00040000-55de-aecf-012b-4a43137c3119	MT	MLT	470	Malta 	Malta	\N
00040000-55de-aecf-db6d-db5863959ba2	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55de-aecf-90a4-d47a8bbe4605	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55de-aecf-e421-7c6d6e6f567b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55de-aecf-7e84-00f55c9222d4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55de-aecf-9797-82067e8a2565	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55de-aecf-fa27-f098a3395e61	MX	MEX	484	Mexico 	Mehika	\N
00040000-55de-aecf-b900-51b8778b4b2b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55de-aecf-a985-58949e7621e8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55de-aecf-931c-5c1ef4fa5a8f	MC	MCO	492	Monaco 	Monako	\N
00040000-55de-aecf-3acf-551a5386f227	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55de-aecf-4aa7-3576606b95c7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55de-aecf-79ec-53a32fb1c847	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55de-aecf-c7cd-f2e1c893bd0f	MA	MAR	504	Morocco 	Maroko	\N
00040000-55de-aecf-b1c1-af3fa1c45b08	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55de-aecf-d128-ad235297c086	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55de-aecf-db24-dd579752d82b	NA	NAM	516	Namibia 	Namibija	\N
00040000-55de-aecf-be35-2052577f2969	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55de-aecf-f057-d876f212edd2	NP	NPL	524	Nepal 	Nepal	\N
00040000-55de-aecf-8fd2-a0d5b2d0c7fa	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55de-aecf-84c2-5b15df27f958	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55de-aecf-ce91-d5962d1909ee	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55de-aecf-0e39-60768d9d7e8f	NE	NER	562	Niger 	Niger 	\N
00040000-55de-aecf-7096-3b7e3f1b53b3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55de-aecf-649c-cb1e4d3ec4ee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55de-aecf-2d09-d0cee87a9744	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55de-aecf-022e-a3dfe7f63a29	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55de-aecf-5d6d-2ab78ce6ab04	NO	NOR	578	Norway 	Norveška	\N
00040000-55de-aecf-644b-03b18a46e0bb	OM	OMN	512	Oman 	Oman	\N
00040000-55de-aecf-e19d-c3ac7b63ed0b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55de-aecf-55f7-ba492703ff1b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55de-aecf-752c-78ed4a3172e1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55de-aecf-0984-6ec5a9c8c3ce	PA	PAN	591	Panama 	Panama	\N
00040000-55de-aecf-5b5d-106e5008c18e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55de-aecf-6648-c95e56dc8e01	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55de-aecf-f13c-57bf03836c72	PE	PER	604	Peru 	Peru	\N
00040000-55de-aecf-136a-971d51374b49	PH	PHL	608	Philippines 	Filipini	\N
00040000-55de-aecf-0c4c-f6775f0ea462	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55de-aecf-72cb-ffd777a9acc1	PL	POL	616	Poland 	Poljska	\N
00040000-55de-aecf-3ea8-f3b6f3f69efd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55de-aecf-446b-e0ed49e5f164	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55de-aecf-2853-fa16a62093a5	QA	QAT	634	Qatar 	Katar	\N
00040000-55de-aecf-5117-1a71281ee38c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55de-aecf-27b8-5f4f17dd10d4	RO	ROU	642	Romania 	Romunija	\N
00040000-55de-aecf-99fc-fa9e93f92879	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55de-aecf-1a0b-285754fba74f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55de-aecf-a848-f497a1188c2c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55de-aecf-466a-99bc152e1c1e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55de-aecf-ebde-3bdbe16ae9a4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55de-aecf-25af-b755ab593393	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55de-aecf-ee26-82c4ab1bcea9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55de-aecf-4500-762e9b3b2d6e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55de-aecf-204b-061b696d68b9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55de-aecf-4cae-41aeabebd15a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55de-aecf-2ce0-ef4fda9637cd	SM	SMR	674	San Marino 	San Marino	\N
00040000-55de-aecf-7034-e612a8db2f27	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55de-aecf-0b1d-c1754ea2ff41	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55de-aecf-55d0-dc4f48fe0059	SN	SEN	686	Senegal 	Senegal	\N
00040000-55de-aecf-afc6-a12b6804a0ec	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55de-aecf-a884-a1ffb8cb12db	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55de-aecf-3d22-0d053213be70	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55de-aecf-cf90-a4d2d878621f	SG	SGP	702	Singapore 	Singapur	\N
00040000-55de-aecf-27d8-d71ca677ffd8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55de-aecf-6d05-25a5aea3ae10	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55de-aecf-541a-9ddc7698c50c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55de-aecf-2569-44cd0cd248f5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55de-aecf-9244-b95db0c99bfd	SO	SOM	706	Somalia 	Somalija	\N
00040000-55de-aecf-ddfb-125c5f95b92e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55de-aecf-b975-73f81289f2f3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55de-aecf-363d-6f2e39f0f78e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55de-aecf-cdb9-651b058a2901	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55de-aecf-2d05-5951bc3b52d1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55de-aecf-d4c0-cee02cbb321f	SD	SDN	729	Sudan 	Sudan	\N
00040000-55de-aecf-d00c-e83af4d06639	SR	SUR	740	Suriname 	Surinam	\N
00040000-55de-aecf-a676-caeef169e3d4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55de-aecf-b1d2-37e8eb0aaa5d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55de-aecf-077d-80f6053db6a5	SE	SWE	752	Sweden 	Švedska	\N
00040000-55de-aecf-4653-f25d9508483f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55de-aecf-2b97-4f2bf8060134	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55de-aecf-3c89-6ae989923373	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55de-aecf-5f9e-c5d418787af6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55de-aecf-98df-3e5c2a80cd30	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55de-aecf-6459-06261d33e629	TH	THA	764	Thailand 	Tajska	\N
00040000-55de-aecf-8140-fb8fe12996bf	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55de-aecf-fd41-0ff095180180	TG	TGO	768	Togo 	Togo	\N
00040000-55de-aecf-82c2-6d52136a58fe	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55de-aecf-9017-af70a1692c30	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55de-aecf-11a7-01a623b416b6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55de-aecf-c9dc-ea7b1966a537	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55de-aecf-5cf6-ff286ae7ad5a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55de-aecf-e022-50a02df8ef9f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55de-aecf-800e-75544f38779b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55de-aecf-14fd-dcfcec9bd2f5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55de-aecf-c106-f04511c62a29	UG	UGA	800	Uganda 	Uganda	\N
00040000-55de-aecf-81b9-209a097bf7ba	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55de-aecf-8d32-8bbc6bf9bd19	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55de-aecf-a381-02b83042e258	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55de-aecf-9225-409200551b07	US	USA	840	United States 	Združene države Amerike	\N
00040000-55de-aecf-d66a-ac04311e0804	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55de-aecf-9dc5-a019309c841b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55de-aecf-5c78-86935d91f68f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55de-aecf-90cd-705343140b27	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55de-aecf-b668-ccf41dd18058	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55de-aecf-2f2c-2345590f9464	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55de-aecf-a249-7b98a5c8aa74	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55de-aecf-36ff-752796b44c08	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55de-aecf-2ef0-3713f43263a0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55de-aecf-ed83-894cc0c46dbc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55de-aecf-b17e-ccb203d68415	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55de-aecf-273f-260b43fbcfe2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55de-aecf-5193-7801b6dbe2e1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 15763856)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55de-aed0-17ee-c1bcf492abef	000e0000-55de-aed0-6b8f-3f89de804c65	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-aecf-4056-c78f77b96f74	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55de-aed0-49fd-620817044a1f	000e0000-55de-aed0-e5a7-d4184130c344	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-aecf-322d-abd0c6a1242f	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55de-aed0-1bfc-01fa4cd35aab	000e0000-55de-aed0-bcb5-231e90a69ed5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-aecf-4056-c78f77b96f74	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55de-aed0-edb7-30dacda85ff8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55de-aed0-1561-6066cafa3461	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 15763673)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55de-aed0-cca0-6bad9d68a12e	000e0000-55de-aed0-e5a7-d4184130c344	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55de-aecf-0657-edab8e74b1c1
000d0000-55de-aed0-fe91-f369f836cc4e	000e0000-55de-aed0-e5a7-d4184130c344	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55de-aecf-0657-edab8e74b1c1
000d0000-55de-aed0-3617-dad492e4dd11	000e0000-55de-aed0-e5a7-d4184130c344	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55de-aecf-acd4-4011347d0217
000d0000-55de-aed0-47af-126d86d7baaf	000e0000-55de-aed0-e5a7-d4184130c344	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55de-aecf-4f46-920e352cc84a
000d0000-55de-aed0-ac9e-83bf619c41c5	000e0000-55de-aed0-e5a7-d4184130c344	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55de-aecf-9250-7f1c34fef115
000d0000-55de-aed0-b2a3-8ec2e2e73579	000e0000-55de-aed0-e5a7-d4184130c344	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55de-aecf-9250-7f1c34fef115
000d0000-55de-aed0-27a4-c84cb1a9be08	000e0000-55de-aed0-e5a7-d4184130c344	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55de-aecf-0657-edab8e74b1c1
000d0000-55de-aed0-4ce7-13dfabec34ee	000e0000-55de-aed0-e5a7-d4184130c344	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55de-aecf-4d4e-f629191e11d3
\.


--
-- TOC entry 2921 (class 0 OID 15763486)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15763534)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15763466)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55de-aed0-1d97-08b017267602	00080000-55de-aed0-d3a7-ae391055312b	00090000-55de-aed0-1ea8-a4424e33bd26	AK		
\.


--
-- TOC entry 2931 (class 0 OID 15763588)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 15764073)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15764085)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15764107)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15763613)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15763423)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55de-aecf-b0a6-af0c122252cf	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55de-aecf-185b-ca06b559ff55	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55de-aecf-4d4d-6327666f7f21	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55de-aecf-d66a-577e76c7e401	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55de-aecf-d31a-3f88dedc1c53	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55de-aecf-cd73-8c566372cf3b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55de-aecf-2ec2-014bd3fff0e8	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55de-aecf-6e0c-360992f2498f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55de-aecf-5e94-53141073014e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55de-aecf-b971-023cabe8456f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55de-aecf-937f-21aa46e61420	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55de-aecf-e174-c0fe1f246087	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55de-aecf-6de8-9161828a682f	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55de-aed0-6f69-89d6bb6834dc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55de-aed0-6b10-1567de655fc1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55de-aed0-bf33-ba81e55f648d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55de-aed0-c235-09600c13661b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55de-aed0-2438-a13978ddbbb8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55de-aed1-20fc-f9bbbac508d0	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 15763337)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55de-aed0-b402-c66f213883fc	00000000-55de-aed0-6f69-89d6bb6834dc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55de-aed0-632a-6777602f888d	00000000-55de-aed0-6f69-89d6bb6834dc	00010000-55de-aecf-0ded-028385af39f4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55de-aed0-d26b-1b4c5402e1a8	00000000-55de-aed0-6b10-1567de655fc1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 15763348)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55de-aed0-a310-c79bbc179e60	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55de-aed0-27d4-b81f7e6c65b1	00010000-55de-aed0-9f24-53bd6fa2f07c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55de-aed0-a619-18ea1dcc62f4	00010000-55de-aed0-986a-f11dd7894cb6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55de-aed0-7eed-9fd9192ee7a9	00010000-55de-aed0-76cc-6edaa73b8593	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55de-aed0-cf9f-946d5a69ba2b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55de-aed0-fedc-f4429e1fa58f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55de-aed0-4e2d-cadccf9ba3fe	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55de-aed0-2538-d5355e59ee6e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55de-aed0-1ea8-a4424e33bd26	00010000-55de-aed0-2139-0ba0c9998893	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55de-aed0-3008-35a5b55da157	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55de-aed0-e450-c42bbe892362	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55de-aed0-d288-6550bd9d8592	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55de-aed0-4a18-f96ef5e5d3d0	00010000-55de-aed0-8f19-1e25d123b57a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 15763302)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55de-aecf-d004-276cd06758df	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55de-aecf-1823-759f20ac443f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55de-aecf-6648-7ee8b87e0390	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55de-aecf-477c-730056fc187d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55de-aecf-bc96-c546f48a9875	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55de-aecf-b89f-12eb275fa250	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55de-aecf-8270-15573719da86	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55de-aecf-7b5e-32876de495f1	Abonma-read	Abonma - branje	f
00030000-55de-aecf-d612-7d6b4b2abf49	Abonma-write	Abonma - spreminjanje	f
00030000-55de-aecf-04a6-010e2408434d	Alternacija-read	Alternacija - branje	f
00030000-55de-aecf-1c1b-807f291b7d87	Alternacija-write	Alternacija - spreminjanje	f
00030000-55de-aecf-8e4a-40cf93ccc3ba	Arhivalija-read	Arhivalija - branje	f
00030000-55de-aecf-6942-073dc1e362c7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55de-aecf-5160-ef213744df1d	Besedilo-read	Besedilo - branje	f
00030000-55de-aecf-3917-5da656bce2b4	Besedilo-write	Besedilo - spreminjanje	f
00030000-55de-aecf-4a51-8706209bda01	DogodekIzven-read	DogodekIzven - branje	f
00030000-55de-aecf-8d40-dcd76b3e1078	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55de-aecf-7dbd-bba18826c04c	Dogodek-read	Dogodek - branje	f
00030000-55de-aecf-7c55-3c3fe28ca035	Dogodek-write	Dogodek - spreminjanje	f
00030000-55de-aecf-48fc-67517593fc08	DrugiVir-read	DrugiVir - branje	f
00030000-55de-aecf-ff71-ab364d6f6021	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55de-aecf-a296-6872488e172c	Drzava-read	Drzava - branje	f
00030000-55de-aecf-0cef-c707b7ed1a53	Drzava-write	Drzava - spreminjanje	f
00030000-55de-aecf-b5f1-835b7d1f4501	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55de-aecf-80a8-c5d32de3e422	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55de-aecf-f93f-669c3cf186fd	Funkcija-read	Funkcija - branje	f
00030000-55de-aecf-0c48-6c8aedb3e5ae	Funkcija-write	Funkcija - spreminjanje	f
00030000-55de-aecf-aeb7-ab2238f2879a	Gostovanje-read	Gostovanje - branje	f
00030000-55de-aecf-4b48-b30600dccc6b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55de-aecf-f43e-176edc1e01f8	Gostujoca-read	Gostujoca - branje	f
00030000-55de-aecf-3d60-28ab91d57836	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55de-aecf-d8c7-60becb33d6de	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55de-aecf-518e-f15e84769cb6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55de-aecf-0bb3-2529df4f6ab8	Kupec-read	Kupec - branje	f
00030000-55de-aecf-5016-d697bd1186d4	Kupec-write	Kupec - spreminjanje	f
00030000-55de-aecf-511e-3ad06426fd17	NacinPlacina-read	NacinPlacina - branje	f
00030000-55de-aecf-7d4a-55be46661df6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55de-aecf-43d1-5674881538eb	Option-read	Option - branje	f
00030000-55de-aecf-5e83-3ff6bba55009	Option-write	Option - spreminjanje	f
00030000-55de-aecf-ca0b-0f040a26398d	OptionValue-read	OptionValue - branje	f
00030000-55de-aecf-a780-1de59e5a4c03	OptionValue-write	OptionValue - spreminjanje	f
00030000-55de-aecf-c2df-cbddc9b60780	Oseba-read	Oseba - branje	f
00030000-55de-aecf-db37-eff6f16cdb1d	Oseba-write	Oseba - spreminjanje	f
00030000-55de-aecf-d2ca-76edfadc783c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55de-aecf-c202-e5443df20271	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55de-aecf-e71d-330f06887d0f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55de-aecf-fc00-59ba9f151562	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55de-aecf-0e82-d4e12aac950b	Pogodba-read	Pogodba - branje	f
00030000-55de-aecf-55a8-12138b2f24ae	Pogodba-write	Pogodba - spreminjanje	f
00030000-55de-aecf-3565-88652a028d2a	Popa-read	Popa - branje	f
00030000-55de-aecf-cac9-4bc63a4aa2c6	Popa-write	Popa - spreminjanje	f
00030000-55de-aecf-a354-9be2bbf1a439	Posta-read	Posta - branje	f
00030000-55de-aecf-0eb1-3a7bfe5be88f	Posta-write	Posta - spreminjanje	f
00030000-55de-aecf-3caa-39e8ff9c532c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55de-aecf-7b72-82b673cf80eb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55de-aecf-8bd2-5022f3c88310	PostniNaslov-read	PostniNaslov - branje	f
00030000-55de-aecf-d518-723202666b74	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55de-aecf-a96f-6cff6cabba53	Predstava-read	Predstava - branje	f
00030000-55de-aecf-0848-71d25e7747fc	Predstava-write	Predstava - spreminjanje	f
00030000-55de-aecf-ad57-40a5bec5ea8c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55de-aecf-335f-cacbc39ebd4d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55de-aecf-2194-1d244161a018	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55de-aecf-63fa-3e15eacf9ffb	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55de-aecf-d3eb-56c30ac4dc3e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55de-aecf-bdfd-20d7a54c2c2b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55de-aecf-5445-f0ddf50546e0	ProgramDela-read	ProgramDela - branje	f
00030000-55de-aecf-dbbc-87a94712b516	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55de-aecf-24d2-de69f92dad81	ProgramFestival-read	ProgramFestival - branje	f
00030000-55de-aecf-9fe3-fd2a0aa052d7	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55de-aecf-8a4e-9f6ddbcc40c9	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55de-aecf-00a3-b7c668e5742c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55de-aecf-91f5-c5f255ddd42a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55de-aecf-2a50-841c09327a22	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55de-aecf-573b-95496786d336	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55de-aecf-691c-e325b43524fd	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55de-aecf-5934-0d259f9947e9	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55de-aecf-20de-992d3253fded	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55de-aecf-a85b-e34bd96447d9	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55de-aecf-ffb3-6c39abb6c2c4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55de-aecf-1d0f-fb8872dc8aa1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55de-aecf-707a-cdd521ca1268	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55de-aecf-4e4b-fbd85dde74bc	ProgramRazno-read	ProgramRazno - branje	f
00030000-55de-aecf-c543-2863ec5bbb71	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55de-aecf-6674-caf47816ebab	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55de-aecf-2875-13b3551b3fef	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55de-aecf-d995-eb844cb02aae	Prostor-read	Prostor - branje	f
00030000-55de-aecf-9c71-8f0d16339fc5	Prostor-write	Prostor - spreminjanje	f
00030000-55de-aecf-06b2-de84f3785c6f	Racun-read	Racun - branje	f
00030000-55de-aecf-7291-5bc694aea936	Racun-write	Racun - spreminjanje	f
00030000-55de-aecf-9d8e-298c8e70360e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55de-aecf-937a-725bda64713d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55de-aecf-c828-04aa7a66869a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55de-aecf-e630-5b556f30b092	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55de-aecf-cf72-c87a25afb13a	Rekvizit-read	Rekvizit - branje	f
00030000-55de-aecf-5c42-bfcf00237460	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55de-aecf-152d-75bd40258282	Revizija-read	Revizija - branje	f
00030000-55de-aecf-fb10-c36aa2b8efcf	Revizija-write	Revizija - spreminjanje	f
00030000-55de-aecf-3baa-4a8a920304e0	Rezervacija-read	Rezervacija - branje	f
00030000-55de-aecf-ac45-a8ded22c2ab7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55de-aecf-1ad9-de06e077b4b5	SedezniRed-read	SedezniRed - branje	f
00030000-55de-aecf-cb05-f81ae011f87b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55de-aecf-8684-ddcf07fe90e5	Sedez-read	Sedez - branje	f
00030000-55de-aecf-dc9d-44d0f4f3705b	Sedez-write	Sedez - spreminjanje	f
00030000-55de-aecf-1681-1f6c7925c78d	Sezona-read	Sezona - branje	f
00030000-55de-aecf-6895-f63e9c182bbf	Sezona-write	Sezona - spreminjanje	f
00030000-55de-aecf-70fe-2922fac2f261	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55de-aecf-bf85-89e74c643c7a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55de-aecf-33b9-9345e04832c0	Stevilcenje-read	Stevilcenje - branje	f
00030000-55de-aecf-fcc8-9ae3496fe60a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55de-aecf-aa96-bf08eab8679e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55de-aecf-0de6-5889791adf20	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55de-aecf-35af-eb4118ace15f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55de-aecf-f02f-a94cc3c5695a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55de-aecf-01f4-fd818bbf0e19	Telefonska-read	Telefonska - branje	f
00030000-55de-aecf-42de-dc2933d5ccea	Telefonska-write	Telefonska - spreminjanje	f
00030000-55de-aecf-6558-bff18d6631ff	TerminStoritve-read	TerminStoritve - branje	f
00030000-55de-aecf-2711-a7543598e3be	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55de-aecf-2b0c-e66607d8d1fd	TipFunkcije-read	TipFunkcije - branje	f
00030000-55de-aecf-3220-d66deaba40b6	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55de-aecf-658f-76530f2b23a4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55de-aecf-3222-a5c2d9cb71a2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55de-aecf-a1e1-d78ff17d00d7	Trr-read	Trr - branje	f
00030000-55de-aecf-a3a8-40c7ddbec997	Trr-write	Trr - spreminjanje	f
00030000-55de-aecf-6200-f687eb0c5982	Uprizoritev-read	Uprizoritev - branje	f
00030000-55de-aecf-f746-fd74be87aedc	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55de-aecf-4ebc-6b91b1a92bb4	Vaja-read	Vaja - branje	f
00030000-55de-aecf-fed2-c958960a266e	Vaja-write	Vaja - spreminjanje	f
00030000-55de-aecf-5c08-8165ca4a479d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55de-aecf-870b-f05e4ec32d3a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55de-aecf-fe1a-66756e30d4fe	VrstaStroska-read	VrstaStroska - branje	f
00030000-55de-aecf-a9a6-e3a28a5d0fe7	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55de-aecf-a631-a87c98ef8d77	Zaposlitev-read	Zaposlitev - branje	f
00030000-55de-aecf-7886-1a0ae8b7a038	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55de-aecf-c54e-aebb74d91b85	Zasedenost-read	Zasedenost - branje	f
00030000-55de-aecf-c49e-951192522fd5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55de-aecf-bf9a-df4aef6162aa	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55de-aecf-5828-7fd3b1d1919d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55de-aecf-d074-50ca7dba6744	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55de-aecf-ae8f-53e37f882664	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55de-aecf-71e1-647095489be1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55de-aecf-2561-7458104f48bf	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55de-aecf-495d-fc0c69207216	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55de-aecf-b0bb-322be943683a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55de-aecf-66ba-b2ed2cf66a5c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55de-aecf-f1cd-4e0ab1cd7878	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55de-aecf-30ce-fac3c3208314	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55de-aecf-9ef3-96eb5121dddb	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55de-aecf-8681-126d61d15acc	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55de-aecf-71a1-ee33f779c110	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55de-aecf-c059-109879f26766	Datoteka-write	Datoteka - spreminjanje	f
00030000-55de-aecf-ac2d-ed19f9294a03	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 15763321)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55de-aecf-fc02-b725ec6f79cb	00030000-55de-aecf-1823-759f20ac443f
00020000-55de-aecf-dc1d-b4633c9c5d1a	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-7b5e-32876de495f1
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-d612-7d6b4b2abf49
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-04a6-010e2408434d
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-1c1b-807f291b7d87
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-8e4a-40cf93ccc3ba
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-7dbd-bba18826c04c
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-477c-730056fc187d
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-7c55-3c3fe28ca035
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-0cef-c707b7ed1a53
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-f93f-669c3cf186fd
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-0c48-6c8aedb3e5ae
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-aeb7-ab2238f2879a
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-4b48-b30600dccc6b
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-f43e-176edc1e01f8
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-3d60-28ab91d57836
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-d8c7-60becb33d6de
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-518e-f15e84769cb6
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-43d1-5674881538eb
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-ca0b-0f040a26398d
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-c2df-cbddc9b60780
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-db37-eff6f16cdb1d
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-3565-88652a028d2a
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-cac9-4bc63a4aa2c6
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-a354-9be2bbf1a439
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-0eb1-3a7bfe5be88f
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-8bd2-5022f3c88310
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-d518-723202666b74
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-a96f-6cff6cabba53
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-0848-71d25e7747fc
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-d3eb-56c30ac4dc3e
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-bdfd-20d7a54c2c2b
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-d995-eb844cb02aae
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-9c71-8f0d16339fc5
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-c828-04aa7a66869a
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-e630-5b556f30b092
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-cf72-c87a25afb13a
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-5c42-bfcf00237460
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-1681-1f6c7925c78d
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-6895-f63e9c182bbf
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-2b0c-e66607d8d1fd
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-6200-f687eb0c5982
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-f746-fd74be87aedc
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-4ebc-6b91b1a92bb4
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-fed2-c958960a266e
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-c54e-aebb74d91b85
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-c49e-951192522fd5
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-bf9a-df4aef6162aa
00020000-55de-aecf-2079-6bd2f3816d33	00030000-55de-aecf-d074-50ca7dba6744
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-7b5e-32876de495f1
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-8e4a-40cf93ccc3ba
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-7dbd-bba18826c04c
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-aeb7-ab2238f2879a
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-f43e-176edc1e01f8
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-d8c7-60becb33d6de
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-518e-f15e84769cb6
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-43d1-5674881538eb
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-ca0b-0f040a26398d
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-c2df-cbddc9b60780
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-db37-eff6f16cdb1d
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-3565-88652a028d2a
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-a354-9be2bbf1a439
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-8bd2-5022f3c88310
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-d518-723202666b74
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-a96f-6cff6cabba53
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-d995-eb844cb02aae
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-c828-04aa7a66869a
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-cf72-c87a25afb13a
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-1681-1f6c7925c78d
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-01f4-fd818bbf0e19
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-42de-dc2933d5ccea
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-a1e1-d78ff17d00d7
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-a3a8-40c7ddbec997
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-a631-a87c98ef8d77
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-7886-1a0ae8b7a038
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-bf9a-df4aef6162aa
00020000-55de-aecf-7bdd-7f6a6acc2c77	00030000-55de-aecf-d074-50ca7dba6744
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-7b5e-32876de495f1
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-04a6-010e2408434d
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-8e4a-40cf93ccc3ba
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-6942-073dc1e362c7
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-5160-ef213744df1d
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-4a51-8706209bda01
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-7dbd-bba18826c04c
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-f93f-669c3cf186fd
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-aeb7-ab2238f2879a
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-f43e-176edc1e01f8
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-d8c7-60becb33d6de
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-43d1-5674881538eb
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-ca0b-0f040a26398d
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-c2df-cbddc9b60780
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-3565-88652a028d2a
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-a354-9be2bbf1a439
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-a96f-6cff6cabba53
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-d3eb-56c30ac4dc3e
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-d995-eb844cb02aae
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-c828-04aa7a66869a
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-cf72-c87a25afb13a
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-1681-1f6c7925c78d
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-2b0c-e66607d8d1fd
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-4ebc-6b91b1a92bb4
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-c54e-aebb74d91b85
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-bf9a-df4aef6162aa
00020000-55de-aecf-6c7b-71725039b23e	00030000-55de-aecf-d074-50ca7dba6744
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-7b5e-32876de495f1
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-d612-7d6b4b2abf49
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-1c1b-807f291b7d87
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-8e4a-40cf93ccc3ba
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-7dbd-bba18826c04c
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-aeb7-ab2238f2879a
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-f43e-176edc1e01f8
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-43d1-5674881538eb
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-ca0b-0f040a26398d
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-3565-88652a028d2a
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-a354-9be2bbf1a439
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-a96f-6cff6cabba53
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-d995-eb844cb02aae
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-c828-04aa7a66869a
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-cf72-c87a25afb13a
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-1681-1f6c7925c78d
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-2b0c-e66607d8d1fd
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-bf9a-df4aef6162aa
00020000-55de-aecf-ae18-d48e045b41f8	00030000-55de-aecf-d074-50ca7dba6744
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-7b5e-32876de495f1
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-8e4a-40cf93ccc3ba
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-7dbd-bba18826c04c
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-aeb7-ab2238f2879a
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-f43e-176edc1e01f8
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-43d1-5674881538eb
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-ca0b-0f040a26398d
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-3565-88652a028d2a
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-a354-9be2bbf1a439
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-a96f-6cff6cabba53
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-d995-eb844cb02aae
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-c828-04aa7a66869a
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-cf72-c87a25afb13a
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-1681-1f6c7925c78d
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-6558-bff18d6631ff
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-6648-7ee8b87e0390
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-2b0c-e66607d8d1fd
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-bf9a-df4aef6162aa
00020000-55de-aecf-549a-a10254084670	00030000-55de-aecf-d074-50ca7dba6744
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d004-276cd06758df
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-1823-759f20ac443f
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-6648-7ee8b87e0390
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-477c-730056fc187d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-bc96-c546f48a9875
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-b89f-12eb275fa250
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-8270-15573719da86
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7b5e-32876de495f1
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d612-7d6b4b2abf49
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-04a6-010e2408434d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-1c1b-807f291b7d87
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-8e4a-40cf93ccc3ba
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-6942-073dc1e362c7
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5160-ef213744df1d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3917-5da656bce2b4
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-4a51-8706209bda01
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-8d40-dcd76b3e1078
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7dbd-bba18826c04c
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7c55-3c3fe28ca035
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a296-6872488e172c
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0cef-c707b7ed1a53
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-48fc-67517593fc08
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-ff71-ab364d6f6021
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-b5f1-835b7d1f4501
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-80a8-c5d32de3e422
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-f93f-669c3cf186fd
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0c48-6c8aedb3e5ae
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-aeb7-ab2238f2879a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-4b48-b30600dccc6b
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-f43e-176edc1e01f8
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3d60-28ab91d57836
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d8c7-60becb33d6de
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-518e-f15e84769cb6
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0bb3-2529df4f6ab8
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5016-d697bd1186d4
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-511e-3ad06426fd17
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7d4a-55be46661df6
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-43d1-5674881538eb
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5e83-3ff6bba55009
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-ca0b-0f040a26398d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a780-1de59e5a4c03
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-c2df-cbddc9b60780
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-db37-eff6f16cdb1d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d2ca-76edfadc783c
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-c202-e5443df20271
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-e71d-330f06887d0f
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-fc00-59ba9f151562
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0e82-d4e12aac950b
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-55a8-12138b2f24ae
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3565-88652a028d2a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-cac9-4bc63a4aa2c6
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a354-9be2bbf1a439
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0eb1-3a7bfe5be88f
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3caa-39e8ff9c532c
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7b72-82b673cf80eb
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-8bd2-5022f3c88310
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d518-723202666b74
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a96f-6cff6cabba53
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0848-71d25e7747fc
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-ad57-40a5bec5ea8c
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-335f-cacbc39ebd4d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-2194-1d244161a018
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-63fa-3e15eacf9ffb
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d3eb-56c30ac4dc3e
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-bdfd-20d7a54c2c2b
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5445-f0ddf50546e0
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-dbbc-87a94712b516
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-24d2-de69f92dad81
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-9fe3-fd2a0aa052d7
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-8a4e-9f6ddbcc40c9
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-00a3-b7c668e5742c
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-91f5-c5f255ddd42a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-2a50-841c09327a22
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-573b-95496786d336
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-691c-e325b43524fd
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5934-0d259f9947e9
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-20de-992d3253fded
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a85b-e34bd96447d9
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-ffb3-6c39abb6c2c4
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-1d0f-fb8872dc8aa1
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-707a-cdd521ca1268
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-4e4b-fbd85dde74bc
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-c543-2863ec5bbb71
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-6674-caf47816ebab
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-2875-13b3551b3fef
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d995-eb844cb02aae
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-9c71-8f0d16339fc5
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-06b2-de84f3785c6f
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7291-5bc694aea936
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-9d8e-298c8e70360e
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-937a-725bda64713d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-c828-04aa7a66869a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-e630-5b556f30b092
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-cf72-c87a25afb13a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5c42-bfcf00237460
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-152d-75bd40258282
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-fb10-c36aa2b8efcf
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3baa-4a8a920304e0
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-ac45-a8ded22c2ab7
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-1ad9-de06e077b4b5
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-cb05-f81ae011f87b
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-8684-ddcf07fe90e5
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-dc9d-44d0f4f3705b
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-1681-1f6c7925c78d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-6895-f63e9c182bbf
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-70fe-2922fac2f261
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-bf85-89e74c643c7a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-33b9-9345e04832c0
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-fcc8-9ae3496fe60a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-aa96-bf08eab8679e
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-0de6-5889791adf20
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-35af-eb4118ace15f
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-f02f-a94cc3c5695a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-01f4-fd818bbf0e19
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-42de-dc2933d5ccea
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-6558-bff18d6631ff
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-2711-a7543598e3be
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-2b0c-e66607d8d1fd
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3220-d66deaba40b6
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-658f-76530f2b23a4
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-3222-a5c2d9cb71a2
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a1e1-d78ff17d00d7
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a3a8-40c7ddbec997
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-6200-f687eb0c5982
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-f746-fd74be87aedc
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-4ebc-6b91b1a92bb4
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-fed2-c958960a266e
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5c08-8165ca4a479d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-870b-f05e4ec32d3a
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-a631-a87c98ef8d77
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-7886-1a0ae8b7a038
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-c54e-aebb74d91b85
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-c49e-951192522fd5
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-bf9a-df4aef6162aa
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-5828-7fd3b1d1919d
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-d074-50ca7dba6744
00020000-55de-aed0-68db-8cdf90d30ce3	00030000-55de-aecf-ae8f-53e37f882664
\.


--
-- TOC entry 2936 (class 0 OID 15763620)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15763653)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15763777)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55de-aed0-2e01-fabd9dc6a58e	00090000-55de-aed0-a310-c79bbc179e60	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55de-aed0-2a0d-6eb1f1f56f94	00090000-55de-aed0-fedc-f4429e1fa58f	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55de-aed0-845d-0b62aa07731b	00090000-55de-aed0-4a18-f96ef5e5d3d0	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 15763381)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55de-aed0-d3a7-ae391055312b	00040000-55de-aecf-541a-9ddc7698c50c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed0-1a4d-b89cc4e31f10	00040000-55de-aecf-541a-9ddc7698c50c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55de-aed0-11fb-a1031020ade6	00040000-55de-aecf-541a-9ddc7698c50c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed0-e3ad-01c99ea713f6	00040000-55de-aecf-541a-9ddc7698c50c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed0-99c7-c088a4faa5ed	00040000-55de-aecf-541a-9ddc7698c50c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed0-f21e-f72460bd6be5	00040000-55de-aecf-b6c0-7c0504b4430f	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed0-d1e5-6cf29c84ba98	00040000-55de-aecf-b4c7-cf202f2c2ee5	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed0-b2cd-5bb9cda4c6c4	00040000-55de-aecf-faea-4282782d5b57	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-aed1-dcdb-513ced5bfd2f	00040000-55de-aecf-541a-9ddc7698c50c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 15763415)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55de-aece-c11b-9e30765f09d9	8341	Adlešiči
00050000-55de-aece-6e6e-2947ebecfbcb	5270	Ajdovščina
00050000-55de-aece-442b-62f53bc4df61	6280	Ankaran/Ancarano
00050000-55de-aece-9886-ff8e3759222b	9253	Apače
00050000-55de-aece-046d-50a9e9b4b015	8253	Artiče
00050000-55de-aece-0583-21b906fe33b2	4275	Begunje na Gorenjskem
00050000-55de-aece-b633-614df9de2eb5	1382	Begunje pri Cerknici
00050000-55de-aece-e35e-91991060304c	9231	Beltinci
00050000-55de-aece-aaa0-54883d80e914	2234	Benedikt
00050000-55de-aece-b341-2875201f8065	2345	Bistrica ob Dravi
00050000-55de-aece-f26e-23f68122dad9	3256	Bistrica ob Sotli
00050000-55de-aece-e6ba-af0f8d1c2ec4	8259	Bizeljsko
00050000-55de-aece-6fd7-3d4a98a99caf	1223	Blagovica
00050000-55de-aece-8d14-c1b0d436fd4b	8283	Blanca
00050000-55de-aece-9db6-4894e5738f03	4260	Bled
00050000-55de-aece-9fac-82d1cd46410f	4273	Blejska Dobrava
00050000-55de-aece-aabe-cd586db481cc	9265	Bodonci
00050000-55de-aece-553e-954ed49e5a99	9222	Bogojina
00050000-55de-aece-7fdb-c66b3f53161e	4263	Bohinjska Bela
00050000-55de-aece-2835-8e6d828e7d9f	4264	Bohinjska Bistrica
00050000-55de-aece-e996-5eace3dfb57f	4265	Bohinjsko jezero
00050000-55de-aece-e363-bbf069dd260e	1353	Borovnica
00050000-55de-aece-f277-9309a156d397	8294	Boštanj
00050000-55de-aece-1263-1eba55ee918a	5230	Bovec
00050000-55de-aece-7958-d789e80d526b	5295	Branik
00050000-55de-aece-6492-dc5f9e214b70	3314	Braslovče
00050000-55de-aece-a5c2-9c03061d4cc3	5223	Breginj
00050000-55de-aece-f0da-bb9bbf34c197	8280	Brestanica
00050000-55de-aece-58ea-93792f818f96	2354	Bresternica
00050000-55de-aece-59d7-7a1df5253025	4243	Brezje
00050000-55de-aece-9adb-96ef6a00a0fc	1351	Brezovica pri Ljubljani
00050000-55de-aece-4945-062a0994e44b	8250	Brežice
00050000-55de-aece-3677-ab3342800dc4	4210	Brnik - Aerodrom
00050000-55de-aece-8635-8fb7df67d72c	8321	Brusnice
00050000-55de-aece-986f-2d1a7b9ca402	3255	Buče
00050000-55de-aece-7314-6686bd4f7c81	8276	Bučka 
00050000-55de-aece-91fb-71536fe89ba6	9261	Cankova
00050000-55de-aece-d265-0970e70c286b	3000	Celje 
00050000-55de-aece-b6cc-213c70617c38	3001	Celje - poštni predali
00050000-55de-aece-df3b-4ccbade0a881	4207	Cerklje na Gorenjskem
00050000-55de-aece-8ecd-566acc513e8d	8263	Cerklje ob Krki
00050000-55de-aece-aab7-7a35af2b7162	1380	Cerknica
00050000-55de-aece-4c17-8e89df16ec9a	5282	Cerkno
00050000-55de-aece-f2bb-87619cd6ebef	2236	Cerkvenjak
00050000-55de-aece-c001-715d1ba8a4fb	2215	Ceršak
00050000-55de-aece-b2c7-911bce84c56d	2326	Cirkovce
00050000-55de-aece-4827-13116b61e0b4	2282	Cirkulane
00050000-55de-aece-2deb-b27eb736cfbf	5273	Col
00050000-55de-aece-1198-9dcd344cc566	8251	Čatež ob Savi
00050000-55de-aece-5e39-29d9221df852	1413	Čemšenik
00050000-55de-aece-24b7-7cba03f6b683	5253	Čepovan
00050000-55de-aece-afaa-b44d9b705f06	9232	Črenšovci
00050000-55de-aece-fd7c-3f9729893a64	2393	Črna na Koroškem
00050000-55de-aece-ae22-d1aba43ceba9	6275	Črni Kal
00050000-55de-aece-3717-bcae15c31ab6	5274	Črni Vrh nad Idrijo
00050000-55de-aece-96a6-32a21742c9de	5262	Črniče
00050000-55de-aece-41bf-ff58f28c34a6	8340	Črnomelj
00050000-55de-aece-46de-5e08d5096fdd	6271	Dekani
00050000-55de-aece-7ad2-0cc86ee73041	5210	Deskle
00050000-55de-aece-d1d7-f3252963b97e	2253	Destrnik
00050000-55de-aece-5774-0b34ebce9eac	6215	Divača
00050000-55de-aece-6569-c70b8a793b7f	1233	Dob
00050000-55de-aece-4b79-793afaff8eac	3224	Dobje pri Planini
00050000-55de-aece-b2b2-fe78a0030d7f	8257	Dobova
00050000-55de-aece-d025-fb6e6b6a80ca	1423	Dobovec
00050000-55de-aece-6f58-f06a9a1c532c	5263	Dobravlje
00050000-55de-aece-cf78-4f36a587a8e3	3204	Dobrna
00050000-55de-aece-df05-cfe72260415e	8211	Dobrnič
00050000-55de-aece-8347-71e5610e03f1	1356	Dobrova
00050000-55de-aece-c106-b5e11845c3ad	9223	Dobrovnik/Dobronak 
00050000-55de-aece-b91d-7fde6eeda4fb	5212	Dobrovo v Brdih
00050000-55de-aece-dda4-f7d20f2062dc	1431	Dol pri Hrastniku
00050000-55de-aece-14fe-586c91787b78	1262	Dol pri Ljubljani
00050000-55de-aece-f8d6-a978ea2f12f7	1273	Dole pri Litiji
00050000-55de-aece-8368-d3f8d22f21ce	1331	Dolenja vas
00050000-55de-aece-8d2c-c3e549698628	8350	Dolenjske Toplice
00050000-55de-aece-fd7b-7a0a4cde83c9	1230	Domžale
00050000-55de-aece-bb84-e88791d7d927	2252	Dornava
00050000-55de-aece-4c0e-f6e68f3cc4ae	5294	Dornberk
00050000-55de-aece-3bc1-1dae5318b79d	1319	Draga
00050000-55de-aece-877f-cdcd5042560f	8343	Dragatuš
00050000-55de-aece-ec44-740b8ff28cc2	3222	Dramlje
00050000-55de-aece-ce0d-fe29d8cb723b	2370	Dravograd
00050000-55de-aece-3746-88d9793fbd2f	4203	Duplje
00050000-55de-aece-1c66-8e223f5d31e5	6221	Dutovlje
00050000-55de-aece-d6d2-7480e5990d9c	8361	Dvor
00050000-55de-aece-b809-65e148eb6413	2343	Fala
00050000-55de-aece-e331-fd4235432c97	9208	Fokovci
00050000-55de-aece-029b-f7be8ece7e69	2313	Fram
00050000-55de-aece-c274-aab8cef20434	3213	Frankolovo
00050000-55de-aece-6114-1d98e4ac8d7c	1274	Gabrovka
00050000-55de-aece-d12b-e6459caa997a	8254	Globoko
00050000-55de-aece-e7f9-405fdea148c5	5275	Godovič
00050000-55de-aece-8957-b69deaae6baa	4204	Golnik
00050000-55de-aece-cf51-60ec9746612a	3303	Gomilsko
00050000-55de-aece-2157-a532bcaf5948	4224	Gorenja vas
00050000-55de-aece-ec7a-abcfa3a9d4b1	3263	Gorica pri Slivnici
00050000-55de-aece-9c70-46a85e307dd6	2272	Gorišnica
00050000-55de-aece-fdcd-027f8c8aed77	9250	Gornja Radgona
00050000-55de-aece-0494-9630719a6555	3342	Gornji Grad
00050000-55de-aece-259b-44d6925cccf9	4282	Gozd Martuljek
00050000-55de-aece-8a76-71a772c7e6d5	6272	Gračišče
00050000-55de-aece-bc79-c6300b3cce87	9264	Grad
00050000-55de-aece-e96a-aa3531068931	8332	Gradac
00050000-55de-aece-dc90-d7d2dae32fda	1384	Grahovo
00050000-55de-aece-11ba-691ec70e85e8	5242	Grahovo ob Bači
00050000-55de-aece-04eb-2a3a2057f0d5	5251	Grgar
00050000-55de-aece-48d4-0be913dc9d5c	3302	Griže
00050000-55de-aece-0578-833347f421eb	3231	Grobelno
00050000-55de-aece-1ba6-1f78ec0d20e9	1290	Grosuplje
00050000-55de-aece-be87-7292f1c4bfb6	2288	Hajdina
00050000-55de-aece-cf82-191d46a4f5bd	8362	Hinje
00050000-55de-aece-183d-f7a4bac0f465	2311	Hoče
00050000-55de-aece-c744-9d5e0b6ac885	9205	Hodoš/Hodos
00050000-55de-aece-853f-52b096efaecb	1354	Horjul
00050000-55de-aece-99fa-d9b66589f377	1372	Hotedršica
00050000-55de-aece-9e34-e1248cbf548f	1430	Hrastnik
00050000-55de-aece-fb55-09f466c07750	6225	Hruševje
00050000-55de-aece-f507-2e19ba995d48	4276	Hrušica
00050000-55de-aece-2e45-381620c95e86	5280	Idrija
00050000-55de-aece-1d98-cfe672cdd328	1292	Ig
00050000-55de-aece-a68c-9ac55188ad14	6250	Ilirska Bistrica
00050000-55de-aece-36d6-aa856e4a1402	6251	Ilirska Bistrica-Trnovo
00050000-55de-aece-8e62-ba3bf30d23db	1295	Ivančna Gorica
00050000-55de-aece-b374-c566e16ef7ce	2259	Ivanjkovci
00050000-55de-aece-6d17-f77a99a73c22	1411	Izlake
00050000-55de-aece-9296-4bf8308188aa	6310	Izola/Isola
00050000-55de-aece-2cab-b5cbeda8460f	2222	Jakobski Dol
00050000-55de-aece-460f-f2641b77a048	2221	Jarenina
00050000-55de-aece-f82f-fe73acda7fcb	6254	Jelšane
00050000-55de-aece-ed81-cdd020541f3d	4270	Jesenice
00050000-55de-aece-6577-287b18b74fc1	8261	Jesenice na Dolenjskem
00050000-55de-aece-fb1f-9f7577e9d20f	3273	Jurklošter
00050000-55de-aece-a9d1-7490f31b8720	2223	Jurovski Dol
00050000-55de-aece-4e8a-bfe8a46bbd45	2256	Juršinci
00050000-55de-aece-b19b-181d0ec3a1e5	5214	Kal nad Kanalom
00050000-55de-aece-f08b-5071d43ffebc	3233	Kalobje
00050000-55de-aece-e7bf-47adc40d9054	4246	Kamna Gorica
00050000-55de-aece-908a-c2bb5ec90b36	2351	Kamnica
00050000-55de-aece-05ee-d84b7185ae7d	1241	Kamnik
00050000-55de-aece-e562-0f503049a6a5	5213	Kanal
00050000-55de-aece-7a29-c444f5a28fa2	8258	Kapele
00050000-55de-aece-3635-ebc588fd9279	2362	Kapla
00050000-55de-aece-9441-e8dec2938486	2325	Kidričevo
00050000-55de-aece-18e7-140e4758bd3d	1412	Kisovec
00050000-55de-aece-e805-fcbaba552743	6253	Knežak
00050000-55de-aece-3d8a-a7f48d59fa8e	5222	Kobarid
00050000-55de-aece-639b-35e0f437c969	9227	Kobilje
00050000-55de-aece-c2d3-f31826b726f1	1330	Kočevje
00050000-55de-aece-644d-314597d26ae6	1338	Kočevska Reka
00050000-55de-aece-631d-ce00dce3e303	2276	Kog
00050000-55de-aece-4c06-95f414cc488f	5211	Kojsko
00050000-55de-aece-2bf1-c4751dcb9293	6223	Komen
00050000-55de-aece-1615-bff48e5a3f8c	1218	Komenda
00050000-55de-aece-5928-8d661fb9a417	6000	Koper/Capodistria 
00050000-55de-aece-cd80-da9bad912f6d	6001	Koper/Capodistria - poštni predali
00050000-55de-aece-30fc-8ff86a52f2fa	8282	Koprivnica
00050000-55de-aece-95bc-58938f47cf71	5296	Kostanjevica na Krasu
00050000-55de-aece-0685-429ee79a914c	8311	Kostanjevica na Krki
00050000-55de-aece-dfd4-4415128e7164	1336	Kostel
00050000-55de-aece-4e89-b270db4b7d7d	6256	Košana
00050000-55de-aece-0f9c-771e239706c4	2394	Kotlje
00050000-55de-aece-3f84-b7d195485772	6240	Kozina
00050000-55de-aece-0064-13ac2a3b4076	3260	Kozje
00050000-55de-aece-df5d-ef81ae96d914	4000	Kranj 
00050000-55de-aece-cd6c-b3990c672d33	4001	Kranj - poštni predali
00050000-55de-aece-0966-a5ffeee67b58	4280	Kranjska Gora
00050000-55de-aece-d59d-cd274f6e2df2	1281	Kresnice
00050000-55de-aece-c529-37fe40ad5eb4	4294	Križe
00050000-55de-aece-9064-c56dc8b26db2	9206	Križevci
00050000-55de-aece-7613-333d4331d27b	9242	Križevci pri Ljutomeru
00050000-55de-aece-1165-709f6d34618b	1301	Krka
00050000-55de-aece-b9b7-4dcd70e891b3	8296	Krmelj
00050000-55de-aece-cff8-91e673f6a562	4245	Kropa
00050000-55de-aece-3bce-7ecb00b79c92	8262	Krška vas
00050000-55de-aece-ab68-3410c7b94a36	8270	Krško
00050000-55de-aece-1d59-b1a2c1281f00	9263	Kuzma
00050000-55de-aece-4fd0-307f6bd19386	2318	Laporje
00050000-55de-aece-94d1-02e9d9ba105b	3270	Laško
00050000-55de-aece-880f-d81a84bb091d	1219	Laze v Tuhinju
00050000-55de-aece-5de7-8f1b66fb5562	2230	Lenart v Slovenskih goricah
00050000-55de-aece-c660-97737e078798	9220	Lendava/Lendva
00050000-55de-aece-2737-9c61239aeeec	4248	Lesce
00050000-55de-aece-de04-2287393baecd	3261	Lesično
00050000-55de-aece-5fcf-e7d451b5b0bf	8273	Leskovec pri Krškem
00050000-55de-aece-9f47-94ffbd1079fa	2372	Libeliče
00050000-55de-aece-071b-cf09dd167ed2	2341	Limbuš
00050000-55de-aece-ffda-da201bc2b494	1270	Litija
00050000-55de-aece-41d3-f9eb932ca1f5	3202	Ljubečna
00050000-55de-aece-2b0f-69f3e6ae0356	1000	Ljubljana 
00050000-55de-aece-2883-10c55546be9a	1001	Ljubljana - poštni predali
00050000-55de-aece-2a3b-ab5d3119688e	1231	Ljubljana - Črnuče
00050000-55de-aece-f037-e015f3239a95	1261	Ljubljana - Dobrunje
00050000-55de-aece-0fcd-0782f54b6d06	1260	Ljubljana - Polje
00050000-55de-aece-9549-49a99739248b	1210	Ljubljana - Šentvid
00050000-55de-aece-195b-325c9ef38c42	1211	Ljubljana - Šmartno
00050000-55de-aece-f871-dd75a784d6eb	3333	Ljubno ob Savinji
00050000-55de-aece-83cb-e14abdd12847	9240	Ljutomer
00050000-55de-aece-8abe-868e8901b2df	3215	Loče
00050000-55de-aece-dcb8-d85de0ea6180	5231	Log pod Mangartom
00050000-55de-aece-8e6c-30cc4e13b661	1358	Log pri Brezovici
00050000-55de-aece-cbe7-abcb19ca4e03	1370	Logatec
00050000-55de-aece-91b7-5bba2df61961	1371	Logatec
00050000-55de-aece-1b2b-bef9ac353a68	1434	Loka pri Zidanem Mostu
00050000-55de-aece-32b1-ff10a1a6bbb1	3223	Loka pri Žusmu
00050000-55de-aece-472c-fea8d6c0d7b5	6219	Lokev
00050000-55de-aece-5c79-3ba326e03cd1	1318	Loški Potok
00050000-55de-aece-f01a-59dd97fe8953	2324	Lovrenc na Dravskem polju
00050000-55de-aece-ad1b-1784fef857af	2344	Lovrenc na Pohorju
00050000-55de-aece-dcf4-d0991f5eb609	3334	Luče
00050000-55de-aece-a136-5f183ce69ae3	1225	Lukovica
00050000-55de-aece-ef99-09866c3e1830	9202	Mačkovci
00050000-55de-aece-7aa9-1e15679aa467	2322	Majšperk
00050000-55de-aece-b747-18f7f07e1ec2	2321	Makole
00050000-55de-aece-dc30-2912ef2e66c1	9243	Mala Nedelja
00050000-55de-aece-8fc4-de86d30b783d	2229	Malečnik
00050000-55de-aece-e3dd-51dc48d77821	6273	Marezige
00050000-55de-aece-5bf0-4ac0808df2cf	2000	Maribor 
00050000-55de-aece-ae3b-a96b81cd490c	2001	Maribor - poštni predali
00050000-55de-aece-f1ff-8f17b82d81ae	2206	Marjeta na Dravskem polju
00050000-55de-aece-9ef5-605e062e0a68	2281	Markovci
00050000-55de-aece-4ef2-a272eeb20411	9221	Martjanci
00050000-55de-aece-ec04-0ab50393a2d1	6242	Materija
00050000-55de-aece-8f63-75743f72f22f	4211	Mavčiče
00050000-55de-aece-a6e7-0239657c599f	1215	Medvode
00050000-55de-aece-34ac-eda0d610477b	1234	Mengeš
00050000-55de-aece-7641-7838f6edcc99	8330	Metlika
00050000-55de-aece-038a-f584f7f51154	2392	Mežica
00050000-55de-aece-43f3-188f5f4a2611	2204	Miklavž na Dravskem polju
00050000-55de-aece-e78d-07da0245be4c	2275	Miklavž pri Ormožu
00050000-55de-aece-a6b4-3c9369ad63b4	5291	Miren
00050000-55de-aece-b09b-e8458c32af13	8233	Mirna
00050000-55de-aece-8ae9-df74de6dd544	8216	Mirna Peč
00050000-55de-aece-a279-f60760d6fb24	2382	Mislinja
00050000-55de-aece-e396-03781170d532	4281	Mojstrana
00050000-55de-aece-d49e-721e901a2fda	8230	Mokronog
00050000-55de-aece-7d94-dfe5e789c127	1251	Moravče
00050000-55de-aece-d3be-fa151c417e9e	9226	Moravske Toplice
00050000-55de-aece-8135-933f57efce3c	5216	Most na Soči
00050000-55de-aece-5410-e3a38aa55470	1221	Motnik
00050000-55de-aece-ea29-94413bc959a0	3330	Mozirje
00050000-55de-aece-2296-40cff46f9412	9000	Murska Sobota 
00050000-55de-aece-de94-3dcc10ef3699	9001	Murska Sobota - poštni predali
00050000-55de-aece-ff63-d3663ea9c8da	2366	Muta
00050000-55de-aece-f19e-af9a75d777f5	4202	Naklo
00050000-55de-aece-8c81-0daa724c1e68	3331	Nazarje
00050000-55de-aece-f13b-8e9955b72590	1357	Notranje Gorice
00050000-55de-aece-fcb7-d252f6df05f9	3203	Nova Cerkev
00050000-55de-aece-4730-0238c3f32093	5000	Nova Gorica 
00050000-55de-aece-f713-1a57fbfd77f6	5001	Nova Gorica - poštni predali
00050000-55de-aece-b7c4-70b9bc02dee6	1385	Nova vas
00050000-55de-aece-58ed-75b503ac86a8	8000	Novo mesto
00050000-55de-aece-9566-a6fe80d92d30	8001	Novo mesto - poštni predali
00050000-55de-aece-1618-f2313246060d	6243	Obrov
00050000-55de-aece-2a44-8fbd29cf1972	9233	Odranci
00050000-55de-aece-d7c8-0ed9bd543e5c	2317	Oplotnica
00050000-55de-aece-8959-f2e1211722b0	2312	Orehova vas
00050000-55de-aece-ed05-91c7079f53ce	2270	Ormož
00050000-55de-aece-5fba-7f0b06a36d80	1316	Ortnek
00050000-55de-aece-f905-5eee5ab2cc45	1337	Osilnica
00050000-55de-aece-5461-f7808bc4e3e6	8222	Otočec
00050000-55de-aece-3533-8759c76d4ef0	2361	Ožbalt
00050000-55de-aece-675f-8590f95f08da	2231	Pernica
00050000-55de-aece-5245-52f9b6e80b20	2211	Pesnica pri Mariboru
00050000-55de-aece-d1e7-7d18f8818e28	9203	Petrovci
00050000-55de-aece-8a23-9dcfc614d92c	3301	Petrovče
00050000-55de-aece-0cf1-5bad4bf358e6	6330	Piran/Pirano
00050000-55de-aece-a5c9-283188c8b33c	8255	Pišece
00050000-55de-aece-207f-5a458bcbdb5b	6257	Pivka
00050000-55de-aece-aa6c-93bddb96b496	6232	Planina
00050000-55de-aece-01c0-5b59b060ad8f	3225	Planina pri Sevnici
00050000-55de-aece-2acf-c41ef2ef159d	6276	Pobegi
00050000-55de-aece-00b5-5590fe8de416	8312	Podbočje
00050000-55de-aece-d8e2-de67d6fc9d33	5243	Podbrdo
00050000-55de-aece-7fb7-18eecaa84dd1	3254	Podčetrtek
00050000-55de-aece-4c46-9de5bbc27ddd	2273	Podgorci
00050000-55de-aece-de8a-32cd86cd4534	6216	Podgorje
00050000-55de-aece-aaf4-941d70b465f8	2381	Podgorje pri Slovenj Gradcu
00050000-55de-aece-431f-9598e074de4a	6244	Podgrad
00050000-55de-aece-4bcc-10d9237809bd	1414	Podkum
00050000-55de-aece-d621-30e9aa2649e6	2286	Podlehnik
00050000-55de-aece-571e-2b2946c2ae84	5272	Podnanos
00050000-55de-aece-2ae5-bdd505042859	4244	Podnart
00050000-55de-aece-749b-eaef8bef2916	3241	Podplat
00050000-55de-aece-fd18-3da154625944	3257	Podsreda
00050000-55de-aece-292d-c606bc3f2133	2363	Podvelka
00050000-55de-aece-f048-b62333b3e7cb	2208	Pohorje
00050000-55de-aece-8055-d26f2b4ae90f	2257	Polenšak
00050000-55de-aece-20e8-37e83657725a	1355	Polhov Gradec
00050000-55de-aece-1469-1f66c6aa5af9	4223	Poljane nad Škofjo Loko
00050000-55de-aece-01cc-84b1ff3167bf	2319	Poljčane
00050000-55de-aece-85ce-3f58b9a8bf42	1272	Polšnik
00050000-55de-aece-163f-0774a9f96e36	3313	Polzela
00050000-55de-aece-2bbc-8719cc9a7313	3232	Ponikva
00050000-55de-aece-9614-6ef3136ac9f7	6320	Portorož/Portorose
00050000-55de-aece-736d-a5f40b18c1ea	6230	Postojna
00050000-55de-aece-d8b8-db5f76846e75	2331	Pragersko
00050000-55de-aece-694f-f93d238a9e35	3312	Prebold
00050000-55de-aece-4a25-45b675e6506c	4205	Preddvor
00050000-55de-aece-37c4-e0e8f4d4b2c1	6255	Prem
00050000-55de-aece-39a3-8602d7e3353a	1352	Preserje
00050000-55de-aece-d436-c3ce57b83fd1	6258	Prestranek
00050000-55de-aece-97f2-f75f216117fd	2391	Prevalje
00050000-55de-aece-8804-878f391dbeb0	3262	Prevorje
00050000-55de-aece-0bd3-2648e08f72c5	1276	Primskovo 
00050000-55de-aece-b29b-99cff93eba24	3253	Pristava pri Mestinju
00050000-55de-aece-876e-f6315cbc8b0c	9207	Prosenjakovci/Partosfalva
00050000-55de-aece-28dc-a5454195db66	5297	Prvačina
00050000-55de-aece-ef79-6e23262975f9	2250	Ptuj
00050000-55de-aece-2554-28e72340bc3a	2323	Ptujska Gora
00050000-55de-aece-9e2c-d9880eb59478	9201	Puconci
00050000-55de-aece-93d6-6ad3bb9f7ebe	2327	Rače
00050000-55de-aece-b52a-ec46725d3e20	1433	Radeče
00050000-55de-aece-40f6-5be779ad2849	9252	Radenci
00050000-55de-aece-f694-9c72482b4810	2360	Radlje ob Dravi
00050000-55de-aece-3367-7767d0115bb7	1235	Radomlje
00050000-55de-aece-2e27-e3cf7b8d6c2c	4240	Radovljica
00050000-55de-aece-1bf7-7d51bc9c8eca	8274	Raka
00050000-55de-aece-dd03-e2b31e008847	1381	Rakek
00050000-55de-aece-7eb6-d9bde05a6aa8	4283	Rateče - Planica
00050000-55de-aece-667c-5c8edd7a682f	2390	Ravne na Koroškem
00050000-55de-aece-af38-9640355c8c6f	9246	Razkrižje
00050000-55de-aece-deb4-3dd3f9291389	3332	Rečica ob Savinji
00050000-55de-aece-dbfc-5798a2e89ac9	5292	Renče
00050000-55de-aece-87df-3059f2851779	1310	Ribnica
00050000-55de-aece-0ef3-3514f8effd79	2364	Ribnica na Pohorju
00050000-55de-aece-dbb3-600136212328	3272	Rimske Toplice
00050000-55de-aece-69a1-98434d60950d	1314	Rob
00050000-55de-aece-4dde-b46dc4fca3fb	5215	Ročinj
00050000-55de-aece-af52-ab702a7c6170	3250	Rogaška Slatina
00050000-55de-aece-417c-65d270bf5826	9262	Rogašovci
00050000-55de-aece-d5ee-e86db2972886	3252	Rogatec
00050000-55de-aece-b07a-6660532e76f3	1373	Rovte
00050000-55de-aece-3744-75d96e4f1430	2342	Ruše
00050000-55de-aece-a4b5-2dac2122786c	1282	Sava
00050000-55de-aece-b04d-0ba7783ad76d	6333	Sečovlje/Sicciole
00050000-55de-aece-1d37-ddcb934ddeeb	4227	Selca
00050000-55de-aece-9127-8a976672a842	2352	Selnica ob Dravi
00050000-55de-aece-f4d4-e0a1dd8e57ea	8333	Semič
00050000-55de-aece-36c4-b7741cd21a7a	8281	Senovo
00050000-55de-aece-d632-39f07bd1ba6f	6224	Senožeče
00050000-55de-aece-662c-ff7af5b03c20	8290	Sevnica
00050000-55de-aece-9382-2446ed93a5f9	6210	Sežana
00050000-55de-aece-399d-0382e1ca1c4e	2214	Sladki Vrh
00050000-55de-aece-4e86-059275b4fb25	5283	Slap ob Idrijci
00050000-55de-aece-756c-a99fa2b06d61	2380	Slovenj Gradec
00050000-55de-aece-b08c-bb46d425f75d	2310	Slovenska Bistrica
00050000-55de-aece-b930-bb91111f4f1f	3210	Slovenske Konjice
00050000-55de-aece-9e9d-6ac8e3bac3d1	1216	Smlednik
00050000-55de-aece-cdbe-d5b5e37399b3	5232	Soča
00050000-55de-aece-1496-fcc679068223	1317	Sodražica
00050000-55de-aece-ea5f-ebcd56be43b9	3335	Solčava
00050000-55de-aece-d857-f4f764e63f6b	5250	Solkan
00050000-55de-aece-5a14-1308d2bc004e	4229	Sorica
00050000-55de-aece-0192-4ff377ac2856	4225	Sovodenj
00050000-55de-aece-cfd6-891fa0efacb5	5281	Spodnja Idrija
00050000-55de-aece-04e6-89dd9443f643	2241	Spodnji Duplek
00050000-55de-aece-ad43-17ef10b23003	9245	Spodnji Ivanjci
00050000-55de-aece-62e3-acbe60a54dd8	2277	Središče ob Dravi
00050000-55de-aece-b736-545f8c81368a	4267	Srednja vas v Bohinju
00050000-55de-aece-aa79-279c4606e627	8256	Sromlje 
00050000-55de-aece-7832-9f3b9c91af92	5224	Srpenica
00050000-55de-aece-ede2-881538f67ecf	1242	Stahovica
00050000-55de-aece-2427-077b4ce57817	1332	Stara Cerkev
00050000-55de-aece-57cc-5505ce57e884	8342	Stari trg ob Kolpi
00050000-55de-aece-8f2c-d804c9a25ed1	1386	Stari trg pri Ložu
00050000-55de-aece-4f09-991f9b6c516d	2205	Starše
00050000-55de-aece-46c3-818a433bade0	2289	Stoperce
00050000-55de-aece-aff7-8d847f98791b	8322	Stopiče
00050000-55de-aece-0068-7dae345ec00a	3206	Stranice
00050000-55de-aece-c5c0-1b780cc6898a	8351	Straža
00050000-55de-aece-444e-8754deb59576	1313	Struge
00050000-55de-aece-c372-755c8975da0d	8293	Studenec
00050000-55de-aece-b544-918075448da2	8331	Suhor
00050000-55de-aece-3bfb-310e232806e0	2233	Sv. Ana v Slovenskih goricah
00050000-55de-aece-029e-a56229c09620	2235	Sv. Trojica v Slovenskih goricah
00050000-55de-aece-8774-0dfd5fee2d3a	2353	Sveti Duh na Ostrem Vrhu
00050000-55de-aece-0877-f3768858e9b9	9244	Sveti Jurij ob Ščavnici
00050000-55de-aece-295c-b68de8037110	3264	Sveti Štefan
00050000-55de-aece-7c94-d4575a35976a	2258	Sveti Tomaž
00050000-55de-aece-a7d2-31b8debbc571	9204	Šalovci
00050000-55de-aece-e192-ab4558591bbd	5261	Šempas
00050000-55de-aece-6bd2-b29c51985d1f	5290	Šempeter pri Gorici
00050000-55de-aece-59b3-aeb3f5244749	3311	Šempeter v Savinjski dolini
00050000-55de-aece-b5ca-aa1387c82ff2	4208	Šenčur
00050000-55de-aece-4b4f-8c08e6dadeeb	2212	Šentilj v Slovenskih goricah
00050000-55de-aece-da4a-ecbb26312611	8297	Šentjanž
00050000-55de-aece-739b-5bba85b2152e	2373	Šentjanž pri Dravogradu
00050000-55de-aece-3bea-885519f96109	8310	Šentjernej
00050000-55de-aece-aa66-0020fb039d86	3230	Šentjur
00050000-55de-aece-62e2-c4bc86739136	3271	Šentrupert
00050000-55de-aece-ca66-affe5c8a8c44	8232	Šentrupert
00050000-55de-aece-c946-13733268eb14	1296	Šentvid pri Stični
00050000-55de-aece-4901-e040e70c3def	8275	Škocjan
00050000-55de-aece-5731-672290a3ce6d	6281	Škofije
00050000-55de-aece-e55d-0e196a6b5342	4220	Škofja Loka
00050000-55de-aece-a157-031a80d07163	3211	Škofja vas
00050000-55de-aece-d30e-a7eb8befa68f	1291	Škofljica
00050000-55de-aece-2642-d125d74949c0	6274	Šmarje
00050000-55de-aece-215b-8267bff74552	1293	Šmarje - Sap
00050000-55de-aece-233a-131ae559cf67	3240	Šmarje pri Jelšah
00050000-55de-aece-27d3-0ec327f4fb96	8220	Šmarješke Toplice
00050000-55de-aece-57ad-a65233e76c52	2315	Šmartno na Pohorju
00050000-55de-aece-d916-806a97909053	3341	Šmartno ob Dreti
00050000-55de-aece-4cf5-307c5e3802d7	3327	Šmartno ob Paki
00050000-55de-aece-f182-7cb2851a8957	1275	Šmartno pri Litiji
00050000-55de-aece-94aa-a2d7dc8af5ca	2383	Šmartno pri Slovenj Gradcu
00050000-55de-aece-1d21-b901aa717591	3201	Šmartno v Rožni dolini
00050000-55de-aece-d752-4e14cebe443c	3325	Šoštanj
00050000-55de-aece-2d70-13521bc36974	6222	Štanjel
00050000-55de-aece-899d-c92037f79f3f	3220	Štore
00050000-55de-aece-4acb-57bb07c359af	3304	Tabor
00050000-55de-aece-14aa-770420626ac7	3221	Teharje
00050000-55de-aece-0d7a-24d67f5687ca	9251	Tišina
00050000-55de-aece-86cc-f49e02aae093	5220	Tolmin
00050000-55de-aece-51c4-c7ea8fe326b8	3326	Topolšica
00050000-55de-aece-1e93-e0ad60b2da29	2371	Trbonje
00050000-55de-aece-4c99-fff282480097	1420	Trbovlje
00050000-55de-aece-623d-984aba46913c	8231	Trebelno 
00050000-55de-aece-d4a9-f8aad50a6653	8210	Trebnje
00050000-55de-aece-f245-2e74bada544f	5252	Trnovo pri Gorici
00050000-55de-aece-32e0-c4ad14f3ec33	2254	Trnovska vas
00050000-55de-aece-0aa1-58b2b438b9ed	1222	Trojane
00050000-55de-aece-a109-9a8fc0dabab9	1236	Trzin
00050000-55de-aece-f472-03a7d69c2af1	4290	Tržič
00050000-55de-aece-1fb1-a06c878e0d81	8295	Tržišče
00050000-55de-aece-8b24-448de6794675	1311	Turjak
00050000-55de-aece-a975-778c0bcd965a	9224	Turnišče
00050000-55de-aece-5cef-ec3419e6a08c	8323	Uršna sela
00050000-55de-aece-4f9a-3b2dd3a66a85	1252	Vače
00050000-55de-aece-9248-7d281a69f8ad	3320	Velenje 
00050000-55de-aece-6d84-2c6bd1f026b3	3322	Velenje - poštni predali
00050000-55de-aece-85ad-d3f710d849b4	8212	Velika Loka
00050000-55de-aece-af42-aed01bfe81e1	2274	Velika Nedelja
00050000-55de-aece-9de8-fc40ed9cdd26	9225	Velika Polana
00050000-55de-aece-9680-f56115778fd9	1315	Velike Lašče
00050000-55de-aece-1c17-8b82225990a2	8213	Veliki Gaber
00050000-55de-aece-8f71-9e9671f14a4d	9241	Veržej
00050000-55de-aece-577f-398abe61318b	1312	Videm - Dobrepolje
00050000-55de-aece-48bf-1870cc1903ba	2284	Videm pri Ptuju
00050000-55de-aece-5742-e5ba49f8effa	8344	Vinica
00050000-55de-aece-3a51-8077ff2e1508	5271	Vipava
00050000-55de-aece-774c-0c462fce0fe8	4212	Visoko
00050000-55de-aece-d0c0-1d00c5a9c9e5	1294	Višnja Gora
00050000-55de-aece-e4e7-2a248fc1ec3b	3205	Vitanje
00050000-55de-aece-dd93-7e498a4d52fb	2255	Vitomarci
00050000-55de-aece-aee1-50c8b848ed6e	1217	Vodice
00050000-55de-aece-0d67-a24752a58947	3212	Vojnik\t
00050000-55de-aece-3e3e-322a4ca34536	5293	Volčja Draga
00050000-55de-aece-1c15-ae32cbf89293	2232	Voličina
00050000-55de-aece-f5c1-971e8f53d12e	3305	Vransko
00050000-55de-aece-006a-9363d9ba3b1b	6217	Vremski Britof
00050000-55de-aece-d225-f94d1e4641f4	1360	Vrhnika
00050000-55de-aece-049b-3328d76b4f0f	2365	Vuhred
00050000-55de-aece-48be-f0fe5992d4f2	2367	Vuzenica
00050000-55de-aece-4278-42de55876d32	8292	Zabukovje 
00050000-55de-aece-f183-2bd24e804233	1410	Zagorje ob Savi
00050000-55de-aece-fb0a-644de447aafe	1303	Zagradec
00050000-55de-aece-2719-82496d25573c	2283	Zavrč
00050000-55de-aece-532e-91f2ef7aee7d	8272	Zdole 
00050000-55de-aece-5479-e973c4d6759e	4201	Zgornja Besnica
00050000-55de-aece-51fd-de40cc887d22	2242	Zgornja Korena
00050000-55de-aece-f115-dbb362a89f8a	2201	Zgornja Kungota
00050000-55de-aece-949f-a856ea17945c	2316	Zgornja Ložnica
00050000-55de-aece-88ab-e2cd760ef83e	2314	Zgornja Polskava
00050000-55de-aece-5f08-df52cd131c42	2213	Zgornja Velka
00050000-55de-aece-9b1d-5ada86e65873	4247	Zgornje Gorje
00050000-55de-aece-0660-71dc650c6568	4206	Zgornje Jezersko
00050000-55de-aece-d39d-e59517c100c0	2285	Zgornji Leskovec
00050000-55de-aece-57a7-8424546c3c3d	1432	Zidani Most
00050000-55de-aece-17de-804fd690c76e	3214	Zreče
00050000-55de-aece-9036-aa0960633aca	4209	Žabnica
00050000-55de-aece-5e1d-713520b7c3c0	3310	Žalec
00050000-55de-aece-3524-3521137a8c58	4228	Železniki
00050000-55de-aece-edfa-595d6a120760	2287	Žetale
00050000-55de-aece-9393-018ab0d10095	4226	Žiri
00050000-55de-aece-ac66-48a33467a029	4274	Žirovnica
00050000-55de-aece-b926-d0de3605659b	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 15763594)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15763400)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55de-aed0-6117-009a29ed781d	00080000-55de-aed0-d3a7-ae391055312b	\N	00040000-55de-aecf-541a-9ddc7698c50c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55de-aed0-44a5-4167c601198e	00080000-55de-aed0-d3a7-ae391055312b	\N	00040000-55de-aecf-541a-9ddc7698c50c		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55de-aed0-d458-183444cdb6f1	00080000-55de-aed0-1a4d-b89cc4e31f10	\N	00040000-55de-aecf-541a-9ddc7698c50c		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 15763478)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15763606)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15763955)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 15763965)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55de-aed0-861a-9b58f933820a	00080000-55de-aed0-11fb-a1031020ade6	0987	AK
00190000-55de-aed0-cbfa-5f3c826e4d85	00080000-55de-aed0-1a4d-b89cc4e31f10	0989	AK
00190000-55de-aed0-f891-d9deb2d24fe3	00080000-55de-aed0-e3ad-01c99ea713f6	0986	AK
00190000-55de-aed0-6248-1daa287e1c84	00080000-55de-aed0-f21e-f72460bd6be5	0984	AK
00190000-55de-aed0-9902-b66e072e1bb4	00080000-55de-aed0-d1e5-6cf29c84ba98	0983	AK
00190000-55de-aed0-25b4-0a8663cdeafc	00080000-55de-aed0-b2cd-5bb9cda4c6c4	0982	AK
00190000-55de-aed1-797e-ebab710f14ee	00080000-55de-aed1-dcdb-513ced5bfd2f	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 15763911)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55de-aed0-dc07-18cfd7633085	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 15763973)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15763635)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55de-aed0-7b7f-f4ffdada4719	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55de-aed0-9e8e-1d2816eed48b	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55de-aed0-744d-90ba62a45f5b	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55de-aed0-cf4a-2f02a22f7e29	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55de-aed0-9553-8e031ec01a8b	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55de-aed0-e0ee-c3c3bc6415ab	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55de-aed0-bd86-f105d1ed5387	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 15763579)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15763569)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15763766)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15763705)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15763273)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55de-aed1-dcdb-513ced5bfd2f	00010000-55de-aecf-7529-dc77df16118c	2015-08-27 08:31:45	INS	a:0:{}
2	App\\Entity\\Option	00000000-55de-aed1-20fc-f9bbbac508d0	00010000-55de-aecf-7529-dc77df16118c	2015-08-27 08:31:45	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55de-aed1-797e-ebab710f14ee	00010000-55de-aecf-7529-dc77df16118c	2015-08-27 08:31:45	INS	a:0:{}
\.


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 15763647)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15763311)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55de-aecf-fc02-b725ec6f79cb	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55de-aecf-dc1d-b4633c9c5d1a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55de-aecf-2b29-710ddf8517a3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55de-aecf-519a-108e799eb212	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55de-aecf-2079-6bd2f3816d33	planer	Planer dogodkov v koledarju	t
00020000-55de-aecf-7bdd-7f6a6acc2c77	kadrovska	Kadrovska služba	t
00020000-55de-aecf-6c7b-71725039b23e	arhivar	Ažuriranje arhivalij	t
00020000-55de-aecf-ae18-d48e045b41f8	igralec	Igralec	t
00020000-55de-aecf-549a-a10254084670	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55de-aed0-68db-8cdf90d30ce3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 15763295)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55de-aecf-0ded-028385af39f4	00020000-55de-aecf-2b29-710ddf8517a3
00010000-55de-aecf-7529-dc77df16118c	00020000-55de-aecf-2b29-710ddf8517a3
00010000-55de-aed0-1c1f-5f0c06c4209d	00020000-55de-aed0-68db-8cdf90d30ce3
\.


--
-- TOC entry 2941 (class 0 OID 15763661)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15763600)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15763545)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 15764014)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55de-aecf-bbb5-b3ea1bd52afc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55de-aecf-33a0-c6b3732979a4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55de-aecf-82e4-1ab0ce2fcddf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55de-aecf-5ab5-7fa54fafd489	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55de-aecf-c767-a060acc38554	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 15764006)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55de-aecf-53a5-7a4d3b2e34d7	00230000-55de-aecf-5ab5-7fa54fafd489	popa
00240000-55de-aecf-b168-b0bc4487de15	00230000-55de-aecf-5ab5-7fa54fafd489	oseba
00240000-55de-aecf-0e20-0571747241b3	00230000-55de-aecf-5ab5-7fa54fafd489	sezona
00240000-55de-aecf-4288-6f85c88a6c42	00230000-55de-aecf-33a0-c6b3732979a4	prostor
00240000-55de-aecf-0c42-5e8bc565e87a	00230000-55de-aecf-5ab5-7fa54fafd489	besedilo
00240000-55de-aecf-b000-8cace89a3f22	00230000-55de-aecf-5ab5-7fa54fafd489	uprizoritev
00240000-55de-aecf-8abe-7ad3a92b535e	00230000-55de-aecf-5ab5-7fa54fafd489	funkcija
00240000-55de-aecf-4b10-a867b6917ba6	00230000-55de-aecf-5ab5-7fa54fafd489	tipfunkcije
00240000-55de-aecf-8f93-549d96b7840f	00230000-55de-aecf-5ab5-7fa54fafd489	alternacija
00240000-55de-aecf-0ffb-9f8bae84308b	00230000-55de-aecf-bbb5-b3ea1bd52afc	pogodba
00240000-55de-aecf-994f-733460c87074	00230000-55de-aecf-5ab5-7fa54fafd489	zaposlitev
00240000-55de-aecf-8f25-388470265745	00230000-55de-aecf-bbb5-b3ea1bd52afc	programdela
00240000-55de-aecf-a772-374218cce045	00230000-55de-aecf-5ab5-7fa54fafd489	zapis
\.


--
-- TOC entry 2963 (class 0 OID 15764001)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
45c1600d-c711-4d0c-8e8a-a63f85c4fb10	00230000-55de-aecf-5ab5-7fa54fafd489	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 15763715)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55de-aed0-355f-82d6a800dcd3	000e0000-55de-aed0-e5a7-d4184130c344	00080000-55de-aed0-d3a7-ae391055312b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55de-aecf-0540-7e97d19f87c8
00270000-55de-aed0-4a1d-02585442f6b0	000e0000-55de-aed0-e5a7-d4184130c344	00080000-55de-aed0-d3a7-ae391055312b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55de-aecf-0540-7e97d19f87c8
00270000-55de-aed0-06d4-9218f768fd19	000e0000-55de-aed0-e5a7-d4184130c344	00080000-55de-aed0-99c7-c088a4faa5ed	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 15763373)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15763555)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55de-aed0-3327-8d2939a456c5	00180000-55de-aed0-d644-55aa713c3490	000c0000-55de-aed0-2df8-65fd32c8ff81	00090000-55de-aed0-1ea8-a4424e33bd26	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-aed0-a97a-75eda800e0a4	00180000-55de-aed0-d644-55aa713c3490	000c0000-55de-aed0-89be-f6caab40b593	00090000-55de-aed0-3008-35a5b55da157	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-aed0-5b53-c6242cd95f4a	00180000-55de-aed0-d644-55aa713c3490	000c0000-55de-aed0-6565-4aefb896b174	00090000-55de-aed0-a619-18ea1dcc62f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-aed0-f385-9e978e7f54d3	00180000-55de-aed0-d644-55aa713c3490	000c0000-55de-aed0-d794-c5cef5309d10	00090000-55de-aed0-27d4-b81f7e6c65b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-aed0-8e1b-e3f42e5b0f93	00180000-55de-aed0-d644-55aa713c3490	000c0000-55de-aed0-8657-1d62e3b5fa40	00090000-55de-aed0-d288-6550bd9d8592	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-aed0-9d0f-7dcb3511962c	00180000-55de-aed0-692f-258f52ddb2d7	\N	00090000-55de-aed0-d288-6550bd9d8592	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 15763755)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55de-aecf-49d5-92109da22f14	Avtor	Avtorji	Avtorka	umetnik
000f0000-55de-aecf-67ca-131f97a06f83	Priredba	Priredba	Priredba	umetnik
000f0000-55de-aecf-07b3-0a3186a03db2	Prevod	Prevod	Prevod	umetnik
000f0000-55de-aecf-acd4-4011347d0217	Režija	Režija	Režija	umetnik
000f0000-55de-aecf-e8de-b0bd15222e85	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55de-aecf-ca59-23c2fba81693	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55de-aecf-2817-222e4bc2964e	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55de-aecf-eca8-f40d3db28138	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55de-aecf-ce31-5cfe44ec53e6	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55de-aecf-1045-f47d31226c87	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55de-aecf-4d4e-f629191e11d3	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55de-aecf-e130-15ce37d0e786	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55de-aecf-d79c-a7dc55cac220	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55de-aecf-d884-dbcdd104456a	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55de-aecf-0657-edab8e74b1c1	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55de-aecf-b069-447297cc4f2f	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55de-aecf-9250-7f1c34fef115	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55de-aecf-4f46-920e352cc84a	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 15763983)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55de-aecf-62bc-248007534316	01	Velika predstava	f	1.00	1.00
002b0000-55de-aecf-5d8e-0c8aebe56e4e	02	Mala predstava	f	0.50	0.50
002b0000-55de-aecf-70be-c0aaaff46ed3	03	Mala koprodukcija	t	0.40	1.00
002b0000-55de-aecf-4056-c78f77b96f74	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55de-aecf-322d-abd0c6a1242f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 15763435)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15763282)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55de-aecf-7529-dc77df16118c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfjH70i0Ga0Hm97.vJNY/GzJtIzLbPD6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55de-aed0-986a-f11dd7894cb6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55de-aed0-9f24-53bd6fa2f07c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55de-aed0-2139-0ba0c9998893	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55de-aed0-8f19-1e25d123b57a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55de-aed0-76cc-6edaa73b8593	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55de-aed0-19d3-192dc4b9e9d6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55de-aed0-c118-473a6a871c02	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55de-aed0-be97-bb025b17bd38	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55de-aed0-06dc-04dffe46321d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55de-aed0-1c1f-5f0c06c4209d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55de-aecf-0ded-028385af39f4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 15763803)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55de-aed0-6b8f-3f89de804c65	00160000-55de-aed0-6ca4-015782267aa4	\N	00140000-55de-aecf-e0bc-b5eda8051fca	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55de-aed0-9553-8e031ec01a8b
000e0000-55de-aed0-e5a7-d4184130c344	00160000-55de-aed0-1a3a-2b1053121fc8	\N	00140000-55de-aecf-6546-97114ff03091	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55de-aed0-e0ee-c3c3bc6415ab
000e0000-55de-aed0-bcb5-231e90a69ed5	\N	\N	00140000-55de-aecf-6546-97114ff03091	00190000-55de-aed0-861a-9b58f933820a	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55de-aed0-9553-8e031ec01a8b
000e0000-55de-aed0-3a22-fcbea3ebf696	\N	\N	00140000-55de-aecf-6546-97114ff03091	00190000-55de-aed0-861a-9b58f933820a	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55de-aed0-9553-8e031ec01a8b
000e0000-55de-aed0-8618-895e3dcce41b	\N	\N	00140000-55de-aecf-6546-97114ff03091	00190000-55de-aed0-861a-9b58f933820a	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55de-aed0-7b7f-f4ffdada4719
000e0000-55de-aed0-306a-5313e7b91da2	\N	\N	00140000-55de-aecf-6546-97114ff03091	00190000-55de-aed0-861a-9b58f933820a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55de-aed0-7b7f-f4ffdada4719
\.


--
-- TOC entry 2922 (class 0 OID 15763497)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55de-aed0-06e0-45faaf0758f2	000e0000-55de-aed0-e5a7-d4184130c344	1	
00200000-55de-aed0-02f1-84280082a522	000e0000-55de-aed0-e5a7-d4184130c344	2	
\.


--
-- TOC entry 2937 (class 0 OID 15763627)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15763729)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55de-aecf-59bc-ed147e209fb7	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55de-aecf-be88-54bb88d42090	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55de-aecf-5236-1da5c4347d9c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55de-aecf-f848-737bb2cd999f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55de-aecf-c2bf-a96f8d70c28b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55de-aecf-2862-14de59e49c22	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55de-aecf-1ebf-3784d8c88668	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55de-aecf-16d2-4d7d696402cc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55de-aecf-0540-7e97d19f87c8	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55de-aecf-e21c-7ee8a9b6f537	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55de-aecf-9f7c-15cdec18f68a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55de-aecf-be15-9acf49a2c638	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55de-aecf-4ca5-a543cd1fa213	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55de-aecf-06bd-6ce782086184	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55de-aecf-3b80-fc382fc44a45	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55de-aecf-fc31-867c381b6ad7	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55de-aecf-ef4a-1641ae4461fb	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55de-aecf-da90-7981275fe642	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55de-aecf-bf16-e26c743982ae	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55de-aecf-c2f6-7fd237b1ff9c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55de-aecf-4ceb-407838000d0f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55de-aecf-0bdf-d7350067692c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55de-aecf-3690-344e6f8ece77	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55de-aecf-7e33-65459a29ac73	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2967 (class 0 OID 15764053)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 15764025)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15764065)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15763698)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55de-aed0-deab-b0a271a95854	00090000-55de-aed0-3008-35a5b55da157	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-aed0-5723-f1560be19cb3	00090000-55de-aed0-a619-18ea1dcc62f4	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-aed0-8047-2ce817197a91	00090000-55de-aed0-2538-d5355e59ee6e	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-aed0-f071-2c5f545ecb69	00090000-55de-aed0-7eed-9fd9192ee7a9	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-aed0-f581-03f1eabf251d	00090000-55de-aed0-1ea8-a4424e33bd26	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-aed0-d04b-44324a75a258	00090000-55de-aed0-4e2d-cadccf9ba3fe	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 15763529)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15763793)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55de-aecf-e0bc-b5eda8051fca	01	Drama	drama (SURS 01)
00140000-55de-aecf-0a13-ed7c55fd59cf	02	Opera	opera (SURS 02)
00140000-55de-aecf-89d3-b1467a7fd1cf	03	Balet	balet (SURS 03)
00140000-55de-aecf-8867-4d8801d92579	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55de-aecf-72ab-f5272b02c192	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55de-aecf-6546-97114ff03091	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55de-aecf-a4b0-8d8cc899ee8e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 15763688)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2446 (class 2606 OID 15763336)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15763850)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15763840)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15763754)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15764105)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15763519)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 15763544)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15763999)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15763461)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 15763905)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15763684)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15763495)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15763538)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15763475)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15763592)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 15764082)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 15764089)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 15764113)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15763619)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15763433)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 15763345)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15763369)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15763325)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 15763310)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15763625)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15763660)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 15763788)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15763397)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15763421)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15763598)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15763411)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15763482)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15763610)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15763962)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15763970)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15763953)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15763981)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15763642)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15763583)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15763574)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15763776)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15763712)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15763281)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15763651)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 15763299)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 15763319)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15763669)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15763605)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15763553)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15764023)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15764011)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 15764005)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 15763725)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15763378)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15763564)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15763765)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15763993)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15763446)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15763294)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 15763819)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 15763504)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15763633)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15763737)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15764063)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15764047)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 15764071)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15763703)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15763533)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 15763801)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15763696)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 15763526)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2589 (class 1259 OID 15763726)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2590 (class 1259 OID 15763727)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 15763728)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 15764084)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 15764083)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2460 (class 1259 OID 15763399)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2552 (class 1259 OID 15763626)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 15764051)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 15764050)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 15764052)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 15764049)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 15764048)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 15763612)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 15763611)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 15763505)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 15763685)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 15763687)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2578 (class 1259 OID 15763686)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 15763477)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 15763476)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2648 (class 1259 OID 15763982)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2602 (class 1259 OID 15763790)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 15763791)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 15763792)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 15764072)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2611 (class 1259 OID 15763824)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2612 (class 1259 OID 15763821)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2613 (class 1259 OID 15763825)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2614 (class 1259 OID 15763823)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2615 (class 1259 OID 15763822)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 15763448)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15763447)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 15763372)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 15763652)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 15763539)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 15763326)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 15763327)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2569 (class 1259 OID 15763672)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2570 (class 1259 OID 15763671)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2571 (class 1259 OID 15763670)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 15763483)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 15763485)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 15763484)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2658 (class 1259 OID 15764013)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2526 (class 1259 OID 15763578)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2527 (class 1259 OID 15763576)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2528 (class 1259 OID 15763575)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2529 (class 1259 OID 15763577)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 15763300)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 15763301)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2555 (class 1259 OID 15763634)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 15764106)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 15764114)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 15764115)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2541 (class 1259 OID 15763599)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2585 (class 1259 OID 15763713)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2586 (class 1259 OID 15763714)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 15763910)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2633 (class 1259 OID 15763909)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2634 (class 1259 OID 15763906)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 15763907)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2636 (class 1259 OID 15763908)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 15763413)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15763412)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 15763414)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2558 (class 1259 OID 15763646)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 15763645)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2640 (class 1259 OID 15763963)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2641 (class 1259 OID 15763964)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2625 (class 1259 OID 15763854)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2626 (class 1259 OID 15763855)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2627 (class 1259 OID 15763852)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2628 (class 1259 OID 15763853)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2582 (class 1259 OID 15763704)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 15763587)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2533 (class 1259 OID 15763586)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 15763584)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2535 (class 1259 OID 15763585)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2621 (class 1259 OID 15763842)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 15763841)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 15763954)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 15763496)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 15764000)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 15764090)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 15764091)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2447 (class 1259 OID 15763347)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 15763346)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 15763379)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 15763380)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 15763568)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15763567)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 15763565)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 15763528)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 15763524)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 15763521)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 15763522)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 15763520)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 15763525)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 15763523)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 15763398)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 15763462)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 15763464)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 15763463)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 15763465)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 15763593)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2607 (class 1259 OID 15763789)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 15763820)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 15763370)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 15763371)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2579 (class 1259 OID 15763697)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 15764024)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15763434)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2661 (class 1259 OID 15764012)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2562 (class 1259 OID 15763644)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2563 (class 1259 OID 15763643)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 15763851)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15763422)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 15763802)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 15764064)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2646 (class 1259 OID 15763971)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 15763972)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 15763554)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2440 (class 1259 OID 15763320)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 15763527)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 15764251)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2717 (class 2606 OID 15764236)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2718 (class 2606 OID 15764241)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2722 (class 2606 OID 15764261)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 15764231)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2721 (class 2606 OID 15764256)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 15764246)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2753 (class 2606 OID 15764416)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 15764421)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15764426)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 15764596)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2788 (class 2606 OID 15764591)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 15764166)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 15764346)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 15764576)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 15764571)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2786 (class 2606 OID 15764581)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 15764566)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2782 (class 2606 OID 15764561)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2738 (class 2606 OID 15764341)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2737 (class 2606 OID 15764336)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 15764226)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15764386)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15764396)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 15764391)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2710 (class 2606 OID 15764201)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 15764196)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 15764326)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15764546)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2756 (class 2606 OID 15764431)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 15764436)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 15764441)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2787 (class 2606 OID 15764586)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 15764461)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2759 (class 2606 OID 15764446)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2763 (class 2606 OID 15764466)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 15764456)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2760 (class 2606 OID 15764451)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2708 (class 2606 OID 15764191)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2707 (class 2606 OID 15764186)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2700 (class 2606 OID 15764151)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2699 (class 2606 OID 15764146)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 15764366)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 15764266)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2695 (class 2606 OID 15764126)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 15764131)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 15764381)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 15764376)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2744 (class 2606 OID 15764371)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2711 (class 2606 OID 15764206)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 15764216)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2712 (class 2606 OID 15764211)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2781 (class 2606 OID 15764556)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2730 (class 2606 OID 15764301)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2728 (class 2606 OID 15764291)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2727 (class 2606 OID 15764286)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2729 (class 2606 OID 15764296)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2693 (class 2606 OID 15764116)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2694 (class 2606 OID 15764121)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 15764351)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2792 (class 2606 OID 15764611)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2793 (class 2606 OID 15764616)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2794 (class 2606 OID 15764621)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 15764331)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2751 (class 2606 OID 15764406)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2752 (class 2606 OID 15764411)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2774 (class 2606 OID 15764521)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 15764516)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2770 (class 2606 OID 15764501)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2771 (class 2606 OID 15764506)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 15764511)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2705 (class 2606 OID 15764176)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2704 (class 2606 OID 15764171)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 15764181)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2742 (class 2606 OID 15764361)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2741 (class 2606 OID 15764356)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 15764531)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15764536)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2768 (class 2606 OID 15764491)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 15764496)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2766 (class 2606 OID 15764481)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2767 (class 2606 OID 15764486)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 15764401)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 15764321)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2733 (class 2606 OID 15764316)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2731 (class 2606 OID 15764306)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2732 (class 2606 OID 15764311)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2765 (class 2606 OID 15764476)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2764 (class 2606 OID 15764471)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 15764526)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2714 (class 2606 OID 15764221)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2778 (class 2606 OID 15764541)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 15764551)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2790 (class 2606 OID 15764601)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2791 (class 2606 OID 15764606)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2698 (class 2606 OID 15764141)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 15764136)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2701 (class 2606 OID 15764156)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 15764161)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 15764281)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 15764276)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2724 (class 2606 OID 15764271)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-27 08:31:46 CEST

--
-- PostgreSQL database dump complete
--

