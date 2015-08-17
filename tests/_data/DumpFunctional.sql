--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-17 11:23:33 CEST

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
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 14037415)
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
-- TOC entry 222 (class 1259 OID 14037918)
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
-- TOC entry 221 (class 1259 OID 14037901)
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
-- TOC entry 215 (class 1259 OID 14037813)
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
-- TOC entry 238 (class 1259 OID 14038161)
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
    title character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 191 (class 1259 OID 14037594)
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
-- TOC entry 194 (class 1259 OID 14037628)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 14038063)
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
-- TOC entry 186 (class 1259 OID 14037537)
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
-- TOC entry 223 (class 1259 OID 14037931)
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
-- TOC entry 210 (class 1259 OID 14037758)
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
-- TOC entry 189 (class 1259 OID 14037574)
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
-- TOC entry 193 (class 1259 OID 14037622)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 14037554)
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
-- TOC entry 199 (class 1259 OID 14037675)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 14038142)
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
-- TOC entry 237 (class 1259 OID 14038154)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 14038177)
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
-- TOC entry 203 (class 1259 OID 14037700)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 14037511)
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
-- TOC entry 178 (class 1259 OID 14037424)
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
-- TOC entry 179 (class 1259 OID 14037435)
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
-- TOC entry 174 (class 1259 OID 14037389)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 14037408)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 14037707)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 14037738)
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
-- TOC entry 218 (class 1259 OID 14037852)
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
-- TOC entry 181 (class 1259 OID 14037468)
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
-- TOC entry 183 (class 1259 OID 14037503)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 14037681)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 14037488)
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
-- TOC entry 188 (class 1259 OID 14037566)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 14037693)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 14038024)
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
-- TOC entry 226 (class 1259 OID 14038034)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 14037980)
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
-- TOC entry 227 (class 1259 OID 14038042)
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
-- TOC entry 206 (class 1259 OID 14037722)
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
-- TOC entry 198 (class 1259 OID 14037666)
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
-- TOC entry 197 (class 1259 OID 14037656)
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
-- TOC entry 217 (class 1259 OID 14037841)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 14037790)
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
-- TOC entry 171 (class 1259 OID 14037360)
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
-- TOC entry 170 (class 1259 OID 14037358)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 14037732)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 14037398)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 14037382)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 14037746)
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
-- TOC entry 201 (class 1259 OID 14037687)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 14037633)
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
-- TOC entry 232 (class 1259 OID 14038083)
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
-- TOC entry 231 (class 1259 OID 14038075)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 14038070)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 14037800)
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
-- TOC entry 180 (class 1259 OID 14037460)
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
-- TOC entry 196 (class 1259 OID 14037643)
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
-- TOC entry 216 (class 1259 OID 14037830)
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
-- TOC entry 228 (class 1259 OID 14038052)
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
-- TOC entry 185 (class 1259 OID 14037523)
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
-- TOC entry 172 (class 1259 OID 14037369)
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
-- TOC entry 220 (class 1259 OID 14037878)
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
-- TOC entry 190 (class 1259 OID 14037585)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 14037714)
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
-- TOC entry 234 (class 1259 OID 14038122)
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
-- TOC entry 233 (class 1259 OID 14038094)
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
    rigths character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 14038134)
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
-- TOC entry 212 (class 1259 OID 14037783)
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
-- TOC entry 192 (class 1259 OID 14037617)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 14037868)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 14037773)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 14037363)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 14037415)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 14037918)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d1-a814-018f-e66a076d6427	000d0000-55d1-a814-4605-f19a1ffe9b96	\N	00090000-55d1-a814-4858-89726e9e2247	000b0000-55d1-a814-c8f7-cb178714d97c	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d1-a814-2b58-19dda463c7c8	000d0000-55d1-a814-0918-bc24676def8d	00100000-55d1-a814-3e05-6efd5dbd9947	00090000-55d1-a814-9ba1-4e3641395d3c	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d1-a814-632f-f19a7f20af2c	000d0000-55d1-a814-7339-b1dcc17333a1	00100000-55d1-a814-9d97-ad0a6c0d26f4	00090000-55d1-a814-2846-146ca07841b8	\N	0003	t	\N	2015-08-17	\N	2	\N	\N	f	f
000c0000-55d1-a814-2e87-2108c80c13a5	000d0000-55d1-a814-b9cc-952ee1482801	\N	00090000-55d1-a814-d463-d239fd62912f	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d1-a814-9570-b7f148552deb	000d0000-55d1-a814-8b0b-e1683e468a46	\N	00090000-55d1-a814-4da4-2aec049d33e5	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d1-a814-dce8-2ebf0a6fa273	000d0000-55d1-a814-6b75-81f72ec33172	\N	00090000-55d1-a814-7d3e-bf5427de7386	000b0000-55d1-a814-30da-f643ea3e6ca0	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d1-a814-8636-c9aa11bd4b83	000d0000-55d1-a814-7388-76afba9a2405	00100000-55d1-a814-9181-fd448d28a6ce	00090000-55d1-a814-8cf5-fd1bfc77794e	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d1-a814-d409-66cddce8f5fe	000d0000-55d1-a814-ae13-7420e6a901bc	\N	00090000-55d1-a814-87de-ce6b640d0a50	000b0000-55d1-a814-d8c1-71c6671b062b	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d1-a814-9104-75d9c8c44ffe	000d0000-55d1-a814-7388-76afba9a2405	00100000-55d1-a814-17dd-59105a607d1b	00090000-55d1-a814-580c-85bafad303fb	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d1-a814-f5bb-54f73c41e4b5	000d0000-55d1-a814-7388-76afba9a2405	00100000-55d1-a814-1e4a-21fa14acb6d1	00090000-55d1-a814-4a6b-80ba3bfe5b37	\N	0010	t	\N	2015-08-17	\N	16	\N	\N	f	t
000c0000-55d1-a814-09b8-c73c65fa247a	000d0000-55d1-a814-7388-76afba9a2405	00100000-55d1-a814-5674-976d9847470d	00090000-55d1-a814-9836-431ec65a8dbc	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 14037901)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 14037813)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d1-a814-ad2e-baf25debafdd	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d1-a814-a232-bcc505c65804	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d1-a814-1f02-cbca1ec2d9ad	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 14038161)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 14037594)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d1-a814-bdc2-35dd00afb9e5	\N	\N	00200000-55d1-a814-86db-d7fc345b2d1d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d1-a814-c1fc-93aed9562d8b	\N	\N	00200000-55d1-a814-6f0b-fcc54110ac4f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d1-a814-083b-c17e588fd81f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d1-a814-22aa-317191d553c5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d1-a814-62e7-3e6baac4fd17	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 14037628)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 14038063)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 14037537)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d1-a812-05fa-44595116b821	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d1-a812-3eb7-b6a179ba7836	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d1-a812-9300-eaec2b6d7cad	AL	ALB	008	Albania 	Albanija	\N
00040000-55d1-a812-fbad-b49b75be68cb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d1-a812-9ae9-5e895d48e9c6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d1-a812-0d0b-69325cd1d6ed	AD	AND	020	Andorra 	Andora	\N
00040000-55d1-a812-8b49-25889d703aa3	AO	AGO	024	Angola 	Angola	\N
00040000-55d1-a812-17c4-a6432e272504	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d1-a812-3b3e-34ed6c83bbc1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d1-a812-c304-0ae2eb569577	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d1-a812-c6bf-4c618d56f445	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d1-a812-fbae-46d5234f4616	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d1-a812-4be4-0dca9548c5db	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d1-a812-4d48-839acad72fb9	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d1-a812-46e0-06d3bfaab617	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d1-a812-8720-aad52cef8d78	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d1-a812-2b43-b2874ee7d940	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d1-a812-93a2-912293a7f777	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d1-a812-f155-ad2920cd660e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d1-a812-a8cf-a076601c6e47	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d1-a812-e9fc-53e7b0e7dc75	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d1-a812-3bb3-9c0c795ec972	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d1-a812-687e-fdc068d2ffe7	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d1-a812-0856-38d00c56be21	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d1-a812-ba8b-ebb03307d472	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d1-a812-b1c5-284f78d61ac5	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d1-a812-4993-080385596aec	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d1-a812-8468-444be852a138	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d1-a812-6fcf-897e455dcca0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d1-a812-76db-7b53297f4f88	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d1-a812-549e-586a6e751a8f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d1-a812-4d68-fa20d91b78f3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d1-a812-5f55-f64b8268c402	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d1-a812-1e99-0d504f5034f0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d1-a812-556b-3f2728300c90	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d1-a812-4ba9-1b8e0ecc83f2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d1-a812-89cb-988337a59d9b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d1-a812-2931-f677cdde583d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d1-a812-5b69-f6d6ee62a748	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d1-a812-2c60-3d225f285cba	CA	CAN	124	Canada 	Kanada	\N
00040000-55d1-a812-4986-f056342dfcd0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d1-a812-847f-60788adeccf6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d1-a812-a2fc-ec5755582a7e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d1-a812-1095-14f5f51b08f2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d1-a812-b7d5-b0f141afded1	CL	CHL	152	Chile 	Čile	\N
00040000-55d1-a812-c778-980ee7a92a25	CN	CHN	156	China 	Kitajska	\N
00040000-55d1-a812-ab6c-1cc79f6ed074	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d1-a812-c6bc-0663a62ad9ba	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d1-a812-99f6-43a282a6dd83	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d1-a812-8008-789212bba842	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d1-a812-1480-0f2780c03b5c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d1-a812-3a47-feba0e8e7394	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d1-a812-cb31-56e45b8d378a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d1-a812-4596-bdf7e7223fa6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d1-a812-e571-cfe7eaaf9051	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d1-a812-dcc3-511b01e8097f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d1-a812-c43b-7a6fc1af033a	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d1-a812-eb38-da635433fbee	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d1-a812-56c5-227ae3c10b1c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d1-a812-839e-cfa97fc19643	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d1-a812-c91a-60f637085701	DK	DNK	208	Denmark 	Danska	\N
00040000-55d1-a812-45a7-af2f5d59e308	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d1-a812-6b01-fbd5f202863a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d1-a812-e5b3-aae221f2e4eb	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d1-a812-9182-096d34e99b0e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d1-a812-3133-24e0abdda7fd	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d1-a812-5f29-1a1657437f24	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d1-a812-ad5b-f209f4938faa	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d1-a812-f938-bb3c39c75107	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d1-a812-dd70-f6454f0fda6b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d1-a812-cae6-0d06d70ed0e4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d1-a812-48d8-b0ed8637b0dc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d1-a812-c28e-595694b091c8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d1-a812-c409-60e7a6afc4b9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d1-a812-2bf6-4f1ca7b76d89	FI	FIN	246	Finland 	Finska	\N
00040000-55d1-a812-f8f4-2040b427a696	FR	FRA	250	France 	Francija	\N
00040000-55d1-a812-cb2a-7d790e0a67fc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d1-a812-db2f-874b921af7f9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d1-a812-f9e8-9c58a4747930	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d1-a812-33cb-6ad45b0713f6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d1-a812-4ae2-a0329d3b5761	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d1-a812-0e86-68d7cc10c49f	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d1-a812-3709-71482d3d83d3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d1-a812-33c5-19e1e66b81c8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d1-a812-77a5-e2a574c04e0e	GH	GHA	288	Ghana 	Gana	\N
00040000-55d1-a812-6288-b54fa2fbf69f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d1-a812-ca6b-9ce352ada477	GR	GRC	300	Greece 	Grčija	\N
00040000-55d1-a812-7556-f3cced8c585c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d1-a812-b5c9-54b4f4957829	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d1-a812-bb7c-1011fc820643	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d1-a812-f1ee-c5197fccf6b1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d1-a812-29eb-7b02da2c8f77	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d1-a812-1532-24e6ea4ce692	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d1-a812-c44c-4d4f2223f44c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d1-a812-44ea-085a642ec235	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d1-a812-0ff3-9bc674479c42	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d1-a812-2958-2b2a813594b7	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d1-a812-bfb2-9c854ae8b07a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d1-a812-13a7-2881db44e9a0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d1-a812-ed1a-5799f245170b	HN	HND	340	Honduras 	Honduras	\N
00040000-55d1-a812-3894-6f0ca52cd940	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d1-a812-2077-12ee15da1ac5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d1-a812-c969-cdf3d644dd9f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d1-a812-aa83-bc0086f2849f	IN	IND	356	India 	Indija	\N
00040000-55d1-a812-c468-7a9682214921	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d1-a812-7e20-7453c48fe7f1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d1-a812-672d-48661a07b052	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d1-a812-754b-c96fa5d52499	IE	IRL	372	Ireland 	Irska	\N
00040000-55d1-a812-6ad1-4c8c2b9cde79	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d1-a812-1d4d-0b5be833fea4	IL	ISR	376	Israel 	Izrael	\N
00040000-55d1-a812-fedb-7737ff97f517	IT	ITA	380	Italy 	Italija	\N
00040000-55d1-a812-ba21-0058e884ac2d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d1-a812-96b7-c2554829b7ad	JP	JPN	392	Japan 	Japonska	\N
00040000-55d1-a812-3368-dcc3712abdba	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d1-a812-cfe2-cf68d7c83402	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d1-a812-3752-2cb4953e75a6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d1-a812-bd13-80873f9a8f28	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d1-a812-03a7-31a6489b3117	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d1-a812-c1b9-24415af51285	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d1-a812-cd6c-d0f75470fc96	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d1-a812-9ddf-536d7970608c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d1-a812-9d88-cd16cc40058a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d1-a812-9bfc-8098d22707a6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d1-a812-96d3-33f4e298091f	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d1-a812-b2a9-419959de2ef3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d1-a812-91a9-4151d8429cdb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d1-a812-b8fe-d8d0edb7ec71	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d1-a812-68fc-bb4959096397	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d1-a812-ebdc-66a8b99952a4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d1-a812-8733-f491e1c35bf4	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d1-a812-68be-b2d8a5d3247d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d1-a812-b97c-817b8e357049	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d1-a812-13bc-5ae303bf8a91	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d1-a812-60bb-8627d27eac6a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d1-a812-753e-8c59e13811d2	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d1-a812-2046-74b70988452d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d1-a812-5936-bcce7b9b84aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d1-a812-53e5-cbbefc8f20b7	ML	MLI	466	Mali 	Mali	\N
00040000-55d1-a812-1478-3dbb36283910	MT	MLT	470	Malta 	Malta	\N
00040000-55d1-a812-9ad6-444ac2be8a00	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d1-a812-4aba-5d3ff69c88f0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d1-a812-3934-e4de1c6289c0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d1-a812-0ef1-31af402893c7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d1-a812-18bb-0f8730082bae	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d1-a812-30a9-2d0fdb5131d9	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d1-a812-a283-bc1253302884	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d1-a812-60c4-29deed1d5bc6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d1-a812-6c9b-016ae93b8ad7	MC	MCO	492	Monaco 	Monako	\N
00040000-55d1-a812-73fa-fee34b81ee0c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d1-a812-512e-889f50786ec8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d1-a812-ef76-9aaf7410d9a3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d1-a812-e61c-d2006fe1cbbe	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d1-a812-549b-8f743d0344a2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d1-a812-1e1c-f312fe9bd4f2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d1-a812-6ae5-5f4e274ac13c	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d1-a812-b52f-017383c2a241	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d1-a812-0a70-adf38cc36e29	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d1-a812-9df5-c1267b672d2f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d1-a812-c333-47edafe004fe	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d1-a812-2360-34d98e3ba449	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d1-a812-1205-c4fe6ef1f209	NE	NER	562	Niger 	Niger 	\N
00040000-55d1-a812-8db6-072ed0902af0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d1-a812-de61-4cd5c2834151	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d1-a812-78d2-5fcc286081f9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d1-a812-a450-b8b957e91983	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d1-a812-c34d-1a65dbdce556	NO	NOR	578	Norway 	Norveška	\N
00040000-55d1-a812-6c4e-1d8c95c3e91a	OM	OMN	512	Oman 	Oman	\N
00040000-55d1-a812-9b71-33bc1fb2047f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d1-a812-c2f0-97805e0c626e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d1-a812-d70f-745f7703546c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d1-a812-b7a9-6a5eb62888a9	PA	PAN	591	Panama 	Panama	\N
00040000-55d1-a812-55f5-64b19d9c13de	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d1-a812-eb1e-8eface44906e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d1-a812-c60c-e508466f5855	PE	PER	604	Peru 	Peru	\N
00040000-55d1-a812-2533-37a9a6084f8e	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d1-a812-49ee-d156b1ddda64	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d1-a812-112f-6a3dd5a098d0	PL	POL	616	Poland 	Poljska	\N
00040000-55d1-a812-e022-9f35e0f667a1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d1-a812-b783-98f5c963ddbe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d1-a812-de1b-70843cf80b59	QA	QAT	634	Qatar 	Katar	\N
00040000-55d1-a812-a5fe-958cdce7c931	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d1-a812-393f-07c81e827625	RO	ROU	642	Romania 	Romunija	\N
00040000-55d1-a812-92bb-fc1dfd5ae658	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d1-a812-f79d-9792e19a7b15	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d1-a812-0711-7484270b1d25	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d1-a812-8952-6e823263083a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d1-a812-f9a5-a994f2d9e0c3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d1-a812-c49d-88df1df4941e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d1-a812-691b-c2b1950c3a37	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d1-a812-d8ec-2b79bfab7f61	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d1-a812-88a2-4469e7aef137	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d1-a812-9b30-c48c9bad80b2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d1-a812-0dc7-e6efcc1036a7	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d1-a812-5bf7-e90701ec69d7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d1-a812-ef21-25bdfbaa1036	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d1-a812-a362-3e7dc5339b55	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d1-a812-77cf-54124fcd64d6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d1-a812-73b9-635080c3e66a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d1-a812-e4df-63655ae0ffe5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d1-a812-9a27-ea301b71881f	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d1-a812-e0c7-79d3ad734ec4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d1-a812-2bf3-a7bd0fdc0520	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d1-a812-1e7d-e6dff1305b5f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d1-a812-593a-b5ddc8b90767	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d1-a812-2877-8b901298ffc0	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d1-a812-fe1f-1eaddc37b897	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d1-a812-9859-bec93fad5970	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d1-a812-aae5-caaf83fd6d9b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d1-a812-35b5-06fb0b00f166	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d1-a812-28ea-8c8b511d71f7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d1-a812-4197-dcdb8194070c	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d1-a812-2119-ba9f65dc4ed1	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d1-a812-fa0c-4c7fcccff86c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d1-a812-6803-5bb5aa4a66eb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d1-a812-7090-80dd6e4c12ed	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d1-a812-b023-f1e9b6f1558a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d1-a812-4825-2766a81a2b90	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d1-a812-679d-a86e4b74d7dd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d1-a812-8b2f-c3ce2a6296ad	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d1-a812-fef0-cb90f8344de1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d1-a812-5489-4ac61c6327ae	TH	THA	764	Thailand 	Tajska	\N
00040000-55d1-a812-bc53-5523c1c19430	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d1-a812-e55f-d9399edad97c	TG	TGO	768	Togo 	Togo	\N
00040000-55d1-a812-4499-6658f6f79e5f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d1-a812-0f4d-ef96b47a8c3e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d1-a812-3fb3-1ad4b4f89636	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d1-a812-0a48-13bd9afa2915	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d1-a812-5596-d92ed45ba44b	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d1-a812-fefe-eb92d05e3082	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d1-a812-7d01-02138d7d25c6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d1-a812-02a9-3f76bc4c0d53	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d1-a812-8be9-f027c642f0b8	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d1-a812-ac1f-1467a3d6a49d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d1-a812-7948-1515254b7c59	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d1-a812-104e-818d77026ebc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d1-a812-126c-45b0d16339ec	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d1-a812-6fe7-7d0bfa4295f5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d1-a812-6ee3-1b6f7bac1679	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d1-a812-ab2c-2ac216352ac9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d1-a812-3223-39e57569d968	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d1-a812-2d86-5b24cb37b202	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d1-a812-e384-a7887cc55113	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d1-a812-f6f5-b335c6c1f6a6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d1-a812-e45a-45f6bd70ccaa	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d1-a812-0175-1caba1b08f5c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d1-a812-fbb3-7fe6e292dd23	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d1-a812-3d3f-384ae89a09a6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d1-a812-9d39-824337a8d3f6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d1-a812-99cd-fbcb5eabc34f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 14037931)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d1-a814-e877-98cfbe6539af	000e0000-55d1-a814-8f79-a445ee877f3c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55d1-a813-47f9-cf160e60d235	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d1-a814-8b65-07b7a372cf1c	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d1-a813-8d9c-94e086edd379	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d1-a814-0e5e-971f722da01a	000e0000-55d1-a814-7a45-91fd8f782b44	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d1-a813-47f9-cf160e60d235	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d1-a814-7d5a-5cc2d2bc886c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d1-a814-6188-dfdc29206ccf	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 14037758)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d1-a814-7388-76afba9a2405	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d1-a813-3d59-46e8c6d51fe3
000d0000-55d1-a814-4605-f19a1ffe9b96	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d1-a813-3d59-46e8c6d51fe3
000d0000-55d1-a814-0918-bc24676def8d	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d1-a813-c28e-e5f624883638
000d0000-55d1-a814-7339-b1dcc17333a1	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d1-a813-fe05-405b635e480c
000d0000-55d1-a814-b9cc-952ee1482801	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d1-a813-2df9-418b7e84fac4
000d0000-55d1-a814-8b0b-e1683e468a46	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55d1-a813-9778-76596fb09e2f
000d0000-55d1-a814-6b75-81f72ec33172	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d1-a813-3d59-46e8c6d51fe3
000d0000-55d1-a814-ae13-7420e6a901bc	000e0000-55d1-a814-e50b-158cc6bf11e7	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d1-a813-b72c-ad10d974758d
\.


