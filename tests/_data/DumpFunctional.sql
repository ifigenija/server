--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-07 15:33:58 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 240 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 17598353)
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
-- TOC entry 222 (class 1259 OID 17598867)
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
-- TOC entry 221 (class 1259 OID 17598850)
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
-- TOC entry 215 (class 1259 OID 17598760)
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
-- TOC entry 238 (class 1259 OID 17599115)
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
-- TOC entry 191 (class 1259 OID 17598531)
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
-- TOC entry 193 (class 1259 OID 17598562)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 17599017)
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
-- TOC entry 186 (class 1259 OID 17598474)
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
-- TOC entry 223 (class 1259 OID 17598880)
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
-- TOC entry 209 (class 1259 OID 17598695)
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
-- TOC entry 189 (class 1259 OID 17598510)
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
-- TOC entry 187 (class 1259 OID 17598491)
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
-- TOC entry 198 (class 1259 OID 17598609)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 17599096)
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
-- TOC entry 237 (class 1259 OID 17599108)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 17599130)
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
-- TOC entry 202 (class 1259 OID 17598634)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 17598448)
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
-- TOC entry 178 (class 1259 OID 17598362)
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
-- TOC entry 179 (class 1259 OID 17598373)
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
-- TOC entry 174 (class 1259 OID 17598327)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 17598346)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 17598641)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 17598675)
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
-- TOC entry 218 (class 1259 OID 17598799)
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
-- TOC entry 181 (class 1259 OID 17598406)
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
-- TOC entry 183 (class 1259 OID 17598440)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 17598615)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 17598425)
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
-- TOC entry 188 (class 1259 OID 17598503)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 201 (class 1259 OID 17598627)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 17598978)
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
-- TOC entry 226 (class 1259 OID 17598988)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 17598935)
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
-- TOC entry 227 (class 1259 OID 17598996)
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
-- TOC entry 205 (class 1259 OID 17598656)
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
-- TOC entry 197 (class 1259 OID 17598600)
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
-- TOC entry 196 (class 1259 OID 17598590)
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
-- TOC entry 217 (class 1259 OID 17598788)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 212 (class 1259 OID 17598727)
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
-- TOC entry 171 (class 1259 OID 17598298)
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
-- TOC entry 170 (class 1259 OID 17598296)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 206 (class 1259 OID 17598669)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 17598336)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 17598320)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 17598683)
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
-- TOC entry 200 (class 1259 OID 17598621)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 17598567)
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
-- TOC entry 232 (class 1259 OID 17599037)
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
-- TOC entry 231 (class 1259 OID 17599029)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 17599024)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 213 (class 1259 OID 17598737)
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
-- TOC entry 180 (class 1259 OID 17598398)
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
-- TOC entry 195 (class 1259 OID 17598577)
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
-- TOC entry 216 (class 1259 OID 17598777)
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
-- TOC entry 228 (class 1259 OID 17599006)
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
-- TOC entry 185 (class 1259 OID 17598460)
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
-- TOC entry 172 (class 1259 OID 17598307)
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
-- TOC entry 220 (class 1259 OID 17598825)
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
-- TOC entry 190 (class 1259 OID 17598521)
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
-- TOC entry 204 (class 1259 OID 17598648)
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
-- TOC entry 214 (class 1259 OID 17598751)
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
-- TOC entry 234 (class 1259 OID 17599076)
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
-- TOC entry 233 (class 1259 OID 17599048)
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
-- TOC entry 235 (class 1259 OID 17599088)
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
-- TOC entry 211 (class 1259 OID 17598720)
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
-- TOC entry 192 (class 1259 OID 17598557)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 17598815)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 210 (class 1259 OID 17598710)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2171 (class 2604 OID 17598301)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2904 (class 0 OID 17598353)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17598867)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ed-9244-f624-12f57ff97a18	000d0000-55ed-9244-7114-6ea3a8f214c4	\N	00090000-55ed-9244-8824-9cc3d8362d92	000b0000-55ed-9244-4aa0-551f7745d5fb	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ed-9244-297e-f31730eed2bb	000d0000-55ed-9244-3ef3-280716540b90	00100000-55ed-9244-3249-083d42d9e730	00090000-55ed-9244-378a-9ba2ba945193	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ed-9244-258e-542709623460	000d0000-55ed-9244-4fc4-c0b01e20d41a	00100000-55ed-9244-8ab5-03b748b37743	00090000-55ed-9244-07db-75d97e940432	\N	0003	t	\N	2015-09-07	\N	2	t	\N	f	f
000c0000-55ed-9244-93ef-44e137d049fe	000d0000-55ed-9244-f983-fd7610b4263d	\N	00090000-55ed-9244-3b20-ebf6d2b2f024	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ed-9244-98b9-4ac7b88b85da	000d0000-55ed-9244-1161-497c89bae39f	\N	00090000-55ed-9244-7f6e-33d875d025d2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ed-9244-dfdc-f30a0ad77a3a	000d0000-55ed-9244-c61d-80560b375156	\N	00090000-55ed-9244-8183-a50bdec70342	000b0000-55ed-9244-ca67-2998525c99ed	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ed-9244-a8ae-92f63c261dd7	000d0000-55ed-9244-1b6e-57d8c050b6ea	00100000-55ed-9244-513b-f214c0e2a2d9	00090000-55ed-9244-4539-007fccd23a3a	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ed-9244-cf74-c81c09cbd505	000d0000-55ed-9244-c0ea-5c90bdb38aa9	\N	00090000-55ed-9244-6ce0-4b37063ed190	000b0000-55ed-9244-8855-4419df472072	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ed-9244-e01e-ae6fd7b53734	000d0000-55ed-9244-1b6e-57d8c050b6ea	00100000-55ed-9244-db4d-96fe7876a07c	00090000-55ed-9244-5ad0-3ac518b0dad4	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ed-9244-e936-c589e1d10c7c	000d0000-55ed-9244-1b6e-57d8c050b6ea	00100000-55ed-9244-4749-e1b018e1bdb2	00090000-55ed-9244-126d-61cf7bf580ef	\N	0010	t	\N	2015-09-07	\N	16	f	\N	f	t
000c0000-55ed-9244-3a37-f9ca7639bba2	000d0000-55ed-9244-1b6e-57d8c050b6ea	00100000-55ed-9244-99c0-ace2e4eebf47	00090000-55ed-9244-655b-e25befdf7e16	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2948 (class 0 OID 17598850)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 17598760)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ed-9244-b094-06e3da019372	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ed-9244-811e-680863efaefd	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ed-9244-7833-282f4fc3f82e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2965 (class 0 OID 17599115)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17598531)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ed-9244-b0ce-ae5111bff69a	\N	\N	00200000-55ed-9244-dd97-9b69b50e40a7	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ed-9244-6e74-e7dcf823f919	\N	\N	00200000-55ed-9244-6ef5-46be3475295b	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ed-9244-6fcd-358fe9d94ce1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ed-9244-f89c-61ba73066c5f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ed-9244-de73-0e0aadddce90	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2920 (class 0 OID 17598562)
-- Dependencies: 193
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 17599017)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 17598474)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ed-9243-a5e2-977357066df7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ed-9243-d189-37430329588e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ed-9243-23ba-7b857200b8a6	AL	ALB	008	Albania 	Albanija	\N
00040000-55ed-9243-27da-3c6ddb26ae5a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ed-9243-7a9b-a1e1da4f3400	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ed-9243-2350-c34b733490e5	AD	AND	020	Andorra 	Andora	\N
00040000-55ed-9243-b07c-b90771a1c5cb	AO	AGO	024	Angola 	Angola	\N
00040000-55ed-9243-dcd1-75b688bc30e1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ed-9243-5e35-7ed550257f50	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ed-9243-aabb-0493243a327c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ed-9243-7a8b-50b3db7604bb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ed-9243-220c-f39d396ef3b4	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ed-9243-85e2-207e9686b6dd	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ed-9243-202f-11c8dfce9c37	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ed-9243-01bb-166e6244974a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ed-9243-78fb-b175add39f66	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ed-9243-d3b5-92986a2aa1ff	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ed-9243-fdb5-db1cb77e424c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ed-9243-6f2e-0dd008cb4433	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ed-9243-73ba-00849441c89a	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ed-9243-e4bd-b7555c743832	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ed-9243-f64f-8add7ab47615	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ed-9243-6291-0ca238ed07c8	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ed-9243-bf50-9748c92275ec	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ed-9243-bc21-d3cc4dcdd19c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ed-9243-b496-925632b0a787	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ed-9243-1190-5e1cfb65c504	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ed-9243-b3f9-78379152f56d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ed-9243-c625-8e0646399974	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ed-9243-92fa-42312345546a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ed-9243-41e9-e25279505891	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ed-9243-7199-c8047bcf2e92	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ed-9243-27c6-1ad8a46301f2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ed-9243-3e24-55bca06003a3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ed-9243-31a2-9f6b7c9361fe	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ed-9243-f14c-11a53c2066d0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ed-9243-686b-0ce1bb3fca2f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ed-9243-fd4b-2ba1f098c226	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ed-9243-044d-b26c46f9da91	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ed-9243-b8d4-a2d8e1fe1b0b	CA	CAN	124	Canada 	Kanada	\N
00040000-55ed-9243-79b6-bb490ad4215c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ed-9243-82d0-5002a687a555	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ed-9243-d276-f703aca94d23	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ed-9243-38b0-ed0b9f30ab7a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ed-9243-0200-47cce0264470	CL	CHL	152	Chile 	Čile	\N
00040000-55ed-9243-fd4e-0a3361eb8035	CN	CHN	156	China 	Kitajska	\N
00040000-55ed-9243-21e5-2d569719f84b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ed-9243-a6de-69b140fd36bf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ed-9243-90e6-04b4f2e23a9c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ed-9243-7c39-9ec6cfc2adc8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ed-9243-9fbf-f35131efe9d5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ed-9243-a1ba-f8084fea18f2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ed-9243-a8df-2565eaaf7121	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ed-9243-5440-b4ebdf9280af	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ed-9243-b3ac-f16d50d15ba4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ed-9243-4673-a6acfc46a5e1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ed-9243-a6f1-c4553988175a	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ed-9243-2269-87f16e71352c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ed-9243-3ae1-2195b6a24b69	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ed-9243-d202-d2f4ba70eb86	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ed-9243-8add-bf33069fac4d	DK	DNK	208	Denmark 	Danska	\N
00040000-55ed-9243-7b9f-4bacb9eb2d85	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ed-9243-2bdb-8407aaf49dd8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ed-9243-9d66-be8dcd25169f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ed-9243-d5ad-274427f48bee	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ed-9243-b249-bdd6bb9fa28e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ed-9243-b98a-e95fd3e8a152	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ed-9243-5395-e6f277cb2aee	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ed-9243-4964-d04eaf51252a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ed-9243-4616-7854bdfdcc27	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ed-9243-0207-41f7e3142d9f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ed-9243-d2d6-1f0e74998a8d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ed-9243-ca73-8c2530dee09c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ed-9243-d4be-3980f0ac1407	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ed-9243-99a3-8fbe1954cc62	FI	FIN	246	Finland 	Finska	\N
00040000-55ed-9243-2c7f-cf38e7aad584	FR	FRA	250	France 	Francija	\N
00040000-55ed-9243-3c15-86cec56b28cb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ed-9243-1c7d-fff720805d39	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ed-9243-ea51-1cd170cfb2e9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ed-9243-9deb-44c9007548e4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ed-9243-7a1d-6934cd4f970c	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ed-9243-9d3e-cb3002ef3bac	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ed-9243-c8ae-2d4eca4e674b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ed-9243-7264-0d054ef6b497	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ed-9243-3a1e-b834593bf99a	GH	GHA	288	Ghana 	Gana	\N
00040000-55ed-9243-78b2-b02a8917b147	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ed-9243-9a2a-76d1c645c46c	GR	GRC	300	Greece 	Grčija	\N
00040000-55ed-9243-612c-0e2c1a493407	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ed-9243-dfd0-406ffdb421fc	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ed-9243-ea44-ac147913d95e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ed-9243-80d4-fa51ba4184e0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ed-9243-9678-724b145f36b9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ed-9243-687e-e550e462a123	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ed-9243-4445-a28920af0dbd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ed-9243-3946-36098fba9786	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ed-9243-8dea-606e0beffd67	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ed-9243-108b-39e85177692b	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ed-9243-f188-c51385ff20c8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ed-9243-e208-e5e639c0e462	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ed-9243-3f18-4ebeaf504c4e	HN	HND	340	Honduras 	Honduras	\N
00040000-55ed-9243-d223-004b5bf2eeab	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ed-9243-b95e-25c5968230cd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ed-9243-4181-00d082a6c433	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ed-9243-2eba-0dabbae82428	IN	IND	356	India 	Indija	\N
00040000-55ed-9243-1625-530003728749	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ed-9243-f162-2560c073015e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ed-9243-ae89-5e37d4300b7f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ed-9243-5239-84a4984dc590	IE	IRL	372	Ireland 	Irska	\N
00040000-55ed-9243-2848-d15f9795e49f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ed-9243-5be2-3ce8ad546581	IL	ISR	376	Israel 	Izrael	\N
00040000-55ed-9243-7303-0e3515c98fa3	IT	ITA	380	Italy 	Italija	\N
00040000-55ed-9243-e49d-6b2196da60b2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ed-9243-d23c-7370d464ce44	JP	JPN	392	Japan 	Japonska	\N
00040000-55ed-9243-765f-24db24c9f9e2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ed-9243-c5f2-7ea8db0210c8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ed-9243-08e8-14dc763dcb91	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ed-9243-a3ad-1eb020009004	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ed-9243-67a9-94ea46145eb1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ed-9243-1639-a6a11cfb5a12	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ed-9243-0b4a-fdb600ba0d09	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ed-9243-44f6-9247d78cea98	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ed-9243-3920-f50fbcfbae56	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ed-9243-3acb-f26f0247d2e6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ed-9243-cf5d-697207ae96a1	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ed-9243-34de-65a93e31c546	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ed-9243-6023-c0273ec85a46	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ed-9243-9b30-8826cdb43396	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ed-9243-bbec-cff473d35b8a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ed-9243-fd58-083897ee296e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ed-9243-f86c-4497eb089072	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ed-9243-547a-9feabd0e0206	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ed-9243-b3d8-b55499130bfd	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ed-9243-a11f-be444cad22a6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ed-9243-b3b5-8455aa4a1c58	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ed-9243-11e8-f126057602ce	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ed-9243-f47d-6f173fa98f27	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ed-9243-ac0f-5a8a261801b4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ed-9243-3ed7-60d132705fef	ML	MLI	466	Mali 	Mali	\N
00040000-55ed-9243-e446-5125bd523cc6	MT	MLT	470	Malta 	Malta	\N
00040000-55ed-9243-8c5c-e4cc4fce2bbd	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ed-9243-0d36-189844fd742b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ed-9243-f911-ae194a5f21e5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ed-9243-9522-746a5fcedc41	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ed-9243-121a-7c1fea0c629f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ed-9243-802a-b0081296e011	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ed-9243-2620-5bd4e08e6232	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ed-9243-1c0d-7f4ac80d2fbf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ed-9243-a418-b9b29db69761	MC	MCO	492	Monaco 	Monako	\N
00040000-55ed-9243-8cf3-402983d07118	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ed-9243-8fde-171cd3eab180	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ed-9243-6805-c922f73f8180	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ed-9243-d746-c90b24396cd2	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ed-9243-3304-39212c3e2085	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ed-9243-2e87-631b96c854e2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ed-9243-4345-7613abad97f2	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ed-9243-04ad-ed879b83587b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ed-9243-bef6-3ce15f9c26a6	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ed-9243-d77e-868e7cd32665	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ed-9243-f7a0-b68cb9ccbd44	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ed-9243-4dc3-88bfe075aae8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ed-9243-a7db-9a93c6b6a8c8	NE	NER	562	Niger 	Niger 	\N
00040000-55ed-9243-e981-b713e7c36aff	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ed-9243-943a-6b85b2321ff5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ed-9243-af97-c718652776c0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ed-9243-8fbe-817d869fe73c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ed-9243-aefe-68e69eab7265	NO	NOR	578	Norway 	Norveška	\N
00040000-55ed-9243-9bb4-ff1be12974a7	OM	OMN	512	Oman 	Oman	\N
00040000-55ed-9243-3e37-ebb888250d6d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ed-9243-460c-03500be1c0fb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ed-9243-7ad3-6d2c57e22093	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ed-9243-88ad-6e67a961979c	PA	PAN	591	Panama 	Panama	\N
00040000-55ed-9243-28c8-3e8fb6f491e8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ed-9243-9532-4b7f0f25cf96	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ed-9243-bd7c-142c8504d8e2	PE	PER	604	Peru 	Peru	\N
00040000-55ed-9243-4a07-a8c9c4999ba6	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ed-9243-dd95-0aed6586f5e6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ed-9243-1a4f-96b08345971a	PL	POL	616	Poland 	Poljska	\N
00040000-55ed-9243-abe9-5e01fe03ab1f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ed-9243-84a6-1659d969a760	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ed-9243-a3a5-cfee1efe9fd7	QA	QAT	634	Qatar 	Katar	\N
00040000-55ed-9243-dd85-f7ef39752a7b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ed-9243-de43-263ec51ec8e6	RO	ROU	642	Romania 	Romunija	\N
00040000-55ed-9243-dd7f-6d9c1a51e397	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ed-9243-8dc7-74f5abbe4a04	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ed-9243-f144-5369e910f261	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ed-9243-9ec7-61a29f660e78	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ed-9243-4e2e-c6d7f7738de9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ed-9243-35e8-8e0b47e4eaee	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ed-9243-8797-f5589971bb84	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ed-9243-bcb8-25602d12efe6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ed-9243-a3bd-a9d575c2cf09	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ed-9243-8c59-5d8be149fab9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ed-9243-23dd-59791b4fca05	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ed-9243-6d4e-100e552415e7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ed-9243-0896-08c1613324e9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ed-9243-9cb6-154a10598ad8	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ed-9243-427a-8dc02ab45d04	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ed-9243-2c80-2c2e9f10b14f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ed-9243-c79a-abce88944565	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ed-9243-e7ee-de88c96f3d12	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ed-9243-ee5a-5cd476524014	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ed-9243-b669-e79a580b17a0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ed-9243-81ec-ec79336c4b9b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ed-9243-bb39-e410b38d3057	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ed-9243-a733-bb0c9b5b62c7	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ed-9243-5016-ef59cf4b74d3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ed-9243-96cf-e193e17fb8b3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ed-9243-6f44-f256f949fe0c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ed-9243-be8e-5b74e8e45864	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ed-9243-613b-385e4f9f4b0c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ed-9243-0fff-06c1acb3fd1e	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ed-9243-7964-496643317a81	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ed-9243-bbaf-89537ab211f1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ed-9243-a04b-7adda4c4f833	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ed-9243-48a1-416e7149f603	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ed-9243-62b3-3382e3d7fea6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ed-9243-de9e-9e3d0dc967b5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ed-9243-afa4-1cbcf6fd84bb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ed-9243-9843-1aa757607625	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ed-9243-46b2-7ee3ac690c54	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ed-9243-394f-08e742d45256	TH	THA	764	Thailand 	Tajska	\N
00040000-55ed-9243-f890-25304b59d1be	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ed-9243-4cde-39fdea6092d4	TG	TGO	768	Togo 	Togo	\N
00040000-55ed-9243-5ff3-2020586984f7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ed-9243-5628-c6e5dd22b0d7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ed-9243-346d-fb6416129910	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ed-9243-bb69-992e7ef3a821	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ed-9243-b097-2231bc330841	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ed-9243-825d-e9035bc14350	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ed-9243-91bb-f89ce0006a78	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ed-9243-5138-70c65fad4558	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ed-9243-133b-950675917ab1	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ed-9243-2dd9-ae6a90bce0ae	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ed-9243-7fc5-4f3c672d8f55	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ed-9243-61c5-167076f691f1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ed-9243-da49-65f6c2e913a7	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ed-9243-30c5-b949ecd7589e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ed-9243-43e6-3625020d2e08	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ed-9243-3cc6-c171723a4ad4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ed-9243-764c-7c7416de6e1e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ed-9243-6aec-560673ffd2f0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ed-9243-cd1f-5982a05a1dbc	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ed-9243-e767-ce926785c743	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ed-9243-1541-47dc4c1ebd09	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ed-9243-b4bb-77953a1f7bdf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ed-9243-3f98-24eca01d64a8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ed-9243-08f2-650580f71406	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ed-9243-d7d3-da34561dc0cb	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ed-9243-d20d-f7d32ebebebf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2950 (class 0 OID 17598880)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ed-9244-9fb6-a8ba3453b563	000e0000-55ed-9244-0900-060ba9134df9	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ed-9243-7073-d34c48f16a07	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ed-9244-f836-ca321934aa54	000e0000-55ed-9244-93ec-9395efe393c8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ed-9243-c537-e8082519bff0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ed-9244-4fc6-d96719125984	000e0000-55ed-9244-0d52-69a9d077a0ad	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ed-9243-7073-d34c48f16a07	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ed-9244-85c2-3e5bf6ee1ca1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ed-9244-3171-2f564bc5cd0a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2936 (class 0 OID 17598695)
-- Dependencies: 209
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ed-9244-7114-6ea3a8f214c4	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-f624-12f57ff97a18	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ed-9243-feaa-ae692d8eea5f
000d0000-55ed-9244-3ef3-280716540b90	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-297e-f31730eed2bb	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ed-9243-7159-8c3423cf3bfa
000d0000-55ed-9244-4fc4-c0b01e20d41a	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-258e-542709623460	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ed-9243-49bc-7b4219e230dc
000d0000-55ed-9244-f983-fd7610b4263d	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-93ef-44e137d049fe	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ed-9243-5dbb-5339e6022f38
000d0000-55ed-9244-1161-497c89bae39f	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-98b9-4ac7b88b85da	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ed-9243-5dbb-5339e6022f38
000d0000-55ed-9244-c61d-80560b375156	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-dfdc-f30a0ad77a3a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ed-9243-feaa-ae692d8eea5f
000d0000-55ed-9244-1b6e-57d8c050b6ea	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-e01e-ae6fd7b53734	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ed-9243-feaa-ae692d8eea5f
000d0000-55ed-9244-c0ea-5c90bdb38aa9	000e0000-55ed-9244-93ec-9395efe393c8	000c0000-55ed-9244-cf74-c81c09cbd505	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ed-9243-364c-dcaf45c9f2fa
\.


