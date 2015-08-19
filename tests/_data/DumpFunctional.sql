--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-19 14:28:05 CEST

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
-- TOC entry 177 (class 1259 OID 14946810)
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
-- TOC entry 222 (class 1259 OID 14947313)
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
-- TOC entry 221 (class 1259 OID 14947296)
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
-- TOC entry 215 (class 1259 OID 14947208)
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
-- TOC entry 238 (class 1259 OID 14947556)
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
-- TOC entry 191 (class 1259 OID 14946989)
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
-- TOC entry 194 (class 1259 OID 14947023)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 14947458)
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
-- TOC entry 186 (class 1259 OID 14946932)
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
-- TOC entry 223 (class 1259 OID 14947326)
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
-- TOC entry 210 (class 1259 OID 14947153)
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
-- TOC entry 189 (class 1259 OID 14946969)
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
-- TOC entry 193 (class 1259 OID 14947017)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 14946949)
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
-- TOC entry 199 (class 1259 OID 14947070)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 14947537)
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
-- TOC entry 237 (class 1259 OID 14947549)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 14947571)
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
-- TOC entry 203 (class 1259 OID 14947095)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 14946906)
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
-- TOC entry 178 (class 1259 OID 14946819)
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
-- TOC entry 179 (class 1259 OID 14946830)
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
-- TOC entry 174 (class 1259 OID 14946784)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 14946803)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 14947102)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 14947133)
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
-- TOC entry 218 (class 1259 OID 14947247)
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
-- TOC entry 181 (class 1259 OID 14946863)
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
-- TOC entry 183 (class 1259 OID 14946898)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 14947076)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 14946883)
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
-- TOC entry 188 (class 1259 OID 14946961)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 14947088)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 14947419)
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
-- TOC entry 226 (class 1259 OID 14947429)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 14947375)
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
-- TOC entry 227 (class 1259 OID 14947437)
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
-- TOC entry 206 (class 1259 OID 14947117)
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
-- TOC entry 198 (class 1259 OID 14947061)
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
-- TOC entry 197 (class 1259 OID 14947051)
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
-- TOC entry 217 (class 1259 OID 14947236)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 14947185)
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
-- TOC entry 171 (class 1259 OID 14946755)
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
-- TOC entry 170 (class 1259 OID 14946753)
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
-- TOC entry 207 (class 1259 OID 14947127)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 14946793)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 14946777)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 14947141)
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
-- TOC entry 201 (class 1259 OID 14947082)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 14947028)
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
-- TOC entry 232 (class 1259 OID 14947478)
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
-- TOC entry 231 (class 1259 OID 14947470)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 14947465)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 14947195)
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
-- TOC entry 180 (class 1259 OID 14946855)
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
-- TOC entry 196 (class 1259 OID 14947038)
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
-- TOC entry 216 (class 1259 OID 14947225)
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
-- TOC entry 228 (class 1259 OID 14947447)
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
-- TOC entry 185 (class 1259 OID 14946918)
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
-- TOC entry 172 (class 1259 OID 14946764)
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
-- TOC entry 220 (class 1259 OID 14947273)
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
-- TOC entry 190 (class 1259 OID 14946980)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 14947109)
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
-- TOC entry 234 (class 1259 OID 14947517)
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
-- TOC entry 233 (class 1259 OID 14947489)
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
-- TOC entry 235 (class 1259 OID 14947529)
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
-- TOC entry 212 (class 1259 OID 14947178)
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
-- TOC entry 192 (class 1259 OID 14947012)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 14947263)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 14947168)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 14946758)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2890 (class 0 OID 14946810)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 14947313)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d4-7654-3b14-197324f95f61	000d0000-55d4-7654-32f3-477c2316c6f0	\N	00090000-55d4-7654-dbdc-0cc84f5d2247	000b0000-55d4-7654-a2a6-5f9d8590d977	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d4-7654-d5a8-5e9a2d95efe4	000d0000-55d4-7654-9713-7ad34a929ac1	00100000-55d4-7654-db5a-bd5374967b8b	00090000-55d4-7654-910b-6c3d9e68754f	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d4-7654-1e2d-18f87a44f51b	000d0000-55d4-7654-8541-5f790de99751	00100000-55d4-7654-d733-62b15887841c	00090000-55d4-7654-ef20-d82326cde72f	\N	0003	t	\N	2015-08-19	\N	2	\N	\N	f	f
000c0000-55d4-7654-def7-39af1b425bac	000d0000-55d4-7654-65c1-9eaaca20ee7d	\N	00090000-55d4-7654-3b81-cb9bad09d6a6	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d4-7654-3313-1a3941418229	000d0000-55d4-7654-893a-cd29567942b1	\N	00090000-55d4-7654-a238-322558a9f0f1	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d4-7654-7e55-2bf6ca490f23	000d0000-55d4-7654-1918-fd78ee8f0435	\N	00090000-55d4-7654-f3c1-479f994a9bf2	000b0000-55d4-7654-4579-8b86fced7658	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d4-7654-4228-ece290384ba0	000d0000-55d4-7654-52c8-08d31b05158e	00100000-55d4-7654-7bf2-30df707168ac	00090000-55d4-7654-47bf-cb4f25c117f6	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d4-7654-0851-62cfae6d0898	000d0000-55d4-7654-9061-fb473169f6b8	\N	00090000-55d4-7654-a597-2052fd12885e	000b0000-55d4-7654-b14a-5607be899834	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d4-7654-334f-8a809064096c	000d0000-55d4-7654-52c8-08d31b05158e	00100000-55d4-7654-a28c-4f3a9bbefaac	00090000-55d4-7654-fd45-27c7addc3a59	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d4-7654-ddac-f4f514e0cfb6	000d0000-55d4-7654-52c8-08d31b05158e	00100000-55d4-7654-3fe2-1790d30a87de	00090000-55d4-7654-b84e-e0b4c76f123a	\N	0010	t	\N	2015-08-19	\N	16	\N	\N	f	t
000c0000-55d4-7654-df38-794b42da1616	000d0000-55d4-7654-52c8-08d31b05158e	00100000-55d4-7654-9af1-51936eddfc3d	00090000-55d4-7654-2b45-a0ea50053848	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2934 (class 0 OID 14947296)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 14947208)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d4-7654-ea1d-61df24ef258d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d4-7654-aa95-ebbe1dc83819	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d4-7654-7a5c-2c540b731c5c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2951 (class 0 OID 14947556)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 14946989)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d4-7654-d025-81bbd6e68a86	\N	\N	00200000-55d4-7654-66e2-5d91f3ca8db6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d4-7654-b7f5-13299da09741	\N	\N	00200000-55d4-7654-9dd5-66b40ae2d3db	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d4-7654-b5a8-3ddfb23bffb1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d4-7654-2979-0d89da5a7562	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d4-7654-d05c-0afbd29585ed	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2907 (class 0 OID 14947023)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 14947458)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 14946932)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d4-7652-6e40-1e60dcbe553b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d4-7652-5b42-9073833d8948	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d4-7652-a183-c6e29c9586cc	AL	ALB	008	Albania 	Albanija	\N
00040000-55d4-7652-615a-02efc4e2aa4b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d4-7652-4e49-e7ffbcb82e48	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d4-7652-96a5-2811150ee003	AD	AND	020	Andorra 	Andora	\N
00040000-55d4-7652-fa2d-00915324b8d7	AO	AGO	024	Angola 	Angola	\N
00040000-55d4-7652-80fb-97ee032536bf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d4-7652-162e-6d486bebd582	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d4-7652-2962-17623d5371a6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d4-7652-abb7-530f4dd1f7a9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d4-7652-b83b-85920cb5a314	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d4-7652-f21b-2138bacfef2a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d4-7652-fc89-157365363d2f	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d4-7652-f897-5044d7ee964f	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d4-7652-ee3f-86bd1048458c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d4-7652-620f-2c1a9e404fab	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d4-7652-36d5-73069e8d97d9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d4-7652-c2e5-fabc449eea27	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d4-7652-e3fb-d6ce4d149355	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d4-7652-be05-6d2201331648	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d4-7652-b22b-b34c45d5e876	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d4-7652-a85c-e69c05d381a8	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d4-7652-39ed-938dcb10edc4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d4-7652-fab1-c16f9a41638f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d4-7652-07ad-feadeae14635	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d4-7652-24a1-e6acb7a003c1	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d4-7652-415d-a860b0ceb2ce	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d4-7652-32e4-033b68eb9cd4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d4-7652-6953-667885171612	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d4-7652-a164-a54b63cac851	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d4-7652-b3b4-d5cffb8ea5fb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d4-7652-be97-dac19418cd0e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d4-7652-8bdc-fc1de0c0a5c1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d4-7652-0543-12703238e138	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d4-7652-2310-2e2f20136d6f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d4-7652-02a8-b8a5256bb472	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d4-7652-3970-a57dfd3f0bb2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d4-7652-a944-43fd969acb71	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d4-7652-c43f-1f6376b57d1c	CA	CAN	124	Canada 	Kanada	\N
00040000-55d4-7652-a85c-ee7a4b99105e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d4-7652-26bb-185f322ffb2d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d4-7652-451f-037229fbb47f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d4-7652-562a-a8ceebf5ad3c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d4-7652-93a2-7e1e0467ef05	CL	CHL	152	Chile 	Čile	\N
00040000-55d4-7652-e2f5-ad15d0a94c81	CN	CHN	156	China 	Kitajska	\N
00040000-55d4-7652-236d-1204614e2eb6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d4-7652-ae01-37be14ac15f9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d4-7652-a96a-c60f11f91dfb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d4-7652-d5aa-ac95d0653eef	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d4-7652-c9a0-bcfb362a0265	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d4-7652-731a-fd8fe0103cd2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d4-7652-7f8f-bc2f65cf00df	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d4-7652-b85f-470374460db4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d4-7652-c265-f000144ac99b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d4-7652-6b9d-30d6df7a3bfa	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d4-7652-4bd2-b792f4d092bb	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d4-7652-8dc9-02773a0504ed	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d4-7652-80bf-a44c75714ec2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d4-7652-c9b5-a15e8e0eea4a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d4-7652-36ed-cf70ac049cea	DK	DNK	208	Denmark 	Danska	\N
00040000-55d4-7652-6db1-e2ca197a5e3f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d4-7652-d6f3-a029f85ecdab	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d4-7652-bef5-5c78edfe1930	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d4-7652-9bed-ab23b7947a16	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d4-7652-14e4-b8efeb112c32	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d4-7652-f6e8-5c4e04ece80c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d4-7652-e944-4da46783bd10	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d4-7652-371c-e119379c6cdb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d4-7652-61e3-0aaac7ad9b1f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d4-7652-2ff5-db3c77481bfe	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d4-7652-1154-54a0964ee284	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d4-7652-28f5-c87e67f2b2e3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d4-7652-65cf-b9cd6f728f0c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d4-7652-8390-eaad6c2186c2	FI	FIN	246	Finland 	Finska	\N
00040000-55d4-7652-3be3-2a6790ac2e84	FR	FRA	250	France 	Francija	\N
00040000-55d4-7652-16f3-392a7934ba61	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d4-7653-4ece-29985c41b109	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d4-7652-f7ef-1a530d74f981	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d4-7652-e55c-f1a5ba832567	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d4-7652-08c5-00db35ef6767	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d4-7652-e60f-eb4f289c9021	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d4-7652-995c-220fb83c7e68	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d4-7652-ba65-83a966ebd939	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d4-7652-bd9c-983afc82896a	GH	GHA	288	Ghana 	Gana	\N
00040000-55d4-7652-139d-a0ae2af57abc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d4-7652-9a51-cc34f0e70a72	GR	GRC	300	Greece 	Grčija	\N
00040000-55d4-7652-f060-35a8446e3c40	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d4-7652-ee4f-3bcecc91bc75	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d4-7652-b20a-76b3853cb9d9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d4-7652-3a40-6f89e9adec37	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d4-7652-897e-b82f619be65a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d4-7652-1367-864f5e6f3e4a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d4-7652-fa08-43c09a8e24ab	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d4-7652-2067-668f02d86178	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d4-7652-4428-6a675e6a4afa	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d4-7652-17ae-7f5d36c33d75	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d4-7652-c39f-a0fd89731b08	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d4-7652-81b4-0ae0e34a1390	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d4-7652-c46f-4b597cc82814	HN	HND	340	Honduras 	Honduras	\N
00040000-55d4-7652-00d8-4d4d3f203a87	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d4-7652-049b-2096cfcebe54	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d4-7652-a751-cdbbb3320dde	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d4-7652-dddc-4a184439b0de	IN	IND	356	India 	Indija	\N
00040000-55d4-7652-66d5-d8bc78a4f60e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d4-7652-208f-894e28ddb693	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d4-7652-12bf-12dac6e166c1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d4-7652-13a4-5712bd3a4c98	IE	IRL	372	Ireland 	Irska	\N
00040000-55d4-7652-8d78-7ffff4f6212d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d4-7652-7b0c-e94daf4455d2	IL	ISR	376	Israel 	Izrael	\N
00040000-55d4-7652-8455-af14dd5d145e	IT	ITA	380	Italy 	Italija	\N
00040000-55d4-7652-202a-788b4db5684d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d4-7652-eefb-6bc473566df9	JP	JPN	392	Japan 	Japonska	\N
00040000-55d4-7652-03ed-3e20264a04f7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d4-7652-7a30-cf6285843da5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d4-7652-ec0e-f7291839255a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d4-7652-bc23-0ead6f8a630b	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d4-7652-3493-0ebcce356040	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d4-7652-54d9-03ffcb44332b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d4-7652-c230-083e199330b3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d4-7652-37ed-a0bfe7d947d6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d4-7652-af01-16a3e9c153f4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d4-7652-50bb-8961f8040494	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d4-7652-0417-afa8809d41a4	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d4-7652-7e5e-db1648e54c04	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d4-7652-f64f-a533b54f1d47	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d4-7652-0365-5ab1f784e51d	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d4-7652-9ec3-0680e116fc94	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d4-7652-f741-dcbdb60b794d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d4-7652-95f1-21e23859e7c3	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d4-7652-02a5-31bbd6adf707	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d4-7652-eb65-4c0391bd41cb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d4-7652-7500-4ef21ffb1f72	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d4-7652-a81f-509c3fc3102c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d4-7652-7a3f-751030c694be	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d4-7652-9a55-0a35e1ef1d4a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d4-7652-76fa-a9774577fb06	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d4-7652-c762-71d5293c2ddb	ML	MLI	466	Mali 	Mali	\N
00040000-55d4-7652-8d79-858c5ee1b63a	MT	MLT	470	Malta 	Malta	\N
00040000-55d4-7652-46fb-d1c5bf847ebd	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d4-7652-2215-a070a0fe4d94	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d4-7652-9b22-dcb0af22f773	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d4-7653-15f4-3f28a9b2449c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d4-7653-b8e6-4411766ed9a2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d4-7653-f21f-cef1939e5878	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d4-7653-00b7-346cfee0047c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d4-7653-4a04-44d372fd8e04	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d4-7653-3dda-dbf404a42a55	MC	MCO	492	Monaco 	Monako	\N
00040000-55d4-7653-39e3-98c056194e5a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d4-7653-afc7-7009a301b64e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d4-7653-6adf-2fbda7b05fbe	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d4-7653-4135-5f953797ae20	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d4-7653-fb19-4a5895e978da	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d4-7653-ea5e-a10c3aa89762	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d4-7653-1fd3-c00b2db650e6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d4-7653-8224-40e78722c0d9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d4-7653-1ef3-c0d122147221	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d4-7653-9408-2856f1a432bc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d4-7653-aaf8-9b7e8cd3a40c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d4-7653-f880-0b56b9b6367f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d4-7653-b298-f2e9203b2163	NE	NER	562	Niger 	Niger 	\N
00040000-55d4-7653-4c31-5508856b45a6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d4-7653-02ec-94b4895366ce	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d4-7653-2bae-f82442c3ffa9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d4-7653-a8bc-73256e34c377	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d4-7653-d232-1179b8a0ad8c	NO	NOR	578	Norway 	Norveška	\N
00040000-55d4-7653-8843-4f649ae7d8c7	OM	OMN	512	Oman 	Oman	\N
00040000-55d4-7653-5758-db1431f1961a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d4-7653-d46a-c10cbea054af	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d4-7653-7839-dd10ccae3f7b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d4-7653-77b7-072296372e94	PA	PAN	591	Panama 	Panama	\N
00040000-55d4-7653-a1fb-23b5570e2353	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d4-7653-e3cd-2e335ed6b92a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d4-7653-a31c-d925705b6820	PE	PER	604	Peru 	Peru	\N
00040000-55d4-7653-3dcc-64a94fd9e562	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d4-7653-6921-becaf6785e52	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d4-7653-f628-3dee8531c52c	PL	POL	616	Poland 	Poljska	\N
00040000-55d4-7653-85a4-a235e5ace1b6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d4-7653-92a3-75230db446c5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d4-7653-232f-b4f9ce4bb0e1	QA	QAT	634	Qatar 	Katar	\N
00040000-55d4-7653-fb10-8cc65846b59b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d4-7653-0ac0-f984e67d66ad	RO	ROU	642	Romania 	Romunija	\N
00040000-55d4-7653-ba04-b8996091d3c4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d4-7653-c946-cc34d4975fb7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d4-7653-757a-e3d89757e5d9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d4-7653-650f-51423aee411b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d4-7653-2db8-6cc6f55894a5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d4-7653-75ed-c2a6a072e3bd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d4-7653-cfff-c15eeca3eb91	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d4-7653-15b5-62c1c1e38cec	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d4-7653-d3fa-1142a5f46da3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d4-7653-c785-d18cb44f6088	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d4-7653-d6f5-0da23f74a11a	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d4-7653-ec7f-d285cb34bca1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d4-7653-8ba9-86d9e99452ce	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d4-7653-56f6-098100392d28	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d4-7653-d193-27c2ecc50959	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d4-7653-5e3a-09471cac1752	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d4-7653-0748-8021db5841c9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d4-7653-9ae3-d9699770790c	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d4-7653-f2c8-ad7714df7487	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d4-7653-34ff-309d07c22488	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d4-7653-9715-1197fd247cb4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d4-7653-48b4-73b9b282198a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d4-7653-78ca-2f6b79aed700	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d4-7653-0a11-bf155ad67bf2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d4-7653-3b48-74bbdd06982c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d4-7653-fc3e-c14882b39ddc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d4-7653-3b88-b6811a4a2395	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d4-7653-ff92-57d1db11f314	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d4-7653-b8e3-47854a91fa42	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d4-7653-2575-ae91cee55fdb	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d4-7653-4e3b-6062f016d2ea	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d4-7653-34e6-134f8d71c251	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d4-7653-d6c0-1d51745005b8	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d4-7653-cd95-e794d7032fc5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d4-7653-4bd4-412064216217	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d4-7653-9ea5-c88dce11144b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d4-7653-164f-e1b4ac954f27	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d4-7653-2d34-84219bb6f3b3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d4-7653-048c-879ee4fbcec4	TH	THA	764	Thailand 	Tajska	\N
00040000-55d4-7653-38b9-6e2e17b00635	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d4-7653-d464-071944f86e25	TG	TGO	768	Togo 	Togo	\N
00040000-55d4-7653-5750-2f98967ffbde	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d4-7653-895b-f590a00a619f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d4-7653-ad7b-d48d3970559e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d4-7653-5ad1-0a10b10793be	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d4-7653-f60a-2f663fb749b3	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d4-7653-c95b-9abd14eda25e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d4-7653-d90b-9c667c3198ae	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d4-7653-72a1-0d62d46777fc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d4-7653-240b-14c2385857c7	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d4-7653-1b54-0ebe4058c84d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d4-7653-a942-4685d63d0c61	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d4-7653-437a-1c58b33582b8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d4-7653-8359-0e9e6c21de9e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d4-7653-603f-cded7c065105	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d4-7653-fe8a-9e8b1c04f144	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d4-7653-a489-0b67b2e7a146	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d4-7653-63cb-0996a0e2ce19	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d4-7653-6e37-f0685448f33d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d4-7653-f406-24dd73bdd1e5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d4-7653-cb5e-ab38c7f4dafc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d4-7653-c4d4-011a9a0b4832	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d4-7653-2f77-2b9d3f578ff1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d4-7653-52c1-3220fdcea9e5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d4-7653-9e01-737133e2f5e6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d4-7653-21b1-75aaf1d67521	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d4-7653-6d29-997e64ad40e8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2936 (class 0 OID 14947326)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d4-7654-02f2-d9d3ba92bcf1	000e0000-55d4-7654-76a9-2c36e03349f4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55d4-7653-ed46-fbaee467118d	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d4-7654-8c20-05c2816e3204	000e0000-55d4-7654-e1c4-4123892cd288	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d4-7653-193b-e5c051870cfd	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d4-7654-8111-b7443c8c6ae0	000e0000-55d4-7654-2a6a-80fd5a447d1d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d4-7653-ed46-fbaee467118d	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d4-7654-6b1b-25083274fea1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d4-7654-b99b-254d645bfc37	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2923 (class 0 OID 14947153)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d4-7654-52c8-08d31b05158e	000e0000-55d4-7654-e1c4-4123892cd288	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d4-7653-62e9-bb34d7e0f8aa
000d0000-55d4-7654-32f3-477c2316c6f0	000e0000-55d4-7654-e1c4-4123892cd288	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d4-7653-62e9-bb34d7e0f8aa
000d0000-55d4-7654-9713-7ad34a929ac1	000e0000-55d4-7654-e1c4-4123892cd288	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d4-7653-b7d6-dd27f9935a9d
000d0000-55d4-7654-8541-5f790de99751	000e0000-55d4-7654-e1c4-4123892cd288	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d4-7653-01e4-5cd4763b483b
000d0000-55d4-7654-65c1-9eaaca20ee7d	000e0000-55d4-7654-e1c4-4123892cd288	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d4-7653-5433-f66ea7c7913c
000d0000-55d4-7654-893a-cd29567942b1	000e0000-55d4-7654-e1c4-4123892cd288	\N	umetnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55d4-7653-644b-277090ed46a0
000d0000-55d4-7654-1918-fd78ee8f0435	000e0000-55d4-7654-e1c4-4123892cd288	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d4-7653-62e9-bb34d7e0f8aa
000d0000-55d4-7654-9061-fb473169f6b8	000e0000-55d4-7654-e1c4-4123892cd288	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d4-7653-cc35-dca1d58cd750
\.