--
-- TOC entry 2903 (class 0 OID 14037574)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 14037622)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 14037554)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d1-a814-fb40-bbb729969dd5	00080000-55d1-a814-121a-07dbbd42967e	00090000-55d1-a814-4a6b-80ba3bfe5b37	AK		
\.


--
-- TOC entry 2913 (class 0 OID 14037675)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 14038142)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 14038154)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 14038177)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 14037700)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 14037511)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d1-a813-95f7-c440317519ca	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d1-a813-059d-f98b60a1598d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d1-a813-ce47-1df85545d14c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d1-a813-5dc0-76c0f6f99028	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d1-a813-5039-625fab061395	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d1-a813-cfaa-fa9814ecdf3c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d1-a813-0589-795e4c5af565	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d1-a813-2950-185b185683be	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d1-a813-cf01-4ea1e2f3ae45	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d1-a813-3a27-d8192075094b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d1-a813-b062-d1985187370f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d1-a813-6c6d-163935880ad9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d1-a813-887c-41cfbad64c74	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d1-a813-2f33-0975fad6b4aa	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d1-a814-5b85-ca95d5177fac	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d1-a814-5f9f-409c40f481d0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d1-a814-b400-824e29db5248	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d1-a814-d116-19396c2dfd71	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d1-a814-890e-2c167a4d805f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d1-a814-447d-719c42805b44	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 14037424)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d1-a814-9c96-aa1a602d6936	00000000-55d1-a814-5f9f-409c40f481d0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d1-a814-6299-75fdbb076bf0	00000000-55d1-a814-5f9f-409c40f481d0	00010000-55d1-a813-eb2b-394a6cebba73	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d1-a814-797d-002eb753eb31	00000000-55d1-a814-b400-824e29db5248	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 14037435)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d1-a814-4858-89726e9e2247	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d1-a814-d463-d239fd62912f	00010000-55d1-a814-f319-03b18f383db0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d1-a814-2846-146ca07841b8	00010000-55d1-a814-8286-ffaec72eb7bd	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d1-a814-580c-85bafad303fb	00010000-55d1-a814-6856-b1bb8d61e5a2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d1-a814-512d-9ade61fca7d7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d1-a814-7d3e-bf5427de7386	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d1-a814-9836-431ec65a8dbc	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d1-a814-8cf5-fd1bfc77794e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d1-a814-4a6b-80ba3bfe5b37	00010000-55d1-a814-4bef-6324d2a2c174	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d1-a814-9ba1-4e3641395d3c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d1-a814-5419-3f08625a1f2b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d1-a814-4da4-2aec049d33e5	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d1-a814-87de-ce6b640d0a50	00010000-55d1-a814-6fa0-9f7e66374c22	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 14037389)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d1-a812-6aa2-65739f8e0db7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d1-a812-8488-ce8c21d4954b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d1-a812-44d9-a6e9eb5d7f10	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d1-a812-f057-5c606e7b600d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d1-a812-7b20-3ed727374dc2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d1-a812-8673-e776ed510e0f	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d1-a812-f15a-fbea13a4c1f1	Abonma-read	Abonma - branje	f
00030000-55d1-a812-56f7-bf31c469ac91	Abonma-write	Abonma - spreminjanje	f
00030000-55d1-a812-397a-d05c159c2c5b	Alternacija-read	Alternacija - branje	f
00030000-55d1-a812-c1a9-0d45c49d0eba	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d1-a812-a1fa-a168c20d06f0	Arhivalija-read	Arhivalija - branje	f
00030000-55d1-a812-8a34-0fc58b7e623b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d1-a812-88d8-d78fc30b7f60	Besedilo-read	Besedilo - branje	f
00030000-55d1-a812-e57f-732657add6ae	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d1-a812-ff09-72dfefb0fec8	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d1-a812-c6a6-ebf269bc2f26	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d1-a812-63b2-5b022033cd67	Dogodek-read	Dogodek - branje	f
00030000-55d1-a812-97a0-9c602522d995	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d1-a812-5bed-d780a1328c49	DrugiVir-read	DrugiVir - branje	f
00030000-55d1-a812-bae4-9e97d8347396	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d1-a812-2a62-effdf4457257	Drzava-read	Drzava - branje	f
00030000-55d1-a812-ec96-9267c528c3ae	Drzava-write	Drzava - spreminjanje	f
00030000-55d1-a812-27e6-cff91c366501	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d1-a812-c4c8-7835f528b68c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d1-a812-94df-bf860a53961c	Funkcija-read	Funkcija - branje	f
00030000-55d1-a812-e4bc-7be095e12c84	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d1-a812-d9ff-0c30e91f77e7	Gostovanje-read	Gostovanje - branje	f
00030000-55d1-a812-6db3-cdd1923e1af3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d1-a812-d881-a5de74ae7250	Gostujoca-read	Gostujoca - branje	f
00030000-55d1-a812-f3cb-0bf3ccfca439	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d1-a812-b3f6-3394a8575250	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d1-a812-1884-e21bb2d6c685	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d1-a812-6acd-3db9437de156	Kupec-read	Kupec - branje	f
00030000-55d1-a812-e0cc-0d2f7d1c4fab	Kupec-write	Kupec - spreminjanje	f
00030000-55d1-a812-9563-340294b0419a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d1-a812-ed78-fef8edc7c6fd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d1-a812-7bb1-44cad23929a5	Option-read	Option - branje	f
00030000-55d1-a812-d41b-ec7e07098bc9	Option-write	Option - spreminjanje	f
00030000-55d1-a812-66d3-9a2346c343d0	OptionValue-read	OptionValue - branje	f
00030000-55d1-a812-9c8a-68f7ea37fadd	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d1-a812-d7af-66f257c3910a	Oseba-read	Oseba - branje	f
00030000-55d1-a812-7c95-12895c5667d8	Oseba-write	Oseba - spreminjanje	f
00030000-55d1-a812-4bec-4ee8caeae6e4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d1-a812-d0a9-375b3eb7aa81	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d1-a812-5387-1210dc421529	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d1-a812-da92-eb13c6bbc27c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d1-a812-cd22-e3e523dcd308	Pogodba-read	Pogodba - branje	f
00030000-55d1-a812-4aa6-dd09912bb5c0	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d1-a812-7152-1c6731a674cd	Popa-read	Popa - branje	f
00030000-55d1-a812-fb5d-926234f8a75d	Popa-write	Popa - spreminjanje	f
00030000-55d1-a812-39cb-c0354fe4f26d	Posta-read	Posta - branje	f
00030000-55d1-a812-827a-3b8f4ef4068d	Posta-write	Posta - spreminjanje	f
00030000-55d1-a812-99b1-50ba37e2d484	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d1-a812-7b63-a85780361b14	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d1-a812-03a3-ba6453d99862	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d1-a812-6162-8e2533da5522	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d1-a812-d6f2-e9956b97309e	Predstava-read	Predstava - branje	f
00030000-55d1-a812-6c34-0ff4e595b19f	Predstava-write	Predstava - spreminjanje	f
00030000-55d1-a812-20b0-755996d4dfe2	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d1-a812-2d0b-9ff14736e25a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d1-a812-b398-120dc1e3c91d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d1-a812-20f0-c22ab721b629	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d1-a812-187e-2c4cb179a308	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d1-a812-e7f5-ab599a3f51fb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d1-a812-3b2c-a6995933f052	ProgramDela-read	ProgramDela - branje	f
00030000-55d1-a812-5450-8d1ce1f99fb2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d1-a812-d7fb-8b02ab93d69a	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d1-a812-280b-073ef7002ad6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d1-a812-dd51-6d30ac50e231	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d1-a812-95db-532cb14e8e73	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d1-a812-e9e8-c31e15b31bf6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d1-a812-bd51-3fa8b714ab84	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d1-a812-84a5-b4c780de5132	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d1-a812-e2b0-3bc6f97ff37b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d1-a812-2a7c-fd24355f716f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d1-a812-0d0d-5d9e94f086e7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d1-a812-8aa6-38434211d300	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d1-a812-b103-4d536923b751	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d1-a812-5d31-8893e38a8c33	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d1-a812-cdc7-6915ce131d9f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d1-a812-9ec0-e4f915634b8b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d1-a812-e0b3-9450740bceb2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d1-a812-b55d-b08edcbbcf35	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d1-a812-b93b-889dde2836a0	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d1-a812-c614-482898c4d5ee	Prostor-read	Prostor - branje	f
00030000-55d1-a812-7cfd-9311670a1ee8	Prostor-write	Prostor - spreminjanje	f
00030000-55d1-a812-ef5f-6cf41af71495	Racun-read	Racun - branje	f
00030000-55d1-a812-4e27-3df6424658dd	Racun-write	Racun - spreminjanje	f
00030000-55d1-a812-687f-4c1c4fee33ee	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d1-a812-5e01-81f55c39a549	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d1-a812-e40e-683980667c8a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d1-a812-6ff7-6df0862e4d13	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d1-a812-236f-476d79d8ad78	Rekvizit-read	Rekvizit - branje	f
00030000-55d1-a812-e489-b2852e2ecbb9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d1-a812-9221-c690556ec945	Revizija-read	Revizija - branje	f
00030000-55d1-a812-dac3-0b318eed0f38	Revizija-write	Revizija - spreminjanje	f
00030000-55d1-a812-60c2-e74c6b18215a	Rezervacija-read	Rezervacija - branje	f
00030000-55d1-a812-0723-ac894862bb0e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d1-a812-3062-66272c15f1e6	SedezniRed-read	SedezniRed - branje	f
00030000-55d1-a812-cd42-e0e4b8ab62e6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d1-a812-cb3e-0c895758b81d	Sedez-read	Sedez - branje	f
00030000-55d1-a812-722d-9120e5eaaa1d	Sedez-write	Sedez - spreminjanje	f
00030000-55d1-a812-57b4-7e2546b7824f	Sezona-read	Sezona - branje	f
00030000-55d1-a812-a3a8-be103c1ce78a	Sezona-write	Sezona - spreminjanje	f
00030000-55d1-a812-4c7a-7c2e3642f42d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d1-a812-2a3c-9a43de38ac12	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d1-a812-e00e-f2580a91df3a	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d1-a812-7581-618be7d8a8aa	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d1-a812-4c6f-d224750a8d4d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d1-a812-696e-1e5c6e9592d0	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d1-a812-bf15-3b6a5026e518	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d1-a812-2e7d-fbe9ed964a6d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d1-a812-bb70-e283d43dc3bc	Telefonska-read	Telefonska - branje	f
00030000-55d1-a812-fec0-aba557aaf814	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d1-a812-721e-bb2be06d47f8	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d1-a812-0c8d-353e13b0fda2	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d1-a812-709b-813fd58401d7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d1-a812-c5b9-84af5ced7d3b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d1-a812-2d28-1be30c25393c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d1-a812-4128-dce96049015d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d1-a812-b9f3-c06bf47cef8e	Trr-read	Trr - branje	f
00030000-55d1-a812-d82f-37054703b71c	Trr-write	Trr - spreminjanje	f
00030000-55d1-a812-42a8-ce1408766a75	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d1-a812-893a-3f30f7ffab68	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d1-a812-838d-42611caec16a	Vaja-read	Vaja - branje	f
00030000-55d1-a812-94d6-84bcdc2464d9	Vaja-write	Vaja - spreminjanje	f
00030000-55d1-a812-27bd-aebe2be5430f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d1-a812-e09f-05e3906f4dff	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d1-a812-2a6b-f0065d33e54e	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d1-a812-cdb4-2f710d722fd2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d1-a812-d362-3acefbc40951	Zasedenost-read	Zasedenost - branje	f
00030000-55d1-a812-1e42-8cb53986c4f4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d1-a812-f5f3-b05daeaa4abc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d1-a812-71e2-2e013cea50d8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d1-a812-74c7-b1ea66290d56	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d1-a812-7bb0-564dd0e5d3ba	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d1-a812-d5fc-15e578831a3e	ClSkupina-write	Checkliste - urejanje skupin	f
00030000-55d1-a812-3a82-749b966c7d31	ClSkupina-read	Checkliste - branje skupin	f
00030000-55d1-a812-66ba-362594732b5e	ClSekcija-write	Checkliste - urejanje sekcij	f
00030000-55d1-a812-d3cb-aefab8017df5	ClSekcija-read	Checkliste - branje sekcij	f
00030000-55d1-a812-8750-73f69826e310	ClVzorec-write	Checkliste - urejanje glave chekcliste	f
00030000-55d1-a812-0a8d-0adcebc42b98	ClVzorec-read	Checkliste - branje checkliste	f
00030000-55d1-a812-de92-4e43a58f9112	ClVzorecPostavka-write	Checkliste - urejanje postavke chekcliste	f
00030000-55d1-a812-3705-68e0f9fb978e	ClVzorecPostavka-read	Checkliste - branje postavke checkliste	f
00030000-55d1-a812-3a25-b962a36c2d6f	ClPregled-write	Checkliste - Razpis checklist  - generično dovoljenje	f
00030000-55d1-a812-446b-13c8658cd41a	ClPregled-read	Checkliste - branje izpolnjenih checklist - generično dovoljenje	f
00030000-55d1-a812-c129-a1380a2192e0	ClVrednost-write	Checkliste - izpolnjevanje checklist - generični permission	f
00030000-55d1-a812-dba7-bbba74816f96	ClVrednost-read	Checkliste - branje vrednosti checkliste - generični permission	f
\.