--
-- TOC entry 2916 (class 0 OID 17598510)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 17598491)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ed-9244-5bab-445d308d8d2c	00080000-55ed-9244-ba77-6e253625644e	00090000-55ed-9244-126d-61cf7bf580ef	AK		igralka
\.


--
-- TOC entry 2925 (class 0 OID 17598609)
-- Dependencies: 198
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 17599096)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 17599108)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17599130)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 17598634)
-- Dependencies: 202
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 17598448)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ed-9243-9f27-adc01836967f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ed-9243-8aff-075a00fcc005	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ed-9243-ae54-85491282d103	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ed-9243-76a8-8a74ed4051ee	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ed-9243-efca-7e02f10c392e	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ed-9243-3419-ec90a493908c	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ed-9243-426a-3786071ad304	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ed-9243-0615-e2589e8c1499	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ed-9243-b4fc-3b0a18c6ad55	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ed-9243-7b37-b825b7b506ad	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ed-9243-c440-52371e2027ae	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ed-9243-9d06-5c22abdb3b3f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ed-9243-4eb8-da84149f6f36	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ed-9243-91d3-8be70bc93dbb	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ed-9244-07b0-a544f4412bfa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ed-9244-735b-cb348e13a6be	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ed-9244-9bea-44dce8830121	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ed-9244-eac0-14ad2c17c731	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ed-9244-ca8e-43efed8a222e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ed-9245-fa28-e3c560c94072	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2905 (class 0 OID 17598362)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ed-9244-d352-5b2a08a29f28	00000000-55ed-9244-07b0-a544f4412bfa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ed-9244-9323-7c93e9732f08	00000000-55ed-9244-07b0-a544f4412bfa	00010000-55ed-9243-8cd3-9f9bfe0d7ae0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ed-9244-9048-24f14223f743	00000000-55ed-9244-735b-cb348e13a6be	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2906 (class 0 OID 17598373)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ed-9244-8824-9cc3d8362d92	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ed-9244-3b20-ebf6d2b2f024	00010000-55ed-9244-c652-614b269a7f3d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ed-9244-07db-75d97e940432	00010000-55ed-9244-8876-d6f38d3aeaf3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ed-9244-5ad0-3ac518b0dad4	00010000-55ed-9244-f97b-943cee0e1b42	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ed-9244-09f2-b51dba040346	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ed-9244-8183-a50bdec70342	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ed-9244-655b-e25befdf7e16	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ed-9244-4539-007fccd23a3a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ed-9244-126d-61cf7bf580ef	00010000-55ed-9244-7fce-3d3bd7a96393	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ed-9244-378a-9ba2ba945193	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ed-9244-1a72-a1a8aa6e04ad	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ed-9244-7f6e-33d875d025d2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ed-9244-6ce0-4b37063ed190	00010000-55ed-9244-2298-fc5d08ff1b46	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 17598327)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ed-9243-7153-f256f4d3792a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ed-9243-5faf-8a122ec703e2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ed-9243-655e-4f1e091b9629	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ed-9243-b36f-eb3bc73433d9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ed-9243-a4ed-d1bf7239cb7a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ed-9243-99f9-2aded9b3e217	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ed-9243-801d-2ba614719904	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ed-9243-61eb-922e17508d32	Abonma-read	Abonma - branje	f
00030000-55ed-9243-dfa8-7c4fc07c7312	Abonma-write	Abonma - spreminjanje	f
00030000-55ed-9243-aa01-d86bc87badbc	Alternacija-read	Alternacija - branje	f
00030000-55ed-9243-d11e-0408d819772f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ed-9243-e765-924a8cd20ddc	Arhivalija-read	Arhivalija - branje	f
00030000-55ed-9243-c8b8-efbbd91b721e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ed-9243-45aa-2d46c630944e	Besedilo-read	Besedilo - branje	f
00030000-55ed-9243-c5bc-7f9c0a92578d	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ed-9243-332e-8a8febb65d0b	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ed-9243-2728-f33709de6c22	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ed-9243-b9b6-9651b131f0a3	Dogodek-read	Dogodek - branje	f
00030000-55ed-9243-bfcf-2e958f6cf56a	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ed-9243-fa39-bfd2ab64f269	DrugiVir-read	DrugiVir - branje	f
00030000-55ed-9243-28c1-1e871296caa3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ed-9243-123e-40b7aa0411c6	Drzava-read	Drzava - branje	f
00030000-55ed-9243-c8d6-7eea0d145a76	Drzava-write	Drzava - spreminjanje	f
00030000-55ed-9243-5684-2e8a57f26ba9	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ed-9243-e25d-c2642600fd6b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ed-9243-e488-68e0a55f9e21	Funkcija-read	Funkcija - branje	f
00030000-55ed-9243-6b5d-5c2ecda6f26d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ed-9243-3a40-f14dc963a55b	Gostovanje-read	Gostovanje - branje	f
00030000-55ed-9243-4adb-ccb2e10da0a2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ed-9243-f6f1-61f6c38848c6	Gostujoca-read	Gostujoca - branje	f
00030000-55ed-9243-9d47-04073250388a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ed-9243-a46f-57719306bfb1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ed-9243-d703-6d9ca5fe35b0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ed-9243-effe-530e20a6fd78	Kupec-read	Kupec - branje	f
00030000-55ed-9243-a356-f821fd129faa	Kupec-write	Kupec - spreminjanje	f
00030000-55ed-9243-4483-a8cdc5e87f14	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ed-9243-c798-bd1c009d0a0f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ed-9243-06cf-0349779bb9b8	Option-read	Option - branje	f
00030000-55ed-9243-af84-1471f33204d5	Option-write	Option - spreminjanje	f
00030000-55ed-9243-40ac-a7dda3f2b904	OptionValue-read	OptionValue - branje	f
00030000-55ed-9243-e94a-9d200324742a	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ed-9243-66d4-9f50ae27cc6c	Oseba-read	Oseba - branje	f
00030000-55ed-9243-07b4-fbbd5fdfa66c	Oseba-write	Oseba - spreminjanje	f
00030000-55ed-9243-bd68-177807e58e40	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ed-9243-fdd9-33a13cbb2f12	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ed-9243-36b9-bec4a62d323f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ed-9243-04fe-18b598d5e6fe	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ed-9243-be99-bc4229769696	Pogodba-read	Pogodba - branje	f
00030000-55ed-9243-0e2d-2794569d742b	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ed-9243-4b6a-c556c4fd1198	Popa-read	Popa - branje	f
00030000-55ed-9243-451f-181227bb64c2	Popa-write	Popa - spreminjanje	f
00030000-55ed-9243-898d-071750ab5bda	Posta-read	Posta - branje	f
00030000-55ed-9243-1f19-be419eadd2e3	Posta-write	Posta - spreminjanje	f
00030000-55ed-9243-ecef-bee2eb7fd2e7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ed-9243-f49a-5c4bec5bdf56	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ed-9243-7954-d15f1c952a69	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ed-9243-1a58-9a0f92ee5534	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ed-9243-644c-c1f57e25423e	Predstava-read	Predstava - branje	f
00030000-55ed-9243-6935-a0256b0fe30e	Predstava-write	Predstava - spreminjanje	f
00030000-55ed-9243-ff8c-517528ce81ad	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ed-9243-795a-fd3f83cc5890	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ed-9243-21c9-98c815728d34	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ed-9243-5d49-1c6f77ddb39d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ed-9243-4935-ab678ee15c26	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ed-9243-6653-db6e7faa3abb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ed-9243-fdd1-0a81c6ac7d36	ProgramDela-read	ProgramDela - branje	f
00030000-55ed-9243-1bea-831a96068308	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ed-9243-536e-3652087c84af	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ed-9243-1309-185abc032251	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ed-9243-2d76-94d2fb1344c9	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ed-9243-3499-57775b4f3298	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ed-9243-bb78-b8ad0a397af6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ed-9243-1ac8-8ddb2280081c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ed-9243-c280-13e48828edac	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ed-9243-3452-3e40d990be9a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ed-9243-2bca-7ac51109b816	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ed-9243-dfbe-e4127f23afeb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ed-9243-474e-00ffe07c4d95	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ed-9243-c82d-e2d4414888d5	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ed-9243-a336-1e341e057c83	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ed-9243-54f1-21d0e5207360	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ed-9243-c951-680771dca2d1	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ed-9243-2611-dd0839fa4208	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ed-9243-4b59-e1d575ab9b96	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ed-9243-69a3-88c473c312ce	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ed-9243-36f1-23379e360c56	Prostor-read	Prostor - branje	f
00030000-55ed-9243-cba5-be7743730b3b	Prostor-write	Prostor - spreminjanje	f
00030000-55ed-9243-0846-6eabcf735724	Racun-read	Racun - branje	f
00030000-55ed-9243-7467-bc94e47db306	Racun-write	Racun - spreminjanje	f
00030000-55ed-9243-3fee-82dae58f1415	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ed-9243-4241-7ec57dde6fb3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ed-9243-b176-71e0366ea4d2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ed-9243-409c-d256f553d135	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ed-9243-e279-8b5eb7b3e694	Rekvizit-read	Rekvizit - branje	f
00030000-55ed-9243-d5fe-15b642166c44	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ed-9243-ee0f-65733d294948	Revizija-read	Revizija - branje	f
00030000-55ed-9243-e70f-b03f4857227d	Revizija-write	Revizija - spreminjanje	f
00030000-55ed-9243-71cc-12022b1668d8	Rezervacija-read	Rezervacija - branje	f
00030000-55ed-9243-440b-69bdb8a7356f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ed-9243-d442-4c87d66a6f58	SedezniRed-read	SedezniRed - branje	f
00030000-55ed-9243-b8ae-300205d4bd5c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ed-9243-c141-c08e11bb7fb0	Sedez-read	Sedez - branje	f
00030000-55ed-9243-b6f5-b7e53c53f639	Sedez-write	Sedez - spreminjanje	f
00030000-55ed-9243-9475-9ac9d06a43dd	Sezona-read	Sezona - branje	f
00030000-55ed-9243-d1bb-9dfa9ef34af6	Sezona-write	Sezona - spreminjanje	f
00030000-55ed-9243-0961-6e48d6b06ecf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ed-9243-830b-1ae1c58e289c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ed-9243-447e-18c843bfc202	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ed-9243-9a9b-2eb4c0837d59	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ed-9243-d132-cbe92db747ee	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ed-9243-6289-2b81160a6dc9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ed-9243-b9c8-7d6a949cfd66	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ed-9243-b5b1-a2a651f9ea2e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ed-9243-1a8d-4cd1591fb0ac	Telefonska-read	Telefonska - branje	f
00030000-55ed-9243-0deb-5194f751fe1d	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ed-9243-4032-66ba5a0a97b3	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ed-9243-9abc-2555953522cc	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ed-9243-5179-ddf11b28b3a6	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ed-9243-ca0f-a6df0b857391	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ed-9243-6ff8-b89866bffb90	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ed-9243-6f44-4f676a46fbfd	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ed-9243-71fd-05f92f2b184c	Trr-read	Trr - branje	f
00030000-55ed-9243-de55-852bd871b952	Trr-write	Trr - spreminjanje	f
00030000-55ed-9243-1ec4-0e1e3716180e	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ed-9243-ad43-4edf816649e9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ed-9243-c321-1b28df6087fd	Vaja-read	Vaja - branje	f
00030000-55ed-9243-579d-43e78eba7d59	Vaja-write	Vaja - spreminjanje	f
00030000-55ed-9243-a7a2-33421ff5f0d8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ed-9243-32a5-0767383c96ed	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ed-9243-e549-f5a6bb1fb203	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ed-9243-b3eb-96e29296c82c	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ed-9243-e115-8470d5a309af	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ed-9243-1838-73339a433668	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ed-9243-ef52-42c1f5f3ea67	Zasedenost-read	Zasedenost - branje	f
00030000-55ed-9243-6010-ca5d19d27488	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ed-9243-c17b-1ba373adebe1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ed-9243-4c94-15098ea0db62	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ed-9243-54ea-37e18fccda13	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ed-9243-ccd6-06560ac56eb6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ed-9243-1512-2236e6bac47c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ed-9243-8576-1c783d68f009	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ed-9243-eb8f-690bd96827cc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ed-9243-d3cb-df0d22d33e73	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ed-9243-e552-f1a6f6eb3c73	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ed-9243-fc48-2a2f52bd5838	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ed-9243-8b57-d886c9d49b06	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ed-9243-2940-9070aea2f863	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ed-9243-eea7-8ae509408cd7	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ed-9243-1d75-0412cfd63613	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ed-9243-dbad-760da5e38507	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ed-9243-6cfd-894a6c4dbed3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2903 (class 0 OID 17598346)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ed-9243-f11b-e955db438e99	00030000-55ed-9243-5faf-8a122ec703e2
00020000-55ed-9243-03fb-b27d9e3b36a6	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-61eb-922e17508d32
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-dfa8-7c4fc07c7312
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-aa01-d86bc87badbc
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-d11e-0408d819772f
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-e765-924a8cd20ddc
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-b9b6-9651b131f0a3
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-b36f-eb3bc73433d9
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-bfcf-2e958f6cf56a
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-c8d6-7eea0d145a76
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-e488-68e0a55f9e21
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-6b5d-5c2ecda6f26d
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-3a40-f14dc963a55b
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-4adb-ccb2e10da0a2
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-f6f1-61f6c38848c6
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-9d47-04073250388a
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-a46f-57719306bfb1
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-d703-6d9ca5fe35b0
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-06cf-0349779bb9b8
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-40ac-a7dda3f2b904
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-66d4-9f50ae27cc6c
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-07b4-fbbd5fdfa66c
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-4b6a-c556c4fd1198
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-451f-181227bb64c2
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-898d-071750ab5bda
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-1f19-be419eadd2e3
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-7954-d15f1c952a69
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-1a58-9a0f92ee5534
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-644c-c1f57e25423e
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-6935-a0256b0fe30e
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-4935-ab678ee15c26
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-6653-db6e7faa3abb
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-36f1-23379e360c56
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-cba5-be7743730b3b
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-b176-71e0366ea4d2
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-409c-d256f553d135
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-e279-8b5eb7b3e694
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-d5fe-15b642166c44
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-9475-9ac9d06a43dd
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-d1bb-9dfa9ef34af6
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-5179-ddf11b28b3a6
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-1ec4-0e1e3716180e
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-ad43-4edf816649e9
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-c321-1b28df6087fd
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-579d-43e78eba7d59
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-ef52-42c1f5f3ea67
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-6010-ca5d19d27488
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-c17b-1ba373adebe1
00020000-55ed-9243-4c1a-13a50a3c1719	00030000-55ed-9243-54ea-37e18fccda13
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-61eb-922e17508d32
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-e765-924a8cd20ddc
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-b9b6-9651b131f0a3
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-3a40-f14dc963a55b
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-f6f1-61f6c38848c6
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-a46f-57719306bfb1
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-d703-6d9ca5fe35b0
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-06cf-0349779bb9b8
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-40ac-a7dda3f2b904
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-66d4-9f50ae27cc6c
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-07b4-fbbd5fdfa66c
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-4b6a-c556c4fd1198
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-898d-071750ab5bda
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-7954-d15f1c952a69
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-1a58-9a0f92ee5534
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-644c-c1f57e25423e
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-36f1-23379e360c56
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-b176-71e0366ea4d2
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-e279-8b5eb7b3e694
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-9475-9ac9d06a43dd
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-1a8d-4cd1591fb0ac
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-0deb-5194f751fe1d
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-71fd-05f92f2b184c
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-de55-852bd871b952
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-e115-8470d5a309af
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-1838-73339a433668
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-c17b-1ba373adebe1
00020000-55ed-9243-35cd-2180113ee2e3	00030000-55ed-9243-54ea-37e18fccda13
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-61eb-922e17508d32
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-aa01-d86bc87badbc
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-e765-924a8cd20ddc
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-c8b8-efbbd91b721e
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-45aa-2d46c630944e
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-332e-8a8febb65d0b
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-b9b6-9651b131f0a3
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-e488-68e0a55f9e21
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-3a40-f14dc963a55b
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-f6f1-61f6c38848c6
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-a46f-57719306bfb1
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-06cf-0349779bb9b8
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-40ac-a7dda3f2b904
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-66d4-9f50ae27cc6c
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-4b6a-c556c4fd1198
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-898d-071750ab5bda
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-644c-c1f57e25423e
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-4935-ab678ee15c26
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-36f1-23379e360c56
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-b176-71e0366ea4d2
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-e279-8b5eb7b3e694
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-9475-9ac9d06a43dd
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-5179-ddf11b28b3a6
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-c321-1b28df6087fd
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-ef52-42c1f5f3ea67
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-c17b-1ba373adebe1
00020000-55ed-9243-abd7-7fa85a6dc594	00030000-55ed-9243-54ea-37e18fccda13
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-61eb-922e17508d32
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-dfa8-7c4fc07c7312
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-d11e-0408d819772f
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-e765-924a8cd20ddc
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-b9b6-9651b131f0a3
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-3a40-f14dc963a55b
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-f6f1-61f6c38848c6
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-06cf-0349779bb9b8
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-40ac-a7dda3f2b904
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-4b6a-c556c4fd1198
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-898d-071750ab5bda
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-644c-c1f57e25423e
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-36f1-23379e360c56
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-b176-71e0366ea4d2
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-e279-8b5eb7b3e694
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-9475-9ac9d06a43dd
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-5179-ddf11b28b3a6
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-c17b-1ba373adebe1
00020000-55ed-9243-28a5-e726b83b739e	00030000-55ed-9243-54ea-37e18fccda13
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-61eb-922e17508d32
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-e765-924a8cd20ddc
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-b9b6-9651b131f0a3
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-3a40-f14dc963a55b
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-f6f1-61f6c38848c6
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-06cf-0349779bb9b8
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-40ac-a7dda3f2b904
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-4b6a-c556c4fd1198
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-898d-071750ab5bda
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-644c-c1f57e25423e
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-36f1-23379e360c56
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-b176-71e0366ea4d2
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-e279-8b5eb7b3e694
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-9475-9ac9d06a43dd
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-4032-66ba5a0a97b3
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-655e-4f1e091b9629
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-5179-ddf11b28b3a6
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-c17b-1ba373adebe1
00020000-55ed-9243-5035-cc4986d5068a	00030000-55ed-9243-54ea-37e18fccda13
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-7153-f256f4d3792a
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-5faf-8a122ec703e2
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-655e-4f1e091b9629
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b36f-eb3bc73433d9
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-a4ed-d1bf7239cb7a
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-99f9-2aded9b3e217
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-801d-2ba614719904
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-61eb-922e17508d32
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-dfa8-7c4fc07c7312
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-aa01-d86bc87badbc
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-d11e-0408d819772f
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e765-924a8cd20ddc
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c8b8-efbbd91b721e
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-45aa-2d46c630944e
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c5bc-7f9c0a92578d
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-332e-8a8febb65d0b
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-2728-f33709de6c22
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b9b6-9651b131f0a3
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-bfcf-2e958f6cf56a
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-123e-40b7aa0411c6
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c8d6-7eea0d145a76
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-fa39-bfd2ab64f269
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-28c1-1e871296caa3
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-5684-2e8a57f26ba9
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e25d-c2642600fd6b
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e488-68e0a55f9e21
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6b5d-5c2ecda6f26d
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-3a40-f14dc963a55b
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4adb-ccb2e10da0a2
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-f6f1-61f6c38848c6
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-9d47-04073250388a
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-a46f-57719306bfb1
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-d703-6d9ca5fe35b0
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-effe-530e20a6fd78
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-a356-f821fd129faa
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4483-a8cdc5e87f14
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c798-bd1c009d0a0f
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-06cf-0349779bb9b8
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-af84-1471f33204d5
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-40ac-a7dda3f2b904
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e94a-9d200324742a
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-66d4-9f50ae27cc6c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-07b4-fbbd5fdfa66c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-bd68-177807e58e40
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-fdd9-33a13cbb2f12
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-36b9-bec4a62d323f
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-04fe-18b598d5e6fe
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-be99-bc4229769696
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-0e2d-2794569d742b
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4b6a-c556c4fd1198
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-451f-181227bb64c2
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-898d-071750ab5bda
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1f19-be419eadd2e3
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ecef-bee2eb7fd2e7
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-f49a-5c4bec5bdf56
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-7954-d15f1c952a69
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1a58-9a0f92ee5534
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-644c-c1f57e25423e
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6935-a0256b0fe30e
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ff8c-517528ce81ad
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-795a-fd3f83cc5890
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-21c9-98c815728d34
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-5d49-1c6f77ddb39d
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4935-ab678ee15c26
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6653-db6e7faa3abb
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-fdd1-0a81c6ac7d36
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1bea-831a96068308
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-536e-3652087c84af
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1309-185abc032251
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-2d76-94d2fb1344c9
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-3499-57775b4f3298
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-bb78-b8ad0a397af6
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1ac8-8ddb2280081c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c280-13e48828edac
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-3452-3e40d990be9a
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-2bca-7ac51109b816
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-dfbe-e4127f23afeb
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-474e-00ffe07c4d95
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c82d-e2d4414888d5
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-a336-1e341e057c83
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-54f1-21d0e5207360
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c951-680771dca2d1
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-2611-dd0839fa4208
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4b59-e1d575ab9b96
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-69a3-88c473c312ce
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-36f1-23379e360c56
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-cba5-be7743730b3b
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-0846-6eabcf735724
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-7467-bc94e47db306
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-3fee-82dae58f1415
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4241-7ec57dde6fb3
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b176-71e0366ea4d2
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-409c-d256f553d135
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e279-8b5eb7b3e694
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-d5fe-15b642166c44
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ee0f-65733d294948
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e70f-b03f4857227d
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-71cc-12022b1668d8
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-440b-69bdb8a7356f
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-d442-4c87d66a6f58
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b8ae-300205d4bd5c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c141-c08e11bb7fb0
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b6f5-b7e53c53f639
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-9475-9ac9d06a43dd
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-d1bb-9dfa9ef34af6
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-0961-6e48d6b06ecf
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-830b-1ae1c58e289c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-447e-18c843bfc202
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-9a9b-2eb4c0837d59
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-d132-cbe92db747ee
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6289-2b81160a6dc9
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b9c8-7d6a949cfd66
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b5b1-a2a651f9ea2e
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1a8d-4cd1591fb0ac
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-0deb-5194f751fe1d
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4032-66ba5a0a97b3
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-9abc-2555953522cc
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-5179-ddf11b28b3a6
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ca0f-a6df0b857391
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6ff8-b89866bffb90
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6f44-4f676a46fbfd
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-71fd-05f92f2b184c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-de55-852bd871b952
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1ec4-0e1e3716180e
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ad43-4edf816649e9
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c321-1b28df6087fd
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-579d-43e78eba7d59
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-a7a2-33421ff5f0d8
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-32a5-0767383c96ed
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e549-f5a6bb1fb203
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-b3eb-96e29296c82c
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-e115-8470d5a309af
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-1838-73339a433668
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ef52-42c1f5f3ea67
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-6010-ca5d19d27488
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-c17b-1ba373adebe1
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-4c94-15098ea0db62
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-54ea-37e18fccda13
00020000-55ed-9244-d923-607d8f09a889	00030000-55ed-9243-ccd6-06560ac56eb6
\.