--
-- TOC entry 2902 (class 0 OID 14946969)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 14947017)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 14946949)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d4-7654-2592-e48c72cf9ac3	00080000-55d4-7654-0219-a545a10e9e38	00090000-55d4-7654-b84e-e0b4c76f123a	AK		
\.


--
-- TOC entry 2912 (class 0 OID 14947070)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 14947537)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 14947549)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 14947571)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 14947095)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 14946906)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d4-7653-2329-91f2eac02ac4	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d4-7653-08d7-0a396b421409	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d4-7653-252c-f5dcc4001816	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d4-7653-5273-ace0ee57081d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d4-7653-a1f8-bb5d3f638f5d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d4-7653-6247-2264bcb572d5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d4-7653-1eb1-ba81e08c4c60	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d4-7653-f7a8-a733eb12c089	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d4-7653-152f-6d46d4ac5ac3	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d4-7653-f086-bcdf5e29aebd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d4-7653-3a35-7644f136a308	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d4-7653-7489-2bcd861713cb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d4-7653-130a-4ffa814f9bc3	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d4-7653-d801-e6ba515b368a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d4-7654-a9b2-f1f88836ca6b	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d4-7654-468c-5a2c97871955	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d4-7654-b609-308df18d75a0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d4-7654-7d8d-7093c18c2c57	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d4-7654-66dc-c40649775dd4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d4-7654-4eca-1b5e3b3b8d5b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2891 (class 0 OID 14946819)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d4-7654-3327-93cb30392bc7	00000000-55d4-7654-468c-5a2c97871955	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d4-7654-16f0-ca735e768b18	00000000-55d4-7654-468c-5a2c97871955	00010000-55d4-7653-f194-ffb2ca44095c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d4-7654-f48c-edafe1c0df15	00000000-55d4-7654-b609-308df18d75a0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2892 (class 0 OID 14946830)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d4-7654-dbdc-0cc84f5d2247	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d4-7654-3b81-cb9bad09d6a6	00010000-55d4-7654-5921-33ad9b44b759	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d4-7654-ef20-d82326cde72f	00010000-55d4-7654-7765-91fcd402ff6e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d4-7654-fd45-27c7addc3a59	00010000-55d4-7654-560b-ada21bc82c72	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d4-7654-b93c-272c2a1ff3d2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d4-7654-f3c1-479f994a9bf2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d4-7654-2b45-a0ea50053848	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d4-7654-47bf-cb4f25c117f6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d4-7654-b84e-e0b4c76f123a	00010000-55d4-7654-a9b6-eed9d426998c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d4-7654-910b-6c3d9e68754f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d4-7654-17e4-527cae5d1184	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d4-7654-a238-322558a9f0f1	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d4-7654-a597-2052fd12885e	00010000-55d4-7654-3604-eceab67d5936	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 14946784)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d4-7653-3830-2d14adb51b0c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d4-7653-7b99-d5a9c7859403	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d4-7653-c2f2-6cfe0371b6c7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d4-7653-6d21-ba79e1a11fbd	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d4-7653-78d1-fe8d59aae98d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d4-7653-5986-dbac58c16d0f	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d4-7653-c7e2-101ac6ee7bfd	Abonma-read	Abonma - branje	f
00030000-55d4-7653-bac0-d054d84bacce	Abonma-write	Abonma - spreminjanje	f
00030000-55d4-7653-416a-4adb98f475d2	Alternacija-read	Alternacija - branje	f
00030000-55d4-7653-4648-5870280cd468	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d4-7653-9ab1-ad931f83c392	Arhivalija-read	Arhivalija - branje	f
00030000-55d4-7653-1245-8c7dbddd3cd4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d4-7653-a062-fc86420c09f5	Besedilo-read	Besedilo - branje	f
00030000-55d4-7653-2ad7-92b6954ab597	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d4-7653-13ed-9feadd66f402	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d4-7653-e62e-23fa0cc366f4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d4-7653-81d6-e2b38c1ed69b	Dogodek-read	Dogodek - branje	f
00030000-55d4-7653-1351-df71af0d8c5b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d4-7653-87fd-aee8c33a3b4f	DrugiVir-read	DrugiVir - branje	f
00030000-55d4-7653-dd19-0de42fc08729	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d4-7653-4a06-85b017e5c11c	Drzava-read	Drzava - branje	f
00030000-55d4-7653-f39e-8ddd4f8565b0	Drzava-write	Drzava - spreminjanje	f
00030000-55d4-7653-2769-c6cfc287ec1b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d4-7653-58cb-8b8a2ae3eb47	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d4-7653-d583-8cca6f0071b1	Funkcija-read	Funkcija - branje	f
00030000-55d4-7653-19f7-65848873cb86	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d4-7653-5384-b45fa3a08718	Gostovanje-read	Gostovanje - branje	f
00030000-55d4-7653-2ea4-40148de80b73	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d4-7653-210c-505fe219e734	Gostujoca-read	Gostujoca - branje	f
00030000-55d4-7653-4443-5915387c3181	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d4-7653-a4cf-b12faa836916	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d4-7653-9664-292e90d49149	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d4-7653-47e7-d2597cf9a22f	Kupec-read	Kupec - branje	f
00030000-55d4-7653-e7c6-9d24b051a315	Kupec-write	Kupec - spreminjanje	f
00030000-55d4-7653-d504-971ccc708aee	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d4-7653-9773-9d59ec306aaf	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d4-7653-2c25-48a4e2d5df05	Option-read	Option - branje	f
00030000-55d4-7653-b566-90047ff5b820	Option-write	Option - spreminjanje	f
00030000-55d4-7653-efcd-8dfdeecc9ad1	OptionValue-read	OptionValue - branje	f
00030000-55d4-7653-b08c-0e8c5776f700	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d4-7653-2f9f-902c2791ee06	Oseba-read	Oseba - branje	f
00030000-55d4-7653-bdb9-7c00f7ad62f2	Oseba-write	Oseba - spreminjanje	f
00030000-55d4-7653-bc76-754e1015916c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d4-7653-da90-91343076670d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d4-7653-9e21-05d2ee808f92	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d4-7653-ed57-ad6435e83074	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d4-7653-dd2b-00b267338e1f	Pogodba-read	Pogodba - branje	f
00030000-55d4-7653-f0bc-ab9f87b96b19	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d4-7653-1c59-fa17752a552c	Popa-read	Popa - branje	f
00030000-55d4-7653-816d-4845a63c7f2f	Popa-write	Popa - spreminjanje	f
00030000-55d4-7653-1d97-70c8d118caf2	Posta-read	Posta - branje	f
00030000-55d4-7653-17a4-a8089e32822a	Posta-write	Posta - spreminjanje	f
00030000-55d4-7653-d4ff-92f8d6f63e7e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d4-7653-719b-aa756753cfb8	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d4-7653-3628-87bb6fb31c69	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d4-7653-3940-db5904f07665	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d4-7653-f4b2-0e44e295e836	Predstava-read	Predstava - branje	f
00030000-55d4-7653-2af8-69a142362362	Predstava-write	Predstava - spreminjanje	f
00030000-55d4-7653-f16f-0d7526bc34df	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d4-7653-fe30-3335edb35ee8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d4-7653-f82c-1ef04075f440	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d4-7653-5d83-46f05b8ff1e0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d4-7653-6b35-f215829f49f3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d4-7653-2748-bcb740beb6fd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d4-7653-38ae-d6db8f4c9c12	ProgramDela-read	ProgramDela - branje	f
00030000-55d4-7653-b676-9971072f8b29	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d4-7653-4b9e-35b68f08ead6	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d4-7653-dadf-1be19eb81043	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d4-7653-d324-6d31af100cef	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d4-7653-ea07-bf2fad39e647	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d4-7653-7120-0ba5c9aa0e9f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d4-7653-7625-6f26cc013d70	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d4-7653-3020-25b501a602ab	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d4-7653-31fc-6d3769497a42	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d4-7653-ee50-88dc0d150b69	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d4-7653-13b4-0a71034455ad	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d4-7653-f1ac-d7729a4b612f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d4-7653-99c2-a6e666fc5340	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d4-7653-1348-51bb3b4b8378	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d4-7653-ad08-f0bc8cc9d9da	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d4-7653-018f-e94795070254	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d4-7653-7147-ccbaeb78bdea	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d4-7653-578d-cc73c80c8186	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d4-7653-2727-aee73176c6bd	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d4-7653-dd5b-393b0471b18b	Prostor-read	Prostor - branje	f
00030000-55d4-7653-7ee4-fb2c677ba2bb	Prostor-write	Prostor - spreminjanje	f
00030000-55d4-7653-d867-b02c4f09a96a	Racun-read	Racun - branje	f
00030000-55d4-7653-e88a-53c466987dc1	Racun-write	Racun - spreminjanje	f
00030000-55d4-7653-7e1c-18fe30f12661	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d4-7653-88ab-6ec099f88f8f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d4-7653-8eef-b2c5c9c66e92	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d4-7653-d4f5-123e00fde408	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d4-7653-88b8-8b70101cd61f	Rekvizit-read	Rekvizit - branje	f
00030000-55d4-7653-93d9-5b8cefd1ffa7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d4-7653-bdac-ea147aec2411	Revizija-read	Revizija - branje	f
00030000-55d4-7653-2f36-8be732e2cc01	Revizija-write	Revizija - spreminjanje	f
00030000-55d4-7653-2459-4943a442c408	Rezervacija-read	Rezervacija - branje	f
00030000-55d4-7653-f06a-1f1d98bf643f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d4-7653-f26b-37c27ec13a66	SedezniRed-read	SedezniRed - branje	f
00030000-55d4-7653-8a16-abbc472eb67a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d4-7653-d20e-c30c3ad623d7	Sedez-read	Sedez - branje	f
00030000-55d4-7653-c8ab-62c4fb42733c	Sedez-write	Sedez - spreminjanje	f
00030000-55d4-7653-5649-0a8786dd632d	Sezona-read	Sezona - branje	f
00030000-55d4-7653-3e10-c429790fb2af	Sezona-write	Sezona - spreminjanje	f
00030000-55d4-7653-a23f-503b0f753209	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d4-7653-ad64-e60b21495763	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d4-7653-0ab6-a53165e7b1fd	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d4-7653-3c27-986f204a68b8	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d4-7653-9ce6-4606cf24e409	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d4-7653-349b-ba68d67c725b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d4-7653-c290-667babba77d3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d4-7653-1605-b0026e81c211	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d4-7653-1659-fb0a22b5b038	Telefonska-read	Telefonska - branje	f
00030000-55d4-7653-6273-bcde690f2197	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d4-7653-1a6a-74459889333a	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d4-7653-19c3-d5a6b387bab9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d4-7653-3ebf-a3646cc5c670	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d4-7653-8bdf-c184cc011080	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d4-7653-eb22-7b79594682cf	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d4-7653-74ca-594690adef2f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d4-7653-b5d4-6fd7a31c25ed	Trr-read	Trr - branje	f
00030000-55d4-7653-5269-d0582b337d44	Trr-write	Trr - spreminjanje	f
00030000-55d4-7653-1f9d-991a6398799b	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d4-7653-9abf-6d5abe03cf20	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d4-7653-ef66-b7b79b74e29d	Vaja-read	Vaja - branje	f
00030000-55d4-7653-239a-eadf2bae9c00	Vaja-write	Vaja - spreminjanje	f
00030000-55d4-7653-ccc8-7f9e34c3aa75	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d4-7653-5d66-b72b9c7e0561	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d4-7653-e1a6-22574172929b	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d4-7653-f290-d2eabe157277	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d4-7653-6a83-914c8cb24771	Zasedenost-read	Zasedenost - branje	f
00030000-55d4-7653-1127-f456926db438	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d4-7653-bcad-e5d1a7b816dd	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d4-7653-4cb2-1b566ea0b690	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d4-7653-9181-13c3a1253143	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d4-7653-4a1d-a08289c8b531	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d4-7653-8be7-8087f416b101	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55d4-7653-9d10-e1169fc4f4e4	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55d4-7653-867f-9810cddd896b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55d4-7653-6da7-7939480e817a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55d4-7653-55ee-372d010b2508	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d4-7653-7240-345933c4ebe8	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d4-7653-f4cf-e74874b90556	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d4-7653-86d1-1060b8f49ba6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d4-7653-aed4-00d665f7d73c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55d4-7653-0e54-260faf8b79cc	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55d4-7653-da87-785cc3425a70	Datoteka-write	Datoteka - spreminjanje	f
00030000-55d4-7653-99b5-c5c5e8ffd9a3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2889 (class 0 OID 14946803)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d4-7653-66f0-c9678d71b2bb	00030000-55d4-7653-7b99-d5a9c7859403
00020000-55d4-7653-cb90-b87e5f9c1b79	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-c7e2-101ac6ee7bfd
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-bac0-d054d84bacce
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-416a-4adb98f475d2
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-4648-5870280cd468
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-9ab1-ad931f83c392
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-81d6-e2b38c1ed69b
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-6d21-ba79e1a11fbd
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-1351-df71af0d8c5b
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-f39e-8ddd4f8565b0
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-d583-8cca6f0071b1
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-19f7-65848873cb86
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-5384-b45fa3a08718
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-2ea4-40148de80b73
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-210c-505fe219e734
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-4443-5915387c3181
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-a4cf-b12faa836916
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-9664-292e90d49149
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-2c25-48a4e2d5df05
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-efcd-8dfdeecc9ad1
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-2f9f-902c2791ee06
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-bdb9-7c00f7ad62f2
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-1c59-fa17752a552c
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-816d-4845a63c7f2f
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-1d97-70c8d118caf2
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-17a4-a8089e32822a
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-3628-87bb6fb31c69
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-3940-db5904f07665
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-f4b2-0e44e295e836
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-2af8-69a142362362
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-6b35-f215829f49f3
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-2748-bcb740beb6fd
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-dd5b-393b0471b18b
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-7ee4-fb2c677ba2bb
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-8eef-b2c5c9c66e92
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-d4f5-123e00fde408
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-88b8-8b70101cd61f
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-93d9-5b8cefd1ffa7
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-5649-0a8786dd632d
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-3e10-c429790fb2af
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-3ebf-a3646cc5c670
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-1f9d-991a6398799b
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-9abf-6d5abe03cf20
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-ef66-b7b79b74e29d
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-239a-eadf2bae9c00
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-6a83-914c8cb24771
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-1127-f456926db438
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-bcad-e5d1a7b816dd
00020000-55d4-7653-b566-da08276b0994	00030000-55d4-7653-9181-13c3a1253143
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-c7e2-101ac6ee7bfd
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-9ab1-ad931f83c392
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-81d6-e2b38c1ed69b
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-5384-b45fa3a08718
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-210c-505fe219e734
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-a4cf-b12faa836916
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-9664-292e90d49149
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-2c25-48a4e2d5df05
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-efcd-8dfdeecc9ad1
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-2f9f-902c2791ee06
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-bdb9-7c00f7ad62f2
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-1c59-fa17752a552c
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-1d97-70c8d118caf2
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-3628-87bb6fb31c69
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-3940-db5904f07665
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-f4b2-0e44e295e836
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-dd5b-393b0471b18b
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-8eef-b2c5c9c66e92
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-88b8-8b70101cd61f
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-5649-0a8786dd632d
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-1659-fb0a22b5b038
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-6273-bcde690f2197
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-b5d4-6fd7a31c25ed
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-5269-d0582b337d44
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-e1a6-22574172929b
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-f290-d2eabe157277
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-bcad-e5d1a7b816dd
00020000-55d4-7653-ecb5-5e8a844b2e78	00030000-55d4-7653-9181-13c3a1253143
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-c7e2-101ac6ee7bfd
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-416a-4adb98f475d2
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-9ab1-ad931f83c392
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-1245-8c7dbddd3cd4
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-a062-fc86420c09f5
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-13ed-9feadd66f402
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-81d6-e2b38c1ed69b
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-d583-8cca6f0071b1
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-5384-b45fa3a08718
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-210c-505fe219e734
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-a4cf-b12faa836916
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-2c25-48a4e2d5df05
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-efcd-8dfdeecc9ad1
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-2f9f-902c2791ee06
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-1c59-fa17752a552c
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-1d97-70c8d118caf2
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-f4b2-0e44e295e836
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-6b35-f215829f49f3
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-dd5b-393b0471b18b
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-8eef-b2c5c9c66e92
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-88b8-8b70101cd61f
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-5649-0a8786dd632d
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-3ebf-a3646cc5c670
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-ef66-b7b79b74e29d
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-6a83-914c8cb24771
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-bcad-e5d1a7b816dd
00020000-55d4-7653-6a88-454805307539	00030000-55d4-7653-9181-13c3a1253143
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-c7e2-101ac6ee7bfd
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-bac0-d054d84bacce
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-4648-5870280cd468
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-9ab1-ad931f83c392
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-81d6-e2b38c1ed69b
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-5384-b45fa3a08718
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-210c-505fe219e734
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-2c25-48a4e2d5df05
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-efcd-8dfdeecc9ad1
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-1c59-fa17752a552c
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-1d97-70c8d118caf2
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-f4b2-0e44e295e836
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-dd5b-393b0471b18b
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-8eef-b2c5c9c66e92
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-88b8-8b70101cd61f
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-5649-0a8786dd632d
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-3ebf-a3646cc5c670
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-bcad-e5d1a7b816dd
00020000-55d4-7653-6afb-a1263905a554	00030000-55d4-7653-9181-13c3a1253143
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-c7e2-101ac6ee7bfd
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-9ab1-ad931f83c392
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-81d6-e2b38c1ed69b
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-5384-b45fa3a08718
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-210c-505fe219e734
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-2c25-48a4e2d5df05
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-efcd-8dfdeecc9ad1
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-1c59-fa17752a552c
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-1d97-70c8d118caf2
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-f4b2-0e44e295e836
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-dd5b-393b0471b18b
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-8eef-b2c5c9c66e92
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-88b8-8b70101cd61f
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-5649-0a8786dd632d
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-1a6a-74459889333a
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-c2f2-6cfe0371b6c7
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-3ebf-a3646cc5c670
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-bcad-e5d1a7b816dd
00020000-55d4-7653-69a1-4fc0a6c9400e	00030000-55d4-7653-9181-13c3a1253143
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3830-2d14adb51b0c
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-7b99-d5a9c7859403
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-c2f2-6cfe0371b6c7
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-6d21-ba79e1a11fbd
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-78d1-fe8d59aae98d
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-5986-dbac58c16d0f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-c7e2-101ac6ee7bfd
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-bac0-d054d84bacce
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-416a-4adb98f475d2
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-4648-5870280cd468
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9ab1-ad931f83c392
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1245-8c7dbddd3cd4
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-a062-fc86420c09f5
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2ad7-92b6954ab597
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-13ed-9feadd66f402
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-e62e-23fa0cc366f4
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-81d6-e2b38c1ed69b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1351-df71af0d8c5b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-4a06-85b017e5c11c
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f39e-8ddd4f8565b0
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-87fd-aee8c33a3b4f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-dd19-0de42fc08729
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2769-c6cfc287ec1b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-58cb-8b8a2ae3eb47
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d583-8cca6f0071b1
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-19f7-65848873cb86
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-5384-b45fa3a08718
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2ea4-40148de80b73
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-210c-505fe219e734
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-4443-5915387c3181
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-a4cf-b12faa836916
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9664-292e90d49149
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-47e7-d2597cf9a22f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-e7c6-9d24b051a315
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d504-971ccc708aee
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9773-9d59ec306aaf
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2c25-48a4e2d5df05
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-b566-90047ff5b820
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-efcd-8dfdeecc9ad1
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-b08c-0e8c5776f700
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2f9f-902c2791ee06
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-bdb9-7c00f7ad62f2
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-bc76-754e1015916c
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-da90-91343076670d
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9e21-05d2ee808f92
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ed57-ad6435e83074
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-dd2b-00b267338e1f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f0bc-ab9f87b96b19
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1c59-fa17752a552c
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-816d-4845a63c7f2f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1d97-70c8d118caf2
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-17a4-a8089e32822a
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d4ff-92f8d6f63e7e
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-719b-aa756753cfb8
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3628-87bb6fb31c69
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3940-db5904f07665
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f4b2-0e44e295e836
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2af8-69a142362362
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f16f-0d7526bc34df
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-fe30-3335edb35ee8
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f82c-1ef04075f440
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-5d83-46f05b8ff1e0
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-6b35-f215829f49f3
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2748-bcb740beb6fd
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-38ae-d6db8f4c9c12
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-b676-9971072f8b29
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-4b9e-35b68f08ead6
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-dadf-1be19eb81043
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d324-6d31af100cef
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ea07-bf2fad39e647
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-7120-0ba5c9aa0e9f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-7625-6f26cc013d70
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3020-25b501a602ab
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-31fc-6d3769497a42
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ee50-88dc0d150b69
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-13b4-0a71034455ad
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f1ac-d7729a4b612f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-99c2-a6e666fc5340
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1348-51bb3b4b8378
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ad08-f0bc8cc9d9da
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-018f-e94795070254
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-7147-ccbaeb78bdea
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-578d-cc73c80c8186
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2727-aee73176c6bd
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-dd5b-393b0471b18b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-7ee4-fb2c677ba2bb
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d867-b02c4f09a96a
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-e88a-53c466987dc1
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-7e1c-18fe30f12661
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-88ab-6ec099f88f8f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-8eef-b2c5c9c66e92
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d4f5-123e00fde408
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-88b8-8b70101cd61f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-93d9-5b8cefd1ffa7
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-bdac-ea147aec2411
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2f36-8be732e2cc01
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-2459-4943a442c408
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f06a-1f1d98bf643f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f26b-37c27ec13a66
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-8a16-abbc472eb67a
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-d20e-c30c3ad623d7
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-c8ab-62c4fb42733c
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-5649-0a8786dd632d
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3e10-c429790fb2af
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-a23f-503b0f753209
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ad64-e60b21495763
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-0ab6-a53165e7b1fd
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3c27-986f204a68b8
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9ce6-4606cf24e409
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-349b-ba68d67c725b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-c290-667babba77d3
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1605-b0026e81c211
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1659-fb0a22b5b038
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-6273-bcde690f2197
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1a6a-74459889333a
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-19c3-d5a6b387bab9
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-3ebf-a3646cc5c670
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-8bdf-c184cc011080
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-eb22-7b79594682cf
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-74ca-594690adef2f
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-b5d4-6fd7a31c25ed
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-5269-d0582b337d44
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1f9d-991a6398799b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9abf-6d5abe03cf20
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ef66-b7b79b74e29d
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-239a-eadf2bae9c00
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-ccc8-7f9e34c3aa75
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-5d66-b72b9c7e0561
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-e1a6-22574172929b
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-f290-d2eabe157277
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-6a83-914c8cb24771
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-1127-f456926db438
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-bcad-e5d1a7b816dd
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-4cb2-1b566ea0b690
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-9181-13c3a1253143
00020000-55d4-7654-6e67-a74ba903a6f8	00030000-55d4-7653-4a1d-a08289c8b531
\.


