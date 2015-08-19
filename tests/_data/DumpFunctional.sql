--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-19 16:49:34 CEST

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
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15099391)
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
-- TOC entry 222 (class 1259 OID 15099894)
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
-- TOC entry 221 (class 1259 OID 15099877)
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
-- TOC entry 215 (class 1259 OID 15099789)
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
-- TOC entry 238 (class 1259 OID 15100137)
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
-- TOC entry 191 (class 1259 OID 15099570)
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
-- TOC entry 194 (class 1259 OID 15099604)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15100039)
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
-- TOC entry 186 (class 1259 OID 15099513)
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
-- TOC entry 223 (class 1259 OID 15099907)
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
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
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
-- TOC entry 210 (class 1259 OID 15099734)
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
-- TOC entry 189 (class 1259 OID 15099550)
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
-- TOC entry 193 (class 1259 OID 15099598)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15099530)
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
-- TOC entry 199 (class 1259 OID 15099651)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15100118)
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
-- TOC entry 237 (class 1259 OID 15100130)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15100152)
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
-- TOC entry 203 (class 1259 OID 15099676)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15099487)
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
-- TOC entry 178 (class 1259 OID 15099400)
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
-- TOC entry 179 (class 1259 OID 15099411)
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
-- TOC entry 174 (class 1259 OID 15099365)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15099384)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15099683)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15099714)
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
-- TOC entry 218 (class 1259 OID 15099828)
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
-- TOC entry 181 (class 1259 OID 15099444)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) DEFAULT NULL::character varying,
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
-- TOC entry 183 (class 1259 OID 15099479)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15099657)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15099464)
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
-- TOC entry 188 (class 1259 OID 15099542)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15099669)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15100000)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 226 (class 1259 OID 15100010)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15099956)
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
    stizvponprej integer,
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
-- TOC entry 227 (class 1259 OID 15100018)
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
-- TOC entry 206 (class 1259 OID 15099698)
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
-- TOC entry 198 (class 1259 OID 15099642)
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
-- TOC entry 197 (class 1259 OID 15099632)
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
-- TOC entry 217 (class 1259 OID 15099817)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15099766)
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
-- TOC entry 171 (class 1259 OID 15099336)
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
-- TOC entry 170 (class 1259 OID 15099334)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15099708)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15099374)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15099358)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15099722)
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
-- TOC entry 201 (class 1259 OID 15099663)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15099609)
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
-- TOC entry 232 (class 1259 OID 15100059)
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
-- TOC entry 231 (class 1259 OID 15100051)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15100046)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15099776)
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
    sort integer
);


--
-- TOC entry 180 (class 1259 OID 15099436)
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
-- TOC entry 196 (class 1259 OID 15099619)
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
-- TOC entry 216 (class 1259 OID 15099806)
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
-- TOC entry 228 (class 1259 OID 15100028)
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
-- TOC entry 185 (class 1259 OID 15099499)
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
-- TOC entry 172 (class 1259 OID 15099345)
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
-- TOC entry 220 (class 1259 OID 15099854)
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
-- TOC entry 190 (class 1259 OID 15099561)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15099690)
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
-- TOC entry 234 (class 1259 OID 15100098)
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
-- TOC entry 233 (class 1259 OID 15100070)
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
-- TOC entry 235 (class 1259 OID 15100110)
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
-- TOC entry 212 (class 1259 OID 15099759)
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
-- TOC entry 192 (class 1259 OID 15099593)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15099844)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15099749)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15099339)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2890 (class 0 OID 15099391)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15099894)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d4-977d-f9c7-47920549c825	000d0000-55d4-977d-76e8-aad7f843a902	\N	00090000-55d4-977d-96f2-db04f4203058	000b0000-55d4-977d-a066-561e42db6fe9	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d4-977d-5aa7-d161cbc7a0bf	000d0000-55d4-977d-17e4-3e61e2625b2b	00100000-55d4-977d-a6f7-7935d6b166d9	00090000-55d4-977d-fece-e10b39af1284	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d4-977d-e8b1-07a3afa399b8	000d0000-55d4-977d-f9e7-186e44c4db0a	00100000-55d4-977d-c8bf-85649c55ad52	00090000-55d4-977d-86c0-6756cb81441b	\N	0003	t	\N	2015-08-19	\N	2	\N	\N	f	f
000c0000-55d4-977d-c5fe-8dca5984d92b	000d0000-55d4-977d-6fb5-517c42e01e84	\N	00090000-55d4-977d-5357-e4a27000c4a1	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d4-977d-00d7-830b859ab49e	000d0000-55d4-977d-17b6-1c5754da0cb5	\N	00090000-55d4-977d-8b55-c3078c2bc7fc	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d4-977e-6e79-5d038d7f153e	000d0000-55d4-977d-93d5-63c4848ef089	\N	00090000-55d4-977d-cc7a-e7336977f183	000b0000-55d4-977d-a86c-90bd696f2f40	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d4-977e-6832-c9635a6af288	000d0000-55d4-977d-4af2-5206ee1268ab	00100000-55d4-977d-c478-8ad21e014080	00090000-55d4-977d-375d-b9360750688a	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d4-977e-a396-b21cce9f3314	000d0000-55d4-977d-2aef-6272f6b806a5	\N	00090000-55d4-977d-3b48-bc1177d5d83d	000b0000-55d4-977d-5ded-6a9963872b6a	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d4-977e-65e8-f21e0b0b9173	000d0000-55d4-977d-4af2-5206ee1268ab	00100000-55d4-977d-f801-9ceabe7322df	00090000-55d4-977d-e81f-da23dba863ed	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d4-977e-318b-cccf219ee491	000d0000-55d4-977d-4af2-5206ee1268ab	00100000-55d4-977d-96bb-96d09ce1ab8e	00090000-55d4-977d-2b54-ad7f6b235b53	\N	0010	t	\N	2015-08-19	\N	16	\N	\N	f	t
000c0000-55d4-977e-cb27-80c28b49ad39	000d0000-55d4-977d-4af2-5206ee1268ab	00100000-55d4-977d-0187-bfe1f12d3dd1	00090000-55d4-977d-0f45-a4870be49474	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2934 (class 0 OID 15099877)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15099789)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d4-977d-f030-636e6a004f28	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d4-977d-ea6e-381bc57c1905	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d4-977d-b4b2-42888570f12b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2951 (class 0 OID 15100137)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15099570)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d4-977d-c0b2-9de2177d0c61	\N	\N	00200000-55d4-977d-2f40-9d0e683c12b5	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d4-977d-83b6-511c0d7eedb5	\N	\N	00200000-55d4-977d-537a-f096fcc8fc7f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d4-977d-3a25-0e0a76d29d7f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d4-977d-6853-14c29c90e44a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d4-977d-b6ae-abf86457b129	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2907 (class 0 OID 15099604)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 15100039)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 15099513)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d4-977b-7122-541ebd27bc82	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d4-977b-9a86-4cd3dfe4e57d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d4-977b-2cd4-14603459acef	AL	ALB	008	Albania 	Albanija	\N
00040000-55d4-977b-c222-a313ada9ccf5	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d4-977b-d0d7-4f1c69d435b0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d4-977b-060d-3ded56ee3e89	AD	AND	020	Andorra 	Andora	\N
00040000-55d4-977b-d317-5cd974834124	AO	AGO	024	Angola 	Angola	\N
00040000-55d4-977b-a3c4-774b9e611059	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d4-977b-e8c7-1e03bd39fea3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d4-977b-6d04-c3ce775273d7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d4-977b-c25b-6b785aef53ef	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d4-977b-a23b-4c07b8ed72b6	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d4-977b-260b-eb3b28799a72	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d4-977b-eb37-d1a691ebd123	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d4-977b-55a8-3e6d8af57968	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d4-977b-0824-d321c348c8bc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d4-977b-1645-3248b9d32f27	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d4-977b-94fc-3abab3f252c7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d4-977b-10ad-734173a6cfa7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d4-977b-84ed-7b0ef444e26f	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d4-977b-7cd8-064f026b0b72	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d4-977b-b71c-c684ec9c6111	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d4-977b-4a56-d88cb89a3a8c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d4-977b-7813-c547d95b1aa2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d4-977b-f878-d40e2d454eee	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d4-977b-302b-54e8a68fa2b6	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d4-977b-9aad-ea62c1db60c7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d4-977b-f4b6-2272fc3d1ed3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d4-977b-650a-c11a4f0fc017	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d4-977b-b5ff-af444f8ec2a0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d4-977b-6a67-6f8444a91840	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d4-977b-cb52-5f2c2b4eb14d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d4-977b-0de4-9e99d41ae423	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d4-977b-c186-b1cfcd716854	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d4-977b-4734-41f73766b938	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d4-977b-4c5d-c8bb6bb8bda4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d4-977b-6f89-edd8cf430edd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d4-977b-043f-a39ad6cf34de	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d4-977b-28b9-387835f60ef3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d4-977b-d5ee-ec10484f1aa8	CA	CAN	124	Canada 	Kanada	\N
00040000-55d4-977b-40da-51ac87b65f63	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d4-977b-6829-47ccecdf2a35	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d4-977b-2114-eb8fde66f33d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d4-977b-2540-40dbeba4e935	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d4-977b-9c3b-2fa8d9f165ac	CL	CHL	152	Chile 	Čile	\N
00040000-55d4-977b-5668-81fd21cc4fc8	CN	CHN	156	China 	Kitajska	\N
00040000-55d4-977b-e8f5-6b9d7f7c758d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d4-977b-3f93-6f1b132f57a1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d4-977b-f90c-940abecee491	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d4-977b-8601-8d300ae27041	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d4-977b-1221-1272e52609a7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d4-977b-69f0-1a6512eb111b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d4-977b-494d-d8b04c5aea27	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d4-977b-69ad-c047f3f7db2b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d4-977c-5b91-01b33e9204a1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d4-977c-730d-7399b4922b43	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d4-977c-f009-3d205b3709d6	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d4-977c-d38b-7906e4832a96	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d4-977c-0609-3fd3dae02333	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d4-977c-9102-1dc8718eff67	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d4-977c-8f4e-0b153f77c6f4	DK	DNK	208	Denmark 	Danska	\N
00040000-55d4-977c-c878-d22e9f9b319b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d4-977c-352b-41a9a0dc82a4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d4-977c-7653-fd5eeb9ddaed	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d4-977c-c2aa-d130591d4c55	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d4-977c-cc19-05232310da99	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d4-977c-2fc9-cddb0f71574e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d4-977c-32b5-2852d06ea530	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d4-977c-7bdf-2de2af47b8b1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d4-977c-fed9-30563a55c2d4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d4-977c-c5b8-49b0fd364257	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d4-977c-4901-75f397db4687	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d4-977c-12c1-d18ebfc02492	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d4-977c-4c57-fedb3426a2e5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d4-977c-7e41-bf47a1f48b38	FI	FIN	246	Finland 	Finska	\N
00040000-55d4-977c-baff-b98200d999e4	FR	FRA	250	France 	Francija	\N
00040000-55d4-977c-e45f-765eea25d282	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d4-977c-9d83-6919c1ca734a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d4-977c-1efa-5904ae6945a3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d4-977c-1789-3d800167746e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d4-977c-06a2-b466f37440e4	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d4-977c-b905-479c39710f98	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d4-977c-9249-692fb7151a6a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d4-977c-8963-6c05dc4246ef	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d4-977c-d8c5-eca3adbea7d6	GH	GHA	288	Ghana 	Gana	\N
00040000-55d4-977c-7b3d-cbb41799c2f3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d4-977c-4c9f-f95203d0a3f1	GR	GRC	300	Greece 	Grčija	\N
00040000-55d4-977c-c399-7801dcb46609	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d4-977c-6523-0d56e81ad827	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d4-977c-23cb-904f17b5c97b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d4-977c-d0b1-4e4938828331	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d4-977c-0375-d84d6c57c16a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d4-977c-2bba-722547e0296a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d4-977c-7ea2-f0b115e88f55	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d4-977c-ce58-0100f7a7d826	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d4-977c-6b5e-964636be98ab	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d4-977c-1e7e-244216b9552c	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d4-977c-3ba5-c3b5537d8888	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d4-977c-4dec-140b61f44561	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d4-977c-80d3-0f017434d04f	HN	HND	340	Honduras 	Honduras	\N
00040000-55d4-977c-24a8-dce5487cf7e2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d4-977c-d74e-226a041b2e4c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d4-977c-5779-ae2ccc3e0c2d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d4-977c-352b-0b4eaaa19aa7	IN	IND	356	India 	Indija	\N
00040000-55d4-977c-838d-7f722ca96e44	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d4-977c-5df3-55306409d2e8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d4-977c-0572-ebeade80bc22	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d4-977c-742e-24faec506923	IE	IRL	372	Ireland 	Irska	\N
00040000-55d4-977c-3f0a-ef3b009b0873	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d4-977c-056d-5bfc53869903	IL	ISR	376	Israel 	Izrael	\N
00040000-55d4-977c-b241-1016672f7769	IT	ITA	380	Italy 	Italija	\N
00040000-55d4-977c-6766-122343a7ffa1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d4-977c-6f71-3008d8a1ea8a	JP	JPN	392	Japan 	Japonska	\N
00040000-55d4-977c-acad-11294afebcd5	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d4-977c-eceb-a11be73cf2dd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d4-977c-fcdd-6815f986fe43	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d4-977c-9039-c9e055e8bd48	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d4-977c-2228-490dee087406	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d4-977c-6815-df3dfbde3e7c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d4-977c-3674-55fbba9a3764	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d4-977c-941a-b9360b5a7fea	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d4-977c-fcb1-004efd859f2f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d4-977c-ebfa-f529fbf96a8c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d4-977c-2be5-18e3e550471e	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d4-977c-ba99-b8d68ac927a8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d4-977c-3eae-608f76e9bb79	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d4-977c-6046-70151738011e	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d4-977c-be4d-125ab56de9ea	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d4-977c-522b-28a847c94315	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d4-977c-9e6c-10ce8389cc81	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d4-977c-23a5-2929856fd052	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d4-977c-e6c3-9da053f00726	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d4-977c-f681-3b1209efc0db	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d4-977c-3ed9-0252b2925352	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d4-977c-173e-0dc60d80c34a	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d4-977c-3a71-04273b10736e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d4-977c-b6bc-5f112a43d894	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d4-977c-a877-c154e13ab33b	ML	MLI	466	Mali 	Mali	\N
00040000-55d4-977c-5941-c76a18e19698	MT	MLT	470	Malta 	Malta	\N
00040000-55d4-977c-292b-339ad767b1b3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d4-977c-3a0a-6197db085fc4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d4-977c-ce40-0b987f2dbf1c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d4-977c-d46a-af8713e91aa5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d4-977c-e60c-12afaf9afadc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d4-977c-1ed5-8df74a12ee19	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d4-977c-3d44-b9da2405becd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d4-977c-3248-42bced7b565a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d4-977c-f1ff-21103b6fa94a	MC	MCO	492	Monaco 	Monako	\N
00040000-55d4-977c-2df4-de130e679d28	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d4-977c-6e04-c9c9f480c1a1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d4-977c-309c-a58c0fcc65c9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d4-977c-7bcb-4bfd35e719aa	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d4-977c-30f2-af5e46957a1b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d4-977c-dc65-f29c7beb97a9	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d4-977c-8f75-803eee349dcb	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d4-977c-4388-3969ebde737c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d4-977c-390f-c2d680d9c537	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d4-977c-ce17-0f2111098722	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d4-977c-2e9f-e04978ca97f8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d4-977c-8ed3-c1728951ac3e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d4-977c-d1d2-41a8fed05853	NE	NER	562	Niger 	Niger 	\N
00040000-55d4-977c-6101-c8295e0b2191	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d4-977c-366b-28ed2a6f7017	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d4-977c-4dfb-04122390b8dd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d4-977c-de52-186556630c71	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d4-977c-aec6-8373dd02c670	NO	NOR	578	Norway 	Norveška	\N
00040000-55d4-977c-7a87-9cbc37ae6085	OM	OMN	512	Oman 	Oman	\N
00040000-55d4-977c-bfb3-51e227f0b0b7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d4-977c-3abd-7535b0808b21	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d4-977c-3978-ede9d3cb6ca1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d4-977c-63aa-79dc73c81dc1	PA	PAN	591	Panama 	Panama	\N
00040000-55d4-977c-8ebc-8071a9dea1b6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d4-977c-f5b4-fb696ff06150	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d4-977c-a7df-b1fb18f1327e	PE	PER	604	Peru 	Peru	\N
00040000-55d4-977c-5982-108610e690d1	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d4-977c-032e-82854f364493	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d4-977c-68ef-51b9ad1a7108	PL	POL	616	Poland 	Poljska	\N
00040000-55d4-977c-1aa7-e73d2bd7c3ff	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d4-977c-b5c3-87ef4d950bd4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d4-977c-c4fe-315d9063eb8b	QA	QAT	634	Qatar 	Katar	\N
00040000-55d4-977c-ac59-e9fe9e934655	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d4-977c-21a3-ff5b4916ac25	RO	ROU	642	Romania 	Romunija	\N
00040000-55d4-977c-c699-5312be2084a8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d4-977c-9bb3-cab72a29b0e9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d4-977c-bc66-abef3c6c91c0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d4-977c-ea46-de3a2ef3b8df	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d4-977c-41de-10cb6c439781	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d4-977c-1662-c3de8c560b75	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d4-977c-cf77-07dbccb28b5d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d4-977c-7d7b-690793be2c11	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d4-977c-d0d1-675058e7be28	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d4-977c-ae7b-e3094dda017b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d4-977c-0a30-ca973c12f25d	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d4-977c-4f14-76e603fdd723	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d4-977c-ab63-2dd3bbc702ce	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d4-977c-e7f3-f68b35ccf2a6	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d4-977c-66dc-04282be5bea7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d4-977c-0acc-1ddff06c97d2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d4-977c-23d3-eecb3963c6e9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d4-977c-0737-8d8d9729f0d4	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d4-977c-3c15-8a196a78ca7a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d4-977c-99a5-4a58de9d5dc9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d4-977c-e878-977caba30808	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d4-977c-579a-774e98c7a85d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d4-977c-fb03-2fefc50fb2e0	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d4-977c-dac6-6609e8886b1b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d4-977c-d9d0-4636337654ff	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d4-977c-d6f4-4b8afe4af507	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d4-977c-793d-5b0df11eedec	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d4-977c-a415-480014bc7558	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d4-977c-6c51-29c329c8f720	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d4-977c-0d99-8240377203bc	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d4-977c-b81b-3e7d7c69c324	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d4-977c-143d-207ad55b1062	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d4-977c-2f66-88199248e1dc	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d4-977c-5fe1-ec199451ba30	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d4-977c-8e31-4aa642c6f4a8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d4-977c-5845-d6d524f311f0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d4-977c-1c79-de8eb850cafc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d4-977c-8e7b-426820406f44	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d4-977c-4f51-0d02a1fbaa93	TH	THA	764	Thailand 	Tajska	\N
00040000-55d4-977c-1ace-32820cf1e076	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d4-977c-162f-e6a71ef4b2e0	TG	TGO	768	Togo 	Togo	\N
00040000-55d4-977c-003b-57e7da06e558	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d4-977c-6599-d7525b4a27fb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d4-977c-77bc-2be87fd851ea	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d4-977c-bafb-41ad9047dded	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d4-977c-e290-d67ab30b477d	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d4-977c-2fca-515bfe9e0f0b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d4-977c-1d21-72f8709c909c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d4-977c-2b65-1dd2f86299af	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d4-977c-196a-5223fc9c7cae	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d4-977c-421c-c5a15cd91613	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d4-977c-a7af-f231432a7b17	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d4-977c-ad8d-0461282c9ac8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d4-977c-e429-5109f6eb0f1b	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d4-977c-c09c-d51e0f75050a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d4-977c-4029-e565b07bcb33	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d4-977c-f411-92daaa4a2414	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d4-977c-5e8c-d9b43255b3e2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d4-977c-3a0a-b5a00d3cf029	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d4-977c-c3fe-9fc819d2770f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d4-977c-44bf-23a7aa7d17cd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d4-977c-8c59-ecfa7bef93a0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d4-977c-0f98-8d45442710ce	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d4-977c-0321-a3231a3664c7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d4-977c-c773-7cffa29afb3b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d4-977c-4131-dda0fa4722b0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d4-977c-ff5b-4314af8866a3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2936 (class 0 OID 15099907)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d4-977d-7c63-2335159dbf87	000e0000-55d4-977d-4f5e-8513e6052560	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55d4-977c-9837-439c1bbdf9c8	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d4-977d-7421-548bcf19cb6e	000e0000-55d4-977d-2a82-f586d57299ce	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d4-977c-5879-fa439c717c46	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d4-977d-39e9-5f409bf8f413	000e0000-55d4-977d-13fb-1dc0565a8e8d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d4-977c-9837-439c1bbdf9c8	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d4-977d-d647-d0ee5bb404e0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d4-977d-d175-e0c244679692	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2923 (class 0 OID 15099734)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d4-977d-4af2-5206ee1268ab	000e0000-55d4-977d-2a82-f586d57299ce	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d4-977c-8a81-9dbbecc0e6fa
000d0000-55d4-977d-76e8-aad7f843a902	000e0000-55d4-977d-2a82-f586d57299ce	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d4-977c-8a81-9dbbecc0e6fa
000d0000-55d4-977d-17e4-3e61e2625b2b	000e0000-55d4-977d-2a82-f586d57299ce	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d4-977c-6510-a1cc9f9df250
000d0000-55d4-977d-f9e7-186e44c4db0a	000e0000-55d4-977d-2a82-f586d57299ce	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d4-977c-939c-28ed9e696b03
000d0000-55d4-977d-6fb5-517c42e01e84	000e0000-55d4-977d-2a82-f586d57299ce	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d4-977c-204e-3f2d37bdf2b3
000d0000-55d4-977d-17b6-1c5754da0cb5	000e0000-55d4-977d-2a82-f586d57299ce	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55d4-977c-204e-3f2d37bdf2b3
000d0000-55d4-977d-93d5-63c4848ef089	000e0000-55d4-977d-2a82-f586d57299ce	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d4-977c-8a81-9dbbecc0e6fa
000d0000-55d4-977d-2aef-6272f6b806a5	000e0000-55d4-977d-2a82-f586d57299ce	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d4-977c-b13d-eb6260d599eb
\.