--
-- TOC entry 2930 (class 0 OID 17598641)
-- Dependencies: 203
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17598675)
-- Dependencies: 207
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 17598799)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ed-9244-4aa0-551f7745d5fb	00090000-55ed-9244-8824-9cc3d8362d92	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ed-9244-ca67-2998525c99ed	00090000-55ed-9244-8183-a50bdec70342	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ed-9244-8855-4419df472072	00090000-55ed-9244-6ce0-4b37063ed190	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2908 (class 0 OID 17598406)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ed-9244-ba77-6e253625644e	00040000-55ed-9243-81ec-ec79336c4b9b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-fcea-135eabf98472	00040000-55ed-9243-81ec-ec79336c4b9b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ed-9244-8a5b-6cbe3727a1d8	00040000-55ed-9243-81ec-ec79336c4b9b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-1ab5-edd0647b78fe	00040000-55ed-9243-81ec-ec79336c4b9b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-6ee5-108b05a241f5	00040000-55ed-9243-81ec-ec79336c4b9b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-12f6-7535bc33cfb2	00040000-55ed-9243-7a8b-50b3db7604bb	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-b15c-c54c1ff81198	00040000-55ed-9243-4673-a6acfc46a5e1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-55cc-6463c5922a71	00040000-55ed-9243-01bb-166e6244974a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9244-7f5f-c9c31386da45	00040000-55ed-9243-7264-0d054ef6b497	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ed-9245-caf7-cea46829d846	00040000-55ed-9243-81ec-ec79336c4b9b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2910 (class 0 OID 17598440)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ed-9242-a88b-edad184ad9ec	8341	Adlešiči
00050000-55ed-9242-680d-b20ee50e1cbb	5270	Ajdovščina
00050000-55ed-9242-ccaa-f3411d941239	6280	Ankaran/Ancarano
00050000-55ed-9242-29b0-49567a6251a5	9253	Apače
00050000-55ed-9242-d253-78a5cd2ae593	8253	Artiče
00050000-55ed-9242-efd8-c32eae9a9617	4275	Begunje na Gorenjskem
00050000-55ed-9242-ffde-6a0891ef09cf	1382	Begunje pri Cerknici
00050000-55ed-9242-7cb0-04f9c9b46523	9231	Beltinci
00050000-55ed-9242-fbb3-d7fa9fbc84b5	2234	Benedikt
00050000-55ed-9242-5838-caff2b5667ec	2345	Bistrica ob Dravi
00050000-55ed-9242-24da-fde1adc76a31	3256	Bistrica ob Sotli
00050000-55ed-9242-50bc-fc54d907fc6b	8259	Bizeljsko
00050000-55ed-9242-e3cf-2fcfe1bce8ff	1223	Blagovica
00050000-55ed-9242-6f1c-7d1742ba0c22	8283	Blanca
00050000-55ed-9242-6d20-61caaee40e3e	4260	Bled
00050000-55ed-9242-5a46-114b5e957cde	4273	Blejska Dobrava
00050000-55ed-9242-88a6-6c73a0d58256	9265	Bodonci
00050000-55ed-9242-8f5c-c543e4b7e1c0	9222	Bogojina
00050000-55ed-9242-e5dc-eb99cf899534	4263	Bohinjska Bela
00050000-55ed-9242-3972-e80b7861707b	4264	Bohinjska Bistrica
00050000-55ed-9242-9612-e6b9e01d5cf8	4265	Bohinjsko jezero
00050000-55ed-9242-1d46-ff1d50c40224	1353	Borovnica
00050000-55ed-9242-b5c1-f8fdb741a86a	8294	Boštanj
00050000-55ed-9242-82fd-2650679015d1	5230	Bovec
00050000-55ed-9242-fb54-7406ab7d7a00	5295	Branik
00050000-55ed-9242-53e1-a7f242b9b208	3314	Braslovče
00050000-55ed-9242-b93b-c50c637277b8	5223	Breginj
00050000-55ed-9242-17bb-37939a5719f0	8280	Brestanica
00050000-55ed-9242-3ff5-5d371a7a5a3a	2354	Bresternica
00050000-55ed-9242-b08a-f02237765125	4243	Brezje
00050000-55ed-9242-b7fb-87a0dc3e7c63	1351	Brezovica pri Ljubljani
00050000-55ed-9242-e795-c28e53f71ce7	8250	Brežice
00050000-55ed-9242-f3be-4b4f765527d5	4210	Brnik - Aerodrom
00050000-55ed-9242-4f07-42ed5acf8499	8321	Brusnice
00050000-55ed-9242-f628-99e16154df8d	3255	Buče
00050000-55ed-9242-d657-aebbedcf4cf0	8276	Bučka 
00050000-55ed-9242-73e6-145aea918c59	9261	Cankova
00050000-55ed-9242-0a8b-878216bd34bd	3000	Celje 
00050000-55ed-9242-1e19-75303bbd25bf	3001	Celje - poštni predali
00050000-55ed-9242-3b41-14b9fdd07ded	4207	Cerklje na Gorenjskem
00050000-55ed-9242-4d04-92413adaf7b0	8263	Cerklje ob Krki
00050000-55ed-9242-f158-e6a3e382d8fd	1380	Cerknica
00050000-55ed-9242-b883-31134d985755	5282	Cerkno
00050000-55ed-9242-bcde-b2ef573746b4	2236	Cerkvenjak
00050000-55ed-9242-f527-4569be0ee771	2215	Ceršak
00050000-55ed-9242-56fa-a097623c6be5	2326	Cirkovce
00050000-55ed-9242-e525-5cb75a525eec	2282	Cirkulane
00050000-55ed-9242-5fb1-b8a1bd2d4fca	5273	Col
00050000-55ed-9242-e728-b84518af621f	8251	Čatež ob Savi
00050000-55ed-9242-4866-96c2385b5cad	1413	Čemšenik
00050000-55ed-9242-1f58-82fd1c8776ec	5253	Čepovan
00050000-55ed-9242-440f-b77c19b37d4c	9232	Črenšovci
00050000-55ed-9242-3859-d9c13eb313c4	2393	Črna na Koroškem
00050000-55ed-9242-1ab7-a21b210df56f	6275	Črni Kal
00050000-55ed-9242-a69f-55085d6a3a53	5274	Črni Vrh nad Idrijo
00050000-55ed-9242-e07f-d5465b44b720	5262	Črniče
00050000-55ed-9242-b339-c796e499581e	8340	Črnomelj
00050000-55ed-9242-acdd-6ba596b32e42	6271	Dekani
00050000-55ed-9242-9a83-7b0ad87363b7	5210	Deskle
00050000-55ed-9242-8e91-db9a6d37fd6b	2253	Destrnik
00050000-55ed-9242-dbbd-253bd1c7a21b	6215	Divača
00050000-55ed-9242-1567-c427f00c2430	1233	Dob
00050000-55ed-9242-6f3e-eb0114f6f802	3224	Dobje pri Planini
00050000-55ed-9242-0001-9814cfb11bc8	8257	Dobova
00050000-55ed-9242-5f38-9d29cb1486b2	1423	Dobovec
00050000-55ed-9242-cf6b-86e3ca7da413	5263	Dobravlje
00050000-55ed-9242-13d5-fb0481be582c	3204	Dobrna
00050000-55ed-9242-eac9-4adce153bd37	8211	Dobrnič
00050000-55ed-9242-981d-ba639bd0f87c	1356	Dobrova
00050000-55ed-9242-1e4c-2037770a43b3	9223	Dobrovnik/Dobronak 
00050000-55ed-9242-ae0b-f572c3ac315c	5212	Dobrovo v Brdih
00050000-55ed-9242-3041-4adba9ba9008	1431	Dol pri Hrastniku
00050000-55ed-9242-019c-17af5d44a6f5	1262	Dol pri Ljubljani
00050000-55ed-9242-47d7-c851e14993b2	1273	Dole pri Litiji
00050000-55ed-9242-7cae-10d6a33ab490	1331	Dolenja vas
00050000-55ed-9242-5840-f866b229a845	8350	Dolenjske Toplice
00050000-55ed-9242-3830-1402d58c4f59	1230	Domžale
00050000-55ed-9242-4d55-90129ef5b2d0	2252	Dornava
00050000-55ed-9242-dae3-07606acd9c61	5294	Dornberk
00050000-55ed-9242-5511-31b1fba65c80	1319	Draga
00050000-55ed-9242-e527-e7e1f84a42e6	8343	Dragatuš
00050000-55ed-9242-e6ac-f2c6cc7a07a0	3222	Dramlje
00050000-55ed-9242-18e9-5ff24c46ec0b	2370	Dravograd
00050000-55ed-9242-1636-141598131569	4203	Duplje
00050000-55ed-9242-64eb-8bc2bc2ebd79	6221	Dutovlje
00050000-55ed-9242-8d9a-944ee8f128b4	8361	Dvor
00050000-55ed-9242-c3e2-cfc672fa1f18	2343	Fala
00050000-55ed-9242-584b-b970afb1771c	9208	Fokovci
00050000-55ed-9242-1974-9f306e6d8c98	2313	Fram
00050000-55ed-9242-1aa7-8817def375f5	3213	Frankolovo
00050000-55ed-9242-9bde-e05e19faddcf	1274	Gabrovka
00050000-55ed-9242-5bf1-affc4e776ffa	8254	Globoko
00050000-55ed-9242-1677-47af924aefa0	5275	Godovič
00050000-55ed-9242-a603-d360b1322f1e	4204	Golnik
00050000-55ed-9242-f956-fa8f2d75349c	3303	Gomilsko
00050000-55ed-9242-0d00-5c1dedca6651	4224	Gorenja vas
00050000-55ed-9242-f42a-cc5b98c2f81d	3263	Gorica pri Slivnici
00050000-55ed-9242-4d97-d90517f4f605	2272	Gorišnica
00050000-55ed-9242-86a3-43b5e14fb203	9250	Gornja Radgona
00050000-55ed-9242-1e20-039f4dc18306	3342	Gornji Grad
00050000-55ed-9242-154d-7b1e746e7e39	4282	Gozd Martuljek
00050000-55ed-9242-58e7-8ca239b29964	6272	Gračišče
00050000-55ed-9242-5d58-dbd3f4cf8fac	9264	Grad
00050000-55ed-9242-2659-8c588a5f790b	8332	Gradac
00050000-55ed-9242-5a37-8bfb48a8ac24	1384	Grahovo
00050000-55ed-9242-1558-bae7f6c886e5	5242	Grahovo ob Bači
00050000-55ed-9242-a745-4b06d83ac027	5251	Grgar
00050000-55ed-9242-8e44-fe1be48ad1e2	3302	Griže
00050000-55ed-9242-3e3d-cb7f2cad20eb	3231	Grobelno
00050000-55ed-9242-e78b-074af94b82c4	1290	Grosuplje
00050000-55ed-9242-2634-437ca355d70b	2288	Hajdina
00050000-55ed-9242-0ea6-ba2b740d7b9e	8362	Hinje
00050000-55ed-9242-0991-a119b001aa2f	2311	Hoče
00050000-55ed-9242-1336-6be3d482023a	9205	Hodoš/Hodos
00050000-55ed-9242-5509-c7f0c051e964	1354	Horjul
00050000-55ed-9242-60e2-d5a8b9b47199	1372	Hotedršica
00050000-55ed-9242-a3b8-758074f68855	1430	Hrastnik
00050000-55ed-9242-bd05-3951dfc109e3	6225	Hruševje
00050000-55ed-9242-ec07-88c8bbe61498	4276	Hrušica
00050000-55ed-9242-fdea-457142b82ea1	5280	Idrija
00050000-55ed-9242-df51-f07aad093e83	1292	Ig
00050000-55ed-9242-b7a5-8d8953bbc9a5	6250	Ilirska Bistrica
00050000-55ed-9242-be91-ad420e2e35df	6251	Ilirska Bistrica-Trnovo
00050000-55ed-9242-8c48-7764d5d08a17	1295	Ivančna Gorica
00050000-55ed-9242-dad2-51ecde9a9238	2259	Ivanjkovci
00050000-55ed-9242-0faa-0e24888ab57d	1411	Izlake
00050000-55ed-9242-e45a-61f222d11e45	6310	Izola/Isola
00050000-55ed-9242-fefd-6235b4d2605f	2222	Jakobski Dol
00050000-55ed-9242-fcdf-e8ebab24f77e	2221	Jarenina
00050000-55ed-9242-62aa-67fe7e86b7f1	6254	Jelšane
00050000-55ed-9242-69ad-f4048c50057a	4270	Jesenice
00050000-55ed-9242-28ce-f19f7116d979	8261	Jesenice na Dolenjskem
00050000-55ed-9242-932f-bcee2cc790b7	3273	Jurklošter
00050000-55ed-9242-f10c-1c225d854afd	2223	Jurovski Dol
00050000-55ed-9242-79f7-374bdbd8f9b2	2256	Juršinci
00050000-55ed-9242-e238-6f929c7d0a8c	5214	Kal nad Kanalom
00050000-55ed-9242-e6a6-c17fe17b710e	3233	Kalobje
00050000-55ed-9242-8e35-96720e9cac4d	4246	Kamna Gorica
00050000-55ed-9242-70ab-1d187aa8c803	2351	Kamnica
00050000-55ed-9242-51e5-36a10f34cd5c	1241	Kamnik
00050000-55ed-9242-4094-467cc98b1702	5213	Kanal
00050000-55ed-9242-5a93-32ecb1af983a	8258	Kapele
00050000-55ed-9242-402d-050695c8fba2	2362	Kapla
00050000-55ed-9242-cec8-d69bbf464cd5	2325	Kidričevo
00050000-55ed-9242-9122-f5487f04a96a	1412	Kisovec
00050000-55ed-9242-b44a-c40c3e62e80b	6253	Knežak
00050000-55ed-9242-66ae-fac252951ab5	5222	Kobarid
00050000-55ed-9242-b912-7f7ddb05b020	9227	Kobilje
00050000-55ed-9242-e540-be32e2d74582	1330	Kočevje
00050000-55ed-9242-6f27-2fbe958a5cc6	1338	Kočevska Reka
00050000-55ed-9242-9e3c-610761e7e61b	2276	Kog
00050000-55ed-9242-cee0-eab56ef36ab6	5211	Kojsko
00050000-55ed-9242-5e84-c48c5e8d88f1	6223	Komen
00050000-55ed-9242-1b21-ca83ca8a6bb3	1218	Komenda
00050000-55ed-9242-2d39-0b8a0e3af0b9	6000	Koper/Capodistria 
00050000-55ed-9242-9817-54b1c2780d71	6001	Koper/Capodistria - poštni predali
00050000-55ed-9242-1124-9d3e5bb93344	8282	Koprivnica
00050000-55ed-9242-5986-8c0e70bcea27	5296	Kostanjevica na Krasu
00050000-55ed-9242-0013-ef4c04c4b9ab	8311	Kostanjevica na Krki
00050000-55ed-9242-3298-7da1bccba2f6	1336	Kostel
00050000-55ed-9242-063c-ec5f1b3da554	6256	Košana
00050000-55ed-9242-a14a-15c0c782fc59	2394	Kotlje
00050000-55ed-9242-f9d1-67d2328466f0	6240	Kozina
00050000-55ed-9242-d2a1-6bb5f37335b0	3260	Kozje
00050000-55ed-9242-e59e-a0591bd3c09a	4000	Kranj 
00050000-55ed-9242-8470-f177eba7380c	4001	Kranj - poštni predali
00050000-55ed-9242-6b1e-02b9dfa50249	4280	Kranjska Gora
00050000-55ed-9242-b516-1a4c1b6f3a40	1281	Kresnice
00050000-55ed-9242-43e2-7f50995b80e4	4294	Križe
00050000-55ed-9242-2adb-1843b93affca	9206	Križevci
00050000-55ed-9242-210e-d053a04ecfb9	9242	Križevci pri Ljutomeru
00050000-55ed-9242-51a1-ff22c83da3c4	1301	Krka
00050000-55ed-9242-6e81-17b071b72a5e	8296	Krmelj
00050000-55ed-9242-997c-c055d902581d	4245	Kropa
00050000-55ed-9242-a7d5-df8bc1f58fa2	8262	Krška vas
00050000-55ed-9242-cad3-ddc0858964eb	8270	Krško
00050000-55ed-9242-657d-a8b7f89f636d	9263	Kuzma
00050000-55ed-9242-b06d-20ad48b4664c	2318	Laporje
00050000-55ed-9242-f0e8-cefe9d7be573	3270	Laško
00050000-55ed-9242-6502-8df39f487210	1219	Laze v Tuhinju
00050000-55ed-9242-5a4f-2cbaa66ffd49	2230	Lenart v Slovenskih goricah
00050000-55ed-9242-aaf8-5d5a6fc1d4c0	9220	Lendava/Lendva
00050000-55ed-9242-a489-a3093d88bb08	4248	Lesce
00050000-55ed-9242-1838-b7b5a195e502	3261	Lesično
00050000-55ed-9242-9be6-ca01486c84d3	8273	Leskovec pri Krškem
00050000-55ed-9242-5f55-12a0e2ea9564	2372	Libeliče
00050000-55ed-9242-420e-3ec82d24eaea	2341	Limbuš
00050000-55ed-9242-fb3b-91805793591d	1270	Litija
00050000-55ed-9242-d508-ace1b0cf5011	3202	Ljubečna
00050000-55ed-9242-4766-479883b1fe30	1000	Ljubljana 
00050000-55ed-9242-d346-7a7f9f393281	1001	Ljubljana - poštni predali
00050000-55ed-9242-a45c-7cde1d296702	1231	Ljubljana - Črnuče
00050000-55ed-9242-aa28-fe2ca840453c	1261	Ljubljana - Dobrunje
00050000-55ed-9242-509c-238cad3a4153	1260	Ljubljana - Polje
00050000-55ed-9242-53df-9488762228c1	1210	Ljubljana - Šentvid
00050000-55ed-9242-db8e-28289ae64874	1211	Ljubljana - Šmartno
00050000-55ed-9242-e3a3-895fd8f776ad	3333	Ljubno ob Savinji
00050000-55ed-9242-d84a-c29a333256eb	9240	Ljutomer
00050000-55ed-9242-d718-7771eaf126ba	3215	Loče
00050000-55ed-9242-55e2-d7d2a2d90f4d	5231	Log pod Mangartom
00050000-55ed-9242-cee2-c4663e38ef6c	1358	Log pri Brezovici
00050000-55ed-9242-2906-7753ca494f6f	1370	Logatec
00050000-55ed-9242-f01d-92ca2c540602	1371	Logatec
00050000-55ed-9242-d2eb-6b51a5260336	1434	Loka pri Zidanem Mostu
00050000-55ed-9242-d7b4-e510f7c141c9	3223	Loka pri Žusmu
00050000-55ed-9242-6fe1-9a8ab0a1f112	6219	Lokev
00050000-55ed-9242-a940-2de4c6b2365d	1318	Loški Potok
00050000-55ed-9242-16c3-c11023a110c3	2324	Lovrenc na Dravskem polju
00050000-55ed-9242-eb6c-83797380d041	2344	Lovrenc na Pohorju
00050000-55ed-9242-e7a0-ca19c198ad23	3334	Luče
00050000-55ed-9242-1104-f41ce108cf21	1225	Lukovica
00050000-55ed-9242-8a6c-6d9597d1fade	9202	Mačkovci
00050000-55ed-9242-954c-a2aedb33d5e7	2322	Majšperk
00050000-55ed-9242-483e-b0dfc487d9a8	2321	Makole
00050000-55ed-9242-d5b0-22b3bf9e3023	9243	Mala Nedelja
00050000-55ed-9242-5218-a2a4e58a83a0	2229	Malečnik
00050000-55ed-9242-b3a6-240105e0fb70	6273	Marezige
00050000-55ed-9242-66d8-a01de88e6dba	2000	Maribor 
00050000-55ed-9242-2ad6-c8101920409d	2001	Maribor - poštni predali
00050000-55ed-9242-7d5b-e5a631d3ec41	2206	Marjeta na Dravskem polju
00050000-55ed-9242-eab7-6ddc1252ceaa	2281	Markovci
00050000-55ed-9242-aafd-f252a511c557	9221	Martjanci
00050000-55ed-9242-ca2f-265d98115115	6242	Materija
00050000-55ed-9242-ebc4-a1a61ca192ec	4211	Mavčiče
00050000-55ed-9242-2a1e-b3d987f2ff6f	1215	Medvode
00050000-55ed-9242-b926-f43fcb73f148	1234	Mengeš
00050000-55ed-9242-0264-7a1f842e638a	8330	Metlika
00050000-55ed-9242-7d4d-6a2b55e243d8	2392	Mežica
00050000-55ed-9242-ac45-08ce3f05672c	2204	Miklavž na Dravskem polju
00050000-55ed-9242-ec7d-8dac9179d04f	2275	Miklavž pri Ormožu
00050000-55ed-9242-a9e3-31c778c72477	5291	Miren
00050000-55ed-9242-2c9e-93170a0fdeae	8233	Mirna
00050000-55ed-9242-a5b6-eca2d3d3e1e0	8216	Mirna Peč
00050000-55ed-9242-2970-b7a87f51bd37	2382	Mislinja
00050000-55ed-9242-551c-e20f954f546e	4281	Mojstrana
00050000-55ed-9242-8779-6e72fff13efb	8230	Mokronog
00050000-55ed-9242-9fe2-c715f3c9d2f6	1251	Moravče
00050000-55ed-9242-9e45-23e0d31b5fe5	9226	Moravske Toplice
00050000-55ed-9242-fbb7-3d3aeeb45b68	5216	Most na Soči
00050000-55ed-9242-1661-e03fe1ea2db4	1221	Motnik
00050000-55ed-9242-d68e-4774670b09f7	3330	Mozirje
00050000-55ed-9242-e96f-8065251d36f0	9000	Murska Sobota 
00050000-55ed-9242-0414-08b0d967b68f	9001	Murska Sobota - poštni predali
00050000-55ed-9242-e9d7-ea6edeec1d07	2366	Muta
00050000-55ed-9242-8a0a-9630679b63e1	4202	Naklo
00050000-55ed-9242-4748-22300dcdd965	3331	Nazarje
00050000-55ed-9242-3f24-153801c5513f	1357	Notranje Gorice
00050000-55ed-9242-b5c6-f6a5762fd3f9	3203	Nova Cerkev
00050000-55ed-9242-4221-f9d5e637a230	5000	Nova Gorica 
00050000-55ed-9242-b06b-22c77231a302	5001	Nova Gorica - poštni predali
00050000-55ed-9242-e17b-dada831ab07d	1385	Nova vas
00050000-55ed-9242-af04-4b1da273f560	8000	Novo mesto
00050000-55ed-9242-58ff-59ef45f22b60	8001	Novo mesto - poštni predali
00050000-55ed-9242-d1aa-e05252765598	6243	Obrov
00050000-55ed-9242-cb61-5beb19b78696	9233	Odranci
00050000-55ed-9242-ad2f-e5a1951a3a98	2317	Oplotnica
00050000-55ed-9242-13de-dab9db4fff04	2312	Orehova vas
00050000-55ed-9242-a10a-50d757318f3a	2270	Ormož
00050000-55ed-9242-b27c-68c7cac8e49f	1316	Ortnek
00050000-55ed-9242-b9ef-e3c864967f0c	1337	Osilnica
00050000-55ed-9242-c5be-c9effef51ec7	8222	Otočec
00050000-55ed-9242-de50-6615bb266e1a	2361	Ožbalt
00050000-55ed-9242-0e49-c09ae889f078	2231	Pernica
00050000-55ed-9242-7048-f21c22f75cd4	2211	Pesnica pri Mariboru
00050000-55ed-9242-005e-3221cd9ffe6c	9203	Petrovci
00050000-55ed-9242-7c11-d479f4a325fd	3301	Petrovče
00050000-55ed-9242-8057-1b1b703efcc4	6330	Piran/Pirano
00050000-55ed-9242-25fa-bfbfcea7d39e	8255	Pišece
00050000-55ed-9242-cae4-fd772fb65740	6257	Pivka
00050000-55ed-9242-2798-05e99726c1a6	6232	Planina
00050000-55ed-9242-69d2-fac088c6ae7c	3225	Planina pri Sevnici
00050000-55ed-9242-8dc0-b0d3fa28e77a	6276	Pobegi
00050000-55ed-9242-f09a-888a32f79d71	8312	Podbočje
00050000-55ed-9242-b1d7-95054428118f	5243	Podbrdo
00050000-55ed-9242-880a-941464701328	3254	Podčetrtek
00050000-55ed-9242-1671-03ef3c7d256e	2273	Podgorci
00050000-55ed-9242-5a4f-9981774b68b4	6216	Podgorje
00050000-55ed-9242-cae3-cf5ad2b7f737	2381	Podgorje pri Slovenj Gradcu
00050000-55ed-9242-0f10-fe1d8c7da282	6244	Podgrad
00050000-55ed-9242-4846-8cb93350646d	1414	Podkum
00050000-55ed-9242-0309-4611b36778e7	2286	Podlehnik
00050000-55ed-9242-aeb1-c21f0aefa406	5272	Podnanos
00050000-55ed-9242-33cf-d4672533f3af	4244	Podnart
00050000-55ed-9242-bfcf-b503f68e3b61	3241	Podplat
00050000-55ed-9242-a747-ea39925f190f	3257	Podsreda
00050000-55ed-9242-66d8-e3f64af6a7d5	2363	Podvelka
00050000-55ed-9242-42b7-c850beb59f3c	2208	Pohorje
00050000-55ed-9242-d0a2-673c10ca6a09	2257	Polenšak
00050000-55ed-9242-d018-3f8ee295326f	1355	Polhov Gradec
00050000-55ed-9242-d3b2-aa100dbd768e	4223	Poljane nad Škofjo Loko
00050000-55ed-9242-a4ca-7eab9cdc73f1	2319	Poljčane
00050000-55ed-9242-e250-012f455f6467	1272	Polšnik
00050000-55ed-9242-5a45-338e18fdb6c1	3313	Polzela
00050000-55ed-9242-a10a-cd63a636dd43	3232	Ponikva
00050000-55ed-9242-ee57-f8bf953f9a9c	6320	Portorož/Portorose
00050000-55ed-9242-2bb7-79c743147e9b	6230	Postojna
00050000-55ed-9242-4c26-69c7786622ee	2331	Pragersko
00050000-55ed-9242-004b-01d00b1d9dc8	3312	Prebold
00050000-55ed-9242-57ce-ae472c189120	4205	Preddvor
00050000-55ed-9242-aacb-3ba1752713b4	6255	Prem
00050000-55ed-9242-44b3-d2f28d79cec3	1352	Preserje
00050000-55ed-9242-1336-e634543520b9	6258	Prestranek
00050000-55ed-9242-bb53-e463fe25e34d	2391	Prevalje
00050000-55ed-9242-9756-3b944f66beaa	3262	Prevorje
00050000-55ed-9242-ef33-b9e9534edf07	1276	Primskovo 
00050000-55ed-9242-d25f-10f8f2703092	3253	Pristava pri Mestinju
00050000-55ed-9242-f2be-171f0693eb71	9207	Prosenjakovci/Partosfalva
00050000-55ed-9242-4c4b-fe04291e051a	5297	Prvačina
00050000-55ed-9242-6210-126909bebe47	2250	Ptuj
00050000-55ed-9242-824a-fc24d7b593f6	2323	Ptujska Gora
00050000-55ed-9242-a3bc-b7f3aec27925	9201	Puconci
00050000-55ed-9242-3833-a0d382417dd1	2327	Rače
00050000-55ed-9242-e6a6-6432ae800c76	1433	Radeče
00050000-55ed-9242-928b-c211165dfee4	9252	Radenci
00050000-55ed-9242-d85f-50d19186a752	2360	Radlje ob Dravi
00050000-55ed-9242-3bf7-2cea9d4305f4	1235	Radomlje
00050000-55ed-9242-2208-b8c2c45d9cd4	4240	Radovljica
00050000-55ed-9242-9f0a-613aa70219b1	8274	Raka
00050000-55ed-9242-381b-36ed2f3b6f4b	1381	Rakek
00050000-55ed-9242-1186-55efa48f74f6	4283	Rateče - Planica
00050000-55ed-9242-f615-51157a186177	2390	Ravne na Koroškem
00050000-55ed-9242-817f-bb81b686e3a1	9246	Razkrižje
00050000-55ed-9242-de6b-d0910ddc7f8d	3332	Rečica ob Savinji
00050000-55ed-9242-4dae-9e38c1d8eeb3	5292	Renče
00050000-55ed-9242-ad09-fb73a54c0cc9	1310	Ribnica
00050000-55ed-9242-6475-b289a599a43e	2364	Ribnica na Pohorju
00050000-55ed-9242-ec45-00c36082ede9	3272	Rimske Toplice
00050000-55ed-9242-0dd7-ffdd1a822343	1314	Rob
00050000-55ed-9242-54b0-e930d9c5f044	5215	Ročinj
00050000-55ed-9242-24df-ac23afcbbee9	3250	Rogaška Slatina
00050000-55ed-9242-6581-d320c76ee141	9262	Rogašovci
00050000-55ed-9242-3b3c-2a62c38efd84	3252	Rogatec
00050000-55ed-9242-dfd2-79054329c2b3	1373	Rovte
00050000-55ed-9242-06dc-55b2c5b79415	2342	Ruše
00050000-55ed-9242-1462-e2a99df21d5d	1282	Sava
00050000-55ed-9242-fb91-fd647a798303	6333	Sečovlje/Sicciole
00050000-55ed-9242-87d7-bb1c755955fd	4227	Selca
00050000-55ed-9242-031e-d196537dd2d9	2352	Selnica ob Dravi
00050000-55ed-9242-0b7e-b6eb177ea9df	8333	Semič
00050000-55ed-9242-7049-b18f90fbbb35	8281	Senovo
00050000-55ed-9242-b1cd-50c13954032c	6224	Senožeče
00050000-55ed-9242-5f0d-449ab72cbb8f	8290	Sevnica
00050000-55ed-9242-f039-696c60dbdf60	6210	Sežana
00050000-55ed-9242-a90f-ef1fac596df8	2214	Sladki Vrh
00050000-55ed-9242-340f-c60de04d069c	5283	Slap ob Idrijci
00050000-55ed-9242-5ac7-f734c68d4778	2380	Slovenj Gradec
00050000-55ed-9242-5b1f-4a160f71647a	2310	Slovenska Bistrica
00050000-55ed-9242-d29b-8a5bc3cf968f	3210	Slovenske Konjice
00050000-55ed-9242-1f8f-d16f82d49f55	1216	Smlednik
00050000-55ed-9242-d421-e9edb2d685aa	5232	Soča
00050000-55ed-9242-a514-7976b4a19af6	1317	Sodražica
00050000-55ed-9242-ccd4-d64e7e97bd1a	3335	Solčava
00050000-55ed-9242-b752-ec7e6d624208	5250	Solkan
00050000-55ed-9242-7964-20a8e88bfe3b	4229	Sorica
00050000-55ed-9242-c854-a4c1e22c947c	4225	Sovodenj
00050000-55ed-9242-06d4-8b293a195624	5281	Spodnja Idrija
00050000-55ed-9242-fd59-de2d7a7f19f7	2241	Spodnji Duplek
00050000-55ed-9242-7009-118b4c3dc5f0	9245	Spodnji Ivanjci
00050000-55ed-9242-4515-8c3a4f175858	2277	Središče ob Dravi
00050000-55ed-9242-f485-0b405e745df2	4267	Srednja vas v Bohinju
00050000-55ed-9242-2bb2-146681093bd7	8256	Sromlje 
00050000-55ed-9242-267e-0339e1a669d4	5224	Srpenica
00050000-55ed-9242-fe0f-73211a9f5927	1242	Stahovica
00050000-55ed-9242-e90b-1fee1c9dd2e8	1332	Stara Cerkev
00050000-55ed-9242-0a30-051858c40b0d	8342	Stari trg ob Kolpi
00050000-55ed-9242-948c-eb6804dc1e41	1386	Stari trg pri Ložu
00050000-55ed-9242-423f-750cbc067eab	2205	Starše
00050000-55ed-9242-5178-d4654876f3fb	2289	Stoperce
00050000-55ed-9242-de2c-31bafb770b44	8322	Stopiče
00050000-55ed-9242-b5b8-c773984ace47	3206	Stranice
00050000-55ed-9242-4a88-9f368ab65433	8351	Straža
00050000-55ed-9242-664d-97b7afa16363	1313	Struge
00050000-55ed-9242-14be-ae94b7bf9f14	8293	Studenec
00050000-55ed-9242-4915-9a950dd8e007	8331	Suhor
00050000-55ed-9242-89d0-f813714aecc5	2233	Sv. Ana v Slovenskih goricah
00050000-55ed-9242-28c0-23a20c8fb077	2235	Sv. Trojica v Slovenskih goricah
00050000-55ed-9242-9ba1-3de7cbb49492	2353	Sveti Duh na Ostrem Vrhu
00050000-55ed-9242-9d8d-7f8beb4ba67d	9244	Sveti Jurij ob Ščavnici
00050000-55ed-9242-a2eb-aaafed45c61a	3264	Sveti Štefan
00050000-55ed-9242-9215-f60397dab71c	2258	Sveti Tomaž
00050000-55ed-9242-81f7-ddd83a802a8b	9204	Šalovci
00050000-55ed-9242-79fe-ce22ba1f07df	5261	Šempas
00050000-55ed-9242-432d-5f2c1ebbd5e4	5290	Šempeter pri Gorici
00050000-55ed-9242-e593-faf3bef55fc4	3311	Šempeter v Savinjski dolini
00050000-55ed-9242-c374-27b1bf6febaa	4208	Šenčur
00050000-55ed-9242-2916-50785443c397	2212	Šentilj v Slovenskih goricah
00050000-55ed-9242-f8df-807da96ebac3	8297	Šentjanž
00050000-55ed-9242-098a-ba67f7c9b8a3	2373	Šentjanž pri Dravogradu
00050000-55ed-9242-605a-bd520e6b2629	8310	Šentjernej
00050000-55ed-9242-4425-ecc81ae58033	3230	Šentjur
00050000-55ed-9242-b88d-01623a860847	3271	Šentrupert
00050000-55ed-9242-5e9a-0e216413eb29	8232	Šentrupert
00050000-55ed-9242-7497-d0c588181156	1296	Šentvid pri Stični
00050000-55ed-9242-a8ac-0f36b9f89a29	8275	Škocjan
00050000-55ed-9242-248b-c7c29145e198	6281	Škofije
00050000-55ed-9242-3d09-ca7d60d33a77	4220	Škofja Loka
00050000-55ed-9242-31c8-af82b3f78027	3211	Škofja vas
00050000-55ed-9242-107d-f8fed87146e6	1291	Škofljica
00050000-55ed-9242-f1ed-ad8133379af8	6274	Šmarje
00050000-55ed-9242-1fa7-928cabc45383	1293	Šmarje - Sap
00050000-55ed-9242-6cee-f6a15ad1657c	3240	Šmarje pri Jelšah
00050000-55ed-9242-6837-2a7505bf4b1d	8220	Šmarješke Toplice
00050000-55ed-9242-4139-4b70c790e437	2315	Šmartno na Pohorju
00050000-55ed-9242-2507-7754e4891f23	3341	Šmartno ob Dreti
00050000-55ed-9242-40e5-6bf9c5edd20e	3327	Šmartno ob Paki
00050000-55ed-9242-dedc-79cbef133961	1275	Šmartno pri Litiji
00050000-55ed-9242-8920-68a5d8fcae40	2383	Šmartno pri Slovenj Gradcu
00050000-55ed-9242-638e-4ad745503549	3201	Šmartno v Rožni dolini
00050000-55ed-9242-315e-a41316088c4c	3325	Šoštanj
00050000-55ed-9242-5798-55fe813013fb	6222	Štanjel
00050000-55ed-9242-1547-a5d2a8db4f0f	3220	Štore
00050000-55ed-9242-f26a-e927bb92da3e	3304	Tabor
00050000-55ed-9242-1017-79a7b9c2253b	3221	Teharje
00050000-55ed-9242-c0b0-0c817779294d	9251	Tišina
00050000-55ed-9242-20f9-737e9584215e	5220	Tolmin
00050000-55ed-9242-7097-b6ca3a371cd9	3326	Topolšica
00050000-55ed-9242-7554-aaacd7df5d23	2371	Trbonje
00050000-55ed-9242-d87e-1e4a088a5759	1420	Trbovlje
00050000-55ed-9242-7e9f-4752bf4ef3e9	8231	Trebelno 
00050000-55ed-9242-b541-bc4b19dcd1d0	8210	Trebnje
00050000-55ed-9242-568a-fd62b0a5c6f0	5252	Trnovo pri Gorici
00050000-55ed-9242-eea8-e19250413893	2254	Trnovska vas
00050000-55ed-9242-1b05-0556fb53a08b	1222	Trojane
00050000-55ed-9242-0264-fbbbc3f1b2e2	1236	Trzin
00050000-55ed-9242-a9da-d40385e3b3ab	4290	Tržič
00050000-55ed-9242-8bd1-828ae26582bd	8295	Tržišče
00050000-55ed-9242-c7fd-c1999dab60be	1311	Turjak
00050000-55ed-9242-f978-abd8b71aac18	9224	Turnišče
00050000-55ed-9242-d230-70989be0630c	8323	Uršna sela
00050000-55ed-9242-db64-1b0b32ff1e0e	1252	Vače
00050000-55ed-9242-4281-b879f06c24bc	3320	Velenje 
00050000-55ed-9242-39d0-ce87e6825ba9	3322	Velenje - poštni predali
00050000-55ed-9242-3de8-e6c11802ced7	8212	Velika Loka
00050000-55ed-9242-6f7f-e94c1f1e126a	2274	Velika Nedelja
00050000-55ed-9242-b302-cdbf109f7082	9225	Velika Polana
00050000-55ed-9242-c9d8-82e746b5043b	1315	Velike Lašče
00050000-55ed-9242-95c9-c277211d8f3d	8213	Veliki Gaber
00050000-55ed-9242-2339-50789fbf9da5	9241	Veržej
00050000-55ed-9242-2451-fb2a983a6808	1312	Videm - Dobrepolje
00050000-55ed-9242-9347-0425ad7cfe67	2284	Videm pri Ptuju
00050000-55ed-9242-1c23-4c5592754aaf	8344	Vinica
00050000-55ed-9242-13c6-6eaab9d88051	5271	Vipava
00050000-55ed-9242-ea85-842e8e11eab6	4212	Visoko
00050000-55ed-9242-e1ed-584acbb8f840	1294	Višnja Gora
00050000-55ed-9242-2a06-a7acf414d75d	3205	Vitanje
00050000-55ed-9242-8606-81dd42b88569	2255	Vitomarci
00050000-55ed-9242-9cfa-b68ffa190bba	1217	Vodice
00050000-55ed-9242-d199-d7f12c4f1a9e	3212	Vojnik\t
00050000-55ed-9242-81fd-4318badb9f8c	5293	Volčja Draga
00050000-55ed-9242-a6e1-139b91666890	2232	Voličina
00050000-55ed-9242-c7e6-2b63398561c6	3305	Vransko
00050000-55ed-9242-14ff-cd254dd7fa3b	6217	Vremski Britof
00050000-55ed-9242-b3dd-00889445db6a	1360	Vrhnika
00050000-55ed-9242-cd50-a834c520934e	2365	Vuhred
00050000-55ed-9242-652c-a7f9c610fccd	2367	Vuzenica
00050000-55ed-9242-8757-88a412186aff	8292	Zabukovje 
00050000-55ed-9242-662d-ff3345494e38	1410	Zagorje ob Savi
00050000-55ed-9242-0c80-6f4b2a64e6db	1303	Zagradec
00050000-55ed-9242-3b54-bca9e4403c7f	2283	Zavrč
00050000-55ed-9242-ba30-d72eebebe097	8272	Zdole 
00050000-55ed-9242-2c43-2cedf24e4885	4201	Zgornja Besnica
00050000-55ed-9242-08d5-b707655a4963	2242	Zgornja Korena
00050000-55ed-9242-a389-9b209d3fc700	2201	Zgornja Kungota
00050000-55ed-9242-ced5-99ef7badde12	2316	Zgornja Ložnica
00050000-55ed-9242-ae32-71cc54048db8	2314	Zgornja Polskava
00050000-55ed-9242-2620-e01676239a15	2213	Zgornja Velka
00050000-55ed-9242-9e03-9390dc634f3c	4247	Zgornje Gorje
00050000-55ed-9242-4888-9a91bb1be1c8	4206	Zgornje Jezersko
00050000-55ed-9242-b976-f020f41a4da2	2285	Zgornji Leskovec
00050000-55ed-9242-229f-5a4a74e58add	1432	Zidani Most
00050000-55ed-9242-cfdb-01339e25d0f4	3214	Zreče
00050000-55ed-9242-7807-50e7f17924b9	4209	Žabnica
00050000-55ed-9242-81ec-d3f40dc889e3	3310	Žalec
00050000-55ed-9242-9e75-0e8ffd8ae820	4228	Železniki
00050000-55ed-9242-c96c-f296be622ad4	2287	Žetale
00050000-55ed-9242-96d2-037a234f3ace	4226	Žiri
00050000-55ed-9242-3ef8-459ef4739c95	4274	Žirovnica
00050000-55ed-9242-55d5-65792558729f	8360	Žužemberk
\.