--
-- TOC entry 2890 (class 0 OID 14037408)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d1-a813-9554-d08ac0dddceb	00030000-55d1-a812-8488-ce8c21d4954b
00020000-55d1-a813-f81e-c716953e22c8	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-f15a-fbea13a4c1f1
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-56f7-bf31c469ac91
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-397a-d05c159c2c5b
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-c1a9-0d45c49d0eba
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-a1fa-a168c20d06f0
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-63b2-5b022033cd67
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-f057-5c606e7b600d
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-97a0-9c602522d995
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-ec96-9267c528c3ae
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-94df-bf860a53961c
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-e4bc-7be095e12c84
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-d9ff-0c30e91f77e7
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-6db3-cdd1923e1af3
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-d881-a5de74ae7250
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-f3cb-0bf3ccfca439
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-b3f6-3394a8575250
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-1884-e21bb2d6c685
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-7bb1-44cad23929a5
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-66d3-9a2346c343d0
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-d7af-66f257c3910a
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-7c95-12895c5667d8
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-7152-1c6731a674cd
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-fb5d-926234f8a75d
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-39cb-c0354fe4f26d
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-827a-3b8f4ef4068d
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-03a3-ba6453d99862
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-6162-8e2533da5522
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-d6f2-e9956b97309e
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-6c34-0ff4e595b19f
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-187e-2c4cb179a308
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-e7f5-ab599a3f51fb
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-c614-482898c4d5ee
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-7cfd-9311670a1ee8
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-e40e-683980667c8a
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-6ff7-6df0862e4d13
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-236f-476d79d8ad78
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-e489-b2852e2ecbb9
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-57b4-7e2546b7824f
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-a3a8-be103c1ce78a
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-709b-813fd58401d7
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-42a8-ce1408766a75
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-893a-3f30f7ffab68
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-838d-42611caec16a
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-94d6-84bcdc2464d9
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-d362-3acefbc40951
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-1e42-8cb53986c4f4
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-f5f3-b05daeaa4abc
00020000-55d1-a813-5ead-fb3d700d0718	00030000-55d1-a812-74c7-b1ea66290d56
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-f15a-fbea13a4c1f1
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-a1fa-a168c20d06f0
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-63b2-5b022033cd67
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-d9ff-0c30e91f77e7
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-d881-a5de74ae7250
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-b3f6-3394a8575250
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-1884-e21bb2d6c685
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-7bb1-44cad23929a5
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-66d3-9a2346c343d0
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-d7af-66f257c3910a
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-7c95-12895c5667d8
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-7152-1c6731a674cd
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-39cb-c0354fe4f26d
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-03a3-ba6453d99862
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-6162-8e2533da5522
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-d6f2-e9956b97309e
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-c614-482898c4d5ee
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-e40e-683980667c8a
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-236f-476d79d8ad78
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-57b4-7e2546b7824f
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-bb70-e283d43dc3bc
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-fec0-aba557aaf814
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-b9f3-c06bf47cef8e
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-d82f-37054703b71c
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-2a6b-f0065d33e54e
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-cdb4-2f710d722fd2
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-f5f3-b05daeaa4abc
00020000-55d1-a813-29dc-b97b6ffb4f5c	00030000-55d1-a812-74c7-b1ea66290d56
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-f15a-fbea13a4c1f1
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-397a-d05c159c2c5b
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-a1fa-a168c20d06f0
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-8a34-0fc58b7e623b
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-88d8-d78fc30b7f60
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-ff09-72dfefb0fec8
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-63b2-5b022033cd67
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-94df-bf860a53961c
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-d9ff-0c30e91f77e7
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-d881-a5de74ae7250
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-b3f6-3394a8575250
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-7bb1-44cad23929a5
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-66d3-9a2346c343d0
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-d7af-66f257c3910a
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-7152-1c6731a674cd
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-39cb-c0354fe4f26d
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-d6f2-e9956b97309e
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-187e-2c4cb179a308
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-c614-482898c4d5ee
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-e40e-683980667c8a
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-236f-476d79d8ad78
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-57b4-7e2546b7824f
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-709b-813fd58401d7
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-838d-42611caec16a
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-d362-3acefbc40951
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-f5f3-b05daeaa4abc
00020000-55d1-a813-c90e-abc74d32b006	00030000-55d1-a812-74c7-b1ea66290d56
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-f15a-fbea13a4c1f1
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-56f7-bf31c469ac91
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-c1a9-0d45c49d0eba
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-a1fa-a168c20d06f0
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-63b2-5b022033cd67
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-d9ff-0c30e91f77e7
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-d881-a5de74ae7250
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-7bb1-44cad23929a5
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-66d3-9a2346c343d0
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-7152-1c6731a674cd
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-39cb-c0354fe4f26d
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-d6f2-e9956b97309e
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-c614-482898c4d5ee
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-e40e-683980667c8a
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-236f-476d79d8ad78
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-57b4-7e2546b7824f
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-709b-813fd58401d7
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-f5f3-b05daeaa4abc
00020000-55d1-a813-1b4d-2d379963d82e	00030000-55d1-a812-74c7-b1ea66290d56
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-f15a-fbea13a4c1f1
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-a1fa-a168c20d06f0
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-63b2-5b022033cd67
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-d9ff-0c30e91f77e7
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-d881-a5de74ae7250
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-7bb1-44cad23929a5
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-66d3-9a2346c343d0
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-7152-1c6731a674cd
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-39cb-c0354fe4f26d
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-d6f2-e9956b97309e
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-c614-482898c4d5ee
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-e40e-683980667c8a
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-236f-476d79d8ad78
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-57b4-7e2546b7824f
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-721e-bb2be06d47f8
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-44d9-a6e9eb5d7f10
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-709b-813fd58401d7
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-f5f3-b05daeaa4abc
00020000-55d1-a813-eebc-6404c5e006d9	00030000-55d1-a812-74c7-b1ea66290d56
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-6aa2-65739f8e0db7
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-8488-ce8c21d4954b
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-44d9-a6e9eb5d7f10
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-f057-5c606e7b600d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7b20-3ed727374dc2
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-8673-e776ed510e0f
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-f15a-fbea13a4c1f1
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-56f7-bf31c469ac91
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-397a-d05c159c2c5b
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-c1a9-0d45c49d0eba
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-a1fa-a168c20d06f0
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-8a34-0fc58b7e623b
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-88d8-d78fc30b7f60
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e57f-732657add6ae
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-ff09-72dfefb0fec8
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-c6a6-ebf269bc2f26
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-63b2-5b022033cd67
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-97a0-9c602522d995
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2a62-effdf4457257
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-ec96-9267c528c3ae
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-5bed-d780a1328c49
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-bae4-9e97d8347396
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-27e6-cff91c366501
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-c4c8-7835f528b68c
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-94df-bf860a53961c
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e4bc-7be095e12c84
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d9ff-0c30e91f77e7
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-6db3-cdd1923e1af3
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d881-a5de74ae7250
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-f3cb-0bf3ccfca439
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-b3f6-3394a8575250
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-1884-e21bb2d6c685
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-6acd-3db9437de156
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e0cc-0d2f7d1c4fab
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-9563-340294b0419a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-ed78-fef8edc7c6fd
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7bb1-44cad23929a5
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d41b-ec7e07098bc9
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-66d3-9a2346c343d0
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-9c8a-68f7ea37fadd
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d7af-66f257c3910a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7c95-12895c5667d8
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-4bec-4ee8caeae6e4
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d0a9-375b3eb7aa81
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-5387-1210dc421529
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-da92-eb13c6bbc27c
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-cd22-e3e523dcd308
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-4aa6-dd09912bb5c0
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7152-1c6731a674cd
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-fb5d-926234f8a75d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-39cb-c0354fe4f26d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-827a-3b8f4ef4068d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-99b1-50ba37e2d484
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7b63-a85780361b14
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-03a3-ba6453d99862
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-6162-8e2533da5522
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d6f2-e9956b97309e
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-6c34-0ff4e595b19f
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-20b0-755996d4dfe2
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2d0b-9ff14736e25a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-b398-120dc1e3c91d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-20f0-c22ab721b629
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-187e-2c4cb179a308
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e7f5-ab599a3f51fb
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-3b2c-a6995933f052
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-5450-8d1ce1f99fb2
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d7fb-8b02ab93d69a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-280b-073ef7002ad6
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-dd51-6d30ac50e231
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-95db-532cb14e8e73
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e9e8-c31e15b31bf6
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-bd51-3fa8b714ab84
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-84a5-b4c780de5132
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e2b0-3bc6f97ff37b
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2a7c-fd24355f716f
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-0d0d-5d9e94f086e7
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-8aa6-38434211d300
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-b103-4d536923b751
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-5d31-8893e38a8c33
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-cdc7-6915ce131d9f
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-9ec0-e4f915634b8b
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e0b3-9450740bceb2
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-b55d-b08edcbbcf35
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-b93b-889dde2836a0
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-c614-482898c4d5ee
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7cfd-9311670a1ee8
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-ef5f-6cf41af71495
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-4e27-3df6424658dd
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-687f-4c1c4fee33ee
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-5e01-81f55c39a549
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e40e-683980667c8a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-6ff7-6df0862e4d13
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-236f-476d79d8ad78
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e489-b2852e2ecbb9
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-9221-c690556ec945
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-dac3-0b318eed0f38
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-60c2-e74c6b18215a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-0723-ac894862bb0e
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-3062-66272c15f1e6
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-cd42-e0e4b8ab62e6
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-cb3e-0c895758b81d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-722d-9120e5eaaa1d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-57b4-7e2546b7824f
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-a3a8-be103c1ce78a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-4c7a-7c2e3642f42d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2a3c-9a43de38ac12
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e00e-f2580a91df3a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7581-618be7d8a8aa
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-4c6f-d224750a8d4d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-696e-1e5c6e9592d0
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-bf15-3b6a5026e518
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2e7d-fbe9ed964a6d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-bb70-e283d43dc3bc
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-fec0-aba557aaf814
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-721e-bb2be06d47f8
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-0c8d-353e13b0fda2
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-709b-813fd58401d7
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-c5b9-84af5ced7d3b
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2d28-1be30c25393c
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-4128-dce96049015d
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-b9f3-c06bf47cef8e
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d82f-37054703b71c
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-42a8-ce1408766a75
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-893a-3f30f7ffab68
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-838d-42611caec16a
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-94d6-84bcdc2464d9
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-27bd-aebe2be5430f
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-e09f-05e3906f4dff
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-2a6b-f0065d33e54e
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-cdb4-2f710d722fd2
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-d362-3acefbc40951
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-1e42-8cb53986c4f4
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-f5f3-b05daeaa4abc
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-71e2-2e013cea50d8
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-74c7-b1ea66290d56
00020000-55d1-a814-9b07-3ff674db3d30	00030000-55d1-a812-7bb0-564dd0e5d3ba
\.