--
-- TOC entry 2902 (class 0 OID 15099550)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15099598)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15099530)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d4-977d-53b3-e58f23be36fc	00080000-55d4-977d-b081-01c102c48c94	00090000-55d4-977d-2b54-ad7f6b235b53	AK		
\.


--
-- TOC entry 2912 (class 0 OID 15099651)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15100118)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15100130)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15100152)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15099676)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 15099487)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d4-977c-4a8b-b41ad4f35ddf	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d4-977c-f989-a485b31c776c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d4-977c-fc85-afe4a656bcf9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d4-977c-5b6b-e79f2397efbf	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d4-977c-99de-92075640669a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d4-977c-faff-e5179de28a6c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d4-977c-e50e-3929fdd31e59	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d4-977c-0f4c-9030053b8797	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55d4-977c-247f-246daff956e9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d4-977c-9ea2-a6725c8312b3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d4-977c-ac4e-2a86a0bfc7ec	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d4-977c-9f79-2f925b576977	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d4-977c-7eab-82bc511054b6	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d4-977c-c664-95d0b287ef5d	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d4-977d-7640-10070cb8f874	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d4-977d-b275-b37ae199896c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d4-977d-9df9-2e69a68459d2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d4-977d-9adf-b5b4a7cb7477	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d4-977d-ffc7-ec927f4cd094	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d4-977d-8ee8-4f10b5cb6947	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2891 (class 0 OID 15099400)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d4-977d-2e71-1c9993155ecb	00000000-55d4-977d-b275-b37ae199896c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d4-977d-c9dc-9cebccf1c126	00000000-55d4-977d-b275-b37ae199896c	00010000-55d4-977c-cb9c-bf94e5e43497	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d4-977d-5910-910d7f9a2fde	00000000-55d4-977d-9df9-2e69a68459d2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2892 (class 0 OID 15099411)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d4-977d-96f2-db04f4203058	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d4-977d-5357-e4a27000c4a1	00010000-55d4-977d-9138-6e11443d9ba8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d4-977d-86c0-6756cb81441b	00010000-55d4-977d-2f8d-918c84794e7a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d4-977d-e81f-da23dba863ed	00010000-55d4-977d-0cfa-b91c48e53470	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d4-977d-99e5-765202bcd70d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d4-977d-cc7a-e7336977f183	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d4-977d-0f45-a4870be49474	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d4-977d-375d-b9360750688a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d4-977d-2b54-ad7f6b235b53	00010000-55d4-977d-deda-8dc5299842b1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d4-977d-fece-e10b39af1284	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d4-977d-9533-ceeee5862b12	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d4-977d-8b55-c3078c2bc7fc	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d4-977d-3b48-bc1177d5d83d	00010000-55d4-977d-1e47-8076549f78c0	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 15099365)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d4-977c-c77c-d1b51bfce030	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d4-977c-5c90-4e9e98b73545	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d4-977c-1e63-21abe954c1b4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d4-977c-af26-3ad562877774	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d4-977c-16d1-a7b4616a130a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d4-977c-a48e-8d0833b78973	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d4-977c-e847-cdc6eaa2e298	Abonma-read	Abonma - branje	f
00030000-55d4-977c-7366-58c89fb948ad	Abonma-write	Abonma - spreminjanje	f
00030000-55d4-977c-cbe5-bafff46c97f9	Alternacija-read	Alternacija - branje	f
00030000-55d4-977c-68f7-48d7ad66925e	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d4-977c-44b2-1ed8b746f053	Arhivalija-read	Arhivalija - branje	f
00030000-55d4-977c-e702-6882f6ae77ad	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d4-977c-57f7-416bbbde4588	Besedilo-read	Besedilo - branje	f
00030000-55d4-977c-3738-60d7c56f339e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d4-977c-9f2d-75c5fa9cdd76	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d4-977c-863b-0d7140c013ba	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d4-977c-b736-52a023e1b12b	Dogodek-read	Dogodek - branje	f
00030000-55d4-977c-ac2e-737517762263	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d4-977c-432c-15b2cb67aebc	DrugiVir-read	DrugiVir - branje	f
00030000-55d4-977c-36bc-a216186b5fa8	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d4-977c-5bca-c2e722639ad4	Drzava-read	Drzava - branje	f
00030000-55d4-977c-2395-43746d586683	Drzava-write	Drzava - spreminjanje	f
00030000-55d4-977c-a33c-9d4531ec8302	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d4-977c-6bc3-0500b6bca401	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d4-977c-40a5-58a28aee4044	Funkcija-read	Funkcija - branje	f
00030000-55d4-977c-8a82-376a4facf123	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d4-977c-5e1a-d4dd99d3b1a5	Gostovanje-read	Gostovanje - branje	f
00030000-55d4-977c-c078-d70fd183a3d8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d4-977c-5a93-a2737d2e4b41	Gostujoca-read	Gostujoca - branje	f
00030000-55d4-977c-4c8f-8c808e6f5639	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d4-977c-8477-d6c94e5a2954	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d4-977c-c21b-2f9f54029926	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d4-977c-4d7d-f44fff0b1638	Kupec-read	Kupec - branje	f
00030000-55d4-977c-ef31-ec0a9a05c848	Kupec-write	Kupec - spreminjanje	f
00030000-55d4-977c-a372-9dc564b31737	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d4-977c-3537-22fde9fb3bd6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d4-977c-81d0-0df61f1d8198	Option-read	Option - branje	f
00030000-55d4-977c-83a9-d047aae4fa6a	Option-write	Option - spreminjanje	f
00030000-55d4-977c-012a-ad23bfb7d0b2	OptionValue-read	OptionValue - branje	f
00030000-55d4-977c-a956-288fcc82dd8e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d4-977c-7c8c-3231e7e2cca5	Oseba-read	Oseba - branje	f
00030000-55d4-977c-23c9-70f2d53c2363	Oseba-write	Oseba - spreminjanje	f
00030000-55d4-977c-bc42-f939025bdabb	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d4-977c-f52f-76ef9378d103	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d4-977c-e06c-83ad22b36785	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d4-977c-bcaf-3401a5140b66	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d4-977c-563c-35abcd133810	Pogodba-read	Pogodba - branje	f
00030000-55d4-977c-fe8e-28fbf081a116	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d4-977c-ce57-bc5fd33e2cbb	Popa-read	Popa - branje	f
00030000-55d4-977c-7694-fa48b5a81f60	Popa-write	Popa - spreminjanje	f
00030000-55d4-977c-96ac-0b96058e9018	Posta-read	Posta - branje	f
00030000-55d4-977c-148a-dccac51a56d4	Posta-write	Posta - spreminjanje	f
00030000-55d4-977c-c121-1caf57a870a3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d4-977c-74b7-b77721059324	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d4-977c-17a9-019c84b52c7c	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d4-977c-1db3-d6c25a3739fc	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d4-977c-e1cd-496160af81ce	Predstava-read	Predstava - branje	f
00030000-55d4-977c-41a1-08ff6c0ebf2b	Predstava-write	Predstava - spreminjanje	f
00030000-55d4-977c-ba5d-80dcdd867247	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d4-977c-4ee1-a04697719261	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d4-977c-8ad0-df041b2c4ea1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d4-977c-e225-99222aca0503	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d4-977c-a24b-a591aed3cb66	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d4-977c-93e4-4de832bc29c6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d4-977c-82ef-a1e739ef57c6	ProgramDela-read	ProgramDela - branje	f
00030000-55d4-977c-3f25-9190496ea9ed	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d4-977c-363f-d5f524a44daa	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d4-977c-d707-ee7a4f2987fa	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d4-977c-44f1-cc0469afd596	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d4-977c-e942-1bd7fefefea3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d4-977c-0594-566b9c2811f5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d4-977c-1403-a544d28d6071	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d4-977c-ac7c-cf2ed0cac60e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d4-977c-54d3-cfc7d9f47ba3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d4-977c-b061-e183017d5dd9	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d4-977c-1fdb-27a61eed1e74	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d4-977c-09ce-e84498d0f69e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d4-977c-a86b-6194fb885c45	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d4-977c-d7d8-f0a84daab6b3	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d4-977c-b0fc-2ab83d440711	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d4-977c-08fd-8bfdebfb3325	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d4-977c-88ab-c360653454eb	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d4-977c-a429-24486aa1fe60	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d4-977c-d1ab-d6a6b0f549bf	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d4-977c-c45d-ffbb70820418	Prostor-read	Prostor - branje	f
00030000-55d4-977c-6566-255d7abf1288	Prostor-write	Prostor - spreminjanje	f
00030000-55d4-977c-8e72-b79921997dd6	Racun-read	Racun - branje	f
00030000-55d4-977c-0273-2c93ef7cd668	Racun-write	Racun - spreminjanje	f
00030000-55d4-977c-9087-d0055e48b6ca	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d4-977c-60ba-6c7ae9dc7520	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d4-977c-1173-8221e8ad75c3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d4-977c-952f-331f2540cf90	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d4-977c-a38f-97daa5c1ad77	Rekvizit-read	Rekvizit - branje	f
00030000-55d4-977c-89b3-dfe06be6b213	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d4-977c-ee5d-5ff9e1b2c8b5	Revizija-read	Revizija - branje	f
00030000-55d4-977c-4757-b4ec2e01911f	Revizija-write	Revizija - spreminjanje	f
00030000-55d4-977c-2001-499fb69e3003	Rezervacija-read	Rezervacija - branje	f
00030000-55d4-977c-d1b5-3284c3ed9ca9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d4-977c-88a9-63d4e28964f3	SedezniRed-read	SedezniRed - branje	f
00030000-55d4-977c-4e46-ade1400b9672	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d4-977c-c34f-e61a55063466	Sedez-read	Sedez - branje	f
00030000-55d4-977c-6aad-5165e18dd80b	Sedez-write	Sedez - spreminjanje	f
00030000-55d4-977c-4c49-b5cad61573d4	Sezona-read	Sezona - branje	f
00030000-55d4-977c-0b2d-c73b7af2187f	Sezona-write	Sezona - spreminjanje	f
00030000-55d4-977c-72c9-75db98dd5552	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d4-977c-c0a0-f4d8f14fac69	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d4-977c-18eb-c2ba20f69f62	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d4-977c-8857-d55913ca48d4	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d4-977c-bd77-c1ceaf4ea789	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d4-977c-cb28-6ec64b02cbcf	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d4-977c-af17-a04d20c2a2ce	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d4-977c-f400-b1dd87941337	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d4-977c-0aa7-0cd216202030	Telefonska-read	Telefonska - branje	f
00030000-55d4-977c-8469-93a7368a4f41	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d4-977c-6382-0beea89aecd7	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d4-977c-4687-ca8a6f7165e9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d4-977c-3b4b-7b2290b30971	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d4-977c-6c60-ae8aa7a084e1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d4-977c-2dee-62789bea69bb	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d4-977c-dc4e-e83efa62c48c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d4-977c-b1a2-c44d420fac7b	Trr-read	Trr - branje	f
00030000-55d4-977c-8d31-2c52ed61342e	Trr-write	Trr - spreminjanje	f
00030000-55d4-977c-fb6e-9c78a0ce066f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d4-977c-8543-6d6a5f200cb7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d4-977c-b0e6-85a581926b64	Vaja-read	Vaja - branje	f
00030000-55d4-977c-44d3-09db338bf0be	Vaja-write	Vaja - spreminjanje	f
00030000-55d4-977c-f9c5-09fa1d408eed	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d4-977c-5602-c11eb9c94870	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d4-977c-74b5-e446aaf1a486	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d4-977c-0048-06dc46602770	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d4-977c-9c3f-6808ab1b2a70	Zasedenost-read	Zasedenost - branje	f
00030000-55d4-977c-4a33-8b859a0247e0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d4-977c-1546-f0ccaecde0df	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d4-977c-7c9f-9e8a8479da81	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d4-977c-da93-e34d81d718cd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d4-977c-bdc4-bba0a3d0ffd2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d4-977c-96f9-30104cbf6577	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55d4-977c-ee1f-d44358e1c1c9	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55d4-977c-34b5-a9d20abce519	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55d4-977c-8872-532c130b159d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55d4-977c-1fa3-9c79488e447f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d4-977c-64cd-fd1ec959b8d1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d4-977c-28d4-3a2cc9bb0ca5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d4-977c-fbd7-23f6d5331ce1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d4-977c-0012-416ddacf7c86	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55d4-977c-eab7-36591cb5127c	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55d4-977c-9854-0420809287bc	Datoteka-write	Datoteka - spreminjanje	f
00030000-55d4-977c-0a02-1794da819ddd	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2889 (class 0 OID 15099384)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d4-977c-5371-ff7caa8a21a6	00030000-55d4-977c-5c90-4e9e98b73545
00020000-55d4-977c-e3ef-335256c7c2a2	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-e847-cdc6eaa2e298
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-7366-58c89fb948ad
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-cbe5-bafff46c97f9
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-68f7-48d7ad66925e
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-44b2-1ed8b746f053
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-b736-52a023e1b12b
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-af26-3ad562877774
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-ac2e-737517762263
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-2395-43746d586683
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-40a5-58a28aee4044
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-8a82-376a4facf123
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-5e1a-d4dd99d3b1a5
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-c078-d70fd183a3d8
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-5a93-a2737d2e4b41
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-4c8f-8c808e6f5639
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-8477-d6c94e5a2954
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-c21b-2f9f54029926
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-81d0-0df61f1d8198
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-012a-ad23bfb7d0b2
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-7c8c-3231e7e2cca5
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-23c9-70f2d53c2363
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-ce57-bc5fd33e2cbb
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-7694-fa48b5a81f60
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-96ac-0b96058e9018
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-148a-dccac51a56d4
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-17a9-019c84b52c7c
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-1db3-d6c25a3739fc
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-e1cd-496160af81ce
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-41a1-08ff6c0ebf2b
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-a24b-a591aed3cb66
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-93e4-4de832bc29c6
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-c45d-ffbb70820418
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-6566-255d7abf1288
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-1173-8221e8ad75c3
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-952f-331f2540cf90
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-a38f-97daa5c1ad77
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-89b3-dfe06be6b213
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-4c49-b5cad61573d4
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-0b2d-c73b7af2187f
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-3b4b-7b2290b30971
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-fb6e-9c78a0ce066f
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-8543-6d6a5f200cb7
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-b0e6-85a581926b64
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-44d3-09db338bf0be
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-9c3f-6808ab1b2a70
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-4a33-8b859a0247e0
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-1546-f0ccaecde0df
00020000-55d4-977c-57ff-369f3835f03a	00030000-55d4-977c-da93-e34d81d718cd
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-e847-cdc6eaa2e298
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-44b2-1ed8b746f053
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-b736-52a023e1b12b
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-5e1a-d4dd99d3b1a5
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-5a93-a2737d2e4b41
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-8477-d6c94e5a2954
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-c21b-2f9f54029926
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-81d0-0df61f1d8198
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-012a-ad23bfb7d0b2
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-7c8c-3231e7e2cca5
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-23c9-70f2d53c2363
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-ce57-bc5fd33e2cbb
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-96ac-0b96058e9018
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-17a9-019c84b52c7c
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-1db3-d6c25a3739fc
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-e1cd-496160af81ce
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-c45d-ffbb70820418
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-1173-8221e8ad75c3
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-a38f-97daa5c1ad77
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-4c49-b5cad61573d4
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-0aa7-0cd216202030
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-8469-93a7368a4f41
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-b1a2-c44d420fac7b
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-8d31-2c52ed61342e
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-74b5-e446aaf1a486
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-0048-06dc46602770
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-1546-f0ccaecde0df
00020000-55d4-977c-c7e1-8aaeb1cb44c1	00030000-55d4-977c-da93-e34d81d718cd
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-e847-cdc6eaa2e298
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-cbe5-bafff46c97f9
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-44b2-1ed8b746f053
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-e702-6882f6ae77ad
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-57f7-416bbbde4588
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-9f2d-75c5fa9cdd76
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-b736-52a023e1b12b
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-40a5-58a28aee4044
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-5e1a-d4dd99d3b1a5
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-5a93-a2737d2e4b41
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-8477-d6c94e5a2954
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-81d0-0df61f1d8198
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-012a-ad23bfb7d0b2
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-7c8c-3231e7e2cca5
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-ce57-bc5fd33e2cbb
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-96ac-0b96058e9018
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-e1cd-496160af81ce
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-a24b-a591aed3cb66
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-c45d-ffbb70820418
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-1173-8221e8ad75c3
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-a38f-97daa5c1ad77
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-4c49-b5cad61573d4
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-3b4b-7b2290b30971
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-b0e6-85a581926b64
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-9c3f-6808ab1b2a70
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-1546-f0ccaecde0df
00020000-55d4-977c-87e9-7225641208dd	00030000-55d4-977c-da93-e34d81d718cd
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-e847-cdc6eaa2e298
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-7366-58c89fb948ad
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-68f7-48d7ad66925e
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-44b2-1ed8b746f053
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-b736-52a023e1b12b
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-5e1a-d4dd99d3b1a5
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-5a93-a2737d2e4b41
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-81d0-0df61f1d8198
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-012a-ad23bfb7d0b2
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-ce57-bc5fd33e2cbb
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-96ac-0b96058e9018
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-e1cd-496160af81ce
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-c45d-ffbb70820418
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-1173-8221e8ad75c3
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-a38f-97daa5c1ad77
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-4c49-b5cad61573d4
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-3b4b-7b2290b30971
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-1546-f0ccaecde0df
00020000-55d4-977c-d8c0-5af6588413a3	00030000-55d4-977c-da93-e34d81d718cd
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-e847-cdc6eaa2e298
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-44b2-1ed8b746f053
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-b736-52a023e1b12b
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-5e1a-d4dd99d3b1a5
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-5a93-a2737d2e4b41
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-81d0-0df61f1d8198
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-012a-ad23bfb7d0b2
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-ce57-bc5fd33e2cbb
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-96ac-0b96058e9018
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-e1cd-496160af81ce
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-c45d-ffbb70820418
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-1173-8221e8ad75c3
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-a38f-97daa5c1ad77
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-4c49-b5cad61573d4
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-6382-0beea89aecd7
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-1e63-21abe954c1b4
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-3b4b-7b2290b30971
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-1546-f0ccaecde0df
00020000-55d4-977c-08d7-fc7adde9c64f	00030000-55d4-977c-da93-e34d81d718cd
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c77c-d1b51bfce030
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-5c90-4e9e98b73545
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-1e63-21abe954c1b4
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-af26-3ad562877774
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-16d1-a7b4616a130a
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a48e-8d0833b78973
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-e847-cdc6eaa2e298
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-7366-58c89fb948ad
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-cbe5-bafff46c97f9
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-68f7-48d7ad66925e
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-44b2-1ed8b746f053
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-e702-6882f6ae77ad
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-57f7-416bbbde4588
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-3738-60d7c56f339e
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-9f2d-75c5fa9cdd76
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-863b-0d7140c013ba
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-b736-52a023e1b12b
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-ac2e-737517762263
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-5bca-c2e722639ad4
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-2395-43746d586683
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-432c-15b2cb67aebc
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-36bc-a216186b5fa8
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a33c-9d4531ec8302
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-6bc3-0500b6bca401
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-40a5-58a28aee4044
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8a82-376a4facf123
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-5e1a-d4dd99d3b1a5
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c078-d70fd183a3d8
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-5a93-a2737d2e4b41
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4c8f-8c808e6f5639
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8477-d6c94e5a2954
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c21b-2f9f54029926
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4d7d-f44fff0b1638
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-ef31-ec0a9a05c848
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a372-9dc564b31737
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-3537-22fde9fb3bd6
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-81d0-0df61f1d8198
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-83a9-d047aae4fa6a
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-012a-ad23bfb7d0b2
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a956-288fcc82dd8e
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-7c8c-3231e7e2cca5
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-23c9-70f2d53c2363
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-bc42-f939025bdabb
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-f52f-76ef9378d103
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-e06c-83ad22b36785
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-bcaf-3401a5140b66
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-563c-35abcd133810
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-fe8e-28fbf081a116
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-ce57-bc5fd33e2cbb
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-7694-fa48b5a81f60
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-96ac-0b96058e9018
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-148a-dccac51a56d4
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c121-1caf57a870a3
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-74b7-b77721059324
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-17a9-019c84b52c7c
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-1db3-d6c25a3739fc
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-e1cd-496160af81ce
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-41a1-08ff6c0ebf2b
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-ba5d-80dcdd867247
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4ee1-a04697719261
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8ad0-df041b2c4ea1
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-e225-99222aca0503
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a24b-a591aed3cb66
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-93e4-4de832bc29c6
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-82ef-a1e739ef57c6
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-3f25-9190496ea9ed
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-363f-d5f524a44daa
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-d707-ee7a4f2987fa
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-44f1-cc0469afd596
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-e942-1bd7fefefea3
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-0594-566b9c2811f5
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-1403-a544d28d6071
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-ac7c-cf2ed0cac60e
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-54d3-cfc7d9f47ba3
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-b061-e183017d5dd9
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-1fdb-27a61eed1e74
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-09ce-e84498d0f69e
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a86b-6194fb885c45
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-d7d8-f0a84daab6b3
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-b0fc-2ab83d440711
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-08fd-8bfdebfb3325
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-88ab-c360653454eb
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a429-24486aa1fe60
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-d1ab-d6a6b0f549bf
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c45d-ffbb70820418
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-6566-255d7abf1288
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8e72-b79921997dd6
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-0273-2c93ef7cd668
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-9087-d0055e48b6ca
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-60ba-6c7ae9dc7520
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-1173-8221e8ad75c3
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-952f-331f2540cf90
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-a38f-97daa5c1ad77
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-89b3-dfe06be6b213
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-ee5d-5ff9e1b2c8b5
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4757-b4ec2e01911f
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-2001-499fb69e3003
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-d1b5-3284c3ed9ca9
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-88a9-63d4e28964f3
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4e46-ade1400b9672
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c34f-e61a55063466
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-6aad-5165e18dd80b
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4c49-b5cad61573d4
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-0b2d-c73b7af2187f
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-72c9-75db98dd5552
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-c0a0-f4d8f14fac69
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-18eb-c2ba20f69f62
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8857-d55913ca48d4
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-bd77-c1ceaf4ea789
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-cb28-6ec64b02cbcf
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-af17-a04d20c2a2ce
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-f400-b1dd87941337
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-0aa7-0cd216202030
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8469-93a7368a4f41
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-6382-0beea89aecd7
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4687-ca8a6f7165e9
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-3b4b-7b2290b30971
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-6c60-ae8aa7a084e1
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-2dee-62789bea69bb
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-dc4e-e83efa62c48c
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-b1a2-c44d420fac7b
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8d31-2c52ed61342e
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-fb6e-9c78a0ce066f
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-8543-6d6a5f200cb7
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-b0e6-85a581926b64
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-44d3-09db338bf0be
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-f9c5-09fa1d408eed
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-5602-c11eb9c94870
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-74b5-e446aaf1a486
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-0048-06dc46602770
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-9c3f-6808ab1b2a70
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-4a33-8b859a0247e0
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-1546-f0ccaecde0df
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-7c9f-9e8a8479da81
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-da93-e34d81d718cd
00020000-55d4-977d-3399-ef143a24dc4c	00030000-55d4-977c-bdc4-bba0a3d0ffd2
\.