--
-- TOC entry 2926 (class 0 OID 17598615)
-- Dependencies: 199
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 17598425)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ed-9244-f39f-d0188640804b	00080000-55ed-9244-ba77-6e253625644e	\N	00040000-55ed-9243-81ec-ec79336c4b9b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ed-9244-d489-9140e9a7bb5c	00080000-55ed-9244-ba77-6e253625644e	\N	00040000-55ed-9243-81ec-ec79336c4b9b	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ed-9244-1554-5f0c6d56da4d	00080000-55ed-9244-fcea-135eabf98472	\N	00040000-55ed-9243-81ec-ec79336c4b9b	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2915 (class 0 OID 17598503)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17598627)
-- Dependencies: 201
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 17598978)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 17598988)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ed-9244-1475-6dbbd0a2cfc9	00080000-55ed-9244-8a5b-6cbe3727a1d8	0987	AK
00190000-55ed-9244-94ce-53d1ff72d267	00080000-55ed-9244-fcea-135eabf98472	0989	AK
00190000-55ed-9244-411c-ba31d5659315	00080000-55ed-9244-1ab5-edd0647b78fe	0986	AK
00190000-55ed-9244-7069-d3d874fa83bf	00080000-55ed-9244-12f6-7535bc33cfb2	0984	AK
00190000-55ed-9244-d4df-910c0d04748e	00080000-55ed-9244-b15c-c54c1ff81198	0983	AK
00190000-55ed-9244-6b36-67c37c60e76e	00080000-55ed-9244-55cc-6463c5922a71	0982	AK
00190000-55ed-9245-ea58-59f1371a482f	00080000-55ed-9245-caf7-cea46829d846	1001	AK
\.