--
-- TOC entry 2917 (class 0 OID 14947102)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 14947133)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 14947247)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d4-7654-a2a6-5f9d8590d977	00090000-55d4-7654-dbdc-0cc84f5d2247	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d4-7654-4579-8b86fced7658	00090000-55d4-7654-f3c1-479f994a9bf2	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d4-7654-b14a-5607be899834	00090000-55d4-7654-a597-2052fd12885e	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2894 (class 0 OID 14946863)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d4-7654-0219-a545a10e9e38	00040000-55d4-7653-9715-1197fd247cb4	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-a21a-28b372f7c0a5	00040000-55d4-7653-9715-1197fd247cb4	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d4-7654-97c0-d9bb32f4ac24	00040000-55d4-7653-9715-1197fd247cb4	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-d7b5-33348c2bc94c	00040000-55d4-7653-9715-1197fd247cb4	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-3840-431e6c87f6de	00040000-55d4-7653-9715-1197fd247cb4	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-4b8c-d59c496d4102	00040000-55d4-7652-abb7-530f4dd1f7a9	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-da47-ec4410e7a35f	00040000-55d4-7652-6b9d-30d6df7a3bfa	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-93d1-d768b7773574	00040000-55d4-7652-f897-5044d7ee964f	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d4-7654-06eb-394563ba31a0	00040000-55d4-7653-9715-1197fd247cb4	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2896 (class 0 OID 14946898)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d4-7653-be5b-97273ab0e237	8341	Adlešiči
00050000-55d4-7653-7668-3a09ac456fd2	5270	Ajdovščina
00050000-55d4-7653-bdd1-de1383158acb	6280	Ankaran/Ancarano
00050000-55d4-7653-92d8-c57e5153e09c	9253	Apače
00050000-55d4-7653-7887-afb4a1ad9cea	8253	Artiče
00050000-55d4-7653-926b-469bc2c282ae	4275	Begunje na Gorenjskem
00050000-55d4-7653-acf6-56040149fca5	1382	Begunje pri Cerknici
00050000-55d4-7653-1591-d86d2fd222fd	9231	Beltinci
00050000-55d4-7653-ed95-8cc1efa6c61a	2234	Benedikt
00050000-55d4-7653-4deb-bcca144f235a	2345	Bistrica ob Dravi
00050000-55d4-7653-3f4e-acfdcb53017f	3256	Bistrica ob Sotli
00050000-55d4-7653-eebf-da536cd8debd	8259	Bizeljsko
00050000-55d4-7653-18cd-0d579deae271	1223	Blagovica
00050000-55d4-7653-cc71-c4049ed32fe1	8283	Blanca
00050000-55d4-7653-6dd0-69039c3fa10f	4260	Bled
00050000-55d4-7653-b636-3eb449290b3d	4273	Blejska Dobrava
00050000-55d4-7653-3c00-29cfcfc1805c	9265	Bodonci
00050000-55d4-7653-d28f-e9e713bc6fee	9222	Bogojina
00050000-55d4-7653-626b-f65b306812cc	4263	Bohinjska Bela
00050000-55d4-7653-ab2c-b8796edacd85	4264	Bohinjska Bistrica
00050000-55d4-7653-d07b-e4c5f4bf6739	4265	Bohinjsko jezero
00050000-55d4-7653-4bdb-8d01aa422c9d	1353	Borovnica
00050000-55d4-7653-5118-5a283ba94fe9	8294	Boštanj
00050000-55d4-7653-6bb2-7e137812f5fe	5230	Bovec
00050000-55d4-7653-97eb-dd49f57e5270	5295	Branik
00050000-55d4-7653-f3fd-fea9084668dd	3314	Braslovče
00050000-55d4-7653-73cb-cad6a41779d1	5223	Breginj
00050000-55d4-7653-e596-ec1d6615d488	8280	Brestanica
00050000-55d4-7653-0fdc-e66033f36fec	2354	Bresternica
00050000-55d4-7653-b42d-966ca9cddd60	4243	Brezje
00050000-55d4-7653-3de3-bc50d88d88e3	1351	Brezovica pri Ljubljani
00050000-55d4-7653-6440-9d5262ed3f03	8250	Brežice
00050000-55d4-7653-0afe-702517d04937	4210	Brnik - Aerodrom
00050000-55d4-7653-b845-0c26dc4eb20d	8321	Brusnice
00050000-55d4-7653-86b7-5dafd67c7100	3255	Buče
00050000-55d4-7653-aa3a-58ccdea1d176	8276	Bučka 
00050000-55d4-7653-5b9a-1dbfbaddffae	9261	Cankova
00050000-55d4-7653-14a6-8d7cc902b417	3000	Celje 
00050000-55d4-7653-8130-e24e3c4be630	3001	Celje - poštni predali
00050000-55d4-7653-01c8-cb4b25cb7744	4207	Cerklje na Gorenjskem
00050000-55d4-7653-1fea-3564cd0cfb9c	8263	Cerklje ob Krki
00050000-55d4-7653-6286-a1a208f9aa0a	1380	Cerknica
00050000-55d4-7653-b7cc-8577a7e89ec8	5282	Cerkno
00050000-55d4-7653-174c-cbb68cdb2d3b	2236	Cerkvenjak
00050000-55d4-7653-3c4b-cfbee4125a66	2215	Ceršak
00050000-55d4-7653-5c4b-e2ba6daf5dc6	2326	Cirkovce
00050000-55d4-7653-48b6-e4f2fd7fb185	2282	Cirkulane
00050000-55d4-7653-45bd-b2e2f5872ec4	5273	Col
00050000-55d4-7653-1481-29cdc8b84741	8251	Čatež ob Savi
00050000-55d4-7653-c9d3-0aacc8d1f465	1413	Čemšenik
00050000-55d4-7653-0742-e8b97a08b2db	5253	Čepovan
00050000-55d4-7653-d2c9-d590e0c6b367	9232	Črenšovci
00050000-55d4-7653-5698-11a563a2340c	2393	Črna na Koroškem
00050000-55d4-7653-035e-47260b52bb65	6275	Črni Kal
00050000-55d4-7653-d006-0dadb1552b36	5274	Črni Vrh nad Idrijo
00050000-55d4-7653-3f94-57e99a2d2500	5262	Črniče
00050000-55d4-7653-cbf5-222160acd16a	8340	Črnomelj
00050000-55d4-7653-5a72-8be0106a3bd7	6271	Dekani
00050000-55d4-7653-5767-e04b41a41e36	5210	Deskle
00050000-55d4-7653-97f0-7c2217525099	2253	Destrnik
00050000-55d4-7653-f7e6-82a66f319653	6215	Divača
00050000-55d4-7653-8ee9-d35fd7714c18	1233	Dob
00050000-55d4-7653-8c54-32a138041209	3224	Dobje pri Planini
00050000-55d4-7653-c780-0516fd8eb094	8257	Dobova
00050000-55d4-7653-4a4b-160d7853d76c	1423	Dobovec
00050000-55d4-7653-37d0-e3b9d5a006b1	5263	Dobravlje
00050000-55d4-7653-2717-975679cfecea	3204	Dobrna
00050000-55d4-7653-fc6d-b03eacab3415	8211	Dobrnič
00050000-55d4-7653-34cc-158ee4f816c7	1356	Dobrova
00050000-55d4-7653-7774-ac3f532c3409	9223	Dobrovnik/Dobronak 
00050000-55d4-7653-d955-993b8bcf1191	5212	Dobrovo v Brdih
00050000-55d4-7653-d631-4bfa388d11cd	1431	Dol pri Hrastniku
00050000-55d4-7653-2017-cd0eac2a723a	1262	Dol pri Ljubljani
00050000-55d4-7653-6980-47556571ce4b	1273	Dole pri Litiji
00050000-55d4-7653-2ec6-6025c33f0df0	1331	Dolenja vas
00050000-55d4-7653-7ea6-606f405f58cd	8350	Dolenjske Toplice
00050000-55d4-7653-59d1-dd0633c7142f	1230	Domžale
00050000-55d4-7653-2adb-f1fdbcfd201a	2252	Dornava
00050000-55d4-7653-a892-02fba45d9bc5	5294	Dornberk
00050000-55d4-7653-166c-e1d5dd0b0cd5	1319	Draga
00050000-55d4-7653-98d3-8cf0a580983d	8343	Dragatuš
00050000-55d4-7653-ce63-f2573ffaf117	3222	Dramlje
00050000-55d4-7653-6278-86ad6471476e	2370	Dravograd
00050000-55d4-7653-d8e2-2a1474b53021	4203	Duplje
00050000-55d4-7653-ada1-9c0c3f9fa378	6221	Dutovlje
00050000-55d4-7653-2137-85044b15b7df	8361	Dvor
00050000-55d4-7653-3a15-e01ef677c023	2343	Fala
00050000-55d4-7653-3d72-181b05c14db6	9208	Fokovci
00050000-55d4-7653-a95c-fdaa1d6666f5	2313	Fram
00050000-55d4-7653-197b-bb56a8a2b652	3213	Frankolovo
00050000-55d4-7653-2a51-bce63a788515	1274	Gabrovka
00050000-55d4-7653-7575-006e362b4346	8254	Globoko
00050000-55d4-7653-fe82-39f0f36fa68a	5275	Godovič
00050000-55d4-7653-3fca-524cc577d1e5	4204	Golnik
00050000-55d4-7653-bbc9-57217ccd3a28	3303	Gomilsko
00050000-55d4-7653-2f8d-d971853652fd	4224	Gorenja vas
00050000-55d4-7653-a2bd-72993cdd845c	3263	Gorica pri Slivnici
00050000-55d4-7653-7833-36809fb6f9af	2272	Gorišnica
00050000-55d4-7653-2d6b-7f839e8178cf	9250	Gornja Radgona
00050000-55d4-7653-5bd5-f94b641a39cd	3342	Gornji Grad
00050000-55d4-7653-38aa-b89c71761591	4282	Gozd Martuljek
00050000-55d4-7653-eb47-b744591e2422	6272	Gračišče
00050000-55d4-7653-36f3-7e983007e75b	9264	Grad
00050000-55d4-7653-4148-32c42ca2ec38	8332	Gradac
00050000-55d4-7653-5341-69d5e9bcb6be	1384	Grahovo
00050000-55d4-7653-9223-35e67383be03	5242	Grahovo ob Bači
00050000-55d4-7653-43bb-45a2c7606f69	5251	Grgar
00050000-55d4-7653-05eb-01e9cf76bfdc	3302	Griže
00050000-55d4-7653-bcee-8fe05ea8b48f	3231	Grobelno
00050000-55d4-7653-3118-41db754f90e4	1290	Grosuplje
00050000-55d4-7653-39f1-744c203e01e4	2288	Hajdina
00050000-55d4-7653-4a48-02cffad3ec53	8362	Hinje
00050000-55d4-7653-0c59-47eadf2989d9	2311	Hoče
00050000-55d4-7653-c886-8177a3c23ea7	9205	Hodoš/Hodos
00050000-55d4-7653-2947-9cda47b06b00	1354	Horjul
00050000-55d4-7653-9167-ee71af904a90	1372	Hotedršica
00050000-55d4-7653-2eb8-8a637ed535c9	1430	Hrastnik
00050000-55d4-7653-73ea-6f014ba6e128	6225	Hruševje
00050000-55d4-7653-bd7d-1d72a3e8c774	4276	Hrušica
00050000-55d4-7653-b650-9833f7fdbe31	5280	Idrija
00050000-55d4-7653-e026-58f0edf64a8a	1292	Ig
00050000-55d4-7653-9e65-b4fd7852cfc8	6250	Ilirska Bistrica
00050000-55d4-7653-0d63-b31d9042dd0a	6251	Ilirska Bistrica-Trnovo
00050000-55d4-7653-ea96-39664a48222f	1295	Ivančna Gorica
00050000-55d4-7653-339c-511f1add20a8	2259	Ivanjkovci
00050000-55d4-7653-7595-622d4d9ac4c0	1411	Izlake
00050000-55d4-7653-520e-bb2863d0f02c	6310	Izola/Isola
00050000-55d4-7653-d06f-4483357f4bed	2222	Jakobski Dol
00050000-55d4-7653-af2b-cfccd4a9c720	2221	Jarenina
00050000-55d4-7653-ae37-c66b10c77ad3	6254	Jelšane
00050000-55d4-7653-9337-72468aa5924c	4270	Jesenice
00050000-55d4-7653-ccdc-ede509770d91	8261	Jesenice na Dolenjskem
00050000-55d4-7653-4911-b78dbea45203	3273	Jurklošter
00050000-55d4-7653-88be-84142ffef61d	2223	Jurovski Dol
00050000-55d4-7653-aafc-e6d4d36903e8	2256	Juršinci
00050000-55d4-7653-60a9-5aef35501148	5214	Kal nad Kanalom
00050000-55d4-7653-1ff7-88fc87fa1926	3233	Kalobje
00050000-55d4-7653-631e-9b5fd5bb6ccc	4246	Kamna Gorica
00050000-55d4-7653-8812-b1b49541dc3f	2351	Kamnica
00050000-55d4-7653-1e17-f9dfe6bd8e92	1241	Kamnik
00050000-55d4-7653-90f0-4c9e9eca72f4	5213	Kanal
00050000-55d4-7653-68a4-b2183318e0f2	8258	Kapele
00050000-55d4-7653-16c1-0cede79b8f41	2362	Kapla
00050000-55d4-7653-5fae-8bd1cc86d669	2325	Kidričevo
00050000-55d4-7653-9c41-f448f12a1663	1412	Kisovec
00050000-55d4-7653-622f-b3ce529700cb	6253	Knežak
00050000-55d4-7653-c05e-ce8367999134	5222	Kobarid
00050000-55d4-7653-677f-741f1ce10456	9227	Kobilje
00050000-55d4-7653-f484-406374499506	1330	Kočevje
00050000-55d4-7653-d88b-9fe6a7e94eb5	1338	Kočevska Reka
00050000-55d4-7653-490e-1ffbe3bd937a	2276	Kog
00050000-55d4-7653-0f26-205a4409cbb0	5211	Kojsko
00050000-55d4-7653-62d7-b87bf0c13a6f	6223	Komen
00050000-55d4-7653-74a5-36d97b14677e	1218	Komenda
00050000-55d4-7653-025c-1f6a70e0345d	6000	Koper/Capodistria 
00050000-55d4-7653-493b-7c022a7f7be3	6001	Koper/Capodistria - poštni predali
00050000-55d4-7653-1733-0acadf3182b8	8282	Koprivnica
00050000-55d4-7653-b91b-a1bc0e861645	5296	Kostanjevica na Krasu
00050000-55d4-7653-8eb7-3e048219765c	8311	Kostanjevica na Krki
00050000-55d4-7653-da22-4f81e9eddc22	1336	Kostel
00050000-55d4-7653-6087-a2daab9b5e12	6256	Košana
00050000-55d4-7653-e78c-97e13976b593	2394	Kotlje
00050000-55d4-7653-dd8b-d1b57688686a	6240	Kozina
00050000-55d4-7653-1096-36b101c92960	3260	Kozje
00050000-55d4-7653-3178-e8cbacbe6a14	4000	Kranj 
00050000-55d4-7653-a535-666e6f1a191b	4001	Kranj - poštni predali
00050000-55d4-7653-9441-7548664b21af	4280	Kranjska Gora
00050000-55d4-7653-4d05-b268f7e1fd47	1281	Kresnice
00050000-55d4-7653-ab9e-95370fca0a42	4294	Križe
00050000-55d4-7653-46c4-40597870b458	9206	Križevci
00050000-55d4-7653-7a70-fb97d1a6c674	9242	Križevci pri Ljutomeru
00050000-55d4-7653-16b2-2e06d419e3cc	1301	Krka
00050000-55d4-7653-a252-e350bd8d1ea0	8296	Krmelj
00050000-55d4-7653-573f-0c83d5675cf6	4245	Kropa
00050000-55d4-7653-7318-b3adf70d3c4d	8262	Krška vas
00050000-55d4-7653-832b-e704159cc933	8270	Krško
00050000-55d4-7653-a1a7-63922b0b0036	9263	Kuzma
00050000-55d4-7653-e859-239d23c4ba30	2318	Laporje
00050000-55d4-7653-6069-cc26c0a648e1	3270	Laško
00050000-55d4-7653-8d0b-c52ec760dddd	1219	Laze v Tuhinju
00050000-55d4-7653-f3ae-cdfde3cd79d6	2230	Lenart v Slovenskih goricah
00050000-55d4-7653-0356-107ee2ca9581	9220	Lendava/Lendva
00050000-55d4-7653-bf13-22789ce4d4ea	4248	Lesce
00050000-55d4-7653-e866-6b910139a277	3261	Lesično
00050000-55d4-7653-32ee-1cff5e40fbde	8273	Leskovec pri Krškem
00050000-55d4-7653-f839-7f30e0c2f107	2372	Libeliče
00050000-55d4-7653-98cc-b0a668a7dc32	2341	Limbuš
00050000-55d4-7653-7e7c-971f07f34874	1270	Litija
00050000-55d4-7653-2089-fbca3637b730	3202	Ljubečna
00050000-55d4-7653-8dab-959237e63a73	1000	Ljubljana 
00050000-55d4-7653-f1cc-f76f32eb8475	1001	Ljubljana - poštni predali
00050000-55d4-7653-e0aa-2dfbc5513ed2	1231	Ljubljana - Črnuče
00050000-55d4-7653-4a35-b3747caffe8c	1261	Ljubljana - Dobrunje
00050000-55d4-7653-4bb6-d44b735591a0	1260	Ljubljana - Polje
00050000-55d4-7653-d785-7ba0cb3a3e62	1210	Ljubljana - Šentvid
00050000-55d4-7653-d075-e26c3e16becb	1211	Ljubljana - Šmartno
00050000-55d4-7653-3510-15b14db896ea	3333	Ljubno ob Savinji
00050000-55d4-7653-83a4-e17d797e0b38	9240	Ljutomer
00050000-55d4-7653-871a-1a009af33323	3215	Loče
00050000-55d4-7653-cab7-570fde50cd2c	5231	Log pod Mangartom
00050000-55d4-7653-0aa0-7886ed058b62	1358	Log pri Brezovici
00050000-55d4-7653-2cfd-b12a30d4bf96	1370	Logatec
00050000-55d4-7653-3f24-1e5839856d5b	1371	Logatec
00050000-55d4-7653-30b3-4575f98e1b6b	1434	Loka pri Zidanem Mostu
00050000-55d4-7653-1286-d31b00b8733b	3223	Loka pri Žusmu
00050000-55d4-7653-bc5b-919c68e3e3cc	6219	Lokev
00050000-55d4-7653-5b1a-32c48610cce6	1318	Loški Potok
00050000-55d4-7653-9723-fe94a507d63b	2324	Lovrenc na Dravskem polju
00050000-55d4-7653-b7a3-00e8652d8f14	2344	Lovrenc na Pohorju
00050000-55d4-7653-1cc3-a0d8acbb1f1b	3334	Luče
00050000-55d4-7653-3956-9a3bcd0ba07f	1225	Lukovica
00050000-55d4-7653-f641-25bff2e78523	9202	Mačkovci
00050000-55d4-7653-6364-2f75149aa9ae	2322	Majšperk
00050000-55d4-7653-7dcc-fd4cbf8e4707	2321	Makole
00050000-55d4-7653-a235-12d7eb7496e8	9243	Mala Nedelja
00050000-55d4-7653-91c2-6735465eeb85	2229	Malečnik
00050000-55d4-7653-894d-10728bb8ec59	6273	Marezige
00050000-55d4-7653-3360-a9bd67532591	2000	Maribor 
00050000-55d4-7653-fb56-d1daec1bf63a	2001	Maribor - poštni predali
00050000-55d4-7653-eb3d-2ec49e1e8ab8	2206	Marjeta na Dravskem polju
00050000-55d4-7653-4370-7080eb75a286	2281	Markovci
00050000-55d4-7653-c99e-b7aab7098bbb	9221	Martjanci
00050000-55d4-7653-b423-ad7454d0a0ae	6242	Materija
00050000-55d4-7653-f38a-d293a4f6a848	4211	Mavčiče
00050000-55d4-7653-a744-b90da0df333d	1215	Medvode
00050000-55d4-7653-ad71-ec6d41ff19f4	1234	Mengeš
00050000-55d4-7653-bdb0-c31654cd2079	8330	Metlika
00050000-55d4-7653-0804-3913c4b7b989	2392	Mežica
00050000-55d4-7653-2d82-32bf23ebefa8	2204	Miklavž na Dravskem polju
00050000-55d4-7653-b0c5-fe6b489b09a4	2275	Miklavž pri Ormožu
00050000-55d4-7653-8fb0-bd8646a84614	5291	Miren
00050000-55d4-7653-3572-dd7e344cc815	8233	Mirna
00050000-55d4-7653-8f2c-e8bdfbbcaf0f	8216	Mirna Peč
00050000-55d4-7653-b266-0491f1976ed5	2382	Mislinja
00050000-55d4-7653-b734-a31adb9f73b5	4281	Mojstrana
00050000-55d4-7653-aec0-0f618d3121d3	8230	Mokronog
00050000-55d4-7653-3dfe-ee919e841406	1251	Moravče
00050000-55d4-7653-81ac-da80dd88a832	9226	Moravske Toplice
00050000-55d4-7653-04e2-e3bb0dc404cc	5216	Most na Soči
00050000-55d4-7653-87f3-4d8f08779abd	1221	Motnik
00050000-55d4-7653-61cf-fca43d515fd8	3330	Mozirje
00050000-55d4-7653-cc04-044b58bd8929	9000	Murska Sobota 
00050000-55d4-7653-afad-5f4713347d77	9001	Murska Sobota - poštni predali
00050000-55d4-7653-b2a3-43f3814867f0	2366	Muta
00050000-55d4-7653-0a9b-d0ee0000f934	4202	Naklo
00050000-55d4-7653-d5b4-03302fecffd9	3331	Nazarje
00050000-55d4-7653-738c-f8c871043193	1357	Notranje Gorice
00050000-55d4-7653-3c12-0cd7c7dd3c77	3203	Nova Cerkev
00050000-55d4-7653-1db1-3619c0862583	5000	Nova Gorica 
00050000-55d4-7653-1440-ecc7e00ef98e	5001	Nova Gorica - poštni predali
00050000-55d4-7653-b28c-cd21159602fd	1385	Nova vas
00050000-55d4-7653-b78f-2870194aae38	8000	Novo mesto
00050000-55d4-7653-3a06-cc2e8a96919c	8001	Novo mesto - poštni predali
00050000-55d4-7653-d41b-a3f434f46f12	6243	Obrov
00050000-55d4-7653-9c37-558fa266f6cf	9233	Odranci
00050000-55d4-7653-2a7e-e5f1d9787903	2317	Oplotnica
00050000-55d4-7653-d171-a0b6e9f35c63	2312	Orehova vas
00050000-55d4-7653-9172-5bfa142e6a74	2270	Ormož
00050000-55d4-7653-9561-58c878a6601e	1316	Ortnek
00050000-55d4-7653-8f1e-0756c0bbbb4c	1337	Osilnica
00050000-55d4-7653-0b7c-c4437ac7a075	8222	Otočec
00050000-55d4-7653-e28c-599bebb5cfc7	2361	Ožbalt
00050000-55d4-7653-79ad-8b97b18b760b	2231	Pernica
00050000-55d4-7653-01c0-5ae7a50517fe	2211	Pesnica pri Mariboru
00050000-55d4-7653-01eb-ab8b28caafff	9203	Petrovci
00050000-55d4-7653-e960-c7d09f2cd378	3301	Petrovče
00050000-55d4-7653-4f76-935f7676a933	6330	Piran/Pirano
00050000-55d4-7653-23cd-9f21cd1f46f8	8255	Pišece
00050000-55d4-7653-8887-68b84c821a2f	6257	Pivka
00050000-55d4-7653-a9b7-821d763ee285	6232	Planina
00050000-55d4-7653-b89a-2d5ec6f18f7a	3225	Planina pri Sevnici
00050000-55d4-7653-8502-ebf581a6905d	6276	Pobegi
00050000-55d4-7653-734c-fc59d132927d	8312	Podbočje
00050000-55d4-7653-bb13-d58add7cee51	5243	Podbrdo
00050000-55d4-7653-3420-f750f956b122	3254	Podčetrtek
00050000-55d4-7653-2132-d85ae2bbff70	2273	Podgorci
00050000-55d4-7653-ecdb-816d147e02b1	6216	Podgorje
00050000-55d4-7653-c2ac-55bc58b58fb6	2381	Podgorje pri Slovenj Gradcu
00050000-55d4-7653-d2e8-8d9f9c059823	6244	Podgrad
00050000-55d4-7653-68b8-d1f3da65a5ff	1414	Podkum
00050000-55d4-7653-2393-aec0d0263ae2	2286	Podlehnik
00050000-55d4-7653-a213-3949a93f1551	5272	Podnanos
00050000-55d4-7653-1ad2-70f9e31e196a	4244	Podnart
00050000-55d4-7653-2691-e900a870a15f	3241	Podplat
00050000-55d4-7653-5d81-c4a4eb6a27cd	3257	Podsreda
00050000-55d4-7653-7e89-2e9264d392bf	2363	Podvelka
00050000-55d4-7653-6768-97d6ca1a7c21	2208	Pohorje
00050000-55d4-7653-7e34-223f74b87399	2257	Polenšak
00050000-55d4-7653-75e2-0bc483d3f6dc	1355	Polhov Gradec
00050000-55d4-7653-311f-7d35341ca1b7	4223	Poljane nad Škofjo Loko
00050000-55d4-7653-60d2-59db5faf0c0a	2319	Poljčane
00050000-55d4-7653-0718-c1a99653f292	1272	Polšnik
00050000-55d4-7653-d5c9-d32a314dfef4	3313	Polzela
00050000-55d4-7653-35c8-3411f5f208c3	3232	Ponikva
00050000-55d4-7653-c03e-55baa4c19532	6320	Portorož/Portorose
00050000-55d4-7653-47dd-a0c87fc3148b	6230	Postojna
00050000-55d4-7653-3e2d-ad5c5a671279	2331	Pragersko
00050000-55d4-7653-556b-2f4698c5c345	3312	Prebold
00050000-55d4-7653-7e58-e6704d9dc830	4205	Preddvor
00050000-55d4-7653-bf8f-0efb0cf8b8ea	6255	Prem
00050000-55d4-7653-37fa-5389b50721eb	1352	Preserje
00050000-55d4-7653-2c59-f1e00b644a19	6258	Prestranek
00050000-55d4-7653-2526-9195744c6bd6	2391	Prevalje
00050000-55d4-7653-fda1-21d6be39ddcf	3262	Prevorje
00050000-55d4-7653-e7d5-f63cb7d12072	1276	Primskovo 
00050000-55d4-7653-f7c2-a7af932ab811	3253	Pristava pri Mestinju
00050000-55d4-7653-45b6-88826f4a8598	9207	Prosenjakovci/Partosfalva
00050000-55d4-7653-5c87-5756d84b43a1	5297	Prvačina
00050000-55d4-7653-b238-0604664de6b1	2250	Ptuj
00050000-55d4-7653-6c3a-05b62f015e48	2323	Ptujska Gora
00050000-55d4-7653-6742-a1e208b54740	9201	Puconci
00050000-55d4-7653-a2c9-3982868801d6	2327	Rače
00050000-55d4-7653-82fd-829730b9ad6a	1433	Radeče
00050000-55d4-7653-7f6c-71240bd6fde8	9252	Radenci
00050000-55d4-7653-5356-90983a11a16a	2360	Radlje ob Dravi
00050000-55d4-7653-9139-61193f9b0fe8	1235	Radomlje
00050000-55d4-7653-2241-4b3e65da059e	4240	Radovljica
00050000-55d4-7653-68e0-345eb31bc9cf	8274	Raka
00050000-55d4-7653-f2fc-ba5ba7e6a715	1381	Rakek
00050000-55d4-7653-1164-4e6972908324	4283	Rateče - Planica
00050000-55d4-7653-2cb1-f05c61c649cc	2390	Ravne na Koroškem
00050000-55d4-7653-5206-10ac911828e2	9246	Razkrižje
00050000-55d4-7653-2227-618f2ff2b825	3332	Rečica ob Savinji
00050000-55d4-7653-13b0-3cd185a6152f	5292	Renče
00050000-55d4-7653-3054-e81b0916f71f	1310	Ribnica
00050000-55d4-7653-9df5-64127796aec1	2364	Ribnica na Pohorju
00050000-55d4-7653-f9e5-72a6a6a5d2ea	3272	Rimske Toplice
00050000-55d4-7653-6374-581bbdd863c8	1314	Rob
00050000-55d4-7653-4403-a688fe5584c0	5215	Ročinj
00050000-55d4-7653-9217-387361ea3628	3250	Rogaška Slatina
00050000-55d4-7653-aa48-f2ad20b998cb	9262	Rogašovci
00050000-55d4-7653-ea50-1ee58c383544	3252	Rogatec
00050000-55d4-7653-efec-987d8e744dc2	1373	Rovte
00050000-55d4-7653-50dc-63971d65bab4	2342	Ruše
00050000-55d4-7653-0111-3760e75c2591	1282	Sava
00050000-55d4-7653-3826-3bec700f8b30	6333	Sečovlje/Sicciole
00050000-55d4-7653-836c-5a9f1c6c8a75	4227	Selca
00050000-55d4-7653-4e20-5b79d592d69b	2352	Selnica ob Dravi
00050000-55d4-7653-cfd6-924c6b2c5bf7	8333	Semič
00050000-55d4-7653-f02b-3e94b1e0a9d4	8281	Senovo
00050000-55d4-7653-4e20-516c03e8f665	6224	Senožeče
00050000-55d4-7653-158f-26d0dcdce66e	8290	Sevnica
00050000-55d4-7653-ca34-3e20e6bb4bad	6210	Sežana
00050000-55d4-7653-3331-e1087285181b	2214	Sladki Vrh
00050000-55d4-7653-6a3e-cb6e232cefd7	5283	Slap ob Idrijci
00050000-55d4-7653-6744-965b77dea0e4	2380	Slovenj Gradec
00050000-55d4-7653-69de-eaf7959eba03	2310	Slovenska Bistrica
00050000-55d4-7653-621f-70e692bffd46	3210	Slovenske Konjice
00050000-55d4-7653-1390-1c9af51525b2	1216	Smlednik
00050000-55d4-7653-7108-a60efa1839a3	5232	Soča
00050000-55d4-7653-5041-1090fcf7a7ba	1317	Sodražica
00050000-55d4-7653-3ab6-6d26d3a46b3d	3335	Solčava
00050000-55d4-7653-7497-9f00f76dbdfc	5250	Solkan
00050000-55d4-7653-168a-8b24969c4beb	4229	Sorica
00050000-55d4-7653-b98a-d991aae1ca13	4225	Sovodenj
00050000-55d4-7653-9f18-1f15db9a1fcd	5281	Spodnja Idrija
00050000-55d4-7653-e2a0-50634a7c1321	2241	Spodnji Duplek
00050000-55d4-7653-bf22-3945f4cd99e7	9245	Spodnji Ivanjci
00050000-55d4-7653-bf08-a45c18a15322	2277	Središče ob Dravi
00050000-55d4-7653-c3a5-3457b3a2f169	4267	Srednja vas v Bohinju
00050000-55d4-7653-640a-03db69343955	8256	Sromlje 
00050000-55d4-7653-4c8e-a091530ad4a3	5224	Srpenica
00050000-55d4-7653-20fd-f7d25b729b8d	1242	Stahovica
00050000-55d4-7653-5a4d-2a1ae54aef29	1332	Stara Cerkev
00050000-55d4-7653-e99a-338408b27936	8342	Stari trg ob Kolpi
00050000-55d4-7653-7bc4-a1535d86bb23	1386	Stari trg pri Ložu
00050000-55d4-7653-1715-a4afa58b5d64	2205	Starše
00050000-55d4-7653-d013-52d2844f523a	2289	Stoperce
00050000-55d4-7653-65fc-d5c7c72152ba	8322	Stopiče
00050000-55d4-7653-938c-806ffd0c8bf6	3206	Stranice
00050000-55d4-7653-2dfe-cd8037d4e378	8351	Straža
00050000-55d4-7653-8adc-8f73615e2def	1313	Struge
00050000-55d4-7653-e60b-7f2ea8940298	8293	Studenec
00050000-55d4-7653-78e8-9797eb3cd338	8331	Suhor
00050000-55d4-7653-01ee-51d8532042ea	2233	Sv. Ana v Slovenskih goricah
00050000-55d4-7653-f278-48d5e33f75cb	2235	Sv. Trojica v Slovenskih goricah
00050000-55d4-7653-dbe4-01a8ebac387e	2353	Sveti Duh na Ostrem Vrhu
00050000-55d4-7653-41c5-813caf2bb592	9244	Sveti Jurij ob Ščavnici
00050000-55d4-7653-862c-4da4740c52c5	3264	Sveti Štefan
00050000-55d4-7653-1102-7a1c3aa18aac	2258	Sveti Tomaž
00050000-55d4-7653-cd7b-a22e3ee1b6ae	9204	Šalovci
00050000-55d4-7653-6d1d-0f18b2de4128	5261	Šempas
00050000-55d4-7653-9ee8-e11fd6ea95b5	5290	Šempeter pri Gorici
00050000-55d4-7653-02c0-f70be6d8dab6	3311	Šempeter v Savinjski dolini
00050000-55d4-7653-ad55-c192d35b0d75	4208	Šenčur
00050000-55d4-7653-83fb-301ab636a412	2212	Šentilj v Slovenskih goricah
00050000-55d4-7653-261e-901fdda0415c	8297	Šentjanž
00050000-55d4-7653-968f-e52dffd1d299	2373	Šentjanž pri Dravogradu
00050000-55d4-7653-ff61-be79ac313434	8310	Šentjernej
00050000-55d4-7653-9c10-0e0a377ec620	3230	Šentjur
00050000-55d4-7653-2fdd-4f0af7213262	3271	Šentrupert
00050000-55d4-7653-4936-30afaed0a084	8232	Šentrupert
00050000-55d4-7653-ff19-1b4fd300b7a7	1296	Šentvid pri Stični
00050000-55d4-7653-f7e3-3e1bad19494d	8275	Škocjan
00050000-55d4-7653-6fe1-855ec57cabbb	6281	Škofije
00050000-55d4-7653-f8cb-0ebff7f5f77d	4220	Škofja Loka
00050000-55d4-7653-3ebd-89ba51c0a496	3211	Škofja vas
00050000-55d4-7653-d8f6-bb73e101f057	1291	Škofljica
00050000-55d4-7653-3186-b5a1812c9af9	6274	Šmarje
00050000-55d4-7653-ac2b-957bad2ac68f	1293	Šmarje - Sap
00050000-55d4-7653-0e1c-2899868c1143	3240	Šmarje pri Jelšah
00050000-55d4-7653-93e0-399607f2d3ce	8220	Šmarješke Toplice
00050000-55d4-7653-c3c5-28e8af98ddf7	2315	Šmartno na Pohorju
00050000-55d4-7653-b78f-dd487e9dc112	3341	Šmartno ob Dreti
00050000-55d4-7653-a249-0d1aaad2bd33	3327	Šmartno ob Paki
00050000-55d4-7653-251d-bcef46bfc78b	1275	Šmartno pri Litiji
00050000-55d4-7653-1259-dc69f59c3590	2383	Šmartno pri Slovenj Gradcu
00050000-55d4-7653-9a87-a35dd4c2c20f	3201	Šmartno v Rožni dolini
00050000-55d4-7653-20f1-bcc3c6e5fb68	3325	Šoštanj
00050000-55d4-7653-e111-40d681e69c85	6222	Štanjel
00050000-55d4-7653-a511-12e254e3a1a2	3220	Štore
00050000-55d4-7653-8ad1-d8eefa48ac51	3304	Tabor
00050000-55d4-7653-94d5-0c1dc509a096	3221	Teharje
00050000-55d4-7653-d87b-9afd14aba37a	9251	Tišina
00050000-55d4-7653-b802-5b27efb830d8	5220	Tolmin
00050000-55d4-7653-44a8-6e879028ddb2	3326	Topolšica
00050000-55d4-7653-5ced-ec48dfeda74b	2371	Trbonje
00050000-55d4-7653-f492-a9fb751edf0a	1420	Trbovlje
00050000-55d4-7653-659f-9ff229f68f51	8231	Trebelno 
00050000-55d4-7653-710f-001b604b8c08	8210	Trebnje
00050000-55d4-7653-f2d9-21e07ad63c8a	5252	Trnovo pri Gorici
00050000-55d4-7653-dd72-bf955e37f987	2254	Trnovska vas
00050000-55d4-7653-6a6d-033920c4cb01	1222	Trojane
00050000-55d4-7653-4d30-a3e2f30d7100	1236	Trzin
00050000-55d4-7653-3dbe-b85a6cbd11f2	4290	Tržič
00050000-55d4-7653-9736-46424c5aafa0	8295	Tržišče
00050000-55d4-7653-e177-aa1acce6f37e	1311	Turjak
00050000-55d4-7653-747e-ae6dbe3d2eec	9224	Turnišče
00050000-55d4-7653-505b-1e499cf3bebc	8323	Uršna sela
00050000-55d4-7653-87cf-cf745070a52b	1252	Vače
00050000-55d4-7653-e87e-1f29eef52846	3320	Velenje 
00050000-55d4-7653-7101-48bd0d1ef10a	3322	Velenje - poštni predali
00050000-55d4-7653-2c68-2982e68f0959	8212	Velika Loka
00050000-55d4-7653-8ed6-d994c3c15f19	2274	Velika Nedelja
00050000-55d4-7653-8c78-0c2b2e2ed77c	9225	Velika Polana
00050000-55d4-7653-8670-2bba3e826cf5	1315	Velike Lašče
00050000-55d4-7653-2f75-24a9c7405658	8213	Veliki Gaber
00050000-55d4-7653-5a77-ba3463d766bc	9241	Veržej
00050000-55d4-7653-ece0-500f74417ac2	1312	Videm - Dobrepolje
00050000-55d4-7653-2008-29e13d708ed2	2284	Videm pri Ptuju
00050000-55d4-7653-34c8-27479f9c399d	8344	Vinica
00050000-55d4-7653-6f93-9924c043007e	5271	Vipava
00050000-55d4-7653-b304-da54baef4b02	4212	Visoko
00050000-55d4-7653-5af0-7e54e6da055d	1294	Višnja Gora
00050000-55d4-7653-d9b3-bb4243c985f7	3205	Vitanje
00050000-55d4-7653-669f-1b0ce4800f86	2255	Vitomarci
00050000-55d4-7653-2a18-2c83acdf701f	1217	Vodice
00050000-55d4-7653-f3a8-004a765dba5b	3212	Vojnik\t
00050000-55d4-7653-2f6a-b65cb5cbc65e	5293	Volčja Draga
00050000-55d4-7653-8302-1e09dcb30969	2232	Voličina
00050000-55d4-7653-bd8f-e020090163b9	3305	Vransko
00050000-55d4-7653-5a1c-1ece89752669	6217	Vremski Britof
00050000-55d4-7653-0d6b-91771b0d94fd	1360	Vrhnika
00050000-55d4-7653-d5fd-1a061d6ff507	2365	Vuhred
00050000-55d4-7653-9e6b-b81e4626043e	2367	Vuzenica
00050000-55d4-7653-ae9f-1f15754c1cf1	8292	Zabukovje 
00050000-55d4-7653-6503-85db8a9e5190	1410	Zagorje ob Savi
00050000-55d4-7653-b819-f3af0242277d	1303	Zagradec
00050000-55d4-7653-73b7-2ad7498fa20e	2283	Zavrč
00050000-55d4-7653-6ece-d7edad28cc52	8272	Zdole 
00050000-55d4-7653-4ff3-425f23d5d14a	4201	Zgornja Besnica
00050000-55d4-7653-a60e-8691209c0eb7	2242	Zgornja Korena
00050000-55d4-7653-25cb-cd6b597fa41b	2201	Zgornja Kungota
00050000-55d4-7653-0c9a-6074b9468b34	2316	Zgornja Ložnica
00050000-55d4-7653-99cc-d1c2ba455c9a	2314	Zgornja Polskava
00050000-55d4-7653-05d4-d82d11db80de	2213	Zgornja Velka
00050000-55d4-7653-127c-daa89e9d8124	4247	Zgornje Gorje
00050000-55d4-7653-d22e-7af13653d58d	4206	Zgornje Jezersko
00050000-55d4-7653-c476-07ad82905eed	2285	Zgornji Leskovec
00050000-55d4-7653-9569-19afe584fe61	1432	Zidani Most
00050000-55d4-7653-14c0-eacdd9ee22ff	3214	Zreče
00050000-55d4-7653-dc63-5f0e0eb8a08e	4209	Žabnica
00050000-55d4-7653-942e-0b9f777445fc	3310	Žalec
00050000-55d4-7653-cbad-7da3260b2652	4228	Železniki
00050000-55d4-7653-52b8-a2100aa085ca	2287	Žetale
00050000-55d4-7653-c0e2-dca8beb32fd6	4226	Žiri
00050000-55d4-7653-0d03-4f927265afc8	4274	Žirovnica
00050000-55d4-7653-e88d-653d80a4c018	8360	Žužemberk
\.