--
-- TOC entry 2918 (class 0 OID 14037707)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 14037738)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 14037852)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d1-a814-c8f7-cb178714d97c	00090000-55d1-a814-4858-89726e9e2247	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d1-a814-30da-f643ea3e6ca0	00090000-55d1-a814-7d3e-bf5427de7386	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d1-a814-d8c1-71c6671b062b	00090000-55d1-a814-87de-ce6b640d0a50	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 14037468)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d1-a814-121a-07dbbd42967e	00040000-55d1-a812-1e7d-e6dff1305b5f	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-baaf-c27f281e2a59	00040000-55d1-a812-1e7d-e6dff1305b5f	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d1-a814-bee2-aaa4d68df70c	00040000-55d1-a812-1e7d-e6dff1305b5f	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-1021-a2699948f443	00040000-55d1-a812-1e7d-e6dff1305b5f	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-b403-f61756a33a3f	00040000-55d1-a812-1e7d-e6dff1305b5f	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-9a8b-065cf88da09c	00040000-55d1-a812-c6bf-4c618d56f445	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-63e9-a8a2fe219913	00040000-55d1-a812-dcc3-511b01e8097f	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-ea93-f976087898b7	00040000-55d1-a812-46e0-06d3bfaab617	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d1-a814-40e2-7eddbcab31c7	00040000-55d1-a812-1e7d-e6dff1305b5f	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 14037503)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d1-a813-5664-dbb6b69dbb90	8341	Adlešiči
00050000-55d1-a813-bd7e-0272ed1571c1	5270	Ajdovščina
00050000-55d1-a813-4ca1-5714df3d1358	6280	Ankaran/Ancarano
00050000-55d1-a813-9793-aa43d72bee00	9253	Apače
00050000-55d1-a813-a782-ea5091e6deeb	8253	Artiče
00050000-55d1-a813-68ac-1450aa8bd191	4275	Begunje na Gorenjskem
00050000-55d1-a813-b35c-8577267e2855	1382	Begunje pri Cerknici
00050000-55d1-a813-8cb7-04749a88cf01	9231	Beltinci
00050000-55d1-a813-510b-eacb65698eb5	2234	Benedikt
00050000-55d1-a813-fc83-130f5472ceb0	2345	Bistrica ob Dravi
00050000-55d1-a813-e78c-e9d8380ad5f0	3256	Bistrica ob Sotli
00050000-55d1-a813-aac8-f4894285e1ef	8259	Bizeljsko
00050000-55d1-a813-6600-07f574b5ce51	1223	Blagovica
00050000-55d1-a813-de28-b85dd3b610b4	8283	Blanca
00050000-55d1-a813-b0c8-d19a93d177f6	4260	Bled
00050000-55d1-a813-c065-3ea96d568ac0	4273	Blejska Dobrava
00050000-55d1-a813-9ac9-20b5a121addf	9265	Bodonci
00050000-55d1-a813-fdf8-687e29f75bc1	9222	Bogojina
00050000-55d1-a813-db37-380684dc3f6a	4263	Bohinjska Bela
00050000-55d1-a813-69cd-8ae2d304acf8	4264	Bohinjska Bistrica
00050000-55d1-a813-45ca-69682ba6859e	4265	Bohinjsko jezero
00050000-55d1-a813-47c8-f7188541ea84	1353	Borovnica
00050000-55d1-a813-48d3-817a6d377836	8294	Boštanj
00050000-55d1-a813-d4d8-b06e898eff0e	5230	Bovec
00050000-55d1-a813-1bec-b58c1b42ca51	5295	Branik
00050000-55d1-a813-130a-dafe18bcde89	3314	Braslovče
00050000-55d1-a813-2f88-14aa9c5c331e	5223	Breginj
00050000-55d1-a813-c254-0b1734b21282	8280	Brestanica
00050000-55d1-a813-808b-6a5d434dc26b	2354	Bresternica
00050000-55d1-a813-d7c2-020b5cbad91a	4243	Brezje
00050000-55d1-a813-f589-e163ca1e1254	1351	Brezovica pri Ljubljani
00050000-55d1-a813-25cd-37daea31d7ea	8250	Brežice
00050000-55d1-a813-6052-1c8142fbb094	4210	Brnik - Aerodrom
00050000-55d1-a813-9087-161cc557461c	8321	Brusnice
00050000-55d1-a813-bf02-e80fcc24416e	3255	Buče
00050000-55d1-a813-5d08-4c2ab10ce1a7	8276	Bučka 
00050000-55d1-a813-c879-32e1a1f2e617	9261	Cankova
00050000-55d1-a813-8e78-62af8489f17b	3000	Celje 
00050000-55d1-a813-caa2-a2a640d861c6	3001	Celje - poštni predali
00050000-55d1-a813-809b-0128e8fc8584	4207	Cerklje na Gorenjskem
00050000-55d1-a813-45c6-c990a06c7ced	8263	Cerklje ob Krki
00050000-55d1-a813-f567-90481a798753	1380	Cerknica
00050000-55d1-a813-fe66-b0a268d33677	5282	Cerkno
00050000-55d1-a813-c9db-3c16d2b469be	2236	Cerkvenjak
00050000-55d1-a813-c18c-2358fe5c69d7	2215	Ceršak
00050000-55d1-a813-9603-8719b1e72573	2326	Cirkovce
00050000-55d1-a813-185d-4de91a5109eb	2282	Cirkulane
00050000-55d1-a813-8ceb-a5780345ba72	5273	Col
00050000-55d1-a813-e22c-4c066a72533e	8251	Čatež ob Savi
00050000-55d1-a813-b2ed-3b1d51fc8a91	1413	Čemšenik
00050000-55d1-a813-3d64-37651c552cad	5253	Čepovan
00050000-55d1-a813-550b-cb706105d552	9232	Črenšovci
00050000-55d1-a813-e6e1-89a6a459a95e	2393	Črna na Koroškem
00050000-55d1-a813-e067-f92ae42b5bb7	6275	Črni Kal
00050000-55d1-a813-33c8-a7c88373a869	5274	Črni Vrh nad Idrijo
00050000-55d1-a813-0978-84200c161b69	5262	Črniče
00050000-55d1-a813-e734-18fe18023f71	8340	Črnomelj
00050000-55d1-a813-c3e0-8f498d80ca11	6271	Dekani
00050000-55d1-a813-a968-e05a831c8f37	5210	Deskle
00050000-55d1-a813-a08a-1af5115f7ad5	2253	Destrnik
00050000-55d1-a813-e177-e151ad5d04d5	6215	Divača
00050000-55d1-a813-72d8-3f4cacbc0426	1233	Dob
00050000-55d1-a813-86ce-cca567c20710	3224	Dobje pri Planini
00050000-55d1-a813-4cb8-4184815cfead	8257	Dobova
00050000-55d1-a813-19b1-d4d9e3e0bd56	1423	Dobovec
00050000-55d1-a813-5401-242847ba01c8	5263	Dobravlje
00050000-55d1-a813-c15f-4b0e6148160e	3204	Dobrna
00050000-55d1-a813-3c7a-bd28e8913f3d	8211	Dobrnič
00050000-55d1-a813-db51-19bcb88f5bac	1356	Dobrova
00050000-55d1-a813-57b2-699d0fad7b76	9223	Dobrovnik/Dobronak 
00050000-55d1-a813-768d-220be656f53d	5212	Dobrovo v Brdih
00050000-55d1-a813-1c49-480fab88c80d	1431	Dol pri Hrastniku
00050000-55d1-a813-59fb-9529f4c6194c	1262	Dol pri Ljubljani
00050000-55d1-a813-402f-a73a0a749442	1273	Dole pri Litiji
00050000-55d1-a813-1eb7-80b64ef4cba8	1331	Dolenja vas
00050000-55d1-a813-2821-45aca715ec4b	8350	Dolenjske Toplice
00050000-55d1-a813-3aed-91425fc87f99	1230	Domžale
00050000-55d1-a813-4920-1369746786bf	2252	Dornava
00050000-55d1-a813-c623-10d84f2ba211	5294	Dornberk
00050000-55d1-a813-44e2-c5d08081ee14	1319	Draga
00050000-55d1-a813-ec71-99abc35ecd84	8343	Dragatuš
00050000-55d1-a813-5987-927073fac473	3222	Dramlje
00050000-55d1-a813-81d7-3dc36305fff0	2370	Dravograd
00050000-55d1-a813-0144-5709aee69bdb	4203	Duplje
00050000-55d1-a813-743c-d972cf9d24a4	6221	Dutovlje
00050000-55d1-a813-070c-91d6f35c2728	8361	Dvor
00050000-55d1-a813-b266-eaba717fed92	2343	Fala
00050000-55d1-a813-3bcd-46d0e646af08	9208	Fokovci
00050000-55d1-a813-6f72-8b04de2fff0a	2313	Fram
00050000-55d1-a813-2a25-0eed46dff2c6	3213	Frankolovo
00050000-55d1-a813-df3d-aa9cce85241d	1274	Gabrovka
00050000-55d1-a813-126f-38f8a869fada	8254	Globoko
00050000-55d1-a813-0530-4d6269221171	5275	Godovič
00050000-55d1-a813-d60d-70f7fd06454f	4204	Golnik
00050000-55d1-a813-04e6-133ddef8cea2	3303	Gomilsko
00050000-55d1-a813-3cf8-7bc99de7cae7	4224	Gorenja vas
00050000-55d1-a813-9bbd-f77bbca9f308	3263	Gorica pri Slivnici
00050000-55d1-a813-05a8-9abbca5c5ae8	2272	Gorišnica
00050000-55d1-a813-769d-68080385eefe	9250	Gornja Radgona
00050000-55d1-a813-047e-b7d550fa3b76	3342	Gornji Grad
00050000-55d1-a813-b291-7514cab83a3f	4282	Gozd Martuljek
00050000-55d1-a813-ae4b-fd88abd0f2c5	6272	Gračišče
00050000-55d1-a813-514d-6430316590a8	9264	Grad
00050000-55d1-a813-d0ef-ffedf6ac7e63	8332	Gradac
00050000-55d1-a813-0208-28ec84a3aa6f	1384	Grahovo
00050000-55d1-a813-b882-5c77a02e469c	5242	Grahovo ob Bači
00050000-55d1-a813-359e-24f0edeabb8f	5251	Grgar
00050000-55d1-a813-c8df-0371263776d4	3302	Griže
00050000-55d1-a813-b5c6-b5bf8b19fabf	3231	Grobelno
00050000-55d1-a813-88db-2d8bf5a7ef66	1290	Grosuplje
00050000-55d1-a813-bc3f-83ba3cf781b0	2288	Hajdina
00050000-55d1-a813-3361-983cb656e8fb	8362	Hinje
00050000-55d1-a813-4d1d-4509ed1c70f4	2311	Hoče
00050000-55d1-a813-c922-a3ca1df59fce	9205	Hodoš/Hodos
00050000-55d1-a813-04a6-0d5dc4f5af2f	1354	Horjul
00050000-55d1-a813-64dd-1524b33c2c8c	1372	Hotedršica
00050000-55d1-a813-ce31-81808232f497	1430	Hrastnik
00050000-55d1-a813-97e6-38310654ee6a	6225	Hruševje
00050000-55d1-a813-9930-df5b26a9709a	4276	Hrušica
00050000-55d1-a813-9be2-61467d43b8f6	5280	Idrija
00050000-55d1-a813-464b-56ec01648cda	1292	Ig
00050000-55d1-a813-9e28-f8569375ca0f	6250	Ilirska Bistrica
00050000-55d1-a813-15f1-eb834e77af3d	6251	Ilirska Bistrica-Trnovo
00050000-55d1-a813-5934-bf0945a7f5c2	1295	Ivančna Gorica
00050000-55d1-a813-297f-8fdefe067d11	2259	Ivanjkovci
00050000-55d1-a813-aa38-4d664801f561	1411	Izlake
00050000-55d1-a813-436b-b023eddaf762	6310	Izola/Isola
00050000-55d1-a813-9d51-2275359e5266	2222	Jakobski Dol
00050000-55d1-a813-c576-6465209f9b7a	2221	Jarenina
00050000-55d1-a813-01fc-8791c810a960	6254	Jelšane
00050000-55d1-a813-24ca-4f80f9e4ad25	4270	Jesenice
00050000-55d1-a813-6d41-b499e7355892	8261	Jesenice na Dolenjskem
00050000-55d1-a813-36d3-5bd88d3324f3	3273	Jurklošter
00050000-55d1-a813-e0f6-8e3bfa948631	2223	Jurovski Dol
00050000-55d1-a813-68bc-8f0ffc62c1c7	2256	Juršinci
00050000-55d1-a813-0d6e-d6be3a0cce74	5214	Kal nad Kanalom
00050000-55d1-a813-5673-b4828fec7fb1	3233	Kalobje
00050000-55d1-a813-7406-ec6195bdd2d0	4246	Kamna Gorica
00050000-55d1-a813-f7fa-ee7d161cd73d	2351	Kamnica
00050000-55d1-a813-cf1a-3aec46fa8c10	1241	Kamnik
00050000-55d1-a813-5a83-eee1cf6952fc	5213	Kanal
00050000-55d1-a813-d87b-4f4996d19549	8258	Kapele
00050000-55d1-a813-1c0f-b1db8f8fb2f3	2362	Kapla
00050000-55d1-a813-a695-7e136164c8ed	2325	Kidričevo
00050000-55d1-a813-81fc-00d70885c0c5	1412	Kisovec
00050000-55d1-a813-8664-a950805f2585	6253	Knežak
00050000-55d1-a813-875c-8e39d27e37d9	5222	Kobarid
00050000-55d1-a813-bd26-af93a2341821	9227	Kobilje
00050000-55d1-a813-b981-a40546ac40c4	1330	Kočevje
00050000-55d1-a813-3725-4584820e6fdc	1338	Kočevska Reka
00050000-55d1-a813-6fe3-6541eddb67c8	2276	Kog
00050000-55d1-a813-24a4-5cbcc002529c	5211	Kojsko
00050000-55d1-a813-07f9-6b9df106829e	6223	Komen
00050000-55d1-a813-f771-8a039bb6da29	1218	Komenda
00050000-55d1-a813-4792-d687d1f82b77	6000	Koper/Capodistria 
00050000-55d1-a813-9394-7719e9cfd564	6001	Koper/Capodistria - poštni predali
00050000-55d1-a813-9798-1e21d2cddb3b	8282	Koprivnica
00050000-55d1-a813-0d3f-be1087f018c2	5296	Kostanjevica na Krasu
00050000-55d1-a813-b42c-9fe47e8ae768	8311	Kostanjevica na Krki
00050000-55d1-a813-607f-68762d002927	1336	Kostel
00050000-55d1-a813-79bb-7888b897a1dc	6256	Košana
00050000-55d1-a813-a89e-cceee06e9228	2394	Kotlje
00050000-55d1-a813-d05f-4bd1b70c3d00	6240	Kozina
00050000-55d1-a813-41b2-9c3210e0afa5	3260	Kozje
00050000-55d1-a813-c6e7-e1e42cb55109	4000	Kranj 
00050000-55d1-a813-6695-04c828e1a0d0	4001	Kranj - poštni predali
00050000-55d1-a813-1a0f-9cbd8db9272f	4280	Kranjska Gora
00050000-55d1-a813-0316-871679a83488	1281	Kresnice
00050000-55d1-a813-3eea-c48892dbc03e	4294	Križe
00050000-55d1-a813-355a-6070780618e3	9206	Križevci
00050000-55d1-a813-010b-fe59cfea8d9c	9242	Križevci pri Ljutomeru
00050000-55d1-a813-4b8b-d6da28132190	1301	Krka
00050000-55d1-a813-3ab5-20a6ce3b4734	8296	Krmelj
00050000-55d1-a813-69e7-74e8b6a83eb2	4245	Kropa
00050000-55d1-a813-87f1-beee0a3d9fe9	8262	Krška vas
00050000-55d1-a813-7263-5579c7ebfd56	8270	Krško
00050000-55d1-a813-a97b-a4f488aa9954	9263	Kuzma
00050000-55d1-a813-bf40-de420c99ad5b	2318	Laporje
00050000-55d1-a813-ddae-6aaed30feb88	3270	Laško
00050000-55d1-a813-c315-5c7c55cd343c	1219	Laze v Tuhinju
00050000-55d1-a813-3ad8-727b562bd8a4	2230	Lenart v Slovenskih goricah
00050000-55d1-a813-8fb0-ff89542a953c	9220	Lendava/Lendva
00050000-55d1-a813-56ef-de378713042c	4248	Lesce
00050000-55d1-a813-8b26-52aee360803d	3261	Lesično
00050000-55d1-a813-9236-32be65b23a74	8273	Leskovec pri Krškem
00050000-55d1-a813-db15-1fef71a0f9b4	2372	Libeliče
00050000-55d1-a813-e589-cb39f49cb9cb	2341	Limbuš
00050000-55d1-a813-3257-5130a0fbca08	1270	Litija
00050000-55d1-a813-75da-174b7ffcf76e	3202	Ljubečna
00050000-55d1-a813-5054-bebb74dbd7bc	1000	Ljubljana 
00050000-55d1-a813-a731-656c83b6948f	1001	Ljubljana - poštni predali
00050000-55d1-a813-5c09-311042d6dfd9	1231	Ljubljana - Črnuče
00050000-55d1-a813-bc29-4475c26e67a2	1261	Ljubljana - Dobrunje
00050000-55d1-a813-9e74-af50c3fee375	1260	Ljubljana - Polje
00050000-55d1-a813-418d-4bc424f50bb5	1210	Ljubljana - Šentvid
00050000-55d1-a813-71c8-53e72c5a009d	1211	Ljubljana - Šmartno
00050000-55d1-a813-1ae1-1358b4f1a695	3333	Ljubno ob Savinji
00050000-55d1-a813-efab-d83c15ef8027	9240	Ljutomer
00050000-55d1-a813-8990-d2bc48c664b7	3215	Loče
00050000-55d1-a813-d779-276e30b270e5	5231	Log pod Mangartom
00050000-55d1-a813-124c-7fcc727a9084	1358	Log pri Brezovici
00050000-55d1-a813-c2b2-fc36567e2d94	1370	Logatec
00050000-55d1-a813-9d27-e43c63eec74a	1371	Logatec
00050000-55d1-a813-ab0d-e0f658bb63c2	1434	Loka pri Zidanem Mostu
00050000-55d1-a813-dd79-2457ddd306e3	3223	Loka pri Žusmu
00050000-55d1-a813-e7c4-80ad3c74cccb	6219	Lokev
00050000-55d1-a813-eeb0-a50f4afc0b1d	1318	Loški Potok
00050000-55d1-a813-4af7-afc989d4f0f5	2324	Lovrenc na Dravskem polju
00050000-55d1-a813-8fc8-2ba1fe2c69c4	2344	Lovrenc na Pohorju
00050000-55d1-a813-3bc0-f1963aec2df5	3334	Luče
00050000-55d1-a813-fd7e-7be359d6b0fe	1225	Lukovica
00050000-55d1-a813-60ce-ec0460206488	9202	Mačkovci
00050000-55d1-a813-4868-0b019c9a0d3a	2322	Majšperk
00050000-55d1-a813-3b30-fa001f0253fa	2321	Makole
00050000-55d1-a813-24c3-bcd167f6e28b	9243	Mala Nedelja
00050000-55d1-a813-47c2-c76f56972a66	2229	Malečnik
00050000-55d1-a813-3f8b-f21dd0cbabe5	6273	Marezige
00050000-55d1-a813-db4a-00358f54bbb1	2000	Maribor 
00050000-55d1-a813-6a94-7454a691371d	2001	Maribor - poštni predali
00050000-55d1-a813-6d7a-dd043705ecad	2206	Marjeta na Dravskem polju
00050000-55d1-a813-1720-0ee83bcc72ef	2281	Markovci
00050000-55d1-a813-805a-3840f25418a9	9221	Martjanci
00050000-55d1-a813-1cb1-b1b1f3c41438	6242	Materija
00050000-55d1-a813-f109-03d9d9c54960	4211	Mavčiče
00050000-55d1-a813-86d4-dd8db6963cee	1215	Medvode
00050000-55d1-a813-26db-1e7551a9d2ff	1234	Mengeš
00050000-55d1-a813-2a57-b3f0f1e3112b	8330	Metlika
00050000-55d1-a813-1c33-b5a88fb5c1a4	2392	Mežica
00050000-55d1-a813-8794-646dd5201c89	2204	Miklavž na Dravskem polju
00050000-55d1-a813-07ff-d062df6eca23	2275	Miklavž pri Ormožu
00050000-55d1-a813-245a-269fadc97b30	5291	Miren
00050000-55d1-a813-b91f-47e936993035	8233	Mirna
00050000-55d1-a813-3925-3159f1b200e2	8216	Mirna Peč
00050000-55d1-a813-18cc-78dcd3a91c7e	2382	Mislinja
00050000-55d1-a813-dd30-f36f500dd0b0	4281	Mojstrana
00050000-55d1-a813-e7e0-0cbacda192ce	8230	Mokronog
00050000-55d1-a813-891a-4c44d53f0eff	1251	Moravče
00050000-55d1-a813-7a0f-fb6d02c24715	9226	Moravske Toplice
00050000-55d1-a813-ac7e-d632d9d25a64	5216	Most na Soči
00050000-55d1-a813-013b-c65a9da93c15	1221	Motnik
00050000-55d1-a813-9138-ff0a216cb997	3330	Mozirje
00050000-55d1-a813-4673-d8b038b70806	9000	Murska Sobota 
00050000-55d1-a813-a0af-b8ca8f844425	9001	Murska Sobota - poštni predali
00050000-55d1-a813-7883-d74d2213433a	2366	Muta
00050000-55d1-a813-bc2e-c5e68e701000	4202	Naklo
00050000-55d1-a813-12b8-d288114594f2	3331	Nazarje
00050000-55d1-a813-8590-050cabae4a3c	1357	Notranje Gorice
00050000-55d1-a813-cfc7-e7bc417d6b01	3203	Nova Cerkev
00050000-55d1-a813-2666-44241602ee59	5000	Nova Gorica 
00050000-55d1-a813-496b-70dc0d94890f	5001	Nova Gorica - poštni predali
00050000-55d1-a813-d324-5cd26ac199db	1385	Nova vas
00050000-55d1-a813-9f48-31fc01e34be5	8000	Novo mesto
00050000-55d1-a813-7711-66e40f0eff16	8001	Novo mesto - poštni predali
00050000-55d1-a813-ae15-d8b20de3e1c0	6243	Obrov
00050000-55d1-a813-2bec-debc07531393	9233	Odranci
00050000-55d1-a813-941a-3e725198ba84	2317	Oplotnica
00050000-55d1-a813-5390-77862a3f6a98	2312	Orehova vas
00050000-55d1-a813-6bdc-487a513c8beb	2270	Ormož
00050000-55d1-a813-9246-54abc5f2fd50	1316	Ortnek
00050000-55d1-a813-dfdd-aea91476557f	1337	Osilnica
00050000-55d1-a813-5bc7-0df050fb2f91	8222	Otočec
00050000-55d1-a813-3f47-9a149e2a559c	2361	Ožbalt
00050000-55d1-a813-e966-bbeb502949bb	2231	Pernica
00050000-55d1-a813-972d-5cbcf5be244f	2211	Pesnica pri Mariboru
00050000-55d1-a813-8a78-e130ab6e27dc	9203	Petrovci
00050000-55d1-a813-58c1-551b1403670a	3301	Petrovče
00050000-55d1-a813-a4c9-8657b6e8d4e8	6330	Piran/Pirano
00050000-55d1-a813-1d3c-fd1a82bdd8af	8255	Pišece
00050000-55d1-a813-55fb-ef66d9e84b32	6257	Pivka
00050000-55d1-a813-c729-c426d39d9671	6232	Planina
00050000-55d1-a813-c5f0-293a71181e62	3225	Planina pri Sevnici
00050000-55d1-a813-9f53-1d2795f4b9d6	6276	Pobegi
00050000-55d1-a813-27ef-ff1e35c4c67e	8312	Podbočje
00050000-55d1-a813-8a15-4032296e073e	5243	Podbrdo
00050000-55d1-a813-45c9-c9edc3eb6cee	3254	Podčetrtek
00050000-55d1-a813-bf40-9545f544323b	2273	Podgorci
00050000-55d1-a813-ed12-20a1c56af3d1	6216	Podgorje
00050000-55d1-a813-8442-b8954a10ebad	2381	Podgorje pri Slovenj Gradcu
00050000-55d1-a813-9c62-5ba3e9654e0f	6244	Podgrad
00050000-55d1-a813-5aaa-266e319e0c54	1414	Podkum
00050000-55d1-a813-d29a-d8814e2a173d	2286	Podlehnik
00050000-55d1-a813-7389-69951f737337	5272	Podnanos
00050000-55d1-a813-a81a-11565cb88607	4244	Podnart
00050000-55d1-a813-f30d-8e50c64953e4	3241	Podplat
00050000-55d1-a813-98f4-458dec0698d6	3257	Podsreda
00050000-55d1-a813-df59-b438fdb9015d	2363	Podvelka
00050000-55d1-a813-b295-8f5b029afa1e	2208	Pohorje
00050000-55d1-a813-f8fa-9b7b5625e0fe	2257	Polenšak
00050000-55d1-a813-c916-7a71dfcdaf43	1355	Polhov Gradec
00050000-55d1-a813-82aa-a33a914b05e0	4223	Poljane nad Škofjo Loko
00050000-55d1-a813-2f8b-a32994f94081	2319	Poljčane
00050000-55d1-a813-7459-264525402780	1272	Polšnik
00050000-55d1-a813-bd0b-35ddf0f7ad46	3313	Polzela
00050000-55d1-a813-51c8-02eaacf765aa	3232	Ponikva
00050000-55d1-a813-e50f-a0d46b20cad4	6320	Portorož/Portorose
00050000-55d1-a813-332a-719d7c27a3f0	6230	Postojna
00050000-55d1-a813-14e4-be0a152b21f1	2331	Pragersko
00050000-55d1-a813-e686-417ac2b1fb4c	3312	Prebold
00050000-55d1-a813-9083-e4e54c1bd14f	4205	Preddvor
00050000-55d1-a813-fc0b-df5434aba2c9	6255	Prem
00050000-55d1-a813-2337-69485c66a221	1352	Preserje
00050000-55d1-a813-0520-9ae3d2541097	6258	Prestranek
00050000-55d1-a813-8eaf-b91731bda137	2391	Prevalje
00050000-55d1-a813-b5d8-4907386fc0d1	3262	Prevorje
00050000-55d1-a813-9e81-6868db5775d7	1276	Primskovo 
00050000-55d1-a813-bf6e-01e3111872d9	3253	Pristava pri Mestinju
00050000-55d1-a813-1592-533b3be0cc39	9207	Prosenjakovci/Partosfalva
00050000-55d1-a813-ca5f-0695fe2994bd	5297	Prvačina
00050000-55d1-a813-e82f-f3346f8ff14c	2250	Ptuj
00050000-55d1-a813-4e09-c2ba33377476	2323	Ptujska Gora
00050000-55d1-a813-9683-e1bba44391eb	9201	Puconci
00050000-55d1-a813-665d-a258e8b20b81	2327	Rače
00050000-55d1-a813-be12-262c0d90099e	1433	Radeče
00050000-55d1-a813-3f5f-5b67f9112d22	9252	Radenci
00050000-55d1-a813-b987-ba18509b23d6	2360	Radlje ob Dravi
00050000-55d1-a813-4a68-3613026b7300	1235	Radomlje
00050000-55d1-a813-de90-e467f324edef	4240	Radovljica
00050000-55d1-a813-8eef-d9f932928f2d	8274	Raka
00050000-55d1-a813-d038-f4f4cdd12b96	1381	Rakek
00050000-55d1-a813-7166-5ee6abdb3f2f	4283	Rateče - Planica
00050000-55d1-a813-3ae1-f640fea65828	2390	Ravne na Koroškem
00050000-55d1-a813-28ba-d86c09f99ddd	9246	Razkrižje
00050000-55d1-a813-710c-31f318762e32	3332	Rečica ob Savinji
00050000-55d1-a813-d8a4-78a5309b9906	5292	Renče
00050000-55d1-a813-85dc-d1d316a415c0	1310	Ribnica
00050000-55d1-a813-7bfc-acb6a307fead	2364	Ribnica na Pohorju
00050000-55d1-a813-f360-61f671aab70f	3272	Rimske Toplice
00050000-55d1-a813-1bba-745c56075e2f	1314	Rob
00050000-55d1-a813-af91-e9adf6543d2d	5215	Ročinj
00050000-55d1-a813-9264-e35f88ec68ba	3250	Rogaška Slatina
00050000-55d1-a813-8cdf-a8563c7cf82b	9262	Rogašovci
00050000-55d1-a813-1d1d-4778ebf5a0e6	3252	Rogatec
00050000-55d1-a813-21a0-2ec4346b96ca	1373	Rovte
00050000-55d1-a813-1361-acf7d766611c	2342	Ruše
00050000-55d1-a813-b6ea-165f70b1da7f	1282	Sava
00050000-55d1-a813-85f6-d87e95e7f38d	6333	Sečovlje/Sicciole
00050000-55d1-a813-cc33-b8c7c834d35d	4227	Selca
00050000-55d1-a813-a736-99adff926968	2352	Selnica ob Dravi
00050000-55d1-a813-3b02-518aa73ad3e3	8333	Semič
00050000-55d1-a813-05b6-68c4dedf8e19	8281	Senovo
00050000-55d1-a813-92a3-c58de3c4a02f	6224	Senožeče
00050000-55d1-a813-a992-faf867cba01f	8290	Sevnica
00050000-55d1-a813-d644-5f04ab75a9ee	6210	Sežana
00050000-55d1-a813-8a5a-2f64368011d4	2214	Sladki Vrh
00050000-55d1-a813-ab45-982b44ce92eb	5283	Slap ob Idrijci
00050000-55d1-a813-0be2-c21e02410269	2380	Slovenj Gradec
00050000-55d1-a813-1212-b0c63253697b	2310	Slovenska Bistrica
00050000-55d1-a813-a6f5-465aa1eb141e	3210	Slovenske Konjice
00050000-55d1-a813-349c-91a55f13aaaa	1216	Smlednik
00050000-55d1-a813-3211-d6f9e741d747	5232	Soča
00050000-55d1-a813-70fa-315e94fe317d	1317	Sodražica
00050000-55d1-a813-7b8a-db09eaf5671b	3335	Solčava
00050000-55d1-a813-4a45-5027e1cd435b	5250	Solkan
00050000-55d1-a813-87d0-a5a637026368	4229	Sorica
00050000-55d1-a813-e419-d176e7363518	4225	Sovodenj
00050000-55d1-a813-9858-6f97d76b4cf5	5281	Spodnja Idrija
00050000-55d1-a813-3d3f-a339192cd461	2241	Spodnji Duplek
00050000-55d1-a813-36a6-b208f1b49cf6	9245	Spodnji Ivanjci
00050000-55d1-a813-742e-f38a9133117a	2277	Središče ob Dravi
00050000-55d1-a813-3b99-8cddab31e684	4267	Srednja vas v Bohinju
00050000-55d1-a813-9dd3-4fde92e5e89d	8256	Sromlje 
00050000-55d1-a813-9e62-933d0a84227a	5224	Srpenica
00050000-55d1-a813-83cb-8a65e498731d	1242	Stahovica
00050000-55d1-a813-ad43-df43e8c899ba	1332	Stara Cerkev
00050000-55d1-a813-f202-1e21f8b81fdc	8342	Stari trg ob Kolpi
00050000-55d1-a813-6f6e-c33891e1b371	1386	Stari trg pri Ložu
00050000-55d1-a813-c298-f7ff246069d2	2205	Starše
00050000-55d1-a813-8940-b3ef27aa05ed	2289	Stoperce
00050000-55d1-a813-327a-37e9f256e4e5	8322	Stopiče
00050000-55d1-a813-d392-76d5430962f7	3206	Stranice
00050000-55d1-a813-3f1b-ae5c1f2e49f7	8351	Straža
00050000-55d1-a813-e53f-e421a450b33c	1313	Struge
00050000-55d1-a813-0442-c56d3946acd9	8293	Studenec
00050000-55d1-a813-9cf9-184b682124e7	8331	Suhor
00050000-55d1-a813-bbbf-e8b61f6a8831	2233	Sv. Ana v Slovenskih goricah
00050000-55d1-a813-dfca-cafd384acdc2	2235	Sv. Trojica v Slovenskih goricah
00050000-55d1-a813-9ee4-d4b1a20b9b05	2353	Sveti Duh na Ostrem Vrhu
00050000-55d1-a813-803b-28d1ec121215	9244	Sveti Jurij ob Ščavnici
00050000-55d1-a813-b68e-6a458b93787f	3264	Sveti Štefan
00050000-55d1-a813-7aa2-1154810ff332	2258	Sveti Tomaž
00050000-55d1-a813-a21e-8e3a11ee9889	9204	Šalovci
00050000-55d1-a813-617a-19965c32a50f	5261	Šempas
00050000-55d1-a813-83c0-3f4bf3802912	5290	Šempeter pri Gorici
00050000-55d1-a813-a853-c3bc815afad3	3311	Šempeter v Savinjski dolini
00050000-55d1-a813-7704-411e55eb3b97	4208	Šenčur
00050000-55d1-a813-71bf-3045c34b3b35	2212	Šentilj v Slovenskih goricah
00050000-55d1-a813-4d1f-efe65ec37ca7	8297	Šentjanž
00050000-55d1-a813-2788-e30b3b4a861a	2373	Šentjanž pri Dravogradu
00050000-55d1-a813-0b9d-f99951d9800d	8310	Šentjernej
00050000-55d1-a813-d770-4be9793bbd19	3230	Šentjur
00050000-55d1-a813-ea13-b4c9dedb804c	3271	Šentrupert
00050000-55d1-a813-c3ce-7af4d938e371	8232	Šentrupert
00050000-55d1-a813-a6d0-1ba60ba1f3e0	1296	Šentvid pri Stični
00050000-55d1-a813-87e6-8ad91f00000a	8275	Škocjan
00050000-55d1-a813-9264-fbfe330de444	6281	Škofije
00050000-55d1-a813-9494-4faec0d8203c	4220	Škofja Loka
00050000-55d1-a813-f6c5-7553ed3a3bd6	3211	Škofja vas
00050000-55d1-a813-d393-7f658638c6b9	1291	Škofljica
00050000-55d1-a813-8b57-3da665b98b0d	6274	Šmarje
00050000-55d1-a813-e071-cd1eb89ccab9	1293	Šmarje - Sap
00050000-55d1-a813-8579-9c613470152c	3240	Šmarje pri Jelšah
00050000-55d1-a813-adbe-0a97fa52c1b0	8220	Šmarješke Toplice
00050000-55d1-a813-119a-af5e7a7716e9	2315	Šmartno na Pohorju
00050000-55d1-a813-cecb-f27730732fdb	3341	Šmartno ob Dreti
00050000-55d1-a813-5c95-9c33becf2d6d	3327	Šmartno ob Paki
00050000-55d1-a813-fa8d-de7c36f0811e	1275	Šmartno pri Litiji
00050000-55d1-a813-f7f4-0bcc12f57a0c	2383	Šmartno pri Slovenj Gradcu
00050000-55d1-a813-e36c-00877d391db5	3201	Šmartno v Rožni dolini
00050000-55d1-a813-d626-817966211960	3325	Šoštanj
00050000-55d1-a813-8f6d-6f4d0096099c	6222	Štanjel
00050000-55d1-a813-a934-60640ed0abb3	3220	Štore
00050000-55d1-a813-aa0c-0a746776e8a8	3304	Tabor
00050000-55d1-a813-3202-82735b184903	3221	Teharje
00050000-55d1-a813-74f1-5e606828ba5c	9251	Tišina
00050000-55d1-a813-57cb-f02ebf7a1877	5220	Tolmin
00050000-55d1-a813-499d-3a1af714205b	3326	Topolšica
00050000-55d1-a813-48e7-06e457c6221c	2371	Trbonje
00050000-55d1-a813-d2af-c010b24a1726	1420	Trbovlje
00050000-55d1-a813-b2d4-0e1bcca30db2	8231	Trebelno 
00050000-55d1-a813-ea38-9bb678df1b1e	8210	Trebnje
00050000-55d1-a813-fbad-77d4c66efc7c	5252	Trnovo pri Gorici
00050000-55d1-a813-2624-9835e20a011c	2254	Trnovska vas
00050000-55d1-a813-1261-32e6134d3e41	1222	Trojane
00050000-55d1-a813-e91c-b1ad9abcc094	1236	Trzin
00050000-55d1-a813-63b4-29c902b555aa	4290	Tržič
00050000-55d1-a813-ccf8-58216d57b872	8295	Tržišče
00050000-55d1-a813-1a9c-b356ad021612	1311	Turjak
00050000-55d1-a813-44bd-b0e4cf2d60cb	9224	Turnišče
00050000-55d1-a813-c0f4-ea70d0704a17	8323	Uršna sela
00050000-55d1-a813-83aa-61f19d5e85ac	1252	Vače
00050000-55d1-a813-5774-8e56b29bec0e	3320	Velenje 
00050000-55d1-a813-42e5-bb5ed8e53557	3322	Velenje - poštni predali
00050000-55d1-a813-fc1e-76c11f1860cb	8212	Velika Loka
00050000-55d1-a813-c164-99c26ccc3216	2274	Velika Nedelja
00050000-55d1-a813-26dc-1b711d50f4ee	9225	Velika Polana
00050000-55d1-a813-2608-51b3498d2352	1315	Velike Lašče
00050000-55d1-a813-22d1-f37e51654862	8213	Veliki Gaber
00050000-55d1-a813-284b-59bb4392b283	9241	Veržej
00050000-55d1-a813-b33b-2575a028e155	1312	Videm - Dobrepolje
00050000-55d1-a813-351f-f8099bd347c2	2284	Videm pri Ptuju
00050000-55d1-a813-2c2e-24ed3a5b0aa5	8344	Vinica
00050000-55d1-a813-868a-dcd781bea71c	5271	Vipava
00050000-55d1-a813-b14d-9a1b72b29680	4212	Visoko
00050000-55d1-a813-9f11-3d5a459268d5	1294	Višnja Gora
00050000-55d1-a813-3913-bb9e1a86fb28	3205	Vitanje
00050000-55d1-a813-5fe3-9f1593b2e9e0	2255	Vitomarci
00050000-55d1-a813-1771-b5ec8df79d71	1217	Vodice
00050000-55d1-a813-ac4d-16106df87103	3212	Vojnik\t
00050000-55d1-a813-4beb-eb6bd5ed447b	5293	Volčja Draga
00050000-55d1-a813-fcf5-f1aed13d6442	2232	Voličina
00050000-55d1-a813-db95-9867f7fad629	3305	Vransko
00050000-55d1-a813-56eb-9a03d9c17736	6217	Vremski Britof
00050000-55d1-a813-1d0a-f9db36599595	1360	Vrhnika
00050000-55d1-a813-a6ef-d9de3df91492	2365	Vuhred
00050000-55d1-a813-ed13-ef6398ae9530	2367	Vuzenica
00050000-55d1-a813-2924-aa8653241dad	8292	Zabukovje 
00050000-55d1-a813-852a-b8495287c427	1410	Zagorje ob Savi
00050000-55d1-a813-f164-a18188c9735b	1303	Zagradec
00050000-55d1-a813-7b56-eb4795415cf3	2283	Zavrč
00050000-55d1-a813-bc23-08bfe3c31809	8272	Zdole 
00050000-55d1-a813-153e-f0cbdb5d733a	4201	Zgornja Besnica
00050000-55d1-a813-d2a2-e8bba14e61db	2242	Zgornja Korena
00050000-55d1-a813-a039-13074afc5133	2201	Zgornja Kungota
00050000-55d1-a813-3a58-b468ef6ecc7a	2316	Zgornja Ložnica
00050000-55d1-a813-c56d-ac62dd9a1ac3	2314	Zgornja Polskava
00050000-55d1-a813-258f-96d96b43a143	2213	Zgornja Velka
00050000-55d1-a813-f02b-bdf9105e751a	4247	Zgornje Gorje
00050000-55d1-a813-6413-aef44a254659	4206	Zgornje Jezersko
00050000-55d1-a813-dba5-fdee01a06c46	2285	Zgornji Leskovec
00050000-55d1-a813-98b8-9c994e2191bf	1432	Zidani Most
00050000-55d1-a813-ae9d-4217e9037ae6	3214	Zreče
00050000-55d1-a813-4082-cae90c236ce2	4209	Žabnica
00050000-55d1-a813-4952-e87210159789	3310	Žalec
00050000-55d1-a813-d211-39572e764427	4228	Železniki
00050000-55d1-a813-298f-c8098ea66dea	2287	Žetale
00050000-55d1-a813-2dec-2f99564df5c5	4226	Žiri
00050000-55d1-a813-c60b-5e03d4e54371	4274	Žirovnica
00050000-55d1-a813-c068-dae8a624c554	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 14037681)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 14037488)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 14037566)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 14037693)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 14038024)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 14038034)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d1-a814-3804-5f923e46d1ea	00080000-55d1-a814-40e2-7eddbcab31c7	0900	AK
00190000-55d1-a814-a53a-85405bea410e	00080000-55d1-a814-bee2-aaa4d68df70c	0987	AK
00190000-55d1-a814-26fa-6f02a29fcd26	00080000-55d1-a814-baaf-c27f281e2a59	0989	AK
00190000-55d1-a814-9a96-652f12169fa1	00080000-55d1-a814-1021-a2699948f443	0986	AK
00190000-55d1-a814-588a-96edb3dbe5ae	00080000-55d1-a814-9a8b-065cf88da09c	0984	AK
00190000-55d1-a814-7259-0551c6fa0906	00080000-55d1-a814-63e9-a8a2fe219913	0983	AK
00190000-55d1-a814-cd4d-160a0373b13c	00080000-55d1-a814-ea93-f976087898b7	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 14037980)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d1-a814-a44d-57665d47a665	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 14038042)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 14037722)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d1-a814-8378-d824e10c987b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d1-a814-f07d-3b1e22221feb	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d1-a814-645c-c0294b43cf1f	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d1-a814-ffdb-7029b30d6cbe	0004	Mali oder	t	24	Mali oder 
00220000-55d1-a814-4bff-31bf4f9e4025	0005	Komorni oder	t	15	Komorni oder
00220000-55d1-a814-830e-9872cf7de893	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d1-a814-fa0d-6f43db2e5344	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 14037666)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 14037656)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 14037841)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 14037790)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 14037360)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2921 (class 0 OID 14037732)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 14037398)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d1-a813-9554-d08ac0dddceb	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d1-a813-f81e-c716953e22c8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d1-a813-7060-006e82086cd5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d1-a813-8947-f3d350eedec6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d1-a813-5ead-fb3d700d0718	planer	Planer dogodkov v koledarju	t
00020000-55d1-a813-29dc-b97b6ffb4f5c	kadrovska	Kadrovska služba	t
00020000-55d1-a813-c90e-abc74d32b006	arhivar	Ažuriranje arhivalij	t
00020000-55d1-a813-1b4d-2d379963d82e	igralec	Igralec	t
00020000-55d1-a813-eebc-6404c5e006d9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d1-a814-9b07-3ff674db3d30	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 14037382)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d1-a813-eb2b-394a6cebba73	00020000-55d1-a813-7060-006e82086cd5
00010000-55d1-a813-f4fd-f0ce8b654897	00020000-55d1-a813-7060-006e82086cd5
00010000-55d1-a814-9999-7e34e08a9546	00020000-55d1-a814-9b07-3ff674db3d30
\.