--
-- TOC entry 2951 (class 0 OID 17598935)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ed-9244-912e-117b4883ef67	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2954 (class 0 OID 17598996)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 17598656)
-- Dependencies: 205
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ed-9244-fa3b-468778b24d4e	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55ed-9244-25df-56f026dbdca2	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55ed-9244-8f3a-1a0d7638510c	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55ed-9244-8c37-3fd5926bb3d6	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55ed-9244-42c9-7d54c5df6404	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55ed-9244-33d2-daa7ad9a3bed	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ed-9244-a0d4-f20f4b6db4bd	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2924 (class 0 OID 17598600)
-- Dependencies: 197
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 17598590)
-- Dependencies: 196
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 17598788)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17598727)
-- Dependencies: 212
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 17598298)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ed-9245-caf7-cea46829d846	00010000-55ed-9243-d0b5-1d0eb9d492d5	2015-09-07 15:33:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ed-9245-fa28-e3c560c94072	00010000-55ed-9243-d0b5-1d0eb9d492d5	2015-09-07 15:33:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ed-9245-ea58-59f1371a482f	00010000-55ed-9243-d0b5-1d0eb9d492d5	2015-09-07 15:33:57	INS	a:0:{}
\.


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2933 (class 0 OID 17598669)
-- Dependencies: 206
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 17598336)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ed-9243-f11b-e955db438e99	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ed-9243-03fb-b27d9e3b36a6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ed-9243-e717-f7b29573d056	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ed-9243-44aa-f6fbddd4e356	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ed-9243-4c1a-13a50a3c1719	planer	Planer dogodkov v koledarju	t
00020000-55ed-9243-35cd-2180113ee2e3	kadrovska	Kadrovska služba	t
00020000-55ed-9243-abd7-7fa85a6dc594	arhivar	Ažuriranje arhivalij	t
00020000-55ed-9243-28a5-e726b83b739e	igralec	Igralec	t
00020000-55ed-9243-5035-cc4986d5068a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ed-9244-d923-607d8f09a889	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2900 (class 0 OID 17598320)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ed-9243-8cd3-9f9bfe0d7ae0	00020000-55ed-9243-e717-f7b29573d056
00010000-55ed-9243-d0b5-1d0eb9d492d5	00020000-55ed-9243-e717-f7b29573d056
00010000-55ed-9244-2c2e-d6fb06158325	00020000-55ed-9244-d923-607d8f09a889
\.