--
-- TOC entry 2913 (class 0 OID 14947076)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 14946883)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 14946961)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 14947088)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 14947419)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 14947429)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d4-7654-b50a-7fd04d3ef5b6	00080000-55d4-7654-06eb-394563ba31a0	0900	AK
00190000-55d4-7654-5301-831f62cae93b	00080000-55d4-7654-97c0-d9bb32f4ac24	0987	AK
00190000-55d4-7654-dad1-f3103db67026	00080000-55d4-7654-a21a-28b372f7c0a5	0989	AK
00190000-55d4-7654-267c-6bfd489d4212	00080000-55d4-7654-d7b5-33348c2bc94c	0986	AK
00190000-55d4-7654-d893-78de4da23059	00080000-55d4-7654-4b8c-d59c496d4102	0984	AK
00190000-55d4-7654-2b3d-0273534201a3	00080000-55d4-7654-da47-ec4410e7a35f	0983	AK
00190000-55d4-7654-88fb-f4d227927755	00080000-55d4-7654-93d1-d768b7773574	0982	AK
\.


--
-- TOC entry 2937 (class 0 OID 14947375)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d4-7654-7f8d-4d9e5cf2c402	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2940 (class 0 OID 14947437)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 14947117)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d4-7654-da82-54276adf5260	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d4-7654-1140-4990a7bbee4d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d4-7654-e12c-4718b1797114	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d4-7654-27d0-4144a3383a99	0004	Mali oder	t	24	Mali oder 
00220000-55d4-7654-9015-237ac1e59dce	0005	Komorni oder	t	15	Komorni oder
00220000-55d4-7654-60ea-5111d8e4de24	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d4-7654-39f0-e3d5f014143f	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2911 (class 0 OID 14947061)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 14947051)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 14947236)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 14947185)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 14946755)
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
-- TOC entry 2920 (class 0 OID 14947127)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 14946793)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d4-7653-66f0-c9678d71b2bb	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d4-7653-cb90-b87e5f9c1b79	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d4-7653-a1d0-f3acd7991d4d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d4-7653-34e8-91e082cb284e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d4-7653-b566-da08276b0994	planer	Planer dogodkov v koledarju	t
00020000-55d4-7653-ecb5-5e8a844b2e78	kadrovska	Kadrovska služba	t
00020000-55d4-7653-6a88-454805307539	arhivar	Ažuriranje arhivalij	t
00020000-55d4-7653-6afb-a1263905a554	igralec	Igralec	t
00020000-55d4-7653-69a1-4fc0a6c9400e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d4-7654-6e67-a74ba903a6f8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2886 (class 0 OID 14946777)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d4-7653-f194-ffb2ca44095c	00020000-55d4-7653-a1d0-f3acd7991d4d
00010000-55d4-7653-138f-afa126429a5d	00020000-55d4-7653-a1d0-f3acd7991d4d
00010000-55d4-7654-e8e8-45f64b6d7cd8	00020000-55d4-7654-6e67-a74ba903a6f8
\.