--
-- TOC entry 2917 (class 0 OID 15099683)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15099714)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15099828)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d4-977d-a066-561e42db6fe9	00090000-55d4-977d-96f2-db04f4203058	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d4-977d-a86c-90bd696f2f40	00090000-55d4-977d-cc7a-e7336977f183	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d4-977d-5ded-6a9963872b6a	00090000-55d4-977d-3b48-bc1177d5d83d	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2894 (class 0 OID 15099444)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d4-977d-b081-01c102c48c94	00040000-55d4-977c-e878-977caba30808	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-a28d-29adba9501f7	00040000-55d4-977c-e878-977caba30808	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d4-977d-a815-82061e6f8f3d	00040000-55d4-977c-e878-977caba30808	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-e5a0-d88d3e0d1cc9	00040000-55d4-977c-e878-977caba30808	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-03b7-ae1bb54d1953	00040000-55d4-977c-e878-977caba30808	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-6254-21169126220a	00040000-55d4-977b-c25b-6b785aef53ef	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-8682-695b6862c933	00040000-55d4-977c-730d-7399b4922b43	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-bd09-1591612c6e91	00040000-55d4-977b-55a8-3e6d8af57968	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-977d-edae-f249af117b7d	00040000-55d4-977c-e878-977caba30808	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2896 (class 0 OID 15099479)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d4-977c-87f6-c4b5a197016c	8341	Adlešiči
00050000-55d4-977c-f5b8-ead245d0b96a	5270	Ajdovščina
00050000-55d4-977c-44d4-4fcc980eff95	6280	Ankaran/Ancarano
00050000-55d4-977c-e902-47a17795c0a6	9253	Apače
00050000-55d4-977c-2126-5462c28c2645	8253	Artiče
00050000-55d4-977c-386f-9d8d7066b05c	4275	Begunje na Gorenjskem
00050000-55d4-977c-450f-5b5ce08afbea	1382	Begunje pri Cerknici
00050000-55d4-977c-1278-70077acbdb53	9231	Beltinci
00050000-55d4-977c-12cb-4121a2db6bd6	2234	Benedikt
00050000-55d4-977c-3714-fe92e95ef6c8	2345	Bistrica ob Dravi
00050000-55d4-977c-ba65-dd27c623faea	3256	Bistrica ob Sotli
00050000-55d4-977c-5b51-57266d8030a8	8259	Bizeljsko
00050000-55d4-977c-2735-aceba8ed1dbb	1223	Blagovica
00050000-55d4-977c-ec18-8452278cbf7e	8283	Blanca
00050000-55d4-977c-c3b8-f06519a958c2	4260	Bled
00050000-55d4-977c-2057-22800ac7fa78	4273	Blejska Dobrava
00050000-55d4-977c-4817-06fd303d7408	9265	Bodonci
00050000-55d4-977c-d0aa-55ff831c17dd	9222	Bogojina
00050000-55d4-977c-1bc4-f6d0c00b259f	4263	Bohinjska Bela
00050000-55d4-977c-5573-bd060583fd32	4264	Bohinjska Bistrica
00050000-55d4-977c-e176-7ceb549fdd2e	4265	Bohinjsko jezero
00050000-55d4-977c-9afd-fab182a7e89f	1353	Borovnica
00050000-55d4-977c-73cc-2bb26cf38ad7	8294	Boštanj
00050000-55d4-977c-1f66-0fe5773ee309	5230	Bovec
00050000-55d4-977c-1407-5aa72162ee15	5295	Branik
00050000-55d4-977c-31fc-c65643739698	3314	Braslovče
00050000-55d4-977c-ca4c-e925b7e097d7	5223	Breginj
00050000-55d4-977c-1f84-9d98a626bd69	8280	Brestanica
00050000-55d4-977c-d83c-d35134732fe8	2354	Bresternica
00050000-55d4-977c-b375-a66ea6b66fb6	4243	Brezje
00050000-55d4-977c-b219-0135ba44901c	1351	Brezovica pri Ljubljani
00050000-55d4-977c-0b0b-76a50a6cbfa2	8250	Brežice
00050000-55d4-977c-3f8a-29c95d550ee9	4210	Brnik - Aerodrom
00050000-55d4-977c-7995-3f256ea422ac	8321	Brusnice
00050000-55d4-977c-3b33-1083bac141e4	3255	Buče
00050000-55d4-977c-836e-8b985e96b9a4	8276	Bučka 
00050000-55d4-977c-4d9d-324b4a255725	9261	Cankova
00050000-55d4-977c-ec8b-ff76976397a2	3000	Celje 
00050000-55d4-977c-a115-9929acddd7cc	3001	Celje - poštni predali
00050000-55d4-977c-a898-ed9231ace985	4207	Cerklje na Gorenjskem
00050000-55d4-977c-7d0e-288ae793aeb8	8263	Cerklje ob Krki
00050000-55d4-977c-106a-33148e044253	1380	Cerknica
00050000-55d4-977c-e6f1-6b81b4522fbf	5282	Cerkno
00050000-55d4-977c-db56-733ddceec89e	2236	Cerkvenjak
00050000-55d4-977c-f797-dd20e2dee7b0	2215	Ceršak
00050000-55d4-977c-de57-deaeeb1d838c	2326	Cirkovce
00050000-55d4-977c-b420-0c1cb1fa6291	2282	Cirkulane
00050000-55d4-977c-9eaa-4e040a06eed6	5273	Col
00050000-55d4-977c-f577-9b79fef3c91e	8251	Čatež ob Savi
00050000-55d4-977c-3fc2-51b259e9fc4c	1413	Čemšenik
00050000-55d4-977c-2503-996ae37f2522	5253	Čepovan
00050000-55d4-977c-c0e0-941d86f7683e	9232	Črenšovci
00050000-55d4-977c-964f-2e9a541213ac	2393	Črna na Koroškem
00050000-55d4-977c-a75c-4c1e07c7a8bb	6275	Črni Kal
00050000-55d4-977c-358d-8e29fa89a47a	5274	Črni Vrh nad Idrijo
00050000-55d4-977c-8afa-e1e0d016ca6e	5262	Črniče
00050000-55d4-977c-1439-46bf13ca4c66	8340	Črnomelj
00050000-55d4-977c-b42d-70dc16a1630c	6271	Dekani
00050000-55d4-977c-87f9-02e1e89ac8b5	5210	Deskle
00050000-55d4-977c-0de8-8091e8b6dc4c	2253	Destrnik
00050000-55d4-977c-8e70-d26e41271f7c	6215	Divača
00050000-55d4-977c-6170-f47bef2e0179	1233	Dob
00050000-55d4-977c-d9b8-21724307e47f	3224	Dobje pri Planini
00050000-55d4-977c-3c3f-05718bb10b80	8257	Dobova
00050000-55d4-977c-2a05-4085fdfd51e3	1423	Dobovec
00050000-55d4-977c-294f-a45915c9a528	5263	Dobravlje
00050000-55d4-977c-ec85-d54a6e852ba3	3204	Dobrna
00050000-55d4-977c-e52b-8197fd04c88e	8211	Dobrnič
00050000-55d4-977c-0ee9-43af69ef83bc	1356	Dobrova
00050000-55d4-977c-2ff8-71d6fa01fb1d	9223	Dobrovnik/Dobronak 
00050000-55d4-977c-b99e-9075b2348e7f	5212	Dobrovo v Brdih
00050000-55d4-977c-6ebb-a84935664e2e	1431	Dol pri Hrastniku
00050000-55d4-977c-c741-a4ebdfd6d682	1262	Dol pri Ljubljani
00050000-55d4-977c-aa7b-5621a55cb956	1273	Dole pri Litiji
00050000-55d4-977c-897a-bd89555cfb76	1331	Dolenja vas
00050000-55d4-977c-7220-4e918379657e	8350	Dolenjske Toplice
00050000-55d4-977c-3d9e-c326955893f3	1230	Domžale
00050000-55d4-977c-4ede-ff023a1445a9	2252	Dornava
00050000-55d4-977c-433e-7c56d48b3617	5294	Dornberk
00050000-55d4-977c-a00c-3a1f091031f4	1319	Draga
00050000-55d4-977c-feb4-9d9ed9bd15d1	8343	Dragatuš
00050000-55d4-977c-f270-419c020ae045	3222	Dramlje
00050000-55d4-977c-dee3-75509449e78e	2370	Dravograd
00050000-55d4-977c-9045-10b633bd9205	4203	Duplje
00050000-55d4-977c-ea50-7dcf8cd72173	6221	Dutovlje
00050000-55d4-977c-bf31-fa5cbc084fec	8361	Dvor
00050000-55d4-977c-fee3-bf7e2585a66b	2343	Fala
00050000-55d4-977c-95af-70bfd30b4853	9208	Fokovci
00050000-55d4-977c-1f5c-e87e6945d5c4	2313	Fram
00050000-55d4-977c-d054-041fa3d1fc2e	3213	Frankolovo
00050000-55d4-977c-5637-c10701bcc47f	1274	Gabrovka
00050000-55d4-977c-715d-bc36766b3829	8254	Globoko
00050000-55d4-977c-6ca8-42dc05174c7b	5275	Godovič
00050000-55d4-977c-c426-52a3ecc90d55	4204	Golnik
00050000-55d4-977c-b7a7-c84e2a754de5	3303	Gomilsko
00050000-55d4-977c-9e55-f8221bca2bda	4224	Gorenja vas
00050000-55d4-977c-2666-842fffd776c0	3263	Gorica pri Slivnici
00050000-55d4-977c-11ea-cd4878c96812	2272	Gorišnica
00050000-55d4-977c-d59c-514efe37eebc	9250	Gornja Radgona
00050000-55d4-977c-434c-7fc23b5fa976	3342	Gornji Grad
00050000-55d4-977c-f6a2-0840da625b32	4282	Gozd Martuljek
00050000-55d4-977c-024d-b6c85936fabb	6272	Gračišče
00050000-55d4-977c-3107-23aff75d0eb1	9264	Grad
00050000-55d4-977c-15be-3ddf5131568e	8332	Gradac
00050000-55d4-977c-a81e-02a7a5c64229	1384	Grahovo
00050000-55d4-977c-7bcd-4e344811fc23	5242	Grahovo ob Bači
00050000-55d4-977c-48d7-48473351ce08	5251	Grgar
00050000-55d4-977c-5f3b-eb6b21bb8bb6	3302	Griže
00050000-55d4-977c-1ecd-48118f08496e	3231	Grobelno
00050000-55d4-977c-23a3-3b34ab4c398c	1290	Grosuplje
00050000-55d4-977c-96e2-305f8891dde9	2288	Hajdina
00050000-55d4-977c-c83d-235556148285	8362	Hinje
00050000-55d4-977c-5f22-038c852ba03d	2311	Hoče
00050000-55d4-977c-c91b-492fd5c7cdef	9205	Hodoš/Hodos
00050000-55d4-977c-66f9-4dea29bd0d85	1354	Horjul
00050000-55d4-977c-7767-3c4bc12524ff	1372	Hotedršica
00050000-55d4-977c-10b9-6c117fb464e0	1430	Hrastnik
00050000-55d4-977c-293e-06e4c6923c34	6225	Hruševje
00050000-55d4-977c-9caf-287f26136c7f	4276	Hrušica
00050000-55d4-977c-9474-60f93f4bbc9d	5280	Idrija
00050000-55d4-977c-749e-ab87fd29fb7e	1292	Ig
00050000-55d4-977c-a5cb-4c8283e02269	6250	Ilirska Bistrica
00050000-55d4-977c-e986-fc9d3c54294e	6251	Ilirska Bistrica-Trnovo
00050000-55d4-977c-6d12-b0d7fa357791	1295	Ivančna Gorica
00050000-55d4-977c-c0bb-b795cc8ca83c	2259	Ivanjkovci
00050000-55d4-977c-57ec-c088c1f2f315	1411	Izlake
00050000-55d4-977c-6c45-2c90058f2560	6310	Izola/Isola
00050000-55d4-977c-9250-06eae4c60561	2222	Jakobski Dol
00050000-55d4-977c-52c9-b0a9d170c765	2221	Jarenina
00050000-55d4-977c-8bd9-f4be3c4b19d1	6254	Jelšane
00050000-55d4-977c-c61e-f3b8db722e25	4270	Jesenice
00050000-55d4-977c-fe62-97af0f2a9562	8261	Jesenice na Dolenjskem
00050000-55d4-977c-3de5-2be07315281a	3273	Jurklošter
00050000-55d4-977c-4f45-de1cdd209312	2223	Jurovski Dol
00050000-55d4-977c-89a8-4aa492007c2c	2256	Juršinci
00050000-55d4-977c-a72e-a31abadcb21f	5214	Kal nad Kanalom
00050000-55d4-977c-e578-8d8540b2efc0	3233	Kalobje
00050000-55d4-977c-6b15-735217dfe570	4246	Kamna Gorica
00050000-55d4-977c-0ee8-66d360d9e11a	2351	Kamnica
00050000-55d4-977c-24f4-30ea1fc7cc07	1241	Kamnik
00050000-55d4-977c-374e-1eb042bb5dce	5213	Kanal
00050000-55d4-977c-0492-21b83acd1d38	8258	Kapele
00050000-55d4-977c-2f36-09f9a67e2738	2362	Kapla
00050000-55d4-977c-248b-b284397d0e63	2325	Kidričevo
00050000-55d4-977c-6265-01d723ed930a	1412	Kisovec
00050000-55d4-977c-687b-7b32e64cd1d9	6253	Knežak
00050000-55d4-977c-b16c-15d4fc197d9c	5222	Kobarid
00050000-55d4-977c-dd7a-c9fb23752a18	9227	Kobilje
00050000-55d4-977c-26ce-ce7628bc1914	1330	Kočevje
00050000-55d4-977c-83da-86a6fccb1655	1338	Kočevska Reka
00050000-55d4-977c-2161-cc89b51899d2	2276	Kog
00050000-55d4-977c-59a5-0cf8024bca31	5211	Kojsko
00050000-55d4-977c-5fb5-796071af97f3	6223	Komen
00050000-55d4-977c-0c2c-93fccce06800	1218	Komenda
00050000-55d4-977c-0e2d-58b575f89e8c	6000	Koper/Capodistria 
00050000-55d4-977c-4cb0-e2281bf9b0e0	6001	Koper/Capodistria - poštni predali
00050000-55d4-977c-ae8d-ba22bd186ecf	8282	Koprivnica
00050000-55d4-977c-d2b2-bc603e3eae1f	5296	Kostanjevica na Krasu
00050000-55d4-977c-a2f4-2a813164b31b	8311	Kostanjevica na Krki
00050000-55d4-977c-6b4d-db5ab7d11e1d	1336	Kostel
00050000-55d4-977c-c640-84cfa441743b	6256	Košana
00050000-55d4-977c-ee52-90041996636f	2394	Kotlje
00050000-55d4-977c-5a65-13d0fd067907	6240	Kozina
00050000-55d4-977c-3929-c3d1b44642a1	3260	Kozje
00050000-55d4-977c-99e0-cc2a4129c157	4000	Kranj 
00050000-55d4-977c-127e-40f31223293c	4001	Kranj - poštni predali
00050000-55d4-977c-b739-efce2f4df173	4280	Kranjska Gora
00050000-55d4-977c-5ac5-d6433469ebc7	1281	Kresnice
00050000-55d4-977c-b6b2-36b9bb12e8f0	4294	Križe
00050000-55d4-977c-b0be-51a153de9646	9206	Križevci
00050000-55d4-977c-b561-0c47e2aec8f9	9242	Križevci pri Ljutomeru
00050000-55d4-977c-62d0-12cd2384c2b8	1301	Krka
00050000-55d4-977c-f28b-2997ae7c115f	8296	Krmelj
00050000-55d4-977c-2e81-4864f807d395	4245	Kropa
00050000-55d4-977c-17b3-2a88c3ddbf6d	8262	Krška vas
00050000-55d4-977c-b6d3-4e6e9a1de6f5	8270	Krško
00050000-55d4-977c-5295-91602707b388	9263	Kuzma
00050000-55d4-977c-a457-209e56c9f612	2318	Laporje
00050000-55d4-977c-37c3-27adf085cafc	3270	Laško
00050000-55d4-977c-4f80-26ed29780c44	1219	Laze v Tuhinju
00050000-55d4-977c-3637-4cb4763b66c8	2230	Lenart v Slovenskih goricah
00050000-55d4-977c-9773-219cd106cba5	9220	Lendava/Lendva
00050000-55d4-977c-1f0e-6e0fd477703e	4248	Lesce
00050000-55d4-977c-e8d0-2f88cfe0db1d	3261	Lesično
00050000-55d4-977c-a063-71636dd91d96	8273	Leskovec pri Krškem
00050000-55d4-977c-68d7-7810a17d2b07	2372	Libeliče
00050000-55d4-977c-42be-8c6a5af37bcb	2341	Limbuš
00050000-55d4-977c-a315-971c5298f325	1270	Litija
00050000-55d4-977c-a3ef-3e528dbd75a4	3202	Ljubečna
00050000-55d4-977c-21b0-6d45b10b59db	1000	Ljubljana 
00050000-55d4-977c-cecc-29c5674b9416	1001	Ljubljana - poštni predali
00050000-55d4-977c-c3ad-01d122686591	1231	Ljubljana - Črnuče
00050000-55d4-977c-23fb-4d2293cc9e9f	1261	Ljubljana - Dobrunje
00050000-55d4-977c-7dd6-3b774b32340f	1260	Ljubljana - Polje
00050000-55d4-977c-0f5b-4c90f81d68e8	1210	Ljubljana - Šentvid
00050000-55d4-977c-188d-9a582c2cfb47	1211	Ljubljana - Šmartno
00050000-55d4-977c-aa07-884958c916b4	3333	Ljubno ob Savinji
00050000-55d4-977c-64f4-aaee93ed4e9c	9240	Ljutomer
00050000-55d4-977c-9917-f80c8c3a789d	3215	Loče
00050000-55d4-977c-767a-0c02078bdbb2	5231	Log pod Mangartom
00050000-55d4-977c-ed00-0586ffc76b94	1358	Log pri Brezovici
00050000-55d4-977c-5238-293f06ed0f77	1370	Logatec
00050000-55d4-977c-2e1a-52fec6bc010e	1371	Logatec
00050000-55d4-977c-a306-74585d1171ed	1434	Loka pri Zidanem Mostu
00050000-55d4-977c-c88c-cedbe7431b92	3223	Loka pri Žusmu
00050000-55d4-977c-af25-4c62dfc33a97	6219	Lokev
00050000-55d4-977c-d596-e8be08522cf0	1318	Loški Potok
00050000-55d4-977c-1e1f-3d185a676573	2324	Lovrenc na Dravskem polju
00050000-55d4-977c-6e09-46846b93e43c	2344	Lovrenc na Pohorju
00050000-55d4-977c-2f26-014bcf7be4ba	3334	Luče
00050000-55d4-977c-7d78-835db1bbcc28	1225	Lukovica
00050000-55d4-977c-f5f9-06a2723be2e1	9202	Mačkovci
00050000-55d4-977c-fcd5-6d28c57de10c	2322	Majšperk
00050000-55d4-977c-0c7f-5a583d75cbd1	2321	Makole
00050000-55d4-977c-04ba-dab92161f379	9243	Mala Nedelja
00050000-55d4-977c-c244-3e61a194dba5	2229	Malečnik
00050000-55d4-977c-ac79-83e07b460e69	6273	Marezige
00050000-55d4-977c-129c-e9c97a0beaca	2000	Maribor 
00050000-55d4-977c-d987-6520b2780b1b	2001	Maribor - poštni predali
00050000-55d4-977c-8397-b6242f52023a	2206	Marjeta na Dravskem polju
00050000-55d4-977c-5d90-879c390542c9	2281	Markovci
00050000-55d4-977c-8f11-b5734034724a	9221	Martjanci
00050000-55d4-977c-e02c-bd425626ca67	6242	Materija
00050000-55d4-977c-1edb-5c0f2ac661e7	4211	Mavčiče
00050000-55d4-977c-26d8-69850142d544	1215	Medvode
00050000-55d4-977c-cd18-d3fd48c54b27	1234	Mengeš
00050000-55d4-977c-4da7-66907ad95cac	8330	Metlika
00050000-55d4-977c-1f5c-a875d7057529	2392	Mežica
00050000-55d4-977c-05da-e1c6244cc1db	2204	Miklavž na Dravskem polju
00050000-55d4-977c-ab23-04083963563d	2275	Miklavž pri Ormožu
00050000-55d4-977c-990b-29f5fe4d9609	5291	Miren
00050000-55d4-977c-a34e-24fde31cbb34	8233	Mirna
00050000-55d4-977c-5919-c86019189f6a	8216	Mirna Peč
00050000-55d4-977c-5a7a-c89a30d9ac5a	2382	Mislinja
00050000-55d4-977c-1cf2-0d32c5bbc27f	4281	Mojstrana
00050000-55d4-977c-ae4e-4f0a95dfeace	8230	Mokronog
00050000-55d4-977c-2d1f-68e00b12bf7a	1251	Moravče
00050000-55d4-977c-cea5-49567351599f	9226	Moravske Toplice
00050000-55d4-977c-257f-51ea100afc80	5216	Most na Soči
00050000-55d4-977c-35bb-f6ae9d3726e4	1221	Motnik
00050000-55d4-977c-743c-e5c207b0603f	3330	Mozirje
00050000-55d4-977c-ec90-2fa367478120	9000	Murska Sobota 
00050000-55d4-977c-6b73-a68e98e7c64d	9001	Murska Sobota - poštni predali
00050000-55d4-977c-1594-07e8ce8563cd	2366	Muta
00050000-55d4-977c-869c-a34f88c5b54f	4202	Naklo
00050000-55d4-977c-4385-3007f590b196	3331	Nazarje
00050000-55d4-977c-309d-f0a58d1fb0ef	1357	Notranje Gorice
00050000-55d4-977c-f2ac-9a3af7b7c38e	3203	Nova Cerkev
00050000-55d4-977c-c8fd-07b84f4575c7	5000	Nova Gorica 
00050000-55d4-977c-837c-481e4d7a740a	5001	Nova Gorica - poštni predali
00050000-55d4-977c-6c80-9656c7a7e7f6	1385	Nova vas
00050000-55d4-977c-af0d-4873d056098f	8000	Novo mesto
00050000-55d4-977c-b600-76dad1ab672e	8001	Novo mesto - poštni predali
00050000-55d4-977c-f201-77e55644c58f	6243	Obrov
00050000-55d4-977c-b971-0c996c3c56a0	9233	Odranci
00050000-55d4-977c-484a-cfd77ea9ea8b	2317	Oplotnica
00050000-55d4-977c-1681-3735b39cd2f1	2312	Orehova vas
00050000-55d4-977c-2b90-f42b816fae9f	2270	Ormož
00050000-55d4-977c-e7d3-21eaf4781f3c	1316	Ortnek
00050000-55d4-977c-e600-014cf7844469	1337	Osilnica
00050000-55d4-977c-398c-5900233c0647	8222	Otočec
00050000-55d4-977c-d12a-85e02766af46	2361	Ožbalt
00050000-55d4-977c-3ed2-bb5f5d1ba7a3	2231	Pernica
00050000-55d4-977c-e924-a2ebc5c65751	2211	Pesnica pri Mariboru
00050000-55d4-977c-49d6-1573ff1f095d	9203	Petrovci
00050000-55d4-977c-342f-3403d81f7f07	3301	Petrovče
00050000-55d4-977c-9a44-0f6b1626d14e	6330	Piran/Pirano
00050000-55d4-977c-1d71-38994472ea31	8255	Pišece
00050000-55d4-977c-3cc9-428ab5a34a01	6257	Pivka
00050000-55d4-977c-cd44-7aa25ea917b3	6232	Planina
00050000-55d4-977c-9743-77dabc613c54	3225	Planina pri Sevnici
00050000-55d4-977c-6ee7-49a2812540bb	6276	Pobegi
00050000-55d4-977c-7400-55940b46b43a	8312	Podbočje
00050000-55d4-977c-8dcb-ec1530ba1519	5243	Podbrdo
00050000-55d4-977c-9475-0d57fbbe733d	3254	Podčetrtek
00050000-55d4-977c-0c9b-59a27af6efa3	2273	Podgorci
00050000-55d4-977c-3019-d2922cf55680	6216	Podgorje
00050000-55d4-977c-3e9d-7aa32675cc0e	2381	Podgorje pri Slovenj Gradcu
00050000-55d4-977c-ab7e-341673fa8ce5	6244	Podgrad
00050000-55d4-977c-d723-2cb8691b4cb6	1414	Podkum
00050000-55d4-977c-b0d8-49f3bb96e196	2286	Podlehnik
00050000-55d4-977c-9af7-d94b4b92da1f	5272	Podnanos
00050000-55d4-977c-1403-61c639a115aa	4244	Podnart
00050000-55d4-977c-73d4-d132196fba57	3241	Podplat
00050000-55d4-977c-1c7b-f46cad434973	3257	Podsreda
00050000-55d4-977c-c781-1e2ee8bd5f35	2363	Podvelka
00050000-55d4-977c-4542-7032b1b2b6c3	2208	Pohorje
00050000-55d4-977c-abf0-e2c9fc7e216a	2257	Polenšak
00050000-55d4-977c-a29a-b13087d584b7	1355	Polhov Gradec
00050000-55d4-977c-7d8f-2f2ff2d09400	4223	Poljane nad Škofjo Loko
00050000-55d4-977c-04db-2c3abe0b9e1f	2319	Poljčane
00050000-55d4-977c-009c-fdf2ee7f4f5d	1272	Polšnik
00050000-55d4-977c-261b-f06084dcf098	3313	Polzela
00050000-55d4-977c-5d27-a0d218a4fd3b	3232	Ponikva
00050000-55d4-977c-e052-e10bdd0b46a4	6320	Portorož/Portorose
00050000-55d4-977c-791b-cd445ec213c7	6230	Postojna
00050000-55d4-977c-34cd-a6a4c6aaef3d	2331	Pragersko
00050000-55d4-977c-dacd-8a4f572561fe	3312	Prebold
00050000-55d4-977c-e20e-31c0117924d0	4205	Preddvor
00050000-55d4-977c-26e6-10e52c121508	6255	Prem
00050000-55d4-977c-ae61-d6e7e1d416a8	1352	Preserje
00050000-55d4-977c-4788-917ba747c89c	6258	Prestranek
00050000-55d4-977c-21e4-f4f5de75e9d0	2391	Prevalje
00050000-55d4-977c-dfb5-90623f7dec38	3262	Prevorje
00050000-55d4-977c-b75d-61702043605b	1276	Primskovo 
00050000-55d4-977c-1a53-3aeb110e5bb5	3253	Pristava pri Mestinju
00050000-55d4-977c-efaa-e54f791966b2	9207	Prosenjakovci/Partosfalva
00050000-55d4-977c-0d72-75829c4c9d4d	5297	Prvačina
00050000-55d4-977c-0534-9de0d7983968	2250	Ptuj
00050000-55d4-977c-2a0a-cb3d4a9ef6b3	2323	Ptujska Gora
00050000-55d4-977c-351b-d1b39fcfca0a	9201	Puconci
00050000-55d4-977c-18aa-1da09951ea6f	2327	Rače
00050000-55d4-977c-67bf-44406d79e089	1433	Radeče
00050000-55d4-977c-f2e9-1943d6b22ad4	9252	Radenci
00050000-55d4-977c-273b-c92383cdee53	2360	Radlje ob Dravi
00050000-55d4-977c-beec-53c3c49bbc28	1235	Radomlje
00050000-55d4-977c-282a-6f41d3f019e5	4240	Radovljica
00050000-55d4-977c-f90c-e138305763e7	8274	Raka
00050000-55d4-977c-5e8c-af8d2c880d5e	1381	Rakek
00050000-55d4-977c-acde-33603e058400	4283	Rateče - Planica
00050000-55d4-977c-3921-3fe52fc479cc	2390	Ravne na Koroškem
00050000-55d4-977c-2dde-022c57644486	9246	Razkrižje
00050000-55d4-977c-948b-3b773903c200	3332	Rečica ob Savinji
00050000-55d4-977c-8ca7-c52274bbc816	5292	Renče
00050000-55d4-977c-8545-fd0e63623309	1310	Ribnica
00050000-55d4-977c-c853-645f7a529088	2364	Ribnica na Pohorju
00050000-55d4-977c-cea4-abfe66740252	3272	Rimske Toplice
00050000-55d4-977c-07c6-b4119358c4a1	1314	Rob
00050000-55d4-977c-1863-a91740c67e8f	5215	Ročinj
00050000-55d4-977c-b0f9-c6b50469dda6	3250	Rogaška Slatina
00050000-55d4-977c-7ee3-3cd1e9ecdd13	9262	Rogašovci
00050000-55d4-977c-28a6-ff16510f74b2	3252	Rogatec
00050000-55d4-977c-b4b1-d97b89021e8b	1373	Rovte
00050000-55d4-977c-6895-20ec42919181	2342	Ruše
00050000-55d4-977c-3fd9-e145f2ee7fca	1282	Sava
00050000-55d4-977c-7600-fc0580224771	6333	Sečovlje/Sicciole
00050000-55d4-977c-449e-9b7c0d4cf803	4227	Selca
00050000-55d4-977c-fea9-6bf5d9adfade	2352	Selnica ob Dravi
00050000-55d4-977c-8359-98b71abe3396	8333	Semič
00050000-55d4-977c-f835-2d77d7d9d634	8281	Senovo
00050000-55d4-977c-fea1-7af76477a374	6224	Senožeče
00050000-55d4-977c-e215-7acf334a7d12	8290	Sevnica
00050000-55d4-977c-2a25-b05b33357eed	6210	Sežana
00050000-55d4-977c-2965-2427e4a67417	2214	Sladki Vrh
00050000-55d4-977c-8fa3-a9dbd5f4c78d	5283	Slap ob Idrijci
00050000-55d4-977c-da9a-e2dc60f7a078	2380	Slovenj Gradec
00050000-55d4-977c-b4ff-edccc4a88fb4	2310	Slovenska Bistrica
00050000-55d4-977c-0515-3b257bd96843	3210	Slovenske Konjice
00050000-55d4-977c-2c07-29ce491fb685	1216	Smlednik
00050000-55d4-977c-e942-6d8b95f62d62	5232	Soča
00050000-55d4-977c-ecc8-6efdbfbfe1b2	1317	Sodražica
00050000-55d4-977c-864b-66ffaf531d07	3335	Solčava
00050000-55d4-977c-78ec-ad363619f9cc	5250	Solkan
00050000-55d4-977c-3348-fc322e9d0253	4229	Sorica
00050000-55d4-977c-3267-26e2ee343481	4225	Sovodenj
00050000-55d4-977c-a6e9-08dc30f70463	5281	Spodnja Idrija
00050000-55d4-977c-e702-be20dc423a37	2241	Spodnji Duplek
00050000-55d4-977c-99d1-e16a3e352bd8	9245	Spodnji Ivanjci
00050000-55d4-977c-458b-5826dd1f891c	2277	Središče ob Dravi
00050000-55d4-977c-194b-c36ada366c94	4267	Srednja vas v Bohinju
00050000-55d4-977c-f11d-edde5c6ee407	8256	Sromlje 
00050000-55d4-977c-b3fc-186f2ee5b077	5224	Srpenica
00050000-55d4-977c-ebdb-7fc885336520	1242	Stahovica
00050000-55d4-977c-d4ef-327a1f806a13	1332	Stara Cerkev
00050000-55d4-977c-9d51-4aae932e3f55	8342	Stari trg ob Kolpi
00050000-55d4-977c-ceab-cc9fa7f6b351	1386	Stari trg pri Ložu
00050000-55d4-977c-7750-3bea6cf81215	2205	Starše
00050000-55d4-977c-285a-5b5e15aad3e4	2289	Stoperce
00050000-55d4-977c-63ad-1af010a6ddad	8322	Stopiče
00050000-55d4-977c-3986-f3e9408e4391	3206	Stranice
00050000-55d4-977c-3b74-8d49dc3b034e	8351	Straža
00050000-55d4-977c-6e2e-e7e52ee1ea3a	1313	Struge
00050000-55d4-977c-b2df-e3072ea6611a	8293	Studenec
00050000-55d4-977c-9577-270a0e4fdd9f	8331	Suhor
00050000-55d4-977c-76d4-7b86e29f6dd4	2233	Sv. Ana v Slovenskih goricah
00050000-55d4-977c-adb6-caeb461beb39	2235	Sv. Trojica v Slovenskih goricah
00050000-55d4-977c-2fc5-f8fef28f1a0d	2353	Sveti Duh na Ostrem Vrhu
00050000-55d4-977c-f521-01c413dcf4f0	9244	Sveti Jurij ob Ščavnici
00050000-55d4-977c-3a44-e1b411542d35	3264	Sveti Štefan
00050000-55d4-977c-eb4b-1f4feeefbc64	2258	Sveti Tomaž
00050000-55d4-977c-4cc6-addafaae28ac	9204	Šalovci
00050000-55d4-977c-210d-ee09c7c4993a	5261	Šempas
00050000-55d4-977c-ec0c-7d497e1dcf52	5290	Šempeter pri Gorici
00050000-55d4-977c-61a7-be8498508286	3311	Šempeter v Savinjski dolini
00050000-55d4-977c-2f2b-8c757b7c5335	4208	Šenčur
00050000-55d4-977c-e65c-cf5460694a9a	2212	Šentilj v Slovenskih goricah
00050000-55d4-977c-83ba-fe749b796ebd	8297	Šentjanž
00050000-55d4-977c-7b69-172f97c0c6e6	2373	Šentjanž pri Dravogradu
00050000-55d4-977c-00ab-509a29d556c6	8310	Šentjernej
00050000-55d4-977c-5192-ad800a28d285	3230	Šentjur
00050000-55d4-977c-ea1b-1d40c0bafbdb	3271	Šentrupert
00050000-55d4-977c-b1d5-50a381db5ee5	8232	Šentrupert
00050000-55d4-977c-5c8c-503258c33528	1296	Šentvid pri Stični
00050000-55d4-977c-e5e0-747a886a4cc2	8275	Škocjan
00050000-55d4-977c-7c32-820c7ffd407f	6281	Škofije
00050000-55d4-977c-00b9-e85c57b73ca5	4220	Škofja Loka
00050000-55d4-977c-c41c-6418cd359ad8	3211	Škofja vas
00050000-55d4-977c-fff7-1af9a4b256f3	1291	Škofljica
00050000-55d4-977c-3ad1-83780f1ed00f	6274	Šmarje
00050000-55d4-977c-772a-2486991de58f	1293	Šmarje - Sap
00050000-55d4-977c-1004-232253407582	3240	Šmarje pri Jelšah
00050000-55d4-977c-661e-74d21e8f3f6b	8220	Šmarješke Toplice
00050000-55d4-977c-5da4-c13a3a387c78	2315	Šmartno na Pohorju
00050000-55d4-977c-acb4-33d6360992aa	3341	Šmartno ob Dreti
00050000-55d4-977c-85dd-b5a8a0b58044	3327	Šmartno ob Paki
00050000-55d4-977c-a453-7ff032c42488	1275	Šmartno pri Litiji
00050000-55d4-977c-8164-7b45b171fd92	2383	Šmartno pri Slovenj Gradcu
00050000-55d4-977c-2e61-1378b951638f	3201	Šmartno v Rožni dolini
00050000-55d4-977c-df74-6c0b40aef715	3325	Šoštanj
00050000-55d4-977c-feda-37f36aff8e9a	6222	Štanjel
00050000-55d4-977c-c8ac-798a4ae7c62b	3220	Štore
00050000-55d4-977c-c111-7e3b1355b990	3304	Tabor
00050000-55d4-977c-147b-639a11a23beb	3221	Teharje
00050000-55d4-977c-15e8-30df73e032b5	9251	Tišina
00050000-55d4-977c-887a-744fccd37a1f	5220	Tolmin
00050000-55d4-977c-f584-b2ae79869961	3326	Topolšica
00050000-55d4-977c-1b47-e20da2992b18	2371	Trbonje
00050000-55d4-977c-2f96-e4993d2b075e	1420	Trbovlje
00050000-55d4-977c-e195-dfcae1e1e321	8231	Trebelno 
00050000-55d4-977c-c4be-8ef5d8ac3e7d	8210	Trebnje
00050000-55d4-977c-aed4-ca4738880139	5252	Trnovo pri Gorici
00050000-55d4-977c-178e-a85b72d5591d	2254	Trnovska vas
00050000-55d4-977c-bf84-9e24cc2106dc	1222	Trojane
00050000-55d4-977c-39b0-423658654c2d	1236	Trzin
00050000-55d4-977c-d55f-212d80d91d43	4290	Tržič
00050000-55d4-977c-7145-4deb6a9d0cd4	8295	Tržišče
00050000-55d4-977c-85f3-53681494085f	1311	Turjak
00050000-55d4-977c-e616-cb6ecb6faef8	9224	Turnišče
00050000-55d4-977c-baa3-8d03d1efd4a9	8323	Uršna sela
00050000-55d4-977c-9bca-29dd9fef854f	1252	Vače
00050000-55d4-977c-c561-aaf412bd88ff	3320	Velenje 
00050000-55d4-977c-fe1a-761d95a3b896	3322	Velenje - poštni predali
00050000-55d4-977c-1667-61d4ae80c082	8212	Velika Loka
00050000-55d4-977c-05f0-001c822aa406	2274	Velika Nedelja
00050000-55d4-977c-2666-d6081cc11453	9225	Velika Polana
00050000-55d4-977c-6451-0a4b3efc11dc	1315	Velike Lašče
00050000-55d4-977c-cae6-e5dd11fe568e	8213	Veliki Gaber
00050000-55d4-977c-1ea7-a5566b00c12a	9241	Veržej
00050000-55d4-977c-6749-93f1b7069f67	1312	Videm - Dobrepolje
00050000-55d4-977c-9da8-33248fe41b46	2284	Videm pri Ptuju
00050000-55d4-977c-30fe-e794d8584bfc	8344	Vinica
00050000-55d4-977c-69d1-21c9257ec652	5271	Vipava
00050000-55d4-977c-6462-0cd25369d53b	4212	Visoko
00050000-55d4-977c-71a0-41121a39fde0	1294	Višnja Gora
00050000-55d4-977c-5835-8aeca2f46cd2	3205	Vitanje
00050000-55d4-977c-1919-7848bdc1d72a	2255	Vitomarci
00050000-55d4-977c-d1d6-4e7c9d8df2b5	1217	Vodice
00050000-55d4-977c-0d5f-1a81775c1068	3212	Vojnik\t
00050000-55d4-977c-618b-02a9e31c9300	5293	Volčja Draga
00050000-55d4-977c-4edf-3d346f875de7	2232	Voličina
00050000-55d4-977c-d2e2-1cf1f9f9d2b5	3305	Vransko
00050000-55d4-977c-53fb-9ff894a3a7cd	6217	Vremski Britof
00050000-55d4-977c-0363-cee37956b775	1360	Vrhnika
00050000-55d4-977c-0b13-8a40dc7040e9	2365	Vuhred
00050000-55d4-977c-cd3d-1bfdce584afa	2367	Vuzenica
00050000-55d4-977c-4820-7bd215a2a6f3	8292	Zabukovje 
00050000-55d4-977c-a876-2575e3eb95b7	1410	Zagorje ob Savi
00050000-55d4-977c-a989-edefb625d463	1303	Zagradec
00050000-55d4-977c-3423-27bcd9b66313	2283	Zavrč
00050000-55d4-977c-d1c9-5d739341c714	8272	Zdole 
00050000-55d4-977c-b2d8-40881fc53a47	4201	Zgornja Besnica
00050000-55d4-977c-5cca-1311e2a4c8c9	2242	Zgornja Korena
00050000-55d4-977c-94b3-7c3b47b92c2e	2201	Zgornja Kungota
00050000-55d4-977c-3f23-83d6ff0f0f4a	2316	Zgornja Ložnica
00050000-55d4-977c-bd4c-cf274a550b05	2314	Zgornja Polskava
00050000-55d4-977c-eb5d-e78f1a4e3e12	2213	Zgornja Velka
00050000-55d4-977c-a508-317e38b2e358	4247	Zgornje Gorje
00050000-55d4-977c-ecf2-42ad951a80da	4206	Zgornje Jezersko
00050000-55d4-977c-c218-3aa5b0c790d9	2285	Zgornji Leskovec
00050000-55d4-977c-f781-a6129ca224a6	1432	Zidani Most
00050000-55d4-977c-2788-5d6b8e01038b	3214	Zreče
00050000-55d4-977c-8792-142ef6253f87	4209	Žabnica
00050000-55d4-977c-4574-c55a028e8a52	3310	Žalec
00050000-55d4-977c-5340-49ef4ce444a6	4228	Železniki
00050000-55d4-977c-b142-e1dad52f0c4a	2287	Žetale
00050000-55d4-977c-ef10-fd42b00f19ed	4226	Žiri
00050000-55d4-977c-6c8c-b89a51c87ba9	4274	Žirovnica
00050000-55d4-977c-315a-39874dc5ecd8	8360	Žužemberk
\.