--
-- TOC entry 2935 (class 0 OID 17598683)
-- Dependencies: 208
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17598621)
-- Dependencies: 200
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 17598567)
-- Dependencies: 194
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 17599037)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ed-9243-c959-a52994b6a923	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ed-9243-5ccc-4b4cf4b96660	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ed-9243-fbc6-ea73ea71a9c5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ed-9243-9e1d-6ecbcd1f14a4	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ed-9243-a66b-88a9cbc35d1b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2958 (class 0 OID 17599029)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ed-9243-09a5-636a13901cc2	00230000-55ed-9243-9e1d-6ecbcd1f14a4	popa
00240000-55ed-9243-d307-b2f9e5b1356e	00230000-55ed-9243-9e1d-6ecbcd1f14a4	oseba
00240000-55ed-9243-d147-416d47b6af33	00230000-55ed-9243-9e1d-6ecbcd1f14a4	sezona
00240000-55ed-9243-2588-2f170107bfd7	00230000-55ed-9243-5ccc-4b4cf4b96660	prostor
00240000-55ed-9243-48ff-a1305fa231c7	00230000-55ed-9243-9e1d-6ecbcd1f14a4	besedilo
00240000-55ed-9243-390c-94679d9d623a	00230000-55ed-9243-9e1d-6ecbcd1f14a4	uprizoritev
00240000-55ed-9243-930b-a275b0624d2c	00230000-55ed-9243-9e1d-6ecbcd1f14a4	funkcija
00240000-55ed-9243-b2df-2c536cf2f76e	00230000-55ed-9243-9e1d-6ecbcd1f14a4	tipfunkcije
00240000-55ed-9243-ce0b-c15cb97c2d2f	00230000-55ed-9243-9e1d-6ecbcd1f14a4	alternacija
00240000-55ed-9243-3783-adb1a5f75d87	00230000-55ed-9243-c959-a52994b6a923	pogodba
00240000-55ed-9243-f0ea-13bbf1fb3926	00230000-55ed-9243-9e1d-6ecbcd1f14a4	zaposlitev
00240000-55ed-9243-ad45-d934005d0961	00230000-55ed-9243-9e1d-6ecbcd1f14a4	zvrstuprizoritve
00240000-55ed-9243-64a5-afc4032c801f	00230000-55ed-9243-c959-a52994b6a923	programdela
00240000-55ed-9243-4e82-ccca6e9ffeed	00230000-55ed-9243-9e1d-6ecbcd1f14a4	zapis
\.