--
-- TOC entry 2923 (class 0 OID 14037746)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 14037687)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 14037633)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 14038083)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d1-a813-36c0-c887ef6fe0b0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d1-a813-fd61-abbfbab1d8c3	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d1-a813-b4e8-a4a68bdef3d1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d1-a813-8a21-9a98d2b26ec5	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d1-a813-a0fb-da773110567b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 14038075)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d1-a813-66bd-d9da769babc2	00230000-55d1-a813-8a21-9a98d2b26ec5	popa
00240000-55d1-a813-a1d3-8e97ad57e291	00230000-55d1-a813-8a21-9a98d2b26ec5	oseba
00240000-55d1-a813-e8b8-6a996afb8e02	00230000-55d1-a813-8a21-9a98d2b26ec5	sezona
00240000-55d1-a813-f27d-06a448c94c82	00230000-55d1-a813-fd61-abbfbab1d8c3	prostor
00240000-55d1-a813-6e0c-0dcad552c2f5	00230000-55d1-a813-8a21-9a98d2b26ec5	besedilo
00240000-55d1-a813-d0dd-66e12426616d	00230000-55d1-a813-8a21-9a98d2b26ec5	uprizoritev
00240000-55d1-a813-2b2f-b6ce9f0470e8	00230000-55d1-a813-8a21-9a98d2b26ec5	funkcija
00240000-55d1-a813-2286-f34571b2f722	00230000-55d1-a813-8a21-9a98d2b26ec5	tipfunkcije
00240000-55d1-a813-7a97-be12f051202b	00230000-55d1-a813-8a21-9a98d2b26ec5	alternacija
00240000-55d1-a813-fdd3-40ec2e8c94c7	00230000-55d1-a813-36c0-c887ef6fe0b0	pogodba
00240000-55d1-a813-82e5-ac8c1ce46af3	00230000-55d1-a813-8a21-9a98d2b26ec5	zaposlitev
00240000-55d1-a813-72ca-c3580fc52200	00230000-55d1-a813-36c0-c887ef6fe0b0	programdela
00240000-55d1-a813-596e-f62a22e62cba	00230000-55d1-a813-8a21-9a98d2b26ec5	zapis
\.