--
-- TOC entry 2913 (class 0 OID 15099657)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 15099464)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 15099542)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15099669)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15100000)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 15100010)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d4-977d-e901-71e99aa9aaa9	00080000-55d4-977d-edae-f249af117b7d	0900	AK
00190000-55d4-977d-3d12-21b950528dd7	00080000-55d4-977d-a815-82061e6f8f3d	0987	AK
00190000-55d4-977d-fade-862c54b940fa	00080000-55d4-977d-a28d-29adba9501f7	0989	AK
00190000-55d4-977d-afdd-262231ea245c	00080000-55d4-977d-e5a0-d88d3e0d1cc9	0986	AK
00190000-55d4-977d-ce09-dfe824011ed7	00080000-55d4-977d-6254-21169126220a	0984	AK
00190000-55d4-977d-e217-9d9ff1c57bd7	00080000-55d4-977d-8682-695b6862c933	0983	AK
00190000-55d4-977d-5e44-48964e5b2a46	00080000-55d4-977d-bd09-1591612c6e91	0982	AK
\.


--
-- TOC entry 2937 (class 0 OID 15099956)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d4-977d-c1cc-5dee6bc9ec94	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2940 (class 0 OID 15100018)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15099698)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d4-977d-a5d0-4667bb4c0688	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d4-977d-c2ec-19a933d45ce9	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d4-977d-4d30-6c6eece9a979	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d4-977d-9620-3094ab3891e8	0004	Mali oder	t	24	Mali oder 
00220000-55d4-977d-7a7f-005bf7a1f42a	0005	Komorni oder	t	15	Komorni oder
00220000-55d4-977d-8fdd-9a3df67a6080	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d4-977d-aa2b-bbea01112486	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2911 (class 0 OID 15099642)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 15099632)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15099817)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15099766)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 15099336)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2920 (class 0 OID 15099708)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 15099374)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d4-977c-5371-ff7caa8a21a6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d4-977c-e3ef-335256c7c2a2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d4-977c-40f6-d0b2f2f4426d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d4-977c-95f3-59aab5474bad	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d4-977c-57ff-369f3835f03a	planer	Planer dogodkov v koledarju	t
00020000-55d4-977c-c7e1-8aaeb1cb44c1	kadrovska	Kadrovska služba	t
00020000-55d4-977c-87e9-7225641208dd	arhivar	Ažuriranje arhivalij	t
00020000-55d4-977c-d8c0-5af6588413a3	igralec	Igralec	t
00020000-55d4-977c-08d7-fc7adde9c64f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d4-977d-3399-ef143a24dc4c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2886 (class 0 OID 15099358)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d4-977c-cb9c-bf94e5e43497	00020000-55d4-977c-40f6-d0b2f2f4426d
00010000-55d4-977c-db29-ebdc5b1133a5	00020000-55d4-977c-40f6-d0b2f2f4426d
00010000-55d4-977d-01f2-8132f26c4ab4	00020000-55d4-977d-3399-ef143a24dc4c
\.