--
-- TOC entry 2922 (class 0 OID 14947141)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 14947082)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 14947028)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 14947478)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d4-7653-a2d4-fccba27f4f10	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d4-7653-4d37-f100e6cb40a9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d4-7653-64ca-28e12331f82f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d4-7653-a842-68d49cdaf900	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d4-7653-2364-fb0eb080f3f7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2944 (class 0 OID 14947470)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d4-7653-0791-6a0975dea441	00230000-55d4-7653-a842-68d49cdaf900	popa
00240000-55d4-7653-e627-a47d6bb6a749	00230000-55d4-7653-a842-68d49cdaf900	oseba
00240000-55d4-7653-927e-d59253bdf4cb	00230000-55d4-7653-a842-68d49cdaf900	sezona
00240000-55d4-7653-8aa7-4a3a13ff4a7c	00230000-55d4-7653-4d37-f100e6cb40a9	prostor
00240000-55d4-7653-4521-1dc2b032debb	00230000-55d4-7653-a842-68d49cdaf900	besedilo
00240000-55d4-7653-a1fe-854af3850351	00230000-55d4-7653-a842-68d49cdaf900	uprizoritev
00240000-55d4-7653-87ad-8ec7c0434fd6	00230000-55d4-7653-a842-68d49cdaf900	funkcija
00240000-55d4-7653-54d4-646021cb49a6	00230000-55d4-7653-a842-68d49cdaf900	tipfunkcije
00240000-55d4-7653-ec28-ea467bcf0297	00230000-55d4-7653-a842-68d49cdaf900	alternacija
00240000-55d4-7653-79e9-8ae5c26fe3ab	00230000-55d4-7653-a2d4-fccba27f4f10	pogodba
00240000-55d4-7653-76e2-d354003534d8	00230000-55d4-7653-a842-68d49cdaf900	zaposlitev
00240000-55d4-7653-eb23-77c3dee94be1	00230000-55d4-7653-a2d4-fccba27f4f10	programdela
00240000-55d4-7653-2da3-dba528905f28	00230000-55d4-7653-a842-68d49cdaf900	zapis
\.