--
-- TOC entry 2944 (class 0 OID 14038070)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 14037800)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d1-a814-d212-d45c7fe44fb2	000e0000-55d1-a814-e50b-158cc6bf11e7	00080000-55d1-a814-121a-07dbbd42967e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d1-a814-cb1d-982c440fe7ae	000e0000-55d1-a814-e50b-158cc6bf11e7	00080000-55d1-a814-121a-07dbbd42967e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d1-a814-a46b-2eaf8f47e681	000e0000-55d1-a814-e50b-158cc6bf11e7	00080000-55d1-a814-b403-f61756a33a3f	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55d1-a814-ae2b-83505b48ba75	000e0000-55d1-a814-e50b-158cc6bf11e7	00080000-55d1-a814-b403-f61756a33a3f	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 14037460)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 14037643)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d1-a814-d23a-7c28631a0355	00180000-55d1-a814-bdc2-35dd00afb9e5	000c0000-55d1-a814-018f-e66a076d6427	00090000-55d1-a814-4a6b-80ba3bfe5b37	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d1-a814-e641-64dcb36b3611	00180000-55d1-a814-bdc2-35dd00afb9e5	000c0000-55d1-a814-2b58-19dda463c7c8	00090000-55d1-a814-9ba1-4e3641395d3c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d1-a814-a71e-75c5c4e58ca2	00180000-55d1-a814-bdc2-35dd00afb9e5	000c0000-55d1-a814-632f-f19a7f20af2c	00090000-55d1-a814-2846-146ca07841b8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d1-a814-b1d7-34faaeb313cc	00180000-55d1-a814-bdc2-35dd00afb9e5	000c0000-55d1-a814-2e87-2108c80c13a5	00090000-55d1-a814-d463-d239fd62912f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d1-a814-993e-1559e4a1832e	00180000-55d1-a814-bdc2-35dd00afb9e5	000c0000-55d1-a814-9570-b7f148552deb	00090000-55d1-a814-4da4-2aec049d33e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d1-a814-8a16-fcb4d897d505	00180000-55d1-a814-083b-c17e588fd81f	\N	00090000-55d1-a814-4da4-2aec049d33e5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 14037830)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d1-a813-c12d-eae6fea95d43	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d1-a813-80df-08700be60424	Priredba	Priredba	Priredba	umetnik
000f0000-55d1-a813-07e8-854a51d5e780	Prevod	Prevod	Prevod	umetnik
000f0000-55d1-a813-c28e-e5f624883638	Režija	Režija	Režija	umetnik
000f0000-55d1-a813-c7c7-3cffd4f95753	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d1-a813-d6e4-589200b8e3ab	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55d1-a813-e767-2f76aabaf00c	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55d1-a813-daa0-aa050d3a12be	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d1-a813-9778-76596fb09e2f	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55d1-a813-f8fa-3c6d0332c4cc	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55d1-a813-b72c-ad10d974758d	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d1-a813-481c-cacf0f46cfa8	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d1-a813-4d93-ce00559471a7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55d1-a813-6c11-70c37987ef8e	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55d1-a813-3d59-46e8c6d51fe3	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d1-a813-fd74-c6e968304946	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d1-a813-2df9-418b7e84fac4	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d1-a813-fe05-405b635e480c	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 14038052)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d1-a813-bfcf-a7b4a661e694	01	Velika predstava	f	1.00	1.00
002b0000-55d1-a813-d607-9b6db25c1578	02	Mala predstava	f	0.50	0.50
002b0000-55d1-a813-8015-867ebbd886e5	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d1-a813-47f9-cf160e60d235	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d1-a813-8d9c-94e086edd379	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 14037523)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 14037369)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d1-a813-f4fd-f0ce8b654897	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROm2Bg1G6.R2yxNWK3eXme059IOBEdlbu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d1-a814-8286-ffaec72eb7bd	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d1-a814-f319-03b18f383db0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d1-a814-4bef-6324d2a2c174	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d1-a814-6fa0-9f7e66374c22	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d1-a814-6856-b1bb8d61e5a2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d1-a814-d51b-63307f8f77a7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d1-a814-c354-76822f801e56	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d1-a814-204b-a9d4c0e5b63a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d1-a814-a5b5-150e2d3a03a3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d1-a814-9999-7e34e08a9546	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d1-a813-eb2b-394a6cebba73	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 14037878)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d1-a814-8f79-a445ee877f3c	00160000-55d1-a814-ad2e-baf25debafdd	00150000-55d1-a813-a594-97829d8e9378	00140000-55d1-a812-ef84-5535c58bb4aa	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d1-a814-4bff-31bf4f9e4025
000e0000-55d1-a814-e50b-158cc6bf11e7	00160000-55d1-a814-1f02-cbca1ec2d9ad	00150000-55d1-a813-c73d-bb9ce4c0c6f7	00140000-55d1-a812-43e5-eef89913677d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d1-a814-830e-9872cf7de893
000e0000-55d1-a814-7a45-91fd8f782b44	\N	00150000-55d1-a813-c73d-bb9ce4c0c6f7	00140000-55d1-a812-43e5-eef89913677d	00190000-55d1-a814-a53a-85405bea410e	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d1-a814-4bff-31bf4f9e4025
000e0000-55d1-a814-5a3a-a0ddd90dc619	\N	00150000-55d1-a813-c73d-bb9ce4c0c6f7	00140000-55d1-a812-43e5-eef89913677d	00190000-55d1-a814-a53a-85405bea410e	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d1-a814-4bff-31bf4f9e4025
000e0000-55d1-a814-b101-4c8418e05e6e	\N	00150000-55d1-a813-c73d-bb9ce4c0c6f7	00140000-55d1-a812-43e5-eef89913677d	00190000-55d1-a814-a53a-85405bea410e	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d1-a814-8378-d824e10c987b
000e0000-55d1-a814-3154-d5a5bb4e961e	\N	00150000-55d1-a813-c73d-bb9ce4c0c6f7	00140000-55d1-a812-43e5-eef89913677d	00190000-55d1-a814-a53a-85405bea410e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d1-a814-8378-d824e10c987b
\.