--
-- TOC entry 2922 (class 0 OID 15099722)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15099663)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 15099609)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15100059)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d4-977c-b370-48039b0d0e98	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d4-977c-4cd8-2643693386ca	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d4-977c-9d00-88df0fe19764	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d4-977c-59f8-8899c9c946e0	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d4-977c-d654-d1f9234a314f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2944 (class 0 OID 15100051)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d4-977c-5cee-5ba483f65f52	00230000-55d4-977c-59f8-8899c9c946e0	popa
00240000-55d4-977c-6e0f-f16e1cfea6a3	00230000-55d4-977c-59f8-8899c9c946e0	oseba
00240000-55d4-977c-e8b0-20ae725ba336	00230000-55d4-977c-59f8-8899c9c946e0	sezona
00240000-55d4-977c-c79d-560dab74e74f	00230000-55d4-977c-4cd8-2643693386ca	prostor
00240000-55d4-977c-8f6b-821a38813fae	00230000-55d4-977c-59f8-8899c9c946e0	besedilo
00240000-55d4-977c-a895-eccb3232d2ab	00230000-55d4-977c-59f8-8899c9c946e0	uprizoritev
00240000-55d4-977c-b4f7-305b632d60b5	00230000-55d4-977c-59f8-8899c9c946e0	funkcija
00240000-55d4-977c-3e24-2733b76ee6da	00230000-55d4-977c-59f8-8899c9c946e0	tipfunkcije
00240000-55d4-977c-3140-e4b407613112	00230000-55d4-977c-59f8-8899c9c946e0	alternacija
00240000-55d4-977c-cebc-513a267ee001	00230000-55d4-977c-b370-48039b0d0e98	pogodba
00240000-55d4-977c-04d4-5eeccaed0f4a	00230000-55d4-977c-59f8-8899c9c946e0	zaposlitev
00240000-55d4-977c-1aed-17cc0678c027	00230000-55d4-977c-b370-48039b0d0e98	programdela
00240000-55d4-977c-710b-58b8fa1ab163	00230000-55d4-977c-59f8-8899c9c946e0	zapis
\.