--
-- TOC entry 2943 (class 0 OID 14947465)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 14947195)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d4-7654-cde3-fa40423fa3a4	000e0000-55d4-7654-e1c4-4123892cd288	00080000-55d4-7654-0219-a545a10e9e38	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d4-7654-09b9-ae1b8de4d8ff	000e0000-55d4-7654-e1c4-4123892cd288	00080000-55d4-7654-0219-a545a10e9e38	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d4-7654-03e5-7bc27b58bd7c	000e0000-55d4-7654-e1c4-4123892cd288	00080000-55d4-7654-3840-431e6c87f6de	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55d4-7654-329a-8bceb29a0281	000e0000-55d4-7654-e1c4-4123892cd288	00080000-55d4-7654-3840-431e6c87f6de	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2893 (class 0 OID 14946855)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 14947038)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d4-7654-3b3f-1af375c5c09f	00180000-55d4-7654-d025-81bbd6e68a86	000c0000-55d4-7654-3b14-197324f95f61	00090000-55d4-7654-b84e-e0b4c76f123a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-7654-6020-1177044a18f8	00180000-55d4-7654-d025-81bbd6e68a86	000c0000-55d4-7654-d5a8-5e9a2d95efe4	00090000-55d4-7654-910b-6c3d9e68754f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-7654-69d0-753d5296e5a2	00180000-55d4-7654-d025-81bbd6e68a86	000c0000-55d4-7654-1e2d-18f87a44f51b	00090000-55d4-7654-ef20-d82326cde72f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-7654-8db3-a9d8404510cb	00180000-55d4-7654-d025-81bbd6e68a86	000c0000-55d4-7654-def7-39af1b425bac	00090000-55d4-7654-3b81-cb9bad09d6a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-7654-9feb-0fede657599b	00180000-55d4-7654-d025-81bbd6e68a86	000c0000-55d4-7654-3313-1a3941418229	00090000-55d4-7654-a238-322558a9f0f1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d4-7654-5606-81adb26dffc8	00180000-55d4-7654-b5a8-3ddfb23bffb1	\N	00090000-55d4-7654-a238-322558a9f0f1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2929 (class 0 OID 14947225)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d4-7653-0e22-c83fea7ccee7	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d4-7653-4371-d77ef94eed75	Priredba	Priredba	Priredba	umetnik
000f0000-55d4-7653-ce45-94de40e14383	Prevod	Prevod	Prevod	umetnik
000f0000-55d4-7653-b7d6-dd27f9935a9d	Režija	Režija	Režija	umetnik
000f0000-55d4-7653-10db-9b732ebf3bb8	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d4-7653-70c3-4b0a6ed64699	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55d4-7653-694b-285b9e140556	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55d4-7653-1b4d-82a76ae208c4	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d4-7653-644b-277090ed46a0	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55d4-7653-72c6-59575426191a	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55d4-7653-cc35-dca1d58cd750	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d4-7653-7435-a103ce5f5649	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d4-7653-2915-b47ebc624a1e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55d4-7653-aae5-5d0e0a44a444	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55d4-7653-62e9-bb34d7e0f8aa	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d4-7653-ae1b-46531d20d69a	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d4-7653-5433-f66ea7c7913c	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d4-7653-01e4-5cd4763b483b	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2941 (class 0 OID 14947447)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d4-7653-fef7-c1037e629caf	01	Velika predstava	f	1.00	1.00
002b0000-55d4-7653-8ad5-e4963d333c12	02	Mala predstava	f	0.50	0.50
002b0000-55d4-7653-21a5-57e9aab94513	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d4-7653-ed46-fbaee467118d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d4-7653-193b-e5c051870cfd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2898 (class 0 OID 14946918)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 14946764)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d4-7653-138f-afa126429a5d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROK/uqkN0Zpa7PokHhGjsELTQ0drSPFby	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d4-7654-7765-91fcd402ff6e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d4-7654-5921-33ad9b44b759	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d4-7654-a9b6-eed9d426998c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d4-7654-3604-eceab67d5936	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d4-7654-560b-ada21bc82c72	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d4-7654-3a1b-49863cb134a3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d4-7654-4661-345c61c91226	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d4-7654-3cc2-0a2e49ec559c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d4-7654-b51f-3032b89cb82d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d4-7654-e8e8-45f64b6d7cd8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d4-7653-f194-ffb2ca44095c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2933 (class 0 OID 14947273)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d4-7654-76a9-2c36e03349f4	00160000-55d4-7654-ea1d-61df24ef258d	00150000-55d4-7653-9a64-f9a7172880b5	00140000-55d4-7652-ad9e-042a745bb000	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d4-7654-9015-237ac1e59dce
000e0000-55d4-7654-e1c4-4123892cd288	00160000-55d4-7654-7a5c-2c540b731c5c	00150000-55d4-7653-521d-de4296adafa4	00140000-55d4-7652-19ae-4a92165d22de	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d4-7654-60ea-5111d8e4de24
000e0000-55d4-7654-2a6a-80fd5a447d1d	\N	00150000-55d4-7653-521d-de4296adafa4	00140000-55d4-7652-19ae-4a92165d22de	00190000-55d4-7654-5301-831f62cae93b	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d4-7654-9015-237ac1e59dce
000e0000-55d4-7654-5902-beb2b353c231	\N	00150000-55d4-7653-521d-de4296adafa4	00140000-55d4-7652-19ae-4a92165d22de	00190000-55d4-7654-5301-831f62cae93b	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d4-7654-9015-237ac1e59dce
000e0000-55d4-7654-4786-0aeceb783546	\N	00150000-55d4-7653-521d-de4296adafa4	00140000-55d4-7652-19ae-4a92165d22de	00190000-55d4-7654-5301-831f62cae93b	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d4-7654-da82-54276adf5260
000e0000-55d4-7654-728a-e33938829007	\N	00150000-55d4-7653-521d-de4296adafa4	00140000-55d4-7652-19ae-4a92165d22de	00190000-55d4-7654-5301-831f62cae93b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d4-7654-da82-54276adf5260
\.