--
-- TOC entry 2957 (class 0 OID 17599024)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b556286e-7784-465b-af10-01b37a2ed402	00240000-55ed-9243-09a5-636a13901cc2	0	1001
\.


--
-- TOC entry 2940 (class 0 OID 17598737)
-- Dependencies: 213
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ed-9244-e12f-39a92e631e3b	000e0000-55ed-9244-93ec-9395efe393c8	00080000-55ed-9244-ba77-6e253625644e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ed-9243-e558-5bcee065a5a3
00270000-55ed-9244-9fa6-2f892736135e	000e0000-55ed-9244-93ec-9395efe393c8	00080000-55ed-9244-ba77-6e253625644e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ed-9243-e558-5bcee065a5a3
00270000-55ed-9244-21ba-6f198a4de1cf	000e0000-55ed-9244-93ec-9395efe393c8	00080000-55ed-9244-6ee5-108b05a241f5	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2907 (class 0 OID 17598398)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 17598577)
-- Dependencies: 195
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ed-9244-ed2e-cfc452bc40e0	00180000-55ed-9244-b0ce-ae5111bff69a	000c0000-55ed-9244-f624-12f57ff97a18	00090000-55ed-9244-126d-61cf7bf580ef	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ed-9244-2204-242f6463a160	00180000-55ed-9244-b0ce-ae5111bff69a	000c0000-55ed-9244-297e-f31730eed2bb	00090000-55ed-9244-378a-9ba2ba945193	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ed-9244-c46b-c204f93ed7ce	00180000-55ed-9244-b0ce-ae5111bff69a	000c0000-55ed-9244-258e-542709623460	00090000-55ed-9244-07db-75d97e940432	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ed-9244-cd6e-9601cf0fc731	00180000-55ed-9244-b0ce-ae5111bff69a	000c0000-55ed-9244-93ef-44e137d049fe	00090000-55ed-9244-3b20-ebf6d2b2f024	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ed-9244-c59c-8bfbd991574e	00180000-55ed-9244-b0ce-ae5111bff69a	000c0000-55ed-9244-98b9-4ac7b88b85da	00090000-55ed-9244-7f6e-33d875d025d2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ed-9244-ae11-2672e87e27b9	00180000-55ed-9244-6fcd-358fe9d94ce1	\N	00090000-55ed-9244-7f6e-33d875d025d2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2943 (class 0 OID 17598777)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ed-9243-8fa2-35016fdb84a0	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ed-9243-92d2-3cd4a006e0d3	Priredba	Priredba	Priredba	umetnik
000f0000-55ed-9243-bcc2-32cc88709f5d	Prevod	Prevod	Prevod	umetnik
000f0000-55ed-9243-7159-8c3423cf3bfa	Režija	Režija	Režija	umetnik
000f0000-55ed-9243-f505-15b5bceab94a	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ed-9243-4e65-fc730662bb61	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ed-9243-9673-342959bdcd66	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ed-9243-c4e1-202c8db1a1d6	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ed-9243-75f4-889190206b9f	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ed-9243-b467-f34730a02dbf	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ed-9243-364c-dcaf45c9f2fa	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ed-9243-bf58-aff7c26f024f	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ed-9243-0bc0-5999cdd15233	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ed-9243-6afa-7d36aaae1763	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ed-9243-feaa-ae692d8eea5f	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ed-9243-c40e-1b3673941fe3	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ed-9243-5dbb-5339e6022f38	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ed-9243-49bc-7b4219e230dc	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2955 (class 0 OID 17599006)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ed-9243-1d89-d4d75d6f7136	01	Velika predstava	f	1.00	1.00
002b0000-55ed-9243-561f-5f76b2b5b37e	02	Mala predstava	f	0.50	0.50
002b0000-55ed-9243-04d2-50bbb7a1a64d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ed-9243-7073-d34c48f16a07	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ed-9243-c537-e8082519bff0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2912 (class 0 OID 17598460)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 17598307)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ed-9243-d0b5-1d0eb9d492d5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROtMGISzKuQYJ2Z938tfbV.U.Z/MhwDQm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ed-9244-8876-d6f38d3aeaf3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ed-9244-c652-614b269a7f3d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ed-9244-7fce-3d3bd7a96393	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ed-9244-2298-fc5d08ff1b46	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ed-9244-f97b-943cee0e1b42	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ed-9244-c77a-3bd9a679cebd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ed-9244-0352-4377f1b4c091	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ed-9244-6181-f17b4e6e5af2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ed-9244-1067-f54539493293	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ed-9244-2c2e-d6fb06158325	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ed-9243-8cd3-9f9bfe0d7ae0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2947 (class 0 OID 17598825)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ed-9244-0900-060ba9134df9	00160000-55ed-9244-b094-06e3da019372	\N	00140000-55ed-9243-2114-81df1daa568d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ed-9244-42c9-7d54c5df6404
000e0000-55ed-9244-93ec-9395efe393c8	00160000-55ed-9244-7833-282f4fc3f82e	\N	00140000-55ed-9243-4ed5-c877c255bffe	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ed-9244-33d2-daa7ad9a3bed
000e0000-55ed-9244-0d52-69a9d077a0ad	\N	\N	00140000-55ed-9243-4ed5-c877c255bffe	00190000-55ed-9244-1475-6dbbd0a2cfc9	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ed-9244-42c9-7d54c5df6404
000e0000-55ed-9244-e778-87d9e9644f17	\N	\N	00140000-55ed-9243-4ed5-c877c255bffe	00190000-55ed-9244-1475-6dbbd0a2cfc9	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ed-9244-42c9-7d54c5df6404
000e0000-55ed-9244-1ec6-d2f16ff5d23c	\N	\N	00140000-55ed-9243-4ed5-c877c255bffe	00190000-55ed-9244-1475-6dbbd0a2cfc9	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ed-9244-fa3b-468778b24d4e
000e0000-55ed-9244-bff6-7d85c4ac11ae	\N	\N	00140000-55ed-9243-4ed5-c877c255bffe	00190000-55ed-9244-1475-6dbbd0a2cfc9	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ed-9244-fa3b-468778b24d4e
\.