--
-- TOC entry 2943 (class 0 OID 15100046)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15099776)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d4-977d-c1b8-2ed9a9f3025b	000e0000-55d4-977d-2a82-f586d57299ce	00080000-55d4-977d-b081-01c102c48c94	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d4-977d-70ba-fa8b60e7a125	000e0000-55d4-977d-2a82-f586d57299ce	00080000-55d4-977d-b081-01c102c48c94	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d4-977d-a15d-5cdfd8c2460d	000e0000-55d4-977d-2a82-f586d57299ce	00080000-55d4-977d-03b7-ae1bb54d1953	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55d4-977d-02ba-85210f669021	000e0000-55d4-977d-2a82-f586d57299ce	00080000-55d4-977d-03b7-ae1bb54d1953	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2893 (class 0 OID 15099436)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15099619)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d4-977e-adbf-ae3938245f9c	00180000-55d4-977d-c0b2-9de2177d0c61	000c0000-55d4-977d-f9c7-47920549c825	00090000-55d4-977d-2b54-ad7f6b235b53	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-977e-af9b-f6b62bdb9a86	00180000-55d4-977d-c0b2-9de2177d0c61	000c0000-55d4-977d-5aa7-d161cbc7a0bf	00090000-55d4-977d-fece-e10b39af1284	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-977e-46e9-2ce64716aae4	00180000-55d4-977d-c0b2-9de2177d0c61	000c0000-55d4-977d-e8b1-07a3afa399b8	00090000-55d4-977d-86c0-6756cb81441b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-977e-5e34-28dc0f608a22	00180000-55d4-977d-c0b2-9de2177d0c61	000c0000-55d4-977d-c5fe-8dca5984d92b	00090000-55d4-977d-5357-e4a27000c4a1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-977e-7848-ab627c45e665	00180000-55d4-977d-c0b2-9de2177d0c61	000c0000-55d4-977d-00d7-830b859ab49e	00090000-55d4-977d-8b55-c3078c2bc7fc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-977e-ac85-fefb3f9edaa7	00180000-55d4-977d-3a25-0e0a76d29d7f	\N	00090000-55d4-977d-8b55-c3078c2bc7fc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2929 (class 0 OID 15099806)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d4-977c-f651-b931a97fb645	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d4-977c-a415-fdd4633e12b8	Priredba	Priredba	Priredba	umetnik
000f0000-55d4-977c-d228-be417230c171	Prevod	Prevod	Prevod	umetnik
000f0000-55d4-977c-6510-a1cc9f9df250	Režija	Režija	Režija	umetnik
000f0000-55d4-977c-d4d7-c3e7e987e5b0	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d4-977c-bdb5-a733ecfbff47	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55d4-977c-f545-116c8b2ed580	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55d4-977c-dbf0-74ff3f7a5ae4	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d4-977c-72dc-143209e5c993	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55d4-977c-bc5e-33feaa81412d	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55d4-977c-b13d-eb6260d599eb	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d4-977c-a670-06dd318fc67a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d4-977c-1487-6189baa922a0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55d4-977c-a5ac-c20522622fdc	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55d4-977c-8a81-9dbbecc0e6fa	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d4-977c-5537-6326d55eb771	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d4-977c-204e-3f2d37bdf2b3	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d4-977c-939c-28ed9e696b03	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2941 (class 0 OID 15100028)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d4-977c-5057-f22698e53efa	01	Velika predstava	f	1.00	1.00
002b0000-55d4-977c-f43c-4c85ecc4081d	02	Mala predstava	f	0.50	0.50
002b0000-55d4-977c-9ed9-86e7914e46c0	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d4-977c-9837-439c1bbdf9c8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d4-977c-5879-fa439c717c46	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2898 (class 0 OID 15099499)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 15099345)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d4-977c-db29-ebdc5b1133a5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfFHA2xbadeqjS9ibet4jmfuiY85.JXG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d4-977d-2f8d-918c84794e7a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d4-977d-9138-6e11443d9ba8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d4-977d-deda-8dc5299842b1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d4-977d-1e47-8076549f78c0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d4-977d-0cfa-b91c48e53470	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d4-977d-ae20-084430b3781e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d4-977d-c67d-ff3829ebb00e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d4-977d-22de-d3b7ff1d699e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d4-977d-b8d5-3f7b2607b038	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d4-977d-01f2-8132f26c4ab4	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d4-977c-cb9c-bf94e5e43497	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2933 (class 0 OID 15099854)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d4-977d-4f5e-8513e6052560	00160000-55d4-977d-f030-636e6a004f28	00150000-55d4-977c-ed8d-ed50362e4e17	00140000-55d4-977b-0cfe-04a48ed4cdfc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d4-977d-7a7f-005bf7a1f42a
000e0000-55d4-977d-2a82-f586d57299ce	00160000-55d4-977d-b4b2-42888570f12b	00150000-55d4-977c-962b-f0e06dc21aec	00140000-55d4-977b-0a17-b993bce985ba	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d4-977d-8fdd-9a3df67a6080
000e0000-55d4-977d-13fb-1dc0565a8e8d	\N	00150000-55d4-977c-962b-f0e06dc21aec	00140000-55d4-977b-0a17-b993bce985ba	00190000-55d4-977d-3d12-21b950528dd7	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d4-977d-7a7f-005bf7a1f42a
000e0000-55d4-977d-ff1d-e7a706a826d4	\N	00150000-55d4-977c-962b-f0e06dc21aec	00140000-55d4-977b-0a17-b993bce985ba	00190000-55d4-977d-3d12-21b950528dd7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d4-977d-7a7f-005bf7a1f42a
000e0000-55d4-977d-785b-fe3cc856f266	\N	00150000-55d4-977c-962b-f0e06dc21aec	00140000-55d4-977b-0a17-b993bce985ba	00190000-55d4-977d-3d12-21b950528dd7	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d4-977d-a5d0-4667bb4c0688
000e0000-55d4-977d-09ff-01ecd0d1c695	\N	00150000-55d4-977c-962b-f0e06dc21aec	00140000-55d4-977b-0a17-b993bce985ba	00190000-55d4-977d-3d12-21b950528dd7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d4-977d-a5d0-4667bb4c0688
\.