--
-- TOC entry 2903 (class 0 OID 14946980)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d4-7654-66e2-5d91f3ca8db6	000e0000-55d4-7654-e1c4-4123892cd288	1	
00200000-55d4-7654-9dd5-66b40ae2d3db	000e0000-55d4-7654-e1c4-4123892cd288	2	
\.


--
-- TOC entry 2918 (class 0 OID 14947109)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 14947517)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 14947489)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 14947529)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 14947178)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d4-7654-db5a-bd5374967b8b	00090000-55d4-7654-910b-6c3d9e68754f	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-7654-d733-62b15887841c	00090000-55d4-7654-ef20-d82326cde72f	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-7654-7bf2-30df707168ac	00090000-55d4-7654-47bf-cb4f25c117f6	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-7654-a28c-4f3a9bbefaac	00090000-55d4-7654-fd45-27c7addc3a59	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-7654-3fe2-1790d30a87de	00090000-55d4-7654-b84e-e0b4c76f123a	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d4-7654-9af1-51936eddfc3d	00090000-55d4-7654-2b45-a0ea50053848	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2905 (class 0 OID 14947012)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 14947263)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d4-7652-ad9e-042a745bb000	01	Drama	drama (SURS 01)
00140000-55d4-7652-1056-3a4d8387d328	02	Opera	opera (SURS 02)
00140000-55d4-7652-27fa-d195c992a2df	03	Balet	balet (SURS 03)
00140000-55d4-7652-8037-87bf51c5ea30	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d4-7652-38e1-45de0ecd77bf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d4-7652-19ae-4a92165d22de	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d4-7652-b207-e091a7019b3a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2924 (class 0 OID 14947168)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d4-7653-cdd7-55209e34286a	01	Opera	opera
00150000-55d4-7653-d4a9-dc85d88f1a56	02	Opereta	opereta
00150000-55d4-7653-01d2-2184f46637bf	03	Balet	balet
00150000-55d4-7653-9f36-442f2b3768ff	04	Plesne prireditve	plesne prireditve
00150000-55d4-7653-da83-98a4b30ff88b	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d4-7653-091c-071563d9c6c0	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d4-7653-2586-dc9e024d0003	07	Biografska drama	biografska drama
00150000-55d4-7653-9a64-f9a7172880b5	08	Komedija	komedija
00150000-55d4-7653-1837-7c12eeca0faa	09	Črna komedija	črna komedija
00150000-55d4-7653-910a-dbfe988146ec	10	E-igra	E-igra
00150000-55d4-7653-521d-de4296adafa4	11	Kriminalka	kriminalka
00150000-55d4-7653-4701-9e21baf9e497	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 14946818)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 14947320)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 14947310)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 14947224)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 14947569)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 14947002)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 14947027)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 14947463)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 14946944)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 14947369)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 14947164)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 14946978)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 14947021)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 14946958)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 14947074)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 14947546)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 14947553)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2676 (class 2606 OID 14947577)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 14947101)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 14946916)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 14946827)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 14946851)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 14946807)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 14946792)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 14947107)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 14947140)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 14947258)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 14946880)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 14946904)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 14947080)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 14946894)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 14946965)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 14947092)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 14947426)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 14947434)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 14947417)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 14947445)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 14947124)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 14947065)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 14947056)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 14947246)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 14947192)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 14946763)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 14947131)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 14946781)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 14946801)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 14947149)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 14947087)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 14947036)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 14947487)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 14947475)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 14947469)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 14947205)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 14946860)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 14947047)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 14947235)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 14947457)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 14946929)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 14946776)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 14947289)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 14946987)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 14947115)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 14947527)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 14947511)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 14947535)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 14947183)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 14947016)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 14947271)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 14947176)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 14947009)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2576 (class 1259 OID 14947206)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 14947207)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 14947548)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2663 (class 1259 OID 14947547)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2449 (class 1259 OID 14946882)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2541 (class 1259 OID 14947108)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2649 (class 1259 OID 14947515)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2650 (class 1259 OID 14947514)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2651 (class 1259 OID 14947516)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2652 (class 1259 OID 14947513)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2653 (class 1259 OID 14947512)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2535 (class 1259 OID 14947094)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 14947093)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 14946988)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 14947165)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 14947167)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2565 (class 1259 OID 14947166)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 14946960)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 14946959)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2632 (class 1259 OID 14947446)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2586 (class 1259 OID 14947260)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 14947261)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2588 (class 1259 OID 14947262)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2659 (class 1259 OID 14947536)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 14947294)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2596 (class 1259 OID 14947291)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2597 (class 1259 OID 14947295)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2598 (class 1259 OID 14947293)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2599 (class 1259 OID 14947292)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 14946931)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 14946930)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 14946854)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2551 (class 1259 OID 14947132)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 14947022)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 14946808)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 14946809)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2556 (class 1259 OID 14947152)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2557 (class 1259 OID 14947151)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 14947150)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 14946966)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 14946968)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 14946967)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 14947477)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2515 (class 1259 OID 14947060)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2516 (class 1259 OID 14947058)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2517 (class 1259 OID 14947057)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2518 (class 1259 OID 14947059)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 14946782)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 14946783)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 14947116)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2672 (class 1259 OID 14947570)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2673 (class 1259 OID 14947578)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2674 (class 1259 OID 14947579)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2530 (class 1259 OID 14947081)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2572 (class 1259 OID 14947193)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2573 (class 1259 OID 14947194)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 14947374)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2617 (class 1259 OID 14947373)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2618 (class 1259 OID 14947370)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 14947371)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2620 (class 1259 OID 14947372)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 14946896)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 14946895)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 14946897)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2624 (class 1259 OID 14947427)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2625 (class 1259 OID 14947428)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2609 (class 1259 OID 14947324)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 14947325)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2611 (class 1259 OID 14947322)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2612 (class 1259 OID 14947323)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2569 (class 1259 OID 14947184)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 14947069)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2522 (class 1259 OID 14947068)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2523 (class 1259 OID 14947066)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2524 (class 1259 OID 14947067)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 14947312)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2606 (class 1259 OID 14947311)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2621 (class 1259 OID 14947418)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 14946979)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 14947464)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2666 (class 1259 OID 14947554)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 14947555)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2436 (class 1259 OID 14946829)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 14946828)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 14946861)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 14946862)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 14947050)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2511 (class 1259 OID 14947049)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2512 (class 1259 OID 14947048)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2492 (class 1259 OID 14947011)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 14947007)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 14947004)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 14947005)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 14947003)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 14947008)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 14947006)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 14946881)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 14946945)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 14946947)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 14946946)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 14946948)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2529 (class 1259 OID 14947075)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2591 (class 1259 OID 14947259)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 14947290)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 14946852)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 14946853)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2566 (class 1259 OID 14947177)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 14947488)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 14946917)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 14947476)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2549 (class 1259 OID 14947126)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2550 (class 1259 OID 14947125)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 14947321)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2460 (class 1259 OID 14946905)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 14947272)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 14947528)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2630 (class 1259 OID 14947435)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 14947436)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 14947037)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2429 (class 1259 OID 14946802)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 14947010)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2702 (class 2606 OID 14947715)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2705 (class 2606 OID 14947700)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2704 (class 2606 OID 14947705)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2700 (class 2606 OID 14947725)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2706 (class 2606 OID 14947695)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2701 (class 2606 OID 14947720)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2703 (class 2606 OID 14947710)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2736 (class 2606 OID 14947870)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 14947875)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 14948045)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2770 (class 2606 OID 14948040)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 14947630)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2723 (class 2606 OID 14947810)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 14948025)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 14948020)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2763 (class 2606 OID 14948030)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 14948015)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2767 (class 2606 OID 14948010)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2721 (class 2606 OID 14947805)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2722 (class 2606 OID 14947800)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2699 (class 2606 OID 14947690)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2731 (class 2606 OID 14947840)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 14947850)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2730 (class 2606 OID 14947845)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2693 (class 2606 OID 14947665)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 14947660)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2719 (class 2606 OID 14947790)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 14947995)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2739 (class 2606 OID 14947880)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 14947885)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 14947890)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2768 (class 2606 OID 14948035)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2741 (class 2606 OID 14947910)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2744 (class 2606 OID 14947895)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2740 (class 2606 OID 14947915)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2742 (class 2606 OID 14947905)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2743 (class 2606 OID 14947900)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2691 (class 2606 OID 14947655)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 14947650)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2683 (class 2606 OID 14947615)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2684 (class 2606 OID 14947610)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 14947820)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2707 (class 2606 OID 14947730)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 14947590)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2679 (class 2606 OID 14947595)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2726 (class 2606 OID 14947835)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2727 (class 2606 OID 14947830)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2728 (class 2606 OID 14947825)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2697 (class 2606 OID 14947670)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2695 (class 2606 OID 14947680)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2696 (class 2606 OID 14947675)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2762 (class 2606 OID 14948005)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2711 (class 2606 OID 14947765)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2713 (class 2606 OID 14947755)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2714 (class 2606 OID 14947750)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2712 (class 2606 OID 14947760)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2678 (class 2606 OID 14947580)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2677 (class 2606 OID 14947585)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2724 (class 2606 OID 14947815)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2773 (class 2606 OID 14948060)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 14948065)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2774 (class 2606 OID 14948070)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2720 (class 2606 OID 14947795)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2734 (class 2606 OID 14947860)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2733 (class 2606 OID 14947865)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 14947970)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2752 (class 2606 OID 14947965)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2755 (class 2606 OID 14947950)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2754 (class 2606 OID 14947955)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2753 (class 2606 OID 14947960)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2689 (class 2606 OID 14947640)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 14947635)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 14947645)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2758 (class 2606 OID 14947980)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2757 (class 2606 OID 14947985)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2748 (class 2606 OID 14947940)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2747 (class 2606 OID 14947945)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2750 (class 2606 OID 14947930)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2749 (class 2606 OID 14947935)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2732 (class 2606 OID 14947855)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 14947785)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2716 (class 2606 OID 14947780)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2718 (class 2606 OID 14947770)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2717 (class 2606 OID 14947775)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2745 (class 2606 OID 14947925)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 14947920)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2756 (class 2606 OID 14947975)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2698 (class 2606 OID 14947685)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 14947990)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 14948000)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2772 (class 2606 OID 14948050)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2771 (class 2606 OID 14948055)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2681 (class 2606 OID 14947605)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 14947600)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2686 (class 2606 OID 14947620)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 14947625)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 14947745)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 14947740)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2710 (class 2606 OID 14947735)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-19 14:28:05 CEST

--
-- PostgreSQL database dump complete
--