--
-- TOC entry 2904 (class 0 OID 14037585)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d1-a814-86db-d7fc345b2d1d	000e0000-55d1-a814-e50b-158cc6bf11e7	1	
00200000-55d1-a814-6f0b-fcc54110ac4f	000e0000-55d1-a814-e50b-158cc6bf11e7	2	
\.


--
-- TOC entry 2919 (class 0 OID 14037714)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 14038122)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 14038094)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 14038134)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 14037783)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d1-a814-3e05-6efd5dbd9947	00090000-55d1-a814-9ba1-4e3641395d3c	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d1-a814-9d97-ad0a6c0d26f4	00090000-55d1-a814-2846-146ca07841b8	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d1-a814-9181-fd448d28a6ce	00090000-55d1-a814-8cf5-fd1bfc77794e	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d1-a814-17dd-59105a607d1b	00090000-55d1-a814-580c-85bafad303fb	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d1-a814-1e4a-21fa14acb6d1	00090000-55d1-a814-4a6b-80ba3bfe5b37	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d1-a814-5674-976d9847470d	00090000-55d1-a814-9836-431ec65a8dbc	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 14037617)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 14037868)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d1-a812-ef84-5535c58bb4aa	01	Drama	drama (SURS 01)
00140000-55d1-a812-f4ec-f34d10bbc136	02	Opera	opera (SURS 02)
00140000-55d1-a812-6ce1-05a5fc56b74f	03	Balet	balet (SURS 03)
00140000-55d1-a812-4d86-4d42dd41fd7e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d1-a812-63d5-aaf590ac915e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d1-a812-43e5-eef89913677d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d1-a812-fb41-f414c29b2ed8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 14037773)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d1-a813-027c-b1c4aacbdc71	01	Opera	opera
00150000-55d1-a813-8cfa-dbba1be5e4d4	02	Opereta	opereta
00150000-55d1-a813-8fe1-0593847eb380	03	Balet	balet
00150000-55d1-a813-1cf7-4fd554007086	04	Plesne prireditve	plesne prireditve
00150000-55d1-a813-ed34-e377dc39f81b	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d1-a813-16a8-6812b38ff3f6	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d1-a813-af49-cca13d0efcd6	07	Biografska drama	biografska drama
00150000-55d1-a813-a594-97829d8e9378	08	Komedija	komedija
00150000-55d1-a813-fbaf-77d16439935d	09	Črna komedija	črna komedija
00150000-55d1-a813-3b58-292218118587	10	E-igra	E-igra
00150000-55d1-a813-c73d-bb9ce4c0c6f7	11	Kriminalka	kriminalka
00150000-55d1-a813-e1d7-1b39b80a6e40	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 14037423)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 14037925)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 14037915)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 14037829)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 14038175)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 14037607)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 14037632)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 14038068)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 14037549)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 14037974)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 14037769)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 14037583)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 14037626)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 14037563)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 14037679)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 14038151)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 14038158)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 14038183)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 14037706)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 14037521)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 14037432)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 14037456)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 14037412)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 14037397)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 14037712)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 14037745)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 14037863)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 14037485)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 14037509)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 14037685)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 14037499)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 14037570)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 14037697)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 14038031)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 14038039)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 14038022)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 14038050)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 14037729)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 14037670)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 14037661)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 14037851)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 14037797)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 14037368)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 14037736)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 14037386)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 14037406)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 14037754)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 14037692)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 14037641)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 14038092)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 14038080)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 14038074)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 14037810)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 14037465)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 14037652)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 14037840)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 14038062)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 14037534)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 14037381)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 14037894)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 14037592)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 14037720)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 14038132)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 14038116)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 14038140)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 14037788)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 14037621)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 14037876)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 14037781)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 14037614)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 14037811)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 14037812)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 14038153)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 14038152)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 14037487)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 14037713)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 14038120)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 14038119)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 14038121)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 14038118)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 14038117)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 14037699)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 14037698)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 14037593)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 14037770)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 14037772)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 14037771)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 14037565)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 14037564)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 14038051)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 14037865)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 14037866)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 14037867)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 14038141)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 14037899)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 14037896)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 14037900)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 14037898)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 14037897)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 14037536)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 14037535)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 14037459)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 14037737)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 14037627)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 14037413)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 14037414)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 14037757)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 14037756)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 14037755)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 14037571)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 14037573)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 14037572)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 14038082)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 14037665)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 14037663)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 14037662)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 14037664)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 14037387)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 14037388)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 14037721)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 14038176)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 14038184)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 14038185)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 14037686)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 14037798)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 14037799)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 14037979)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 14037978)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 14037975)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 14037976)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 14037977)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 14037501)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 14037500)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 14037502)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 14038032)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 14038033)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 14037929)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 14037930)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 14037927)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 14037928)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 14037789)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 14037674)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 14037673)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 14037671)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 14037672)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 14037917)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 14037916)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 14038023)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 14037584)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 14038069)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 14038159)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 14038160)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 14037434)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 14037433)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 14037466)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 14037467)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 14037655)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 14037654)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 14037653)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 14037616)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 14037612)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 14037609)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 14037610)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 14037608)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 14037613)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 14037611)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 14037486)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 14037550)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 14037552)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 14037551)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 14037553)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 14037680)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 14037864)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 14037895)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 14037457)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 14037458)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 14037782)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 14038093)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 14037522)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 14038081)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 14037731)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 14037730)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 14037926)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 14037510)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 14037877)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 14038133)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 14038040)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 14038041)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 14037642)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 14037407)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 14037615)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2705 (class 2606 OID 14038321)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2702 (class 2606 OID 14038306)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2703 (class 2606 OID 14038311)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2707 (class 2606 OID 14038331)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2701 (class 2606 OID 14038301)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2706 (class 2606 OID 14038326)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 14038316)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2736 (class 2606 OID 14038476)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2737 (class 2606 OID 14038481)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 14038651)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2770 (class 2606 OID 14038646)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 14038236)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 14038416)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2767 (class 2606 OID 14038631)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 14038626)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2768 (class 2606 OID 14038636)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 14038621)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2764 (class 2606 OID 14038616)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2723 (class 2606 OID 14038411)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2722 (class 2606 OID 14038406)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 14038296)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 14038446)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 14038456)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 14038451)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2695 (class 2606 OID 14038271)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 14038266)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 14038396)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 14038601)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2738 (class 2606 OID 14038486)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 14038491)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2740 (class 2606 OID 14038496)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 14038641)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2744 (class 2606 OID 14038516)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2741 (class 2606 OID 14038501)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2745 (class 2606 OID 14038521)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 14038511)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2742 (class 2606 OID 14038506)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2693 (class 2606 OID 14038261)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 14038256)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 14038221)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2684 (class 2606 OID 14038216)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 14038426)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 14038336)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 14038196)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2681 (class 2606 OID 14038201)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2729 (class 2606 OID 14038441)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 14038436)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2727 (class 2606 OID 14038431)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2696 (class 2606 OID 14038276)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 14038286)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 14038281)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 14038611)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2715 (class 2606 OID 14038371)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2713 (class 2606 OID 14038361)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2712 (class 2606 OID 14038356)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2714 (class 2606 OID 14038366)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2678 (class 2606 OID 14038186)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2679 (class 2606 OID 14038191)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 14038421)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 14038666)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 14038671)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2776 (class 2606 OID 14038676)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 14038401)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2734 (class 2606 OID 14038466)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2735 (class 2606 OID 14038471)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 14038576)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2755 (class 2606 OID 14038571)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2752 (class 2606 OID 14038556)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 14038561)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 14038566)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 14038246)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 14038241)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 14038251)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2758 (class 2606 OID 14038586)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2759 (class 2606 OID 14038591)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2750 (class 2606 OID 14038546)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2751 (class 2606 OID 14038551)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2748 (class 2606 OID 14038536)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2749 (class 2606 OID 14038541)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 14038461)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2719 (class 2606 OID 14038391)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2718 (class 2606 OID 14038386)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2716 (class 2606 OID 14038376)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2717 (class 2606 OID 14038381)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2747 (class 2606 OID 14038531)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 14038526)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 14038581)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 14038291)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 14038596)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 14038606)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2772 (class 2606 OID 14038656)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2773 (class 2606 OID 14038661)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2683 (class 2606 OID 14038211)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 14038206)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2686 (class 2606 OID 14038226)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 14038231)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 14038351)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 14038346)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2709 (class 2606 OID 14038341)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-17 11:23:33 CEST

--
-- PostgreSQL database dump complete
--