--
-- TOC entry 2903 (class 0 OID 15099561)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d4-977d-2f40-9d0e683c12b5	000e0000-55d4-977d-2a82-f586d57299ce	1	
00200000-55d4-977d-537a-f096fcc8fc7f	000e0000-55d4-977d-2a82-f586d57299ce	2	
\.


--
-- TOC entry 2918 (class 0 OID 15099690)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15100098)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15100070)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15100110)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15099759)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d4-977d-a6f7-7935d6b166d9	00090000-55d4-977d-fece-e10b39af1284	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-977d-c8bf-85649c55ad52	00090000-55d4-977d-86c0-6756cb81441b	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-977d-c478-8ad21e014080	00090000-55d4-977d-375d-b9360750688a	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-977d-f801-9ceabe7322df	00090000-55d4-977d-e81f-da23dba863ed	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-977d-96bb-96d09ce1ab8e	00090000-55d4-977d-2b54-ad7f6b235b53	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-977d-0187-bfe1f12d3dd1	00090000-55d4-977d-0f45-a4870be49474	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2905 (class 0 OID 15099593)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15099844)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d4-977b-0cfe-04a48ed4cdfc	01	Drama	drama (SURS 01)
00140000-55d4-977b-5ba7-428dd6e06f49	02	Opera	opera (SURS 02)
00140000-55d4-977b-70f3-7960f8dde154	03	Balet	balet (SURS 03)
00140000-55d4-977b-0cb1-9113c7491dc0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d4-977b-c218-49e71591ae2e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d4-977b-0a17-b993bce985ba	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d4-977b-4368-c5a75e1dcb3f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2924 (class 0 OID 15099749)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d4-977c-e89b-917c35136820	01	Opera	opera
00150000-55d4-977c-4d9b-39e1e54c6a4b	02	Opereta	opereta
00150000-55d4-977c-f859-5c03075e8490	03	Balet	balet
00150000-55d4-977c-40d8-ef6a5d82dca6	04	Plesne prireditve	plesne prireditve
00150000-55d4-977c-db21-f4b228954c10	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d4-977c-bee1-c1bee59860a5	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d4-977c-4221-48148c6e15de	07	Biografska drama	biografska drama
00150000-55d4-977c-ed8d-ed50362e4e17	08	Komedija	komedija
00150000-55d4-977c-e1b5-32d3ef46670d	09	Črna komedija	črna komedija
00150000-55d4-977c-271c-95af54ab9c69	10	E-igra	E-igra
00150000-55d4-977c-962b-f0e06dc21aec	11	Kriminalka	kriminalka
00150000-55d4-977c-1bd5-e6e0cff35fd7	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 15099399)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15099901)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 15099891)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15099805)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15100150)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 15099583)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 15099608)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 15100044)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 15099525)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 15099950)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 15099745)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 15099559)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 15099602)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 15099539)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 15099655)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 15100127)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 15100134)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2676 (class 2606 OID 15100158)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 15099682)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15099497)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 15099408)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 15099432)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 15099388)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 15099373)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15099688)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 15099721)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15099839)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 15099461)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15099485)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 15099661)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 15099475)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15099546)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 15099673)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 15100007)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 15100015)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 15099998)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 15100026)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 15099705)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 15099646)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 15099637)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 15099827)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15099773)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 15099344)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15099712)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 15099362)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 15099382)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 15099730)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 15099668)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 15099617)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 15100068)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 15100056)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15100050)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 15099786)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 15099441)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15099628)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 15099816)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 15100038)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 15099510)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 15099357)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 15099870)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15099568)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 15099696)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 15100108)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 15100092)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 15100116)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 15099764)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15099597)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 15099852)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15099757)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 15099590)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2576 (class 1259 OID 15099787)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 15099788)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 15100129)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2663 (class 1259 OID 15100128)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2449 (class 1259 OID 15099463)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2541 (class 1259 OID 15099689)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2649 (class 1259 OID 15100096)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2650 (class 1259 OID 15100095)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2651 (class 1259 OID 15100097)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2652 (class 1259 OID 15100094)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2653 (class 1259 OID 15100093)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2535 (class 1259 OID 15099675)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 15099674)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 15099569)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 15099746)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 15099748)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2565 (class 1259 OID 15099747)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 15099541)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 15099540)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2632 (class 1259 OID 15100027)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2586 (class 1259 OID 15099841)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 15099842)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2588 (class 1259 OID 15099843)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2659 (class 1259 OID 15100117)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 15099875)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2596 (class 1259 OID 15099872)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2597 (class 1259 OID 15099876)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2598 (class 1259 OID 15099874)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2599 (class 1259 OID 15099873)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 15099512)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15099511)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 15099435)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2551 (class 1259 OID 15099713)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 15099603)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 15099389)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 15099390)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2556 (class 1259 OID 15099733)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2557 (class 1259 OID 15099732)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 15099731)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 15099547)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 15099549)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 15099548)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 15100058)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2515 (class 1259 OID 15099641)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2516 (class 1259 OID 15099639)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2517 (class 1259 OID 15099638)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2518 (class 1259 OID 15099640)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 15099363)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 15099364)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 15099697)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2672 (class 1259 OID 15100151)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2673 (class 1259 OID 15100159)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2674 (class 1259 OID 15100160)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2530 (class 1259 OID 15099662)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2572 (class 1259 OID 15099774)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2573 (class 1259 OID 15099775)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 15099955)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2617 (class 1259 OID 15099954)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2618 (class 1259 OID 15099951)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 15099952)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2620 (class 1259 OID 15099953)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 15099477)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 15099476)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 15099478)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2624 (class 1259 OID 15100008)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2625 (class 1259 OID 15100009)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2609 (class 1259 OID 15099905)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 15099906)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2611 (class 1259 OID 15099903)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2612 (class 1259 OID 15099904)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2569 (class 1259 OID 15099765)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 15099650)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2522 (class 1259 OID 15099649)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2523 (class 1259 OID 15099647)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2524 (class 1259 OID 15099648)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 15099893)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2606 (class 1259 OID 15099892)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2621 (class 1259 OID 15099999)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 15099560)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 15100045)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2666 (class 1259 OID 15100135)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 15100136)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2436 (class 1259 OID 15099410)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 15099409)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 15099442)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 15099443)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 15099631)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2511 (class 1259 OID 15099630)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2512 (class 1259 OID 15099629)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2492 (class 1259 OID 15099592)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 15099588)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 15099585)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 15099586)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 15099584)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 15099589)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 15099587)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 15099462)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 15099526)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15099528)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 15099527)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 15099529)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2529 (class 1259 OID 15099656)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2591 (class 1259 OID 15099840)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 15099871)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 15099433)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 15099434)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2566 (class 1259 OID 15099758)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 15100069)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 15099498)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 15100057)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2549 (class 1259 OID 15099707)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2550 (class 1259 OID 15099706)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 15099902)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2460 (class 1259 OID 15099486)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 15099853)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 15100109)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2630 (class 1259 OID 15100016)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 15100017)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 15099618)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2429 (class 1259 OID 15099383)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 15099591)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2702 (class 2606 OID 15100296)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2705 (class 2606 OID 15100281)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2704 (class 2606 OID 15100286)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2700 (class 2606 OID 15100306)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2706 (class 2606 OID 15100276)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2701 (class 2606 OID 15100301)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2703 (class 2606 OID 15100291)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2736 (class 2606 OID 15100451)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 15100456)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 15100626)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2770 (class 2606 OID 15100621)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 15100211)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2723 (class 2606 OID 15100391)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 15100606)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 15100601)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2763 (class 2606 OID 15100611)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 15100596)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2767 (class 2606 OID 15100591)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2721 (class 2606 OID 15100386)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2722 (class 2606 OID 15100381)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2699 (class 2606 OID 15100271)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2731 (class 2606 OID 15100421)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 15100431)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2730 (class 2606 OID 15100426)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2693 (class 2606 OID 15100246)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 15100241)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2719 (class 2606 OID 15100371)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 15100576)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2739 (class 2606 OID 15100461)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 15100466)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 15100471)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2768 (class 2606 OID 15100616)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2741 (class 2606 OID 15100491)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2744 (class 2606 OID 15100476)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2740 (class 2606 OID 15100496)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2742 (class 2606 OID 15100486)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2743 (class 2606 OID 15100481)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2691 (class 2606 OID 15100236)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 15100231)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2683 (class 2606 OID 15100196)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2684 (class 2606 OID 15100191)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 15100401)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2707 (class 2606 OID 15100311)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 15100171)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2679 (class 2606 OID 15100176)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2726 (class 2606 OID 15100416)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2727 (class 2606 OID 15100411)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2728 (class 2606 OID 15100406)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2697 (class 2606 OID 15100251)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2695 (class 2606 OID 15100261)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2696 (class 2606 OID 15100256)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2762 (class 2606 OID 15100586)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2711 (class 2606 OID 15100346)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2713 (class 2606 OID 15100336)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2714 (class 2606 OID 15100331)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2712 (class 2606 OID 15100341)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2678 (class 2606 OID 15100161)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2677 (class 2606 OID 15100166)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2724 (class 2606 OID 15100396)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2773 (class 2606 OID 15100641)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 15100646)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2774 (class 2606 OID 15100651)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2720 (class 2606 OID 15100376)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2734 (class 2606 OID 15100441)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2733 (class 2606 OID 15100446)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15100551)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2752 (class 2606 OID 15100546)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2755 (class 2606 OID 15100531)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2754 (class 2606 OID 15100536)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2753 (class 2606 OID 15100541)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2689 (class 2606 OID 15100221)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 15100216)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 15100226)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2758 (class 2606 OID 15100561)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2757 (class 2606 OID 15100566)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2748 (class 2606 OID 15100521)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2747 (class 2606 OID 15100526)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2750 (class 2606 OID 15100511)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2749 (class 2606 OID 15100516)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2732 (class 2606 OID 15100436)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 15100366)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2716 (class 2606 OID 15100361)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2718 (class 2606 OID 15100351)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2717 (class 2606 OID 15100356)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2745 (class 2606 OID 15100506)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 15100501)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2756 (class 2606 OID 15100556)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2698 (class 2606 OID 15100266)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 15100571)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 15100581)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2772 (class 2606 OID 15100631)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2771 (class 2606 OID 15100636)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2681 (class 2606 OID 15100186)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 15100181)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2686 (class 2606 OID 15100201)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 15100206)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 15100326)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 15100321)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2710 (class 2606 OID 15100316)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-19 16:49:35 CEST

--
-- PostgreSQL database dump complete
--