--
-- TOC entry 2917 (class 0 OID 17598521)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ed-9244-dd97-9b69b50e40a7	000e0000-55ed-9244-93ec-9395efe393c8	\N	1	
00200000-55ed-9244-6ef5-46be3475295b	000e0000-55ed-9244-93ec-9395efe393c8	\N	2	
\.


--
-- TOC entry 2931 (class 0 OID 17598648)
-- Dependencies: 204
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 17598751)
-- Dependencies: 214
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ed-9243-f0bc-169cd6bb1089	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ed-9243-caf3-b31af1ca62aa	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ed-9243-c6aa-cda2248ff6c5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ed-9243-b3ce-3d60286fd075	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ed-9243-62e9-9268e4390d1a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ed-9243-159a-2b352d572834	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ed-9243-2ac3-1c854a565d7e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ed-9243-bebd-8eb642aff706	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ed-9243-e558-5bcee065a5a3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ed-9243-4eec-3169c43b77ae	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ed-9243-6b5b-f1f6c25e88b9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ed-9243-f3bc-617e34588d96	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ed-9243-bf39-33be4582a89e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ed-9243-58aa-1f4ce517b45d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ed-9243-43db-39412c95dacd	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ed-9243-1088-72bfe93e9511	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ed-9243-5dc9-b8876e530178	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ed-9243-f08a-63bcbd10a9d0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ed-9243-7938-e89d00852c31	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ed-9243-6eb1-474b2606fa18	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ed-9243-b712-b2189f21c092	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ed-9243-936c-2f179486310d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ed-9243-6d22-857829e61c3a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ed-9243-534c-d0a37943a195	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ed-9243-f650-9fba6905f1bb	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ed-9243-bc04-7458d80878d5	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ed-9243-88f2-d59df0c08257	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ed-9243-6a82-5921184d260d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2961 (class 0 OID 17599076)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 17599048)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 17599088)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 17598720)
-- Dependencies: 211
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ed-9244-3249-083d42d9e730	00090000-55ed-9244-378a-9ba2ba945193	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ed-9244-8ab5-03b748b37743	00090000-55ed-9244-07db-75d97e940432	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ed-9244-513b-f214c0e2a2d9	00090000-55ed-9244-4539-007fccd23a3a	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ed-9244-db4d-96fe7876a07c	00090000-55ed-9244-5ad0-3ac518b0dad4	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ed-9244-4749-e1b018e1bdb2	00090000-55ed-9244-126d-61cf7bf580ef	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ed-9244-99c0-ace2e4eebf47	00090000-55ed-9244-655b-e25befdf7e16	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2919 (class 0 OID 17598557)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17598815)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ed-9243-2114-81df1daa568d	01	Drama	drama (SURS 01)
00140000-55ed-9243-3bae-9847df4086cb	02	Opera	opera (SURS 02)
00140000-55ed-9243-7f0a-f133ef435afd	03	Balet	balet (SURS 03)
00140000-55ed-9243-f795-d28aaf1d3b9a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ed-9243-dcf4-03faaf7f10a5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ed-9243-4ed5-c877c255bffe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ed-9243-71e4-adb62e8deb1c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2937 (class 0 OID 17598710)
-- Dependencies: 210
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 17598361)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 17598874)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 17598864)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 17598776)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17599128)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 17598546)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 17598566)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 17599022)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 17598486)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 17598929)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 17598706)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 17598519)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 17598500)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 17598613)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 17599105)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 17599112)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2690 (class 2606 OID 17599136)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17598640)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 17598458)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 17598370)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 17598394)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 17598350)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 17598335)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 17598646)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 17598682)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 17598810)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 17598422)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 17598446)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 17598619)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17598436)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 17598507)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 17598631)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 17598985)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 17598993)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 17598977)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 17599004)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 17598664)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 17598604)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 17598595)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 17598798)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 17598734)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 17598306)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 17598673)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17598324)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 17598344)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 17598691)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 17598626)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 17598575)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17599046)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 17599034)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 17599028)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 17598747)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17598403)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 17598586)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 17598787)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 17599016)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 17598471)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 17598319)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 17598843)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 17598529)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 17598654)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 17598759)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 17599086)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 17599070)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 17599094)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 17598725)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 17598561)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 17598823)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17598718)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 1259 OID 17598555)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 17598556)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2505 (class 1259 OID 17598554)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2506 (class 1259 OID 17598553)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2588 (class 1259 OID 17598748)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2589 (class 1259 OID 17598749)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2590 (class 1259 OID 17598750)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2676 (class 1259 OID 17599107)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2677 (class 1259 OID 17599106)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 17598424)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2551 (class 1259 OID 17598647)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 17599074)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2664 (class 1259 OID 17599073)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2665 (class 1259 OID 17599075)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2666 (class 1259 OID 17599072)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2667 (class 1259 OID 17599071)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2545 (class 1259 OID 17598633)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2546 (class 1259 OID 17598632)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2498 (class 1259 OID 17598530)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2575 (class 1259 OID 17598707)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 17598709)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2577 (class 1259 OID 17598708)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 17598502)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 17598501)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 17599005)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2601 (class 1259 OID 17598812)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 17598813)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2603 (class 1259 OID 17598814)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2673 (class 1259 OID 17599095)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2610 (class 1259 OID 17598848)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2611 (class 1259 OID 17598845)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2612 (class 1259 OID 17598849)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2613 (class 1259 OID 17598847)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2614 (class 1259 OID 17598846)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 17598473)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 17598472)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 17598397)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2563 (class 1259 OID 17598674)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 17598351)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 17598352)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2568 (class 1259 OID 17598694)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2569 (class 1259 OID 17598693)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2570 (class 1259 OID 17598692)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 17598508)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 17598509)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2656 (class 1259 OID 17599036)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2525 (class 1259 OID 17598599)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2526 (class 1259 OID 17598597)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2527 (class 1259 OID 17598596)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2528 (class 1259 OID 17598598)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 17598325)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 17598326)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2554 (class 1259 OID 17598655)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2686 (class 1259 OID 17599129)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2687 (class 1259 OID 17599137)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2688 (class 1259 OID 17599138)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2540 (class 1259 OID 17598620)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2584 (class 1259 OID 17598735)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2585 (class 1259 OID 17598736)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 17598934)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2632 (class 1259 OID 17598933)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2633 (class 1259 OID 17598930)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 17598931)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2635 (class 1259 OID 17598932)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 17598438)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 17598437)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 17598439)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 17598668)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2558 (class 1259 OID 17598667)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 17598986)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2639 (class 1259 OID 17598987)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2624 (class 1259 OID 17598878)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 17598879)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2626 (class 1259 OID 17598876)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2627 (class 1259 OID 17598877)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2581 (class 1259 OID 17598726)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 17598608)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2532 (class 1259 OID 17598607)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2533 (class 1259 OID 17598605)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2534 (class 1259 OID 17598606)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2620 (class 1259 OID 17598866)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 17598865)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2497 (class 1259 OID 17598520)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2653 (class 1259 OID 17599023)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2680 (class 1259 OID 17599113)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2681 (class 1259 OID 17599114)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 17598372)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 17598371)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 17598404)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 17598405)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 17598589)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 17598588)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2522 (class 1259 OID 17598587)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 17598548)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 17598549)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 17598547)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 17598551)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2511 (class 1259 OID 17598552)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2512 (class 1259 OID 17598550)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 17598423)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 17598487)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 17598489)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 17598488)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 17598490)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2539 (class 1259 OID 17598614)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 17598811)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2615 (class 1259 OID 17598844)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 17598395)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 17598396)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2578 (class 1259 OID 17598719)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 17599047)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 17598459)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2659 (class 1259 OID 17599035)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2561 (class 1259 OID 17598666)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2562 (class 1259 OID 17598665)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 17598875)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 17598447)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 17598824)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2670 (class 1259 OID 17599087)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2644 (class 1259 OID 17598994)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 17598995)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 17598576)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 17598345)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2718 (class 2606 OID 17599254)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2717 (class 2606 OID 17599259)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2713 (class 2606 OID 17599279)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2719 (class 2606 OID 17599249)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2715 (class 2606 OID 17599269)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2714 (class 2606 OID 17599274)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 17599264)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2751 (class 2606 OID 17599429)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2750 (class 2606 OID 17599434)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 17599439)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 17599604)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 17599599)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2701 (class 2606 OID 17599189)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 17599359)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2778 (class 2606 OID 17599584)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 17599579)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2777 (class 2606 OID 17599589)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 17599574)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2781 (class 2606 OID 17599569)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2733 (class 2606 OID 17599354)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2734 (class 2606 OID 17599349)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2712 (class 2606 OID 17599244)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2745 (class 2606 OID 17599399)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 17599409)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2744 (class 2606 OID 17599404)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2707 (class 2606 OID 17599224)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 17599219)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 17599339)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 17599554)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2754 (class 2606 OID 17599444)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2753 (class 2606 OID 17599449)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2752 (class 2606 OID 17599454)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2782 (class 2606 OID 17599594)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2756 (class 2606 OID 17599474)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2759 (class 2606 OID 17599459)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2755 (class 2606 OID 17599479)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2757 (class 2606 OID 17599469)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2758 (class 2606 OID 17599464)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2705 (class 2606 OID 17599214)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 17599209)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2697 (class 2606 OID 17599174)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2698 (class 2606 OID 17599169)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2739 (class 2606 OID 17599379)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2694 (class 2606 OID 17599149)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2693 (class 2606 OID 17599154)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2740 (class 2606 OID 17599394)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2741 (class 2606 OID 17599389)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2742 (class 2606 OID 17599384)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2710 (class 2606 OID 17599229)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 17599234)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2776 (class 2606 OID 17599564)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2723 (class 2606 OID 17599314)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2725 (class 2606 OID 17599304)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2726 (class 2606 OID 17599299)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2724 (class 2606 OID 17599309)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 17599139)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2691 (class 2606 OID 17599144)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2736 (class 2606 OID 17599364)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2787 (class 2606 OID 17599619)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 17599624)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2788 (class 2606 OID 17599629)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2732 (class 2606 OID 17599344)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2748 (class 2606 OID 17599419)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2747 (class 2606 OID 17599424)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 17599534)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2767 (class 2606 OID 17599529)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2770 (class 2606 OID 17599514)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2769 (class 2606 OID 17599519)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2768 (class 2606 OID 17599524)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2703 (class 2606 OID 17599199)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2704 (class 2606 OID 17599194)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2702 (class 2606 OID 17599204)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2737 (class 2606 OID 17599374)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2738 (class 2606 OID 17599369)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2772 (class 2606 OID 17599539)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2771 (class 2606 OID 17599544)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 17599504)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 17599509)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2765 (class 2606 OID 17599494)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2764 (class 2606 OID 17599499)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2746 (class 2606 OID 17599414)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 17599334)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2728 (class 2606 OID 17599329)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2730 (class 2606 OID 17599319)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2729 (class 2606 OID 17599324)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2760 (class 2606 OID 17599489)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2761 (class 2606 OID 17599484)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2711 (class 2606 OID 17599239)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2773 (class 2606 OID 17599549)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 17599559)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2786 (class 2606 OID 17599609)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2785 (class 2606 OID 17599614)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2695 (class 2606 OID 17599164)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2696 (class 2606 OID 17599159)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2700 (class 2606 OID 17599179)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 17599184)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 17599294)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2721 (class 2606 OID 17599289)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2722 (class 2606 OID 17599284)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-07 15:33:58 CEST

--
-- PostgreSQL database dump complete
--

