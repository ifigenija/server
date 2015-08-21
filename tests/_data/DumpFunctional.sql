--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-21 15:58:59 CEST

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
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15231799)
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
-- TOC entry 222 (class 1259 OID 15232302)
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
-- TOC entry 221 (class 1259 OID 15232285)
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
-- TOC entry 215 (class 1259 OID 15232197)
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
-- TOC entry 238 (class 1259 OID 15232550)
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
-- TOC entry 191 (class 1259 OID 15231978)
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
-- TOC entry 194 (class 1259 OID 15232012)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15232452)
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
-- TOC entry 186 (class 1259 OID 15231921)
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
-- TOC entry 223 (class 1259 OID 15232315)
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
-- TOC entry 210 (class 1259 OID 15232142)
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
-- TOC entry 189 (class 1259 OID 15231958)
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
-- TOC entry 193 (class 1259 OID 15232006)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15231938)
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
-- TOC entry 199 (class 1259 OID 15232059)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15232531)
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
-- TOC entry 237 (class 1259 OID 15232543)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15232565)
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
-- TOC entry 203 (class 1259 OID 15232084)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15231895)
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
-- TOC entry 178 (class 1259 OID 15231808)
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
-- TOC entry 179 (class 1259 OID 15231819)
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
-- TOC entry 174 (class 1259 OID 15231773)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15231792)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15232091)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15232122)
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
-- TOC entry 218 (class 1259 OID 15232236)
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
-- TOC entry 181 (class 1259 OID 15231852)
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
-- TOC entry 183 (class 1259 OID 15231887)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15232065)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15231872)
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
-- TOC entry 188 (class 1259 OID 15231950)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15232077)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15232413)
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
-- TOC entry 226 (class 1259 OID 15232423)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15232369)
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
-- TOC entry 227 (class 1259 OID 15232431)
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
-- TOC entry 206 (class 1259 OID 15232106)
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
-- TOC entry 198 (class 1259 OID 15232050)
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
-- TOC entry 197 (class 1259 OID 15232040)
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
-- TOC entry 217 (class 1259 OID 15232225)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15232174)
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
-- TOC entry 171 (class 1259 OID 15231744)
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
-- TOC entry 170 (class 1259 OID 15231742)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15232116)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15231782)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15231766)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15232130)
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
-- TOC entry 201 (class 1259 OID 15232071)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15232017)
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
-- TOC entry 232 (class 1259 OID 15232472)
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
-- TOC entry 231 (class 1259 OID 15232464)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15232459)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15232184)
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
-- TOC entry 180 (class 1259 OID 15231844)
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
-- TOC entry 196 (class 1259 OID 15232027)
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
-- TOC entry 216 (class 1259 OID 15232214)
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
-- TOC entry 228 (class 1259 OID 15232441)
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
-- TOC entry 185 (class 1259 OID 15231907)
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
-- TOC entry 172 (class 1259 OID 15231753)
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
-- TOC entry 220 (class 1259 OID 15232262)
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
-- TOC entry 190 (class 1259 OID 15231969)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15232098)
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
-- TOC entry 234 (class 1259 OID 15232511)
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
-- TOC entry 233 (class 1259 OID 15232483)
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
-- TOC entry 235 (class 1259 OID 15232523)
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
-- TOC entry 212 (class 1259 OID 15232167)
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
-- TOC entry 192 (class 1259 OID 15232001)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15232252)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15232157)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15231747)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2895 (class 0 OID 15231799)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15232302)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d7-2ea2-2824-990fba10ff03	000d0000-55d7-2ea2-a6c2-12e491d6f3e2	\N	00090000-55d7-2ea2-345c-235b762a9fb9	000b0000-55d7-2ea2-d9ae-7f1b14c946bb	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d7-2ea2-3931-5dd01faca58d	000d0000-55d7-2ea2-e8eb-99edabd62997	00100000-55d7-2ea2-79e8-98baf1390d27	00090000-55d7-2ea2-7fd8-4f4652e17b14	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d7-2ea2-f3af-7490574cce1e	000d0000-55d7-2ea2-5e0c-3a452423cc04	00100000-55d7-2ea2-8116-5f8f0f1a14d2	00090000-55d7-2ea2-8772-cd1bfb697472	\N	0003	t	\N	2015-08-21	\N	2	\N	\N	f	f
000c0000-55d7-2ea2-bb68-3e517e4831e9	000d0000-55d7-2ea2-6eb7-4c4e821261ec	\N	00090000-55d7-2ea2-af69-b1f6fc081349	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d7-2ea2-9aa3-6def9f957808	000d0000-55d7-2ea2-b8dd-559df4ac22b4	\N	00090000-55d7-2ea2-d16d-1d64b26e5ab2	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d7-2ea2-799f-ba6d0447d116	000d0000-55d7-2ea2-a93b-6ec77995e1ec	\N	00090000-55d7-2ea2-1f0e-1f85af7d238d	000b0000-55d7-2ea2-0240-fba199b9e925	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d7-2ea2-2bdc-4d7de681cbc1	000d0000-55d7-2ea2-b7c4-4b8a8e225135	00100000-55d7-2ea2-1588-d7ea028f2016	00090000-55d7-2ea2-2f74-5071eb91071f	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d7-2ea2-015d-b8957d41b147	000d0000-55d7-2ea2-d2bb-8130eb7cc0c7	\N	00090000-55d7-2ea2-1cea-e4e6ac37484d	000b0000-55d7-2ea2-018d-3088803517eb	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d7-2ea2-19e5-426fded42a45	000d0000-55d7-2ea2-b7c4-4b8a8e225135	00100000-55d7-2ea2-58fb-ba6a43030825	00090000-55d7-2ea2-f166-649dc5cb3e2a	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d7-2ea2-93e2-d7217b159df2	000d0000-55d7-2ea2-b7c4-4b8a8e225135	00100000-55d7-2ea2-8f76-c84cd0d35630	00090000-55d7-2ea2-bfa4-ff8ffe4c45c4	\N	0010	t	\N	2015-08-21	\N	16	\N	\N	f	t
000c0000-55d7-2ea2-4a96-66e1cde2c9d8	000d0000-55d7-2ea2-b7c4-4b8a8e225135	00100000-55d7-2ea2-0660-8f25f2001dc0	00090000-55d7-2ea2-d768-133262209b28	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2939 (class 0 OID 15232285)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15232197)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d7-2ea2-4886-fd9eac62a89a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d7-2ea2-717f-d07e09a27ec0	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d7-2ea2-65d1-26e7a0751f93	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 15232550)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15231978)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d7-2ea2-51a0-de5b4d432050	\N	\N	00200000-55d7-2ea2-9e37-c31fa3622681	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d7-2ea2-c5e2-dd88c7cb7c4f	\N	\N	00200000-55d7-2ea2-eb41-1c679b959b25	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d7-2ea2-d666-5f18abe68672	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d7-2ea2-4c8d-06e15c9ac9d6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d7-2ea2-e693-ee4c36291bdf	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2912 (class 0 OID 15232012)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15232452)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15231921)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d7-2ea0-fd5c-aa9e44b821de	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d7-2ea0-4d90-c57a85827b20	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d7-2ea0-9b51-553b5d08f983	AL	ALB	008	Albania 	Albanija	\N
00040000-55d7-2ea0-e9e6-fb652aec3f57	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d7-2ea0-248c-f88cde4ad8a3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d7-2ea0-55a0-0a0a326260d0	AD	AND	020	Andorra 	Andora	\N
00040000-55d7-2ea0-45fb-87d927b027f1	AO	AGO	024	Angola 	Angola	\N
00040000-55d7-2ea0-b4ea-34a2f6abc57f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d7-2ea0-8be4-472ea72c3fc0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d7-2ea0-c7fb-de3791e9447b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d7-2ea0-ff11-44c1576903ad	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d7-2ea0-29be-e055903f34ff	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d7-2ea0-65ca-76cae6eca906	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d7-2ea0-3c66-df966aeabb21	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d7-2ea0-3e3a-e6de9d4ab193	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d7-2ea0-cb30-6c505a37329f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d7-2ea0-6ac5-150bbe1518d8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d7-2ea0-af3b-bb40249b6bd8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d7-2ea0-ba16-60cd4d86b229	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d7-2ea0-eb93-0105ac70921d	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d7-2ea0-2027-fc772c42641f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d7-2ea0-09fe-ed345bf5fa2f	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d7-2ea0-95f8-7e06f169d67b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d7-2ea0-8316-f240be432f20	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d7-2ea0-9691-1b8e854b548e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d7-2ea0-22f7-019d6896742f	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d7-2ea0-b80c-5a573c49ff6f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d7-2ea0-8757-2f849d8ffef8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d7-2ea0-c7b6-a579407e342b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d7-2ea0-0c7f-05e4e41d4f1b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d7-2ea0-6116-41f561120e73	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d7-2ea0-c415-8f3533867aa9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d7-2ea0-224b-71be560e79b1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d7-2ea0-b7ea-e8fb1d66f3c8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d7-2ea0-5b47-6876d7cd3cf9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d7-2ea0-65ff-ef45dc0d64d3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d7-2ea0-4919-cc4730eb4c4c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d7-2ea0-f658-a83ac24a43fe	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d7-2ea0-0264-18ed3cec4212	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d7-2ea0-938c-9f86cc37c368	CA	CAN	124	Canada 	Kanada	\N
00040000-55d7-2ea0-9b77-fc4155bc4cd3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d7-2ea0-8a38-cfe405359151	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d7-2ea0-b6d5-2891af466145	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d7-2ea0-f3b5-11ebafb3c251	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d7-2ea0-1bc1-94f9466c9a0e	CL	CHL	152	Chile 	Čile	\N
00040000-55d7-2ea0-5178-5c57a99d75c9	CN	CHN	156	China 	Kitajska	\N
00040000-55d7-2ea0-37df-529324fdaede	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d7-2ea0-6561-2e78b3a7d519	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d7-2ea0-559d-414708946398	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d7-2ea0-a59d-1cd7a08b0dbd	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d7-2ea0-6ec6-a0ebdf8b6226	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d7-2ea0-4d8f-1952505247cf	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d7-2ea0-00ab-2a405ca4aa2f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d7-2ea0-d43c-342afffec62d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d7-2ea0-b142-28ec07619bad	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d7-2ea0-ae21-69555293e777	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d7-2ea0-613b-65f835b64bb6	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d7-2ea0-bfd0-226877b9044e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d7-2ea0-1070-37cf6612a47d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d7-2ea0-4717-0282fe314c57	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d7-2ea0-d573-6dd9ec702f71	DK	DNK	208	Denmark 	Danska	\N
00040000-55d7-2ea0-bb35-ef0012fffd03	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d7-2ea0-692f-fc847716ff24	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d7-2ea0-0ddf-c76479ad0da6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d7-2ea0-fde1-48e3f8948840	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d7-2ea0-5bb0-22c56eef9c3b	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d7-2ea0-02e1-95d6872e95f9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d7-2ea0-3fdc-cb88e8f23944	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d7-2ea0-f12d-736cd63ce1b0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d7-2ea0-855e-c3f8e39c5392	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d7-2ea0-d941-56efe528336a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d7-2ea0-8d67-f78a13c14d84	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d7-2ea0-d2af-a2dc4d1dcffe	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d7-2ea0-aad8-1eb266b6db80	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d7-2ea0-729f-2513e8a2c660	FI	FIN	246	Finland 	Finska	\N
00040000-55d7-2ea0-cbcd-aec4efae34a1	FR	FRA	250	France 	Francija	\N
00040000-55d7-2ea0-746b-a4370ae5982d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d7-2ea0-2e43-fb737e5ef149	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d7-2ea0-ecfd-5629a0f3b6ad	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d7-2ea0-95de-922bbd1701d3	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d7-2ea0-f657-87a0d047cc53	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d7-2ea0-5bdd-3781b491402c	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d7-2ea0-b0ae-5423b26c4b2c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d7-2ea0-bc6c-4b0e61c32512	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d7-2ea0-a881-1057fa5d66e2	GH	GHA	288	Ghana 	Gana	\N
00040000-55d7-2ea0-2c45-0160e70af194	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d7-2ea0-8d8e-e93fce7ffac7	GR	GRC	300	Greece 	Grčija	\N
00040000-55d7-2ea0-4edb-9c2d08f2e763	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d7-2ea0-bf21-fce532c8f2df	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d7-2ea0-3d96-4971e8d81b9c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d7-2ea0-8e32-2c9a3eaa5d81	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d7-2ea0-abd0-09f649cd05ba	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d7-2ea0-6133-485761fa3396	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d7-2ea0-7aeb-08e89aa2d42d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d7-2ea0-a301-f6e1a54fc129	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d7-2ea0-c2bf-48b7469fd7af	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d7-2ea0-be9c-9fb903ae5095	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d7-2ea0-7162-e1cc3c47066d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d7-2ea0-9d11-806503b5246d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d7-2ea0-e103-91e380edea85	HN	HND	340	Honduras 	Honduras	\N
00040000-55d7-2ea0-7558-3b6f494dfef2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d7-2ea0-726b-ebcd5b17bfa4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d7-2ea0-428c-6bb25fc379d3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d7-2ea0-394a-e25abc682dd6	IN	IND	356	India 	Indija	\N
00040000-55d7-2ea0-5ecb-dcfdc0de5239	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d7-2ea0-d1bf-61622734376e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d7-2ea0-d770-984f26855f41	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d7-2ea0-3c5d-c88fbe4590b0	IE	IRL	372	Ireland 	Irska	\N
00040000-55d7-2ea0-3fa5-849824d6593e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d7-2ea0-223a-811a934782e2	IL	ISR	376	Israel 	Izrael	\N
00040000-55d7-2ea0-cc29-cec7817ecdcd	IT	ITA	380	Italy 	Italija	\N
00040000-55d7-2ea0-e8df-55a76f6fe6f8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d7-2ea0-090d-2dbc85cecdf3	JP	JPN	392	Japan 	Japonska	\N
00040000-55d7-2ea0-b300-4a8c664de120	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d7-2ea0-a3a2-fd599dd16aad	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d7-2ea0-b920-0aaca013d00f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d7-2ea0-dc09-ecf2cdec68ce	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d7-2ea0-a6ef-ad3a914c7248	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d7-2ea0-a0c0-d2618f6f434c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d7-2ea0-c2dd-db0dd360da49	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d7-2ea0-1c3b-c345dc2b3293	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d7-2ea0-2fa9-77c02a2cd2e8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d7-2ea0-bcc5-4bc4c67e5296	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d7-2ea0-c916-17865d5bc8a9	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d7-2ea0-1ddf-6204c142be9a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d7-2ea0-4fa8-a70c01432b9c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d7-2ea0-9050-7332ebd22b01	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d7-2ea0-01c5-ec7dfc48bd2c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d7-2ea0-405d-eee8c8dec664	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d7-2ea0-2c0b-03d535e6f795	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d7-2ea0-cf18-c1f2e30d2780	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d7-2ea0-2687-6c77dd50fc2d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d7-2ea0-9cda-48838ed1ea79	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d7-2ea0-fff2-2695e9a142cf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d7-2ea0-cbe6-4bb616ba8a83	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d7-2ea0-c8e9-246ceeccf9eb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d7-2ea0-b5a3-589935f4dcb7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d7-2ea0-30a0-86ad3b3cfe24	ML	MLI	466	Mali 	Mali	\N
00040000-55d7-2ea0-42aa-248afd2ff1b5	MT	MLT	470	Malta 	Malta	\N
00040000-55d7-2ea0-3cee-cd497f32f6c9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d7-2ea0-a5a8-9c4c84215c6f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d7-2ea0-74cc-e8936f6b046b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d7-2ea0-3106-c15c10c673a7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d7-2ea0-dd6a-e29cf3e26ac9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d7-2ea0-ca18-5d815243cc12	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d7-2ea0-2f86-ab4ab3b72612	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d7-2ea0-a6f1-a78efbe7c98d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d7-2ea0-a5f0-2a141f0ca9ab	MC	MCO	492	Monaco 	Monako	\N
00040000-55d7-2ea0-dc41-872cc96d406e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d7-2ea0-5861-ab356d5070cd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d7-2ea0-b80a-6c9a695ef9df	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d7-2ea0-3db1-080078f13340	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d7-2ea0-2d5c-a7da052fe4be	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d7-2ea0-475c-dad782c259c7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d7-2ea0-ebb7-7d3ccaf19639	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d7-2ea0-03ea-4359a29f641d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d7-2ea0-5916-c10c12586a7f	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d7-2ea0-d4bf-a7f9f02f1e91	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d7-2ea0-4d43-7cd41be46ce4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d7-2ea0-8b33-5c8a05281334	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d7-2ea0-c23d-d0418a5d7667	NE	NER	562	Niger 	Niger 	\N
00040000-55d7-2ea0-0a80-21c4a7e46db3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d7-2ea0-217e-21e6cf9b5105	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d7-2ea0-aed8-cb50dbbd9cca	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d7-2ea0-fe5a-7d3f34e27361	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d7-2ea0-2b70-bf3daf2919bc	NO	NOR	578	Norway 	Norveška	\N
00040000-55d7-2ea0-4094-e75e64a3fa9a	OM	OMN	512	Oman 	Oman	\N
00040000-55d7-2ea0-6ad0-d60b0eb65930	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d7-2ea0-66f8-70c50e43e0a1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d7-2ea0-df00-e2319e4d253d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d7-2ea0-0e6e-0a9dbc2d1f93	PA	PAN	591	Panama 	Panama	\N
00040000-55d7-2ea0-9d6b-bee4506efaec	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d7-2ea0-554f-4a0602916a99	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d7-2ea0-83d0-41ff14edb152	PE	PER	604	Peru 	Peru	\N
00040000-55d7-2ea0-ab42-f262126dbf5b	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d7-2ea0-96c4-bf70796b4187	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d7-2ea0-c39e-7b78cb1ee28e	PL	POL	616	Poland 	Poljska	\N
00040000-55d7-2ea0-87d3-a21ec85d11b4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d7-2ea0-4c13-803d2af01159	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d7-2ea0-4d5d-336823ebe8d1	QA	QAT	634	Qatar 	Katar	\N
00040000-55d7-2ea0-174b-ba804a5656cb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d7-2ea0-3bfd-96316a19140b	RO	ROU	642	Romania 	Romunija	\N
00040000-55d7-2ea0-2aac-aef310295d0d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d7-2ea0-2c19-4c753b2bee1f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d7-2ea0-06f7-4fa614919dc5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d7-2ea0-c264-bf51f9bb1833	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d7-2ea0-ce91-e9330a0da562	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d7-2ea0-3a9d-f02762526f94	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d7-2ea0-4d3a-589a081736ea	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d7-2ea0-1926-de43f51b5daf	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d7-2ea0-e493-3c2a9489bd2c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d7-2ea0-5c9e-7edd72ead367	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d7-2ea0-f198-15b3db6303aa	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d7-2ea0-8323-fbb0eff5057f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d7-2ea0-300c-2bae32c6c372	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d7-2ea0-9f0f-16392741a6cb	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d7-2ea0-661d-7be9b1e0253c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d7-2ea0-4f85-6940b7825d9c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d7-2ea0-96a0-28caef132b88	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d7-2ea0-2eda-cf7cb4cc8cac	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d7-2ea0-6f2f-5424c669054d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d7-2ea0-7dc3-17035a8b164d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d7-2ea0-a9fb-8ae929dfa70b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d7-2ea0-eb3d-47b79bc57def	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d7-2ea0-777f-d74bb3cb546e	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d7-2ea0-0735-e76f88746eb5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d7-2ea0-6e17-b364aee2e938	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d7-2ea0-2c42-54126788c205	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d7-2ea0-e469-f93dd09f1dda	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d7-2ea0-eb98-0ae0ba51a868	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d7-2ea0-2921-6fc97f11cf6b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d7-2ea0-d86f-d3f9a8df1817	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d7-2ea0-52b0-725aab1008f6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d7-2ea0-5b82-374cfb3d0a64	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d7-2ea0-8c8d-57f101eaba2b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d7-2ea0-6461-db7dbeedb916	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d7-2ea0-6feb-0d9c20f5426b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d7-2ea0-4b05-362b20f02381	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d7-2ea0-9320-4071bec23841	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d7-2ea0-dd8c-df7c5746af98	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d7-2ea0-60ad-85064aa155e0	TH	THA	764	Thailand 	Tajska	\N
00040000-55d7-2ea0-e53d-4ad03baf2508	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d7-2ea0-3b20-96e6a165dfaf	TG	TGO	768	Togo 	Togo	\N
00040000-55d7-2ea0-eb40-865eea959d7a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d7-2ea0-4c51-b3fc309b6786	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d7-2ea0-bc56-93bf3dd86569	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d7-2ea0-5469-908a536cd780	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d7-2ea0-80c5-2a65fbf0fe62	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d7-2ea0-99c7-1c7d4fa862a9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d7-2ea0-359b-11873f7199e1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d7-2ea0-0394-15fd7bcd515d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d7-2ea0-5035-3ec6c45e42c7	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d7-2ea0-9f82-5f36fddd89d7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d7-2ea0-1828-c9799ce5f4ac	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d7-2ea0-388a-ffee1958bdd9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d7-2ea0-40d9-07d1a6fd08a9	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d7-2ea0-1001-799d029e0f63	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d7-2ea0-bf32-40c3058500ff	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d7-2ea0-5885-0e7514f8265c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d7-2ea0-2ddd-9cf610a0371f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d7-2ea0-dcf8-1e684ba07c54	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d7-2ea0-7c32-f8f8381b8515	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d7-2ea0-278b-f01de266270d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d7-2ea0-b946-568a83403eeb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d7-2ea0-498a-5b1ab10a66bf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d7-2ea0-20de-0330fc22681a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d7-2ea0-3a84-7bf3c8d2dab9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d7-2ea0-8b75-a7b11f5a7566	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d7-2ea0-9e8d-a1413e0536c5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2941 (class 0 OID 15232315)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d7-2ea2-48a7-071c8713944a	000e0000-55d7-2ea2-0772-1395df0c17fd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55d7-2ea1-dd7a-a8c06cbd862c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d7-2ea2-32e9-eacb2ac890a1	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55d7-2ea1-e23d-05c6723e6b35	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d7-2ea2-3f7a-b5a544dcf92a	000e0000-55d7-2ea2-3177-b6db8923fa6e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55d7-2ea1-dd7a-a8c06cbd862c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d7-2ea2-e967-2c6f50f568c8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d7-2ea2-8b46-04cfba719f9f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 15232142)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d7-2ea2-b7c4-4b8a8e225135	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d7-2ea1-126f-d1ddac47baf6
000d0000-55d7-2ea2-a6c2-12e491d6f3e2	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d7-2ea1-126f-d1ddac47baf6
000d0000-55d7-2ea2-e8eb-99edabd62997	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d7-2ea1-9ce1-5dc27607f8de
000d0000-55d7-2ea2-5e0c-3a452423cc04	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d7-2ea1-0613-099f3c24dc42
000d0000-55d7-2ea2-6eb7-4c4e821261ec	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d7-2ea1-3a62-59708bbd6a58
000d0000-55d7-2ea2-b8dd-559df4ac22b4	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55d7-2ea1-3a62-59708bbd6a58
000d0000-55d7-2ea2-a93b-6ec77995e1ec	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d7-2ea1-126f-d1ddac47baf6
000d0000-55d7-2ea2-d2bb-8130eb7cc0c7	000e0000-55d7-2ea2-6be6-3b371ae80db5	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d7-2ea1-2ade-36a25432b813
\.


--
-- TOC entry 2907 (class 0 OID 15231958)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15232006)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15231938)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d7-2ea2-0787-cec0a2556af3	00080000-55d7-2ea2-6617-7a22f1785ef7	00090000-55d7-2ea2-bfa4-ff8ffe4c45c4	AK		
\.


--
-- TOC entry 2917 (class 0 OID 15232059)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15232531)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15232543)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15232565)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15232084)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15231895)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d7-2ea1-32a9-1bafa5e1438d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d7-2ea1-8bb3-25a5b00c6ac1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d7-2ea1-3751-596dfef0fcc0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d7-2ea1-a5fc-61a1deb42b51	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d7-2ea1-c9f7-33152e508863	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d7-2ea1-14c3-588ddc55e28d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d7-2ea1-7a51-544d27860696	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d7-2ea1-29f1-4d50e4ea2862	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55d7-2ea1-f64f-28c6e924a123	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d7-2ea1-7ae5-2077f87e6471	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d7-2ea1-fa0d-df4fc36a66d6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d7-2ea1-b6f5-d8d60757ad3e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d7-2ea1-0cfd-335025c77767	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d7-2ea1-5370-90f8e9bb5c0a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d7-2ea2-2509-ee19dee33849	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d7-2ea2-f278-6498390e3a88	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d7-2ea2-02af-a64b6bab5a4f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d7-2ea2-89cb-9070e0ec76a9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d7-2ea2-eb1c-85f67b464b88	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d7-2ea2-678a-a2b5eba7d5e6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2896 (class 0 OID 15231808)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d7-2ea2-ad30-03cc594b2015	00000000-55d7-2ea2-f278-6498390e3a88	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d7-2ea2-e7a0-5b7a9ad652d3	00000000-55d7-2ea2-f278-6498390e3a88	00010000-55d7-2ea1-e307-e867dff87b99	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d7-2ea2-1391-0035c0c9ac03	00000000-55d7-2ea2-02af-a64b6bab5a4f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2897 (class 0 OID 15231819)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d7-2ea2-345c-235b762a9fb9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d7-2ea2-af69-b1f6fc081349	00010000-55d7-2ea2-01e0-428963457290	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d7-2ea2-8772-cd1bfb697472	00010000-55d7-2ea2-2d50-91f1b750ec27	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d7-2ea2-f166-649dc5cb3e2a	00010000-55d7-2ea2-fb35-d536ab576f1a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d7-2ea2-2f0f-ae5769f73563	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d7-2ea2-1f0e-1f85af7d238d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d7-2ea2-d768-133262209b28	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d7-2ea2-2f74-5071eb91071f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d7-2ea2-bfa4-ff8ffe4c45c4	00010000-55d7-2ea2-0c4f-43213e09c115	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d7-2ea2-7fd8-4f4652e17b14	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d7-2ea2-553e-d6bd90cb9105	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d7-2ea2-d16d-1d64b26e5ab2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d7-2ea2-1cea-e4e6ac37484d	00010000-55d7-2ea2-b3f0-e5361181d33c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 15231773)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d7-2ea0-3cfe-79e5ee6a801e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d7-2ea0-316c-b225dec19cf2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d7-2ea0-ffbc-e31122e96a76	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d7-2ea0-95b4-213e04a66b32	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d7-2ea0-98c7-04c144616ae8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d7-2ea0-1aaa-0edbe2b97ca9	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d7-2ea0-00ff-f4727a4367c1	Abonma-read	Abonma - branje	f
00030000-55d7-2ea0-3675-b4e0425a7bf6	Abonma-write	Abonma - spreminjanje	f
00030000-55d7-2ea0-8624-2759a0fc0123	Alternacija-read	Alternacija - branje	f
00030000-55d7-2ea0-b06a-b560cd018be2	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d7-2ea0-aa36-60de06228906	Arhivalija-read	Arhivalija - branje	f
00030000-55d7-2ea0-02e8-680962ee472e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d7-2ea0-fda1-f7ff03d919a9	Besedilo-read	Besedilo - branje	f
00030000-55d7-2ea0-1071-652385fa1cb9	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d7-2ea0-5416-888af8ceebeb	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d7-2ea0-ed06-49bcbfbe90ed	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d7-2ea0-4b65-60dc32da62d2	Dogodek-read	Dogodek - branje	f
00030000-55d7-2ea0-cde8-5c92a4d20431	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d7-2ea0-accd-03eecf1d9eae	DrugiVir-read	DrugiVir - branje	f
00030000-55d7-2ea0-ee58-e76648472df3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d7-2ea1-6431-340ebde673f5	Drzava-read	Drzava - branje	f
00030000-55d7-2ea1-e704-6ed911d23346	Drzava-write	Drzava - spreminjanje	f
00030000-55d7-2ea1-9de9-0f08ef8c5eda	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d7-2ea1-1089-e6e5e96981ae	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d7-2ea1-246e-4df090d932f7	Funkcija-read	Funkcija - branje	f
00030000-55d7-2ea1-9498-a72743d0b71b	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d7-2ea1-3abc-20883ae677b0	Gostovanje-read	Gostovanje - branje	f
00030000-55d7-2ea1-24cc-801bd94566da	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d7-2ea1-7686-e4e3ffcbc61e	Gostujoca-read	Gostujoca - branje	f
00030000-55d7-2ea1-5513-1711ea9581aa	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d7-2ea1-c7a8-72c88b390ad9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d7-2ea1-7229-a4e4f521f6ae	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d7-2ea1-1e65-8b09365d4d14	Kupec-read	Kupec - branje	f
00030000-55d7-2ea1-703a-c692893bbf35	Kupec-write	Kupec - spreminjanje	f
00030000-55d7-2ea1-89d6-e00d35755856	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d7-2ea1-aa4c-52536ddee198	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d7-2ea1-4324-2fcedcc7d69f	Option-read	Option - branje	f
00030000-55d7-2ea1-47e9-c162ac8a0ee1	Option-write	Option - spreminjanje	f
00030000-55d7-2ea1-39de-b4879aefc25e	OptionValue-read	OptionValue - branje	f
00030000-55d7-2ea1-ec27-e454876d1a85	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d7-2ea1-92aa-6078b2248412	Oseba-read	Oseba - branje	f
00030000-55d7-2ea1-32fb-8b02eb7c3fe4	Oseba-write	Oseba - spreminjanje	f
00030000-55d7-2ea1-eda0-4c2021ae0dae	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d7-2ea1-5372-32c9f1a5bf89	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d7-2ea1-3672-9b5baa0a46de	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d7-2ea1-c74a-a15082dbbeee	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d7-2ea1-9f54-ba9a938dfee1	Pogodba-read	Pogodba - branje	f
00030000-55d7-2ea1-ddad-d2bb703386ab	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d7-2ea1-ace5-d2c1e27a0674	Popa-read	Popa - branje	f
00030000-55d7-2ea1-417a-d65b00aebdfc	Popa-write	Popa - spreminjanje	f
00030000-55d7-2ea1-eb14-ec301b15768e	Posta-read	Posta - branje	f
00030000-55d7-2ea1-3b2c-d946782534b0	Posta-write	Posta - spreminjanje	f
00030000-55d7-2ea1-d5c2-2f4168be0c37	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d7-2ea1-b760-03cc96303ed9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d7-2ea1-323a-dabd1465ce67	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d7-2ea1-d94b-f4f87c539c04	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d7-2ea1-4597-48c385e01cb6	Predstava-read	Predstava - branje	f
00030000-55d7-2ea1-e206-c14c31aa198f	Predstava-write	Predstava - spreminjanje	f
00030000-55d7-2ea1-dc7b-bc7b1e47823c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d7-2ea1-bc87-b5ffa800dd1c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d7-2ea1-b080-9563e00ef3b0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d7-2ea1-a275-bc6e3b99657e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d7-2ea1-12a5-14143903d067	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d7-2ea1-7a34-576e050153ae	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d7-2ea1-5288-a28a061b9896	ProgramDela-read	ProgramDela - branje	f
00030000-55d7-2ea1-a7e2-4054668fada2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d7-2ea1-f38c-56931491bb75	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d7-2ea1-ecb7-f2a1544f2612	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d7-2ea1-6549-d36a1b6d9767	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d7-2ea1-88ea-e92a1fbb853d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d7-2ea1-5334-ed340d1c4bb4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d7-2ea1-48f3-7fea5e6ca739	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d7-2ea1-e0ee-487210ff564e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d7-2ea1-40f3-7dbb292d2704	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d7-2ea1-6a5e-2d5c1c3b00cf	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d7-2ea1-15f0-bf3a9d3df73a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d7-2ea1-ac48-dd07e3655bb8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d7-2ea1-0e5e-9ea101928daf	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d7-2ea1-946d-f12065443cec	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d7-2ea1-3250-7862598ab71d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d7-2ea1-0abc-1fa67fff68c9	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d7-2ea1-c256-9b875244d401	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d7-2ea1-e34d-2487129deb3c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d7-2ea1-9725-3bba25b16c60	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d7-2ea1-7935-cb48f8b46ded	Prostor-read	Prostor - branje	f
00030000-55d7-2ea1-69bd-e4c118238e26	Prostor-write	Prostor - spreminjanje	f
00030000-55d7-2ea1-7af0-b4fe7d0e2a75	Racun-read	Racun - branje	f
00030000-55d7-2ea1-7fb6-0691578e5bc5	Racun-write	Racun - spreminjanje	f
00030000-55d7-2ea1-0c00-523e5902f07b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d7-2ea1-4a7c-33f9b32451c1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d7-2ea1-4871-62375780bd86	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d7-2ea1-f649-b47329de77da	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d7-2ea1-d6b6-33bffff07247	Rekvizit-read	Rekvizit - branje	f
00030000-55d7-2ea1-52c5-50e4adc8baf5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d7-2ea1-38e6-ad992f97aa7d	Revizija-read	Revizija - branje	f
00030000-55d7-2ea1-0da2-b89a5244850a	Revizija-write	Revizija - spreminjanje	f
00030000-55d7-2ea1-09a1-ae2da312c47f	Rezervacija-read	Rezervacija - branje	f
00030000-55d7-2ea1-a584-155b63a6dc05	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d7-2ea1-dea7-83582e67429b	SedezniRed-read	SedezniRed - branje	f
00030000-55d7-2ea1-7b2e-b0e6444233c8	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d7-2ea1-dc4f-733085c2dd9f	Sedez-read	Sedez - branje	f
00030000-55d7-2ea1-6e7c-11181d7f08b1	Sedez-write	Sedez - spreminjanje	f
00030000-55d7-2ea1-c4eb-279c7238d515	Sezona-read	Sezona - branje	f
00030000-55d7-2ea1-f092-209cb4400810	Sezona-write	Sezona - spreminjanje	f
00030000-55d7-2ea1-6d96-2d8085d9e7e6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d7-2ea1-6b58-87937eed6c34	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d7-2ea1-80f1-d8cd664fcfa4	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d7-2ea1-cb97-3e5812d00fda	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d7-2ea1-dda3-cef9a06f12e7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d7-2ea1-663d-a0aeffdddbfa	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d7-2ea1-de39-07e7edcf3343	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d7-2ea1-0ff3-180fd8e2529e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d7-2ea1-0791-65407048411b	Telefonska-read	Telefonska - branje	f
00030000-55d7-2ea1-1ce4-19a9fc56ad0d	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d7-2ea1-30ba-e2ff5a197eed	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d7-2ea1-47f0-b929d28af267	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d7-2ea1-6a2a-ef5f6a3d79d9	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d7-2ea1-f3ea-2cd7fd323718	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d7-2ea1-ddfb-b52eefbce795	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d7-2ea1-e973-81b5026dad1e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d7-2ea1-1424-3ed800b6c90c	Trr-read	Trr - branje	f
00030000-55d7-2ea1-3ad9-bd8b7b5384bb	Trr-write	Trr - spreminjanje	f
00030000-55d7-2ea1-bb35-346e4cd99b63	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d7-2ea1-c3a5-f0e58fca1a33	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d7-2ea1-3a11-d50c9d4dfa3c	Vaja-read	Vaja - branje	f
00030000-55d7-2ea1-f477-961c5cae4635	Vaja-write	Vaja - spreminjanje	f
00030000-55d7-2ea1-1569-349645080c73	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d7-2ea1-a3aa-12635c68ee9c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d7-2ea1-7646-0e4d2b8e1b9a	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d7-2ea1-c285-0adbc9d33a04	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d7-2ea1-37a8-43c4da183feb	Zasedenost-read	Zasedenost - branje	f
00030000-55d7-2ea1-8c43-62083b8e0ef0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d7-2ea1-9f4e-1aad3c7f9362	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d7-2ea1-8760-0e4b98cc2ec4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d7-2ea1-9da0-705e4ed39714	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d7-2ea1-c151-eeb057692fcc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d7-2ea1-d991-3c1273ffc55d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55d7-2ea1-a162-6bdd12e4c739	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55d7-2ea1-3cf0-6085e853f4b5	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55d7-2ea1-fa28-3883c2d42c30	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55d7-2ea1-03ae-09d24bd95ea3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d7-2ea1-b851-4f0411bcc08c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d7-2ea1-69a8-22b30b640027	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d7-2ea1-2019-5564380603cf	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d7-2ea1-4b63-e0ae901cc005	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55d7-2ea1-eeea-053d60688ea4	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55d7-2ea1-aa91-0351389cc519	Datoteka-write	Datoteka - spreminjanje	f
00030000-55d7-2ea1-0faa-f8040dd0ca6c	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2894 (class 0 OID 15231792)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d7-2ea1-a117-975afaada4f4	00030000-55d7-2ea0-316c-b225dec19cf2
00020000-55d7-2ea1-94eb-ff36c1fea727	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-00ff-f4727a4367c1
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-3675-b4e0425a7bf6
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-8624-2759a0fc0123
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-b06a-b560cd018be2
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-aa36-60de06228906
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-4b65-60dc32da62d2
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-95b4-213e04a66b32
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea0-cde8-5c92a4d20431
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-e704-6ed911d23346
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-246e-4df090d932f7
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-9498-a72743d0b71b
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-3abc-20883ae677b0
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-24cc-801bd94566da
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-7686-e4e3ffcbc61e
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-5513-1711ea9581aa
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-c7a8-72c88b390ad9
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-7229-a4e4f521f6ae
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-4324-2fcedcc7d69f
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-39de-b4879aefc25e
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-92aa-6078b2248412
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-32fb-8b02eb7c3fe4
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-ace5-d2c1e27a0674
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-417a-d65b00aebdfc
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-eb14-ec301b15768e
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-3b2c-d946782534b0
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-323a-dabd1465ce67
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-d94b-f4f87c539c04
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-4597-48c385e01cb6
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-e206-c14c31aa198f
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-12a5-14143903d067
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-7a34-576e050153ae
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-7935-cb48f8b46ded
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-69bd-e4c118238e26
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-4871-62375780bd86
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-f649-b47329de77da
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-d6b6-33bffff07247
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-52c5-50e4adc8baf5
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-c4eb-279c7238d515
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-f092-209cb4400810
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-6a2a-ef5f6a3d79d9
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-bb35-346e4cd99b63
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-c3a5-f0e58fca1a33
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-3a11-d50c9d4dfa3c
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-f477-961c5cae4635
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-37a8-43c4da183feb
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-8c43-62083b8e0ef0
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-9f4e-1aad3c7f9362
00020000-55d7-2ea1-858a-d3b165e249c5	00030000-55d7-2ea1-9da0-705e4ed39714
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea0-00ff-f4727a4367c1
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea0-aa36-60de06228906
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea0-4b65-60dc32da62d2
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-3abc-20883ae677b0
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-7686-e4e3ffcbc61e
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-c7a8-72c88b390ad9
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-7229-a4e4f521f6ae
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-4324-2fcedcc7d69f
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-39de-b4879aefc25e
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-92aa-6078b2248412
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-32fb-8b02eb7c3fe4
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-ace5-d2c1e27a0674
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-eb14-ec301b15768e
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-323a-dabd1465ce67
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-d94b-f4f87c539c04
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-4597-48c385e01cb6
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-7935-cb48f8b46ded
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-4871-62375780bd86
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-d6b6-33bffff07247
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-c4eb-279c7238d515
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-0791-65407048411b
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-1ce4-19a9fc56ad0d
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-1424-3ed800b6c90c
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-3ad9-bd8b7b5384bb
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-7646-0e4d2b8e1b9a
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-c285-0adbc9d33a04
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-9f4e-1aad3c7f9362
00020000-55d7-2ea1-be90-1bad5ac37f8d	00030000-55d7-2ea1-9da0-705e4ed39714
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-00ff-f4727a4367c1
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-8624-2759a0fc0123
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-aa36-60de06228906
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-02e8-680962ee472e
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-fda1-f7ff03d919a9
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-5416-888af8ceebeb
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea0-4b65-60dc32da62d2
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-246e-4df090d932f7
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-3abc-20883ae677b0
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-7686-e4e3ffcbc61e
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-c7a8-72c88b390ad9
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-4324-2fcedcc7d69f
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-39de-b4879aefc25e
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-92aa-6078b2248412
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-ace5-d2c1e27a0674
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-eb14-ec301b15768e
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-4597-48c385e01cb6
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-12a5-14143903d067
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-7935-cb48f8b46ded
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-4871-62375780bd86
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-d6b6-33bffff07247
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-c4eb-279c7238d515
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-6a2a-ef5f6a3d79d9
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-3a11-d50c9d4dfa3c
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-37a8-43c4da183feb
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-9f4e-1aad3c7f9362
00020000-55d7-2ea1-8b44-c5428973ee89	00030000-55d7-2ea1-9da0-705e4ed39714
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea0-00ff-f4727a4367c1
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea0-3675-b4e0425a7bf6
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea0-b06a-b560cd018be2
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea0-aa36-60de06228906
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea0-4b65-60dc32da62d2
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-3abc-20883ae677b0
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-7686-e4e3ffcbc61e
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-4324-2fcedcc7d69f
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-39de-b4879aefc25e
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-ace5-d2c1e27a0674
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-eb14-ec301b15768e
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-4597-48c385e01cb6
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-7935-cb48f8b46ded
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-4871-62375780bd86
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-d6b6-33bffff07247
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-c4eb-279c7238d515
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-6a2a-ef5f6a3d79d9
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-9f4e-1aad3c7f9362
00020000-55d7-2ea1-9502-c158a8173a75	00030000-55d7-2ea1-9da0-705e4ed39714
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea0-00ff-f4727a4367c1
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea0-aa36-60de06228906
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea0-4b65-60dc32da62d2
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-3abc-20883ae677b0
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-7686-e4e3ffcbc61e
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-4324-2fcedcc7d69f
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-39de-b4879aefc25e
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-ace5-d2c1e27a0674
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-eb14-ec301b15768e
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-4597-48c385e01cb6
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-7935-cb48f8b46ded
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-4871-62375780bd86
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-d6b6-33bffff07247
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-c4eb-279c7238d515
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-30ba-e2ff5a197eed
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea0-ffbc-e31122e96a76
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-6a2a-ef5f6a3d79d9
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-9f4e-1aad3c7f9362
00020000-55d7-2ea1-6eec-584bff0e216c	00030000-55d7-2ea1-9da0-705e4ed39714
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-3cfe-79e5ee6a801e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-316c-b225dec19cf2
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-ffbc-e31122e96a76
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-95b4-213e04a66b32
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-98c7-04c144616ae8
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-1aaa-0edbe2b97ca9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-00ff-f4727a4367c1
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-3675-b4e0425a7bf6
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-8624-2759a0fc0123
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-b06a-b560cd018be2
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-aa36-60de06228906
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-02e8-680962ee472e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-fda1-f7ff03d919a9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-1071-652385fa1cb9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-5416-888af8ceebeb
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-ed06-49bcbfbe90ed
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-4b65-60dc32da62d2
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-cde8-5c92a4d20431
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6431-340ebde673f5
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-e704-6ed911d23346
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-accd-03eecf1d9eae
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea0-ee58-e76648472df3
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-9de9-0f08ef8c5eda
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-1089-e6e5e96981ae
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-246e-4df090d932f7
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-9498-a72743d0b71b
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-3abc-20883ae677b0
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-24cc-801bd94566da
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7686-e4e3ffcbc61e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-5513-1711ea9581aa
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c7a8-72c88b390ad9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7229-a4e4f521f6ae
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-1e65-8b09365d4d14
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-703a-c692893bbf35
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-89d6-e00d35755856
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-aa4c-52536ddee198
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-4324-2fcedcc7d69f
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-47e9-c162ac8a0ee1
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-39de-b4879aefc25e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-ec27-e454876d1a85
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-92aa-6078b2248412
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-32fb-8b02eb7c3fe4
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-eda0-4c2021ae0dae
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-5372-32c9f1a5bf89
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-3672-9b5baa0a46de
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c74a-a15082dbbeee
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-9f54-ba9a938dfee1
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-ddad-d2bb703386ab
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-ace5-d2c1e27a0674
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-417a-d65b00aebdfc
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-eb14-ec301b15768e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-3b2c-d946782534b0
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-d5c2-2f4168be0c37
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-b760-03cc96303ed9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-323a-dabd1465ce67
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-d94b-f4f87c539c04
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-4597-48c385e01cb6
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-e206-c14c31aa198f
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-dc7b-bc7b1e47823c
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-bc87-b5ffa800dd1c
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-b080-9563e00ef3b0
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-a275-bc6e3b99657e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-12a5-14143903d067
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7a34-576e050153ae
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-5288-a28a061b9896
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-a7e2-4054668fada2
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-f38c-56931491bb75
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-ecb7-f2a1544f2612
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6549-d36a1b6d9767
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-88ea-e92a1fbb853d
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-5334-ed340d1c4bb4
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-48f3-7fea5e6ca739
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-e0ee-487210ff564e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-40f3-7dbb292d2704
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6a5e-2d5c1c3b00cf
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-15f0-bf3a9d3df73a
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-ac48-dd07e3655bb8
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-0e5e-9ea101928daf
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-946d-f12065443cec
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-3250-7862598ab71d
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-0abc-1fa67fff68c9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c256-9b875244d401
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-e34d-2487129deb3c
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-9725-3bba25b16c60
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7935-cb48f8b46ded
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-69bd-e4c118238e26
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7af0-b4fe7d0e2a75
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7fb6-0691578e5bc5
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-0c00-523e5902f07b
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-4a7c-33f9b32451c1
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-4871-62375780bd86
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-f649-b47329de77da
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-d6b6-33bffff07247
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-52c5-50e4adc8baf5
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-38e6-ad992f97aa7d
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-0da2-b89a5244850a
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-09a1-ae2da312c47f
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-a584-155b63a6dc05
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-dea7-83582e67429b
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7b2e-b0e6444233c8
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-dc4f-733085c2dd9f
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6e7c-11181d7f08b1
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c4eb-279c7238d515
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-f092-209cb4400810
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6d96-2d8085d9e7e6
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6b58-87937eed6c34
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-80f1-d8cd664fcfa4
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-cb97-3e5812d00fda
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-dda3-cef9a06f12e7
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-663d-a0aeffdddbfa
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-de39-07e7edcf3343
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-0ff3-180fd8e2529e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-0791-65407048411b
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-1ce4-19a9fc56ad0d
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-30ba-e2ff5a197eed
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-47f0-b929d28af267
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-6a2a-ef5f6a3d79d9
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-f3ea-2cd7fd323718
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-ddfb-b52eefbce795
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-e973-81b5026dad1e
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-1424-3ed800b6c90c
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-3ad9-bd8b7b5384bb
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-bb35-346e4cd99b63
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c3a5-f0e58fca1a33
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-3a11-d50c9d4dfa3c
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-f477-961c5cae4635
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-1569-349645080c73
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-a3aa-12635c68ee9c
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-7646-0e4d2b8e1b9a
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c285-0adbc9d33a04
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-37a8-43c4da183feb
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-8c43-62083b8e0ef0
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-9f4e-1aad3c7f9362
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-8760-0e4b98cc2ec4
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-9da0-705e4ed39714
00020000-55d7-2ea2-bd2c-c4ba6158761a	00030000-55d7-2ea1-c151-eeb057692fcc
\.


--
-- TOC entry 2922 (class 0 OID 15232091)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15232122)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15232236)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d7-2ea2-d9ae-7f1b14c946bb	00090000-55d7-2ea2-345c-235b762a9fb9	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d7-2ea2-0240-fba199b9e925	00090000-55d7-2ea2-1f0e-1f85af7d238d	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d7-2ea2-018d-3088803517eb	00090000-55d7-2ea2-1cea-e4e6ac37484d	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2899 (class 0 OID 15231852)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d7-2ea2-6617-7a22f1785ef7	00040000-55d7-2ea0-a9fb-8ae929dfa70b	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-ba34-8c6446e79cea	00040000-55d7-2ea0-a9fb-8ae929dfa70b	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d7-2ea2-6d7b-fe3c837c1779	00040000-55d7-2ea0-a9fb-8ae929dfa70b	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-09c1-9d6a0448c1d6	00040000-55d7-2ea0-a9fb-8ae929dfa70b	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-a5f6-a9c69fc05794	00040000-55d7-2ea0-a9fb-8ae929dfa70b	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-1848-43fcdf903c8d	00040000-55d7-2ea0-ff11-44c1576903ad	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-796f-e7e411486247	00040000-55d7-2ea0-ae21-69555293e777	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-6e2f-c120aa2b61db	00040000-55d7-2ea0-3e3a-e6de9d4ab193	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d7-2ea2-68f4-3dc7a9f7d660	00040000-55d7-2ea0-a9fb-8ae929dfa70b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2901 (class 0 OID 15231887)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d7-2ea1-842b-e119574c9a04	8341	Adlešiči
00050000-55d7-2ea1-1b12-9356ee72ff8b	5270	Ajdovščina
00050000-55d7-2ea1-9750-fb9802b72602	6280	Ankaran/Ancarano
00050000-55d7-2ea1-455f-61703d8d62c8	9253	Apače
00050000-55d7-2ea1-e433-7bb9ce7f8908	8253	Artiče
00050000-55d7-2ea1-9a48-6ac75f0b8b1b	4275	Begunje na Gorenjskem
00050000-55d7-2ea1-17c2-a95f5849faae	1382	Begunje pri Cerknici
00050000-55d7-2ea1-6190-f4014bb2b38d	9231	Beltinci
00050000-55d7-2ea1-6ff6-4967ef15c245	2234	Benedikt
00050000-55d7-2ea1-5377-84b8838210c2	2345	Bistrica ob Dravi
00050000-55d7-2ea1-7571-37d09f7bcfd2	3256	Bistrica ob Sotli
00050000-55d7-2ea1-7503-abddaa7f7848	8259	Bizeljsko
00050000-55d7-2ea1-4d04-a1df728043dd	1223	Blagovica
00050000-55d7-2ea1-37de-f5729a4d5a8e	8283	Blanca
00050000-55d7-2ea1-a513-7a84d9b53fc9	4260	Bled
00050000-55d7-2ea1-4054-68645b030eca	4273	Blejska Dobrava
00050000-55d7-2ea1-21b7-87429c60381e	9265	Bodonci
00050000-55d7-2ea1-9a93-77ec38a03632	9222	Bogojina
00050000-55d7-2ea1-8894-7b57f1ef2124	4263	Bohinjska Bela
00050000-55d7-2ea1-1b27-4c30306a30e7	4264	Bohinjska Bistrica
00050000-55d7-2ea1-9e84-997aff5e47fc	4265	Bohinjsko jezero
00050000-55d7-2ea1-36e7-1f514fd378d7	1353	Borovnica
00050000-55d7-2ea1-7616-2d39f6c2254e	8294	Boštanj
00050000-55d7-2ea1-117f-a14a6a1a6905	5230	Bovec
00050000-55d7-2ea1-587f-5d15f3f3e3fe	5295	Branik
00050000-55d7-2ea1-c75a-dd0ef8c8940b	3314	Braslovče
00050000-55d7-2ea1-8af0-2a37634e9b1c	5223	Breginj
00050000-55d7-2ea1-0284-04f5e6b2c014	8280	Brestanica
00050000-55d7-2ea1-e117-f06fc08ddce5	2354	Bresternica
00050000-55d7-2ea1-8619-1e80c3f95f99	4243	Brezje
00050000-55d7-2ea1-9da1-92ea02781435	1351	Brezovica pri Ljubljani
00050000-55d7-2ea1-2364-96e227021346	8250	Brežice
00050000-55d7-2ea1-65bd-30ab98ce480b	4210	Brnik - Aerodrom
00050000-55d7-2ea1-4cf9-1348e7bb501e	8321	Brusnice
00050000-55d7-2ea1-6e1f-b470bfd881fd	3255	Buče
00050000-55d7-2ea1-d3b3-97cd0ab07e28	8276	Bučka 
00050000-55d7-2ea1-cd34-e077ebe7d6b7	9261	Cankova
00050000-55d7-2ea1-4199-8059a38dc707	3000	Celje 
00050000-55d7-2ea1-2864-b4e0a9f1f469	3001	Celje - poštni predali
00050000-55d7-2ea1-7833-3c976245d02b	4207	Cerklje na Gorenjskem
00050000-55d7-2ea1-3d45-9e2814ed3e76	8263	Cerklje ob Krki
00050000-55d7-2ea1-5388-0c4c64aedaa9	1380	Cerknica
00050000-55d7-2ea1-5edf-774bd8833878	5282	Cerkno
00050000-55d7-2ea1-4d42-d8265e0f1eeb	2236	Cerkvenjak
00050000-55d7-2ea1-52b4-8acbaed3b7fe	2215	Ceršak
00050000-55d7-2ea1-7130-fc651ee848df	2326	Cirkovce
00050000-55d7-2ea1-a72a-355efaae76a5	2282	Cirkulane
00050000-55d7-2ea1-037b-c9c4a85ed900	5273	Col
00050000-55d7-2ea1-4095-ffe56bc1f366	8251	Čatež ob Savi
00050000-55d7-2ea1-42a5-f0ecc57dd0ee	1413	Čemšenik
00050000-55d7-2ea1-9a19-80ba62264f0b	5253	Čepovan
00050000-55d7-2ea1-478a-086e5b8f0d98	9232	Črenšovci
00050000-55d7-2ea1-66f1-5cc25e3be245	2393	Črna na Koroškem
00050000-55d7-2ea1-a899-86fc84c48720	6275	Črni Kal
00050000-55d7-2ea1-be69-4ebabfb32ebc	5274	Črni Vrh nad Idrijo
00050000-55d7-2ea1-5b4e-1d87d9a9902d	5262	Črniče
00050000-55d7-2ea1-b372-de29df1878f5	8340	Črnomelj
00050000-55d7-2ea1-fe13-e930e3ded3f2	6271	Dekani
00050000-55d7-2ea1-cd73-41ed228488ab	5210	Deskle
00050000-55d7-2ea1-0b9d-5069c50c6215	2253	Destrnik
00050000-55d7-2ea1-a7b3-3f38242a965b	6215	Divača
00050000-55d7-2ea1-f926-8810776a271e	1233	Dob
00050000-55d7-2ea1-6edf-07824264b5e5	3224	Dobje pri Planini
00050000-55d7-2ea1-63a3-e7ced6b6f350	8257	Dobova
00050000-55d7-2ea1-f173-3822076b7a49	1423	Dobovec
00050000-55d7-2ea1-076e-15eb713dc00d	5263	Dobravlje
00050000-55d7-2ea1-e45e-cdf05f3756ab	3204	Dobrna
00050000-55d7-2ea1-6142-e10fc465d046	8211	Dobrnič
00050000-55d7-2ea1-6046-ee3ccfde9bfd	1356	Dobrova
00050000-55d7-2ea1-4201-ae8f05897de7	9223	Dobrovnik/Dobronak 
00050000-55d7-2ea1-4563-39e0f35cab59	5212	Dobrovo v Brdih
00050000-55d7-2ea1-de66-1e6a82cc6450	1431	Dol pri Hrastniku
00050000-55d7-2ea1-39ad-3e1e1b107def	1262	Dol pri Ljubljani
00050000-55d7-2ea1-e2bd-2092b04a9a89	1273	Dole pri Litiji
00050000-55d7-2ea1-c84c-2d27109d4871	1331	Dolenja vas
00050000-55d7-2ea1-d96e-f1bc541bb299	8350	Dolenjske Toplice
00050000-55d7-2ea1-0488-73e1aba29daf	1230	Domžale
00050000-55d7-2ea1-730d-d3a147c50db6	2252	Dornava
00050000-55d7-2ea1-793c-338b61c28263	5294	Dornberk
00050000-55d7-2ea1-0823-23bfdc50658b	1319	Draga
00050000-55d7-2ea1-cd22-5d4eb60af431	8343	Dragatuš
00050000-55d7-2ea1-457a-ac254de8ebe2	3222	Dramlje
00050000-55d7-2ea1-1770-e871196889d7	2370	Dravograd
00050000-55d7-2ea1-4f59-76afc4ef4b64	4203	Duplje
00050000-55d7-2ea1-a005-9d7c755a306a	6221	Dutovlje
00050000-55d7-2ea1-bc17-9d8a6228b643	8361	Dvor
00050000-55d7-2ea1-78ee-08b0e8333e50	2343	Fala
00050000-55d7-2ea1-a5b3-cfc61aceabd1	9208	Fokovci
00050000-55d7-2ea1-8ae4-e165e6835baf	2313	Fram
00050000-55d7-2ea1-ccdc-4e8c6e8991e1	3213	Frankolovo
00050000-55d7-2ea1-169b-5873c2f83d3b	1274	Gabrovka
00050000-55d7-2ea1-f51c-4d3989acde0d	8254	Globoko
00050000-55d7-2ea1-4c62-35c5fc6b9d0a	5275	Godovič
00050000-55d7-2ea1-cafa-6abcdc0a786c	4204	Golnik
00050000-55d7-2ea1-cf16-c07251f831fe	3303	Gomilsko
00050000-55d7-2ea1-93a9-5a92ff865643	4224	Gorenja vas
00050000-55d7-2ea1-c5f2-cf254b3f9a44	3263	Gorica pri Slivnici
00050000-55d7-2ea1-d408-96e070358fd3	2272	Gorišnica
00050000-55d7-2ea1-2769-6cf181e371fe	9250	Gornja Radgona
00050000-55d7-2ea1-2026-aa28e8014f35	3342	Gornji Grad
00050000-55d7-2ea1-50f6-97c66bf4e1a6	4282	Gozd Martuljek
00050000-55d7-2ea1-9a49-ca6701f9bb3c	6272	Gračišče
00050000-55d7-2ea1-2f0d-786b213165f4	9264	Grad
00050000-55d7-2ea1-a191-09df94e0d630	8332	Gradac
00050000-55d7-2ea1-3915-36a1513e77b1	1384	Grahovo
00050000-55d7-2ea1-e615-ac2335df67a0	5242	Grahovo ob Bači
00050000-55d7-2ea1-40b6-a0fce405696b	5251	Grgar
00050000-55d7-2ea1-5c04-0fd2f7cc41b2	3302	Griže
00050000-55d7-2ea1-aed3-a7ddc96d9e6e	3231	Grobelno
00050000-55d7-2ea1-64e2-5fd4e66acf8e	1290	Grosuplje
00050000-55d7-2ea1-9a9f-ce0fb7cb295f	2288	Hajdina
00050000-55d7-2ea1-8c52-54b82b06b3b1	8362	Hinje
00050000-55d7-2ea1-b4b8-6cd278fb9caf	2311	Hoče
00050000-55d7-2ea1-5de5-b5fd266a058f	9205	Hodoš/Hodos
00050000-55d7-2ea1-c4b3-b3a86415d923	1354	Horjul
00050000-55d7-2ea1-8c00-860711f2af7f	1372	Hotedršica
00050000-55d7-2ea1-8865-9048f7759101	1430	Hrastnik
00050000-55d7-2ea1-72e6-5471a43f07e3	6225	Hruševje
00050000-55d7-2ea1-af30-8b544996eaeb	4276	Hrušica
00050000-55d7-2ea1-26cd-31c797e3b627	5280	Idrija
00050000-55d7-2ea1-a52e-361272d140d7	1292	Ig
00050000-55d7-2ea1-276d-c18e428c3750	6250	Ilirska Bistrica
00050000-55d7-2ea1-2ec8-402e41904252	6251	Ilirska Bistrica-Trnovo
00050000-55d7-2ea1-56e7-baada36e07eb	1295	Ivančna Gorica
00050000-55d7-2ea1-1a9c-0fe5a449c04a	2259	Ivanjkovci
00050000-55d7-2ea1-ec4f-49ce76549567	1411	Izlake
00050000-55d7-2ea1-b787-cc6800622bc0	6310	Izola/Isola
00050000-55d7-2ea1-23bd-93def273da8e	2222	Jakobski Dol
00050000-55d7-2ea1-6643-710aba9141de	2221	Jarenina
00050000-55d7-2ea1-d253-37cb1d283a3e	6254	Jelšane
00050000-55d7-2ea1-1d05-9c8cb84fbf69	4270	Jesenice
00050000-55d7-2ea1-4221-8e8706fefde4	8261	Jesenice na Dolenjskem
00050000-55d7-2ea1-3ac5-0f237fd0d8ff	3273	Jurklošter
00050000-55d7-2ea1-7e3b-a7120ec8faf2	2223	Jurovski Dol
00050000-55d7-2ea1-349e-520623fda723	2256	Juršinci
00050000-55d7-2ea1-97b7-c9c73bb07015	5214	Kal nad Kanalom
00050000-55d7-2ea1-fb3a-d3e75fca6d4d	3233	Kalobje
00050000-55d7-2ea1-c1e1-d7e5cfd8bf65	4246	Kamna Gorica
00050000-55d7-2ea1-c1ab-c7cacb3833ed	2351	Kamnica
00050000-55d7-2ea1-faba-ea93cbccf551	1241	Kamnik
00050000-55d7-2ea1-630e-2bf98f06af15	5213	Kanal
00050000-55d7-2ea1-f9f8-7f9420b592f6	8258	Kapele
00050000-55d7-2ea1-6245-3f3a3573cc6e	2362	Kapla
00050000-55d7-2ea1-8337-b1bc0559dc30	2325	Kidričevo
00050000-55d7-2ea1-5ad7-5702ee7892b8	1412	Kisovec
00050000-55d7-2ea1-7c8d-5a0b6620bb0b	6253	Knežak
00050000-55d7-2ea1-557c-1dfa8c782dc5	5222	Kobarid
00050000-55d7-2ea1-6342-e3b3963d3b91	9227	Kobilje
00050000-55d7-2ea1-102b-75fe034aa71e	1330	Kočevje
00050000-55d7-2ea1-4442-f0df88ff2540	1338	Kočevska Reka
00050000-55d7-2ea1-fe36-3d813046f402	2276	Kog
00050000-55d7-2ea1-c327-f069dc6dfee2	5211	Kojsko
00050000-55d7-2ea1-8c7f-883111254a19	6223	Komen
00050000-55d7-2ea1-1579-ffe0bbb7355c	1218	Komenda
00050000-55d7-2ea1-feec-5dfadeb205a9	6000	Koper/Capodistria 
00050000-55d7-2ea1-4718-993360a6aff7	6001	Koper/Capodistria - poštni predali
00050000-55d7-2ea1-262b-e0aaa66ccca5	8282	Koprivnica
00050000-55d7-2ea1-b377-d0dca2a9c081	5296	Kostanjevica na Krasu
00050000-55d7-2ea1-8dd6-ee9d12e95cf7	8311	Kostanjevica na Krki
00050000-55d7-2ea1-6c71-aa6655fc75aa	1336	Kostel
00050000-55d7-2ea1-c5b5-6820e1d223f4	6256	Košana
00050000-55d7-2ea1-179c-1f0312b24b7c	2394	Kotlje
00050000-55d7-2ea1-ef33-a89ed058c06e	6240	Kozina
00050000-55d7-2ea1-d213-b4bd01aff97a	3260	Kozje
00050000-55d7-2ea1-30ee-2f320492f91b	4000	Kranj 
00050000-55d7-2ea1-aeb4-c519f814a82c	4001	Kranj - poštni predali
00050000-55d7-2ea1-704d-f4d00734d36c	4280	Kranjska Gora
00050000-55d7-2ea1-c9ce-6b58c63ea10b	1281	Kresnice
00050000-55d7-2ea1-e15b-75661d06d7e8	4294	Križe
00050000-55d7-2ea1-6237-13cf3f5e6463	9206	Križevci
00050000-55d7-2ea1-d9ed-7949210669fd	9242	Križevci pri Ljutomeru
00050000-55d7-2ea1-a9f7-b84abd4952cc	1301	Krka
00050000-55d7-2ea1-2203-f741fed24968	8296	Krmelj
00050000-55d7-2ea1-3acc-61bdec9c6991	4245	Kropa
00050000-55d7-2ea1-df4b-2df5103a971f	8262	Krška vas
00050000-55d7-2ea1-3205-e032cf9004c2	8270	Krško
00050000-55d7-2ea1-d538-4a1c3de3c457	9263	Kuzma
00050000-55d7-2ea1-8ee5-3a663bbc7d5c	2318	Laporje
00050000-55d7-2ea1-218b-dd82d1c611f8	3270	Laško
00050000-55d7-2ea1-040e-7917c7a92a75	1219	Laze v Tuhinju
00050000-55d7-2ea1-49c3-e964b1d0e7a5	2230	Lenart v Slovenskih goricah
00050000-55d7-2ea1-5d8c-17008e5b43d1	9220	Lendava/Lendva
00050000-55d7-2ea1-2fc6-73d76ce4f774	4248	Lesce
00050000-55d7-2ea1-9270-9e0096cc39f6	3261	Lesično
00050000-55d7-2ea1-10bc-496ee455e6c5	8273	Leskovec pri Krškem
00050000-55d7-2ea1-d7a7-5c3dab6723aa	2372	Libeliče
00050000-55d7-2ea1-7a2c-abadb66e02bb	2341	Limbuš
00050000-55d7-2ea1-d9e2-78af9f46eec6	1270	Litija
00050000-55d7-2ea1-8c26-80b28107a5e4	3202	Ljubečna
00050000-55d7-2ea1-85f0-af9a3517dc5d	1000	Ljubljana 
00050000-55d7-2ea1-cd12-908e8182ab63	1001	Ljubljana - poštni predali
00050000-55d7-2ea1-c733-62a9f2df193f	1231	Ljubljana - Črnuče
00050000-55d7-2ea1-8b19-faca8c58fb8c	1261	Ljubljana - Dobrunje
00050000-55d7-2ea1-b36e-0e99caae6661	1260	Ljubljana - Polje
00050000-55d7-2ea1-d779-9d2770faca61	1210	Ljubljana - Šentvid
00050000-55d7-2ea1-e619-bc4e6c38b6a6	1211	Ljubljana - Šmartno
00050000-55d7-2ea1-9bba-7a77ad183d6d	3333	Ljubno ob Savinji
00050000-55d7-2ea1-8cdc-43bd5a643f68	9240	Ljutomer
00050000-55d7-2ea1-28dc-4ad05070b9af	3215	Loče
00050000-55d7-2ea1-da61-080b10c584df	5231	Log pod Mangartom
00050000-55d7-2ea1-a21b-8caaf47b3b2f	1358	Log pri Brezovici
00050000-55d7-2ea1-61e9-fff2442729d9	1370	Logatec
00050000-55d7-2ea1-f959-0ba6d7616608	1371	Logatec
00050000-55d7-2ea1-4796-f0a0a3a8ba5b	1434	Loka pri Zidanem Mostu
00050000-55d7-2ea1-b8fb-3fc44f9e1204	3223	Loka pri Žusmu
00050000-55d7-2ea1-0ead-d8b42838ad23	6219	Lokev
00050000-55d7-2ea1-1acb-7f16031078f9	1318	Loški Potok
00050000-55d7-2ea1-81d0-2828cdd4a685	2324	Lovrenc na Dravskem polju
00050000-55d7-2ea1-6e0d-adace1c982d3	2344	Lovrenc na Pohorju
00050000-55d7-2ea1-7ec1-5ebd26b41c9d	3334	Luče
00050000-55d7-2ea1-164b-9561d7f4f365	1225	Lukovica
00050000-55d7-2ea1-e197-de5ef89710b1	9202	Mačkovci
00050000-55d7-2ea1-66b0-d0abc4bb2e7c	2322	Majšperk
00050000-55d7-2ea1-1900-ec9b739cf6df	2321	Makole
00050000-55d7-2ea1-c06e-169c2e9a06de	9243	Mala Nedelja
00050000-55d7-2ea1-8c36-ab575334dbaf	2229	Malečnik
00050000-55d7-2ea1-d499-3735bb02d861	6273	Marezige
00050000-55d7-2ea1-3ac6-56230635d61b	2000	Maribor 
00050000-55d7-2ea1-14b0-be19084558c8	2001	Maribor - poštni predali
00050000-55d7-2ea1-94ce-6e2ffa815c2f	2206	Marjeta na Dravskem polju
00050000-55d7-2ea1-1e15-db43a28b6297	2281	Markovci
00050000-55d7-2ea1-b566-a06173a2299e	9221	Martjanci
00050000-55d7-2ea1-683f-d209fa065c37	6242	Materija
00050000-55d7-2ea1-4750-6620da076767	4211	Mavčiče
00050000-55d7-2ea1-c7ad-81e8f41ce12a	1215	Medvode
00050000-55d7-2ea1-ba33-7c1987264d36	1234	Mengeš
00050000-55d7-2ea1-395a-2470bce668e7	8330	Metlika
00050000-55d7-2ea1-8bdf-937f7235aaa3	2392	Mežica
00050000-55d7-2ea1-ef3b-894e8c0c757f	2204	Miklavž na Dravskem polju
00050000-55d7-2ea1-3c05-ad0dde7583d5	2275	Miklavž pri Ormožu
00050000-55d7-2ea1-ddd6-e43a0a32134e	5291	Miren
00050000-55d7-2ea1-f5a5-601d94ae9dd6	8233	Mirna
00050000-55d7-2ea1-b538-1325ba24faed	8216	Mirna Peč
00050000-55d7-2ea1-59ca-3752e6a3de55	2382	Mislinja
00050000-55d7-2ea1-02dc-63d7c440dd0f	4281	Mojstrana
00050000-55d7-2ea1-b90c-ac6a5682de7c	8230	Mokronog
00050000-55d7-2ea1-2ef9-5e80787966b6	1251	Moravče
00050000-55d7-2ea1-cd4e-956de1d84a56	9226	Moravske Toplice
00050000-55d7-2ea1-4fb4-817f09800e9f	5216	Most na Soči
00050000-55d7-2ea1-c3fe-054fe734f197	1221	Motnik
00050000-55d7-2ea1-052e-10722cc449b4	3330	Mozirje
00050000-55d7-2ea1-7c17-14bee0f24907	9000	Murska Sobota 
00050000-55d7-2ea1-cb44-2f6b43ebd6d0	9001	Murska Sobota - poštni predali
00050000-55d7-2ea1-7e67-7ba6993c0e4f	2366	Muta
00050000-55d7-2ea1-f7a6-b124e204dc43	4202	Naklo
00050000-55d7-2ea1-9a7a-a215ae25a9f3	3331	Nazarje
00050000-55d7-2ea1-ad5f-d3849cde86b8	1357	Notranje Gorice
00050000-55d7-2ea1-c782-6029a10a80f2	3203	Nova Cerkev
00050000-55d7-2ea1-6a78-8ab444bb477c	5000	Nova Gorica 
00050000-55d7-2ea1-259f-5fb05f9dfd9d	5001	Nova Gorica - poštni predali
00050000-55d7-2ea1-923a-d11d72a75ce6	1385	Nova vas
00050000-55d7-2ea1-0410-7d67aebf2162	8000	Novo mesto
00050000-55d7-2ea1-5435-c801bbefa9a5	8001	Novo mesto - poštni predali
00050000-55d7-2ea1-ef83-d52f1890ebe8	6243	Obrov
00050000-55d7-2ea1-7559-8d8104bc809b	9233	Odranci
00050000-55d7-2ea1-1fdc-e958f6d2be28	2317	Oplotnica
00050000-55d7-2ea1-c8dd-a5c219e50d73	2312	Orehova vas
00050000-55d7-2ea1-9eb9-1aa0ed06234f	2270	Ormož
00050000-55d7-2ea1-4fbe-77c60c0877e5	1316	Ortnek
00050000-55d7-2ea1-3a71-43978eb3215a	1337	Osilnica
00050000-55d7-2ea1-6375-e256a695d9b3	8222	Otočec
00050000-55d7-2ea1-8219-21a7c729c3e9	2361	Ožbalt
00050000-55d7-2ea1-2b5e-bbcf68403bae	2231	Pernica
00050000-55d7-2ea1-55af-f19c8927547e	2211	Pesnica pri Mariboru
00050000-55d7-2ea1-fef5-524452a581fd	9203	Petrovci
00050000-55d7-2ea1-ed42-ba0d9c6d124e	3301	Petrovče
00050000-55d7-2ea1-4543-66f77d50a5dc	6330	Piran/Pirano
00050000-55d7-2ea1-4e2a-203de330dd93	8255	Pišece
00050000-55d7-2ea1-d6ab-ec8e0c1fca72	6257	Pivka
00050000-55d7-2ea1-34e0-e2f42e31b1fb	6232	Planina
00050000-55d7-2ea1-6c81-34fc93bf1a05	3225	Planina pri Sevnici
00050000-55d7-2ea1-227f-a00d56aabf3c	6276	Pobegi
00050000-55d7-2ea1-5c54-d7555fbdfad0	8312	Podbočje
00050000-55d7-2ea1-daad-1fd2280c170b	5243	Podbrdo
00050000-55d7-2ea1-d03c-6dbd447ab76d	3254	Podčetrtek
00050000-55d7-2ea1-39b1-6e1674743f66	2273	Podgorci
00050000-55d7-2ea1-8fc7-42ecc289f745	6216	Podgorje
00050000-55d7-2ea1-44fd-9b25a0f83fc7	2381	Podgorje pri Slovenj Gradcu
00050000-55d7-2ea1-02fe-85d16ef76ea9	6244	Podgrad
00050000-55d7-2ea1-c140-72f26a8943dc	1414	Podkum
00050000-55d7-2ea1-34df-491b2d300b0d	2286	Podlehnik
00050000-55d7-2ea1-0c6c-7f5da5efa20b	5272	Podnanos
00050000-55d7-2ea1-3fdb-e1ceec81d90f	4244	Podnart
00050000-55d7-2ea1-c0e3-72e90d71c9c1	3241	Podplat
00050000-55d7-2ea1-f510-300e5399c35e	3257	Podsreda
00050000-55d7-2ea1-e603-c166222a069e	2363	Podvelka
00050000-55d7-2ea1-5c9b-57f6d3c0ac4e	2208	Pohorje
00050000-55d7-2ea1-6b27-27787d6e505d	2257	Polenšak
00050000-55d7-2ea1-0fe1-5eb1effc2d7d	1355	Polhov Gradec
00050000-55d7-2ea1-4f5b-a23728268d4b	4223	Poljane nad Škofjo Loko
00050000-55d7-2ea1-60cd-39599b49dbad	2319	Poljčane
00050000-55d7-2ea1-751d-8749439f690c	1272	Polšnik
00050000-55d7-2ea1-ec37-ad7bf125bf3f	3313	Polzela
00050000-55d7-2ea1-b02e-c23b1be8c731	3232	Ponikva
00050000-55d7-2ea1-dbf4-f5b246ee94ce	6320	Portorož/Portorose
00050000-55d7-2ea1-12d9-b8d1312ef38d	6230	Postojna
00050000-55d7-2ea1-a71a-c81be8f546b5	2331	Pragersko
00050000-55d7-2ea1-813c-5efcf9d221da	3312	Prebold
00050000-55d7-2ea1-8d13-edbd1bd722bf	4205	Preddvor
00050000-55d7-2ea1-91a4-6be367a94431	6255	Prem
00050000-55d7-2ea1-b86a-99750e916ed9	1352	Preserje
00050000-55d7-2ea1-aa6c-354d613800cf	6258	Prestranek
00050000-55d7-2ea1-d473-5f1d89c45ad2	2391	Prevalje
00050000-55d7-2ea1-26f3-745f2c441202	3262	Prevorje
00050000-55d7-2ea1-2c41-8f83cc52eeb2	1276	Primskovo 
00050000-55d7-2ea1-fbd1-84719b29f87a	3253	Pristava pri Mestinju
00050000-55d7-2ea1-7655-7b7400f47177	9207	Prosenjakovci/Partosfalva
00050000-55d7-2ea1-8df8-0d0fb286bca4	5297	Prvačina
00050000-55d7-2ea1-a27e-b068bbdb83d6	2250	Ptuj
00050000-55d7-2ea1-56a2-aa803c9a5517	2323	Ptujska Gora
00050000-55d7-2ea1-ad26-bcff7c148073	9201	Puconci
00050000-55d7-2ea1-6996-51d66ebaf3d6	2327	Rače
00050000-55d7-2ea1-a65c-6f4bbee49cac	1433	Radeče
00050000-55d7-2ea1-0fc3-9ff3a55e23af	9252	Radenci
00050000-55d7-2ea1-6fc4-bbd1eb99db84	2360	Radlje ob Dravi
00050000-55d7-2ea1-89a8-44f02a86d642	1235	Radomlje
00050000-55d7-2ea1-0742-597f7a47c37d	4240	Radovljica
00050000-55d7-2ea1-5222-d74b0ffec8b0	8274	Raka
00050000-55d7-2ea1-d2cc-91ba08fd1c41	1381	Rakek
00050000-55d7-2ea1-fc7c-1bdd5836ba7a	4283	Rateče - Planica
00050000-55d7-2ea1-03c3-f469559ce848	2390	Ravne na Koroškem
00050000-55d7-2ea1-ecb1-8602fa58422c	9246	Razkrižje
00050000-55d7-2ea1-23a2-cb0977cf05b4	3332	Rečica ob Savinji
00050000-55d7-2ea1-5749-cb4e55cd9a4d	5292	Renče
00050000-55d7-2ea1-9ffb-7b7573479073	1310	Ribnica
00050000-55d7-2ea1-7c9e-01d0ecf26415	2364	Ribnica na Pohorju
00050000-55d7-2ea1-8c85-24571211bb61	3272	Rimske Toplice
00050000-55d7-2ea1-b019-8acecdaa9c64	1314	Rob
00050000-55d7-2ea1-9bf4-c0808b7080b5	5215	Ročinj
00050000-55d7-2ea1-2788-4549eb6d71e4	3250	Rogaška Slatina
00050000-55d7-2ea1-926a-4cf65d4b9bfc	9262	Rogašovci
00050000-55d7-2ea1-aa9c-2667aa694ab0	3252	Rogatec
00050000-55d7-2ea1-c7e9-0f0c83b22c27	1373	Rovte
00050000-55d7-2ea1-3633-b6e2957d0cd7	2342	Ruše
00050000-55d7-2ea1-b415-8b7aeab13d21	1282	Sava
00050000-55d7-2ea1-3373-0d08e5834269	6333	Sečovlje/Sicciole
00050000-55d7-2ea1-00e1-9b8843554e93	4227	Selca
00050000-55d7-2ea1-15e0-2b1632ae8b6d	2352	Selnica ob Dravi
00050000-55d7-2ea1-7125-ae959440f18a	8333	Semič
00050000-55d7-2ea1-24ba-9ebb115f73ed	8281	Senovo
00050000-55d7-2ea1-c6ba-9b2e3af22923	6224	Senožeče
00050000-55d7-2ea1-2476-46b20084b3b5	8290	Sevnica
00050000-55d7-2ea1-ca66-70da014fa532	6210	Sežana
00050000-55d7-2ea1-edac-ba6ca2586ff7	2214	Sladki Vrh
00050000-55d7-2ea1-ca92-ee35f3cfe319	5283	Slap ob Idrijci
00050000-55d7-2ea1-0a45-e0c4520bec05	2380	Slovenj Gradec
00050000-55d7-2ea1-cd57-851f8cea9acd	2310	Slovenska Bistrica
00050000-55d7-2ea1-0b13-cdee47b896ce	3210	Slovenske Konjice
00050000-55d7-2ea1-d63c-0b41bd63573b	1216	Smlednik
00050000-55d7-2ea1-190c-b1c61ec88eb7	5232	Soča
00050000-55d7-2ea1-c9ef-616d3d5da699	1317	Sodražica
00050000-55d7-2ea1-1669-d40a6dc71b89	3335	Solčava
00050000-55d7-2ea1-49ea-2fc9ea645835	5250	Solkan
00050000-55d7-2ea1-37ea-1e4fd388c221	4229	Sorica
00050000-55d7-2ea1-4f83-eba0a76b92fe	4225	Sovodenj
00050000-55d7-2ea1-68ce-d3d43b4ccfa2	5281	Spodnja Idrija
00050000-55d7-2ea1-aaa9-844b0a395adc	2241	Spodnji Duplek
00050000-55d7-2ea1-1d98-782204fbe9c6	9245	Spodnji Ivanjci
00050000-55d7-2ea1-c828-9f5b20a41156	2277	Središče ob Dravi
00050000-55d7-2ea1-f309-d6c49fb626fe	4267	Srednja vas v Bohinju
00050000-55d7-2ea1-be46-01a6e4ea4fc1	8256	Sromlje 
00050000-55d7-2ea1-8e53-567b293320af	5224	Srpenica
00050000-55d7-2ea1-92ee-d51d069c8642	1242	Stahovica
00050000-55d7-2ea1-a560-02491d316193	1332	Stara Cerkev
00050000-55d7-2ea1-1cd2-84a0a4030777	8342	Stari trg ob Kolpi
00050000-55d7-2ea1-6b17-0545a10d3ee0	1386	Stari trg pri Ložu
00050000-55d7-2ea1-7d94-27221ead3d96	2205	Starše
00050000-55d7-2ea1-26ec-b576bfd2c963	2289	Stoperce
00050000-55d7-2ea1-a1b6-d1081d8d990d	8322	Stopiče
00050000-55d7-2ea1-8854-309e8f906426	3206	Stranice
00050000-55d7-2ea1-0223-e68c476255d0	8351	Straža
00050000-55d7-2ea1-cace-e51c6b4838e4	1313	Struge
00050000-55d7-2ea1-aaf7-c5c0b989788f	8293	Studenec
00050000-55d7-2ea1-70b5-e97298984de4	8331	Suhor
00050000-55d7-2ea1-3651-78278a1ee9cc	2233	Sv. Ana v Slovenskih goricah
00050000-55d7-2ea1-21c5-ec62ce87d366	2235	Sv. Trojica v Slovenskih goricah
00050000-55d7-2ea1-7538-2875a32d9a43	2353	Sveti Duh na Ostrem Vrhu
00050000-55d7-2ea1-468f-6bae30d96cb5	9244	Sveti Jurij ob Ščavnici
00050000-55d7-2ea1-4284-6bc6c30d6d7c	3264	Sveti Štefan
00050000-55d7-2ea1-aa4d-f62a490dc12a	2258	Sveti Tomaž
00050000-55d7-2ea1-468e-475e24f473e8	9204	Šalovci
00050000-55d7-2ea1-d21a-f5f3e70abf94	5261	Šempas
00050000-55d7-2ea1-58ef-98ccc978d3d2	5290	Šempeter pri Gorici
00050000-55d7-2ea1-6762-68d8864342a2	3311	Šempeter v Savinjski dolini
00050000-55d7-2ea1-c884-f4644cdd2baf	4208	Šenčur
00050000-55d7-2ea1-3c62-97698f91bcdf	2212	Šentilj v Slovenskih goricah
00050000-55d7-2ea1-97ab-9425a21e288b	8297	Šentjanž
00050000-55d7-2ea1-bbe7-0cc03ae3bdcc	2373	Šentjanž pri Dravogradu
00050000-55d7-2ea1-85c9-960be79805eb	8310	Šentjernej
00050000-55d7-2ea1-9555-45b82830098f	3230	Šentjur
00050000-55d7-2ea1-8886-6adc8fe925cd	3271	Šentrupert
00050000-55d7-2ea1-c862-4bba0d06a2b5	8232	Šentrupert
00050000-55d7-2ea1-20bf-e22abad97978	1296	Šentvid pri Stični
00050000-55d7-2ea1-05b7-acd337930295	8275	Škocjan
00050000-55d7-2ea1-73e2-3b03eccbcb0f	6281	Škofije
00050000-55d7-2ea1-772b-6ef49a85b89a	4220	Škofja Loka
00050000-55d7-2ea1-59fb-300fbd49a2e1	3211	Škofja vas
00050000-55d7-2ea1-2e2e-27aef89570e1	1291	Škofljica
00050000-55d7-2ea1-f684-6225aaeb9e39	6274	Šmarje
00050000-55d7-2ea1-ab11-191bab70cf70	1293	Šmarje - Sap
00050000-55d7-2ea1-1e48-3539ca69396c	3240	Šmarje pri Jelšah
00050000-55d7-2ea1-ab72-38c2d90747e3	8220	Šmarješke Toplice
00050000-55d7-2ea1-bc12-cf496ba17578	2315	Šmartno na Pohorju
00050000-55d7-2ea1-2337-198d0324dc4b	3341	Šmartno ob Dreti
00050000-55d7-2ea1-fdb2-3073d94d790c	3327	Šmartno ob Paki
00050000-55d7-2ea1-ed2a-364489933f9f	1275	Šmartno pri Litiji
00050000-55d7-2ea1-48bd-adc6a428ab6a	2383	Šmartno pri Slovenj Gradcu
00050000-55d7-2ea1-1167-f119de7a3a0c	3201	Šmartno v Rožni dolini
00050000-55d7-2ea1-ffdf-760ab98ecef9	3325	Šoštanj
00050000-55d7-2ea1-5849-c9bd7edfa41a	6222	Štanjel
00050000-55d7-2ea1-4567-66c4ca5ed2ff	3220	Štore
00050000-55d7-2ea1-b1f4-fd47d9f157c0	3304	Tabor
00050000-55d7-2ea1-6071-106d68b1dfae	3221	Teharje
00050000-55d7-2ea1-d81b-efbc391071db	9251	Tišina
00050000-55d7-2ea1-1806-c3f59d3add79	5220	Tolmin
00050000-55d7-2ea1-d318-cd9acbba13d0	3326	Topolšica
00050000-55d7-2ea1-77b0-7aa2b9510e94	2371	Trbonje
00050000-55d7-2ea1-ea74-080a31569e16	1420	Trbovlje
00050000-55d7-2ea1-9e89-8f24191223f2	8231	Trebelno 
00050000-55d7-2ea1-94c7-8d953a5b9c61	8210	Trebnje
00050000-55d7-2ea1-273b-db4df05dcf4b	5252	Trnovo pri Gorici
00050000-55d7-2ea1-233e-49e70697036c	2254	Trnovska vas
00050000-55d7-2ea1-9dcb-ef569c5cd8c9	1222	Trojane
00050000-55d7-2ea1-6a29-bc94da30ae2e	1236	Trzin
00050000-55d7-2ea1-b579-3962564c9769	4290	Tržič
00050000-55d7-2ea1-21d9-845f8b05dab7	8295	Tržišče
00050000-55d7-2ea1-6569-06518694a0a3	1311	Turjak
00050000-55d7-2ea1-a476-7eccbf48eab2	9224	Turnišče
00050000-55d7-2ea1-a093-d1fe35ce8756	8323	Uršna sela
00050000-55d7-2ea1-aa13-64eae3f8acf9	1252	Vače
00050000-55d7-2ea1-b6b9-a288b55cf512	3320	Velenje 
00050000-55d7-2ea1-74c8-58ab10b31c93	3322	Velenje - poštni predali
00050000-55d7-2ea1-b13f-23f732349504	8212	Velika Loka
00050000-55d7-2ea1-da9c-5271a1bf5cbf	2274	Velika Nedelja
00050000-55d7-2ea1-2b2f-6aa3fa9365d8	9225	Velika Polana
00050000-55d7-2ea1-ee00-bfdc478eb31b	1315	Velike Lašče
00050000-55d7-2ea1-667e-abc42d47f59e	8213	Veliki Gaber
00050000-55d7-2ea1-7e21-ee66303793ce	9241	Veržej
00050000-55d7-2ea1-b761-29f426b6eccb	1312	Videm - Dobrepolje
00050000-55d7-2ea1-11b3-d8aa56820cd9	2284	Videm pri Ptuju
00050000-55d7-2ea1-3c51-7297e3791f76	8344	Vinica
00050000-55d7-2ea1-9177-84a7eeffb501	5271	Vipava
00050000-55d7-2ea1-669a-478f5b3de384	4212	Visoko
00050000-55d7-2ea1-c7f9-c41678c73a33	1294	Višnja Gora
00050000-55d7-2ea1-af54-e66fcd4dfca8	3205	Vitanje
00050000-55d7-2ea1-a21d-70fc5b08b4fd	2255	Vitomarci
00050000-55d7-2ea1-4e7f-98ddcda91001	1217	Vodice
00050000-55d7-2ea1-c34d-905fe5649cd0	3212	Vojnik\t
00050000-55d7-2ea1-4e93-d50a3c815f42	5293	Volčja Draga
00050000-55d7-2ea1-17e4-72bd04435b88	2232	Voličina
00050000-55d7-2ea1-7822-87d6aceb1caf	3305	Vransko
00050000-55d7-2ea1-8788-5e5338a43438	6217	Vremski Britof
00050000-55d7-2ea1-ae7c-c0fd3db90ee8	1360	Vrhnika
00050000-55d7-2ea1-6b7d-687121e06c3e	2365	Vuhred
00050000-55d7-2ea1-b0d1-55986a6bcc30	2367	Vuzenica
00050000-55d7-2ea1-a2c7-127663f4c2b4	8292	Zabukovje 
00050000-55d7-2ea1-f7bf-7d0d46c3adef	1410	Zagorje ob Savi
00050000-55d7-2ea1-cd3f-20f785aefffd	1303	Zagradec
00050000-55d7-2ea1-11e7-11aafd5dffc4	2283	Zavrč
00050000-55d7-2ea1-a855-316accfe9345	8272	Zdole 
00050000-55d7-2ea1-8b4f-6897283a45a9	4201	Zgornja Besnica
00050000-55d7-2ea1-8a28-ac4e344949f2	2242	Zgornja Korena
00050000-55d7-2ea1-5503-96ed94be2318	2201	Zgornja Kungota
00050000-55d7-2ea1-b2fb-e197ca6ac301	2316	Zgornja Ložnica
00050000-55d7-2ea1-8260-8158204cd900	2314	Zgornja Polskava
00050000-55d7-2ea1-7e58-f48faada517c	2213	Zgornja Velka
00050000-55d7-2ea1-c809-e3671dbdd558	4247	Zgornje Gorje
00050000-55d7-2ea1-6f84-4714218e8326	4206	Zgornje Jezersko
00050000-55d7-2ea1-453b-165e56ebea25	2285	Zgornji Leskovec
00050000-55d7-2ea1-7d54-1ee2686de35a	1432	Zidani Most
00050000-55d7-2ea1-1460-6cf9b802db9c	3214	Zreče
00050000-55d7-2ea1-66bd-c34e5530e6b9	4209	Žabnica
00050000-55d7-2ea1-29ed-9af10143948b	3310	Žalec
00050000-55d7-2ea1-84ae-0c47b746727f	4228	Železniki
00050000-55d7-2ea1-ad96-9b67cfbff02b	2287	Žetale
00050000-55d7-2ea1-9d95-0beadcaea9b0	4226	Žiri
00050000-55d7-2ea1-4a0d-4f0e990043e6	4274	Žirovnica
00050000-55d7-2ea1-f4d4-e365b67ea071	8360	Žužemberk
\.


--
-- TOC entry 2918 (class 0 OID 15232065)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15231872)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15231950)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15232077)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15232413)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15232423)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d7-2ea2-c904-c03eb4eb7399	00080000-55d7-2ea2-68f4-3dc7a9f7d660	0900	AK
00190000-55d7-2ea2-494f-62343e8466bd	00080000-55d7-2ea2-6d7b-fe3c837c1779	0987	AK
00190000-55d7-2ea2-b83f-7eb3ddd28b9a	00080000-55d7-2ea2-ba34-8c6446e79cea	0989	AK
00190000-55d7-2ea2-73bc-b57ca5664c84	00080000-55d7-2ea2-09c1-9d6a0448c1d6	0986	AK
00190000-55d7-2ea2-6791-0bf6310f1e90	00080000-55d7-2ea2-1848-43fcdf903c8d	0984	AK
00190000-55d7-2ea2-4375-4a6d0f7dd1cc	00080000-55d7-2ea2-796f-e7e411486247	0983	AK
00190000-55d7-2ea2-194b-556d5a793e75	00080000-55d7-2ea2-6e2f-c120aa2b61db	0982	AK
\.


--
-- TOC entry 2942 (class 0 OID 15232369)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d7-2ea2-297e-d3e294b75cce	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 15232431)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 15232106)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d7-2ea2-b1c1-8148494500d4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d7-2ea2-c39f-b1742bb16ff2	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d7-2ea2-f218-210f47b2b22f	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d7-2ea2-7885-cbd68375964c	0004	Mali oder	t	24	Mali oder 
00220000-55d7-2ea2-230b-d36ae9bc2bf7	0005	Komorni oder	t	15	Komorni oder
00220000-55d7-2ea2-5bcc-6e55e6c266e3	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d7-2ea2-6832-310444d9d5cf	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2916 (class 0 OID 15232050)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15232040)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15232225)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15232174)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15231744)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2925 (class 0 OID 15232116)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 15231782)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d7-2ea1-a117-975afaada4f4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d7-2ea1-94eb-ff36c1fea727	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d7-2ea1-9027-ff9251906248	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d7-2ea1-47a8-e0956d32ad80	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d7-2ea1-858a-d3b165e249c5	planer	Planer dogodkov v koledarju	t
00020000-55d7-2ea1-be90-1bad5ac37f8d	kadrovska	Kadrovska služba	t
00020000-55d7-2ea1-8b44-c5428973ee89	arhivar	Ažuriranje arhivalij	t
00020000-55d7-2ea1-9502-c158a8173a75	igralec	Igralec	t
00020000-55d7-2ea1-6eec-584bff0e216c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d7-2ea2-bd2c-c4ba6158761a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2891 (class 0 OID 15231766)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d7-2ea1-e307-e867dff87b99	00020000-55d7-2ea1-9027-ff9251906248
00010000-55d7-2ea1-6cac-d49677df8340	00020000-55d7-2ea1-9027-ff9251906248
00010000-55d7-2ea2-725f-7ea916154d0b	00020000-55d7-2ea2-bd2c-c4ba6158761a
\.


--
-- TOC entry 2927 (class 0 OID 15232130)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15232071)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 15232017)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15232472)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d7-2ea1-9c51-32f70186339e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d7-2ea1-7812-656f419369e9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d7-2ea1-1ca3-de7ca8e3c6b0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d7-2ea1-fac1-f6c4439e74bc	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d7-2ea1-7c53-ded1109e32c6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2949 (class 0 OID 15232464)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d7-2ea1-c132-f069686e7330	00230000-55d7-2ea1-fac1-f6c4439e74bc	popa
00240000-55d7-2ea1-2475-f51249b2918b	00230000-55d7-2ea1-fac1-f6c4439e74bc	oseba
00240000-55d7-2ea1-4e59-f3cac0470a88	00230000-55d7-2ea1-fac1-f6c4439e74bc	sezona
00240000-55d7-2ea1-5ca2-7eeab681e390	00230000-55d7-2ea1-7812-656f419369e9	prostor
00240000-55d7-2ea1-30a0-f3dd94d1486e	00230000-55d7-2ea1-fac1-f6c4439e74bc	besedilo
00240000-55d7-2ea1-e9eb-c3fed8fff783	00230000-55d7-2ea1-fac1-f6c4439e74bc	uprizoritev
00240000-55d7-2ea1-4588-333b3cf43b90	00230000-55d7-2ea1-fac1-f6c4439e74bc	funkcija
00240000-55d7-2ea1-ab5f-12b46ff615ce	00230000-55d7-2ea1-fac1-f6c4439e74bc	tipfunkcije
00240000-55d7-2ea1-e35e-ec8fdeb4b95d	00230000-55d7-2ea1-fac1-f6c4439e74bc	alternacija
00240000-55d7-2ea1-8712-aec8a53ce7a5	00230000-55d7-2ea1-9c51-32f70186339e	pogodba
00240000-55d7-2ea1-f0bd-b1a1213aed39	00230000-55d7-2ea1-fac1-f6c4439e74bc	zaposlitev
00240000-55d7-2ea1-e97e-247412da5b61	00230000-55d7-2ea1-9c51-32f70186339e	programdela
00240000-55d7-2ea1-b108-e57ba07791d7	00230000-55d7-2ea1-fac1-f6c4439e74bc	zapis
\.


--
-- TOC entry 2948 (class 0 OID 15232459)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15232184)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d7-2ea2-ac49-6f556c460cb0	000e0000-55d7-2ea2-6be6-3b371ae80db5	00080000-55d7-2ea2-6617-7a22f1785ef7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d7-2ea2-01ca-71e299455e23	000e0000-55d7-2ea2-6be6-3b371ae80db5	00080000-55d7-2ea2-6617-7a22f1785ef7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d7-2ea2-8137-c2a5dae9ca65	000e0000-55d7-2ea2-6be6-3b371ae80db5	00080000-55d7-2ea2-a5f6-a9c69fc05794	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2898 (class 0 OID 15231844)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15232027)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d7-2ea2-6fec-8b02d714390f	00180000-55d7-2ea2-51a0-de5b4d432050	000c0000-55d7-2ea2-2824-990fba10ff03	00090000-55d7-2ea2-bfa4-ff8ffe4c45c4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d7-2ea2-3931-714d4e35350c	00180000-55d7-2ea2-51a0-de5b4d432050	000c0000-55d7-2ea2-3931-5dd01faca58d	00090000-55d7-2ea2-7fd8-4f4652e17b14	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d7-2ea2-ea64-6d8fcfdb91ee	00180000-55d7-2ea2-51a0-de5b4d432050	000c0000-55d7-2ea2-f3af-7490574cce1e	00090000-55d7-2ea2-8772-cd1bfb697472	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d7-2ea2-a371-de02e21c91a2	00180000-55d7-2ea2-51a0-de5b4d432050	000c0000-55d7-2ea2-bb68-3e517e4831e9	00090000-55d7-2ea2-af69-b1f6fc081349	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d7-2ea2-7d7b-c4648124b501	00180000-55d7-2ea2-51a0-de5b4d432050	000c0000-55d7-2ea2-9aa3-6def9f957808	00090000-55d7-2ea2-d16d-1d64b26e5ab2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d7-2ea2-c9c3-0fc9dae5c5f8	00180000-55d7-2ea2-d666-5f18abe68672	\N	00090000-55d7-2ea2-d16d-1d64b26e5ab2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2934 (class 0 OID 15232214)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d7-2ea1-2389-84fdad989389	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d7-2ea1-a986-91d5c2306c33	Priredba	Priredba	Priredba	umetnik
000f0000-55d7-2ea1-5ec3-1334bb07ca8a	Prevod	Prevod	Prevod	umetnik
000f0000-55d7-2ea1-9ce1-5dc27607f8de	Režija	Režija	Režija	umetnik
000f0000-55d7-2ea1-6acf-dede701df0c6	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d7-2ea1-30bf-c643b4c68825	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55d7-2ea1-86ae-79d1ba129dfd	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55d7-2ea1-c957-29b4226a816a	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d7-2ea1-ac0b-698ee114714f	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55d7-2ea1-5174-a379ef6a98d2	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55d7-2ea1-2ade-36a25432b813	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d7-2ea1-e4ca-73d149484115	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d7-2ea1-2a90-46977b1766b1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55d7-2ea1-dd42-6b30d1e06b79	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55d7-2ea1-126f-d1ddac47baf6	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d7-2ea1-8fca-85520b01a79e	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d7-2ea1-3a62-59708bbd6a58	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d7-2ea1-0613-099f3c24dc42	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2946 (class 0 OID 15232441)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d7-2ea1-792b-d405bed97cd6	01	Velika predstava	f	1.00	1.00
002b0000-55d7-2ea1-3aec-cfc982a11fa3	02	Mala predstava	f	0.50	0.50
002b0000-55d7-2ea1-ea4b-9ee2c6dee8ee	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d7-2ea1-dd7a-a8c06cbd862c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d7-2ea1-e23d-05c6723e6b35	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2903 (class 0 OID 15231907)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 15231753)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d7-2ea1-6cac-d49677df8340	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROdkYhNsp0a7yRKW4eNKZT8gdyVQvMsFC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-2d50-91f1b750ec27	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-01e0-428963457290	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-0c4f-43213e09c115	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-b3f0-e5361181d33c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-fb35-d536ab576f1a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-a072-a9d9be97a05f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-be6a-0ce83e2d05e1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-09d8-449c9d8aa5e8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-480b-790baf69bdb6	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d7-2ea2-725f-7ea916154d0b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d7-2ea1-e307-e867dff87b99	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2938 (class 0 OID 15232262)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d7-2ea2-0772-1395df0c17fd	00160000-55d7-2ea2-4886-fd9eac62a89a	00150000-55d7-2ea1-888d-5a6a602652b4	00140000-55d7-2ea0-4525-abc4af622583	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d7-2ea2-230b-d36ae9bc2bf7
000e0000-55d7-2ea2-6be6-3b371ae80db5	00160000-55d7-2ea2-65d1-26e7a0751f93	00150000-55d7-2ea1-3956-1a83af0b26ac	00140000-55d7-2ea0-b4ef-8e10b6284573	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d7-2ea2-5bcc-6e55e6c266e3
000e0000-55d7-2ea2-3177-b6db8923fa6e	\N	00150000-55d7-2ea1-3956-1a83af0b26ac	00140000-55d7-2ea0-b4ef-8e10b6284573	00190000-55d7-2ea2-494f-62343e8466bd	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d7-2ea2-230b-d36ae9bc2bf7
000e0000-55d7-2ea2-3a64-b531536ca436	\N	00150000-55d7-2ea1-3956-1a83af0b26ac	00140000-55d7-2ea0-b4ef-8e10b6284573	00190000-55d7-2ea2-494f-62343e8466bd	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d7-2ea2-230b-d36ae9bc2bf7
000e0000-55d7-2ea2-99d3-da8cc2124aed	\N	00150000-55d7-2ea1-3956-1a83af0b26ac	00140000-55d7-2ea0-b4ef-8e10b6284573	00190000-55d7-2ea2-494f-62343e8466bd	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d7-2ea2-b1c1-8148494500d4
000e0000-55d7-2ea2-df6f-62ecc4906ffd	\N	00150000-55d7-2ea1-3956-1a83af0b26ac	00140000-55d7-2ea0-b4ef-8e10b6284573	00190000-55d7-2ea2-494f-62343e8466bd	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d7-2ea2-b1c1-8148494500d4
\.


--
-- TOC entry 2908 (class 0 OID 15231969)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d7-2ea2-9e37-c31fa3622681	000e0000-55d7-2ea2-6be6-3b371ae80db5	1	
00200000-55d7-2ea2-eb41-1c679b959b25	000e0000-55d7-2ea2-6be6-3b371ae80db5	2	
\.


--
-- TOC entry 2923 (class 0 OID 15232098)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15232511)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15232483)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15232523)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15232167)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d7-2ea2-79e8-98baf1390d27	00090000-55d7-2ea2-7fd8-4f4652e17b14	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d7-2ea2-8116-5f8f0f1a14d2	00090000-55d7-2ea2-8772-cd1bfb697472	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d7-2ea2-1588-d7ea028f2016	00090000-55d7-2ea2-2f74-5071eb91071f	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d7-2ea2-58fb-ba6a43030825	00090000-55d7-2ea2-f166-649dc5cb3e2a	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d7-2ea2-8f76-c84cd0d35630	00090000-55d7-2ea2-bfa4-ff8ffe4c45c4	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d7-2ea2-0660-8f25f2001dc0	00090000-55d7-2ea2-d768-133262209b28	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2910 (class 0 OID 15232001)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15232252)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d7-2ea0-4525-abc4af622583	01	Drama	drama (SURS 01)
00140000-55d7-2ea0-b1be-28ab62a297f9	02	Opera	opera (SURS 02)
00140000-55d7-2ea0-87a0-6f2f175be605	03	Balet	balet (SURS 03)
00140000-55d7-2ea0-e58a-db41b68d0574	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d7-2ea0-1d4b-61ef4cd2544c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d7-2ea0-b4ef-8e10b6284573	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d7-2ea0-f8da-1505811befc9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2929 (class 0 OID 15232157)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d7-2ea1-5183-0f281e4af26d	01	Opera	opera
00150000-55d7-2ea1-6e68-30b38032eee2	02	Opereta	opereta
00150000-55d7-2ea1-9e65-16f51f516469	03	Balet	balet
00150000-55d7-2ea1-1ccd-b030c228bbd2	04	Plesne prireditve	plesne prireditve
00150000-55d7-2ea1-6074-86fc57114146	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d7-2ea1-66cc-1202d7528688	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d7-2ea1-f8ac-d6fae4b2ec59	07	Biografska drama	biografska drama
00150000-55d7-2ea1-888d-5a6a602652b4	08	Komedija	komedija
00150000-55d7-2ea1-422f-9904fb89cffa	09	Črna komedija	črna komedija
00150000-55d7-2ea1-7e40-3f137cd67cb4	10	E-igra	E-igra
00150000-55d7-2ea1-3956-1a83af0b26ac	11	Kriminalka	kriminalka
00150000-55d7-2ea1-5b97-8288787b697f	12	Musical	musical
\.


--
-- TOC entry 2440 (class 2606 OID 15231807)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 15232309)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15232299)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15232213)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15232563)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15231991)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 15232016)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15232457)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 15231933)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15232363)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 15232153)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15231967)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 15232010)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15231947)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15232063)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15232540)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15232547)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2681 (class 2606 OID 15232571)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15232090)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 15231905)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15231816)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 15231840)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 15231796)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2431 (class 2606 OID 15231781)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 15232096)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 15232129)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15232247)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 15231869)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15231893)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15232069)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15231883)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 15231954)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15232081)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 15232420)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 15232428)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15232411)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15232439)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15232113)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15232054)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15232045)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15232235)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15232181)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 15231752)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 15232120)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15231770)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2433 (class 2606 OID 15231790)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 15232138)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15232076)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 15232025)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15232481)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 15232469)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 15232463)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15232194)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15231849)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15232036)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15232224)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15232451)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15231918)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15231765)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 15232278)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15231976)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15232104)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15232521)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15232505)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15232529)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15232172)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 15232005)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15232260)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15232165)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 1259 OID 15231998)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 15232195)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 15232196)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 15232542)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2668 (class 1259 OID 15232541)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2454 (class 1259 OID 15231871)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 15232097)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 15232509)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2655 (class 1259 OID 15232508)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2656 (class 1259 OID 15232510)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2657 (class 1259 OID 15232507)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2658 (class 1259 OID 15232506)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2540 (class 1259 OID 15232083)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 15232082)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2491 (class 1259 OID 15231977)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 15232154)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 15232156)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 15232155)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 15231949)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 15231948)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 15232440)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2591 (class 1259 OID 15232249)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 15232250)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 15232251)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2664 (class 1259 OID 15232530)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2600 (class 1259 OID 15232283)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 15232280)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 15232284)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 15232282)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 15232281)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2469 (class 1259 OID 15231920)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 15231919)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2445 (class 1259 OID 15231843)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 15232121)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2509 (class 1259 OID 15232011)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 15231797)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2436 (class 1259 OID 15231798)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 15232141)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 15232140)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 15232139)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2483 (class 1259 OID 15231955)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2484 (class 1259 OID 15231957)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2485 (class 1259 OID 15231956)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 15232471)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 15232049)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 15232047)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 15232046)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 15232048)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2426 (class 1259 OID 15231771)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2427 (class 1259 OID 15231772)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 15232105)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2677 (class 1259 OID 15232564)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2678 (class 1259 OID 15232572)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2679 (class 1259 OID 15232573)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2535 (class 1259 OID 15232070)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 15232182)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 15232183)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 15232368)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 15232367)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2623 (class 1259 OID 15232364)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15232365)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2625 (class 1259 OID 15232366)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2458 (class 1259 OID 15231885)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15231884)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2460 (class 1259 OID 15231886)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 15232421)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2630 (class 1259 OID 15232422)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 15232313)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 15232314)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 15232311)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 15232312)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 15232173)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 15232058)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 15232057)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 15232055)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 15232056)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2610 (class 1259 OID 15232301)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 15232300)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2626 (class 1259 OID 15232412)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2490 (class 1259 OID 15231968)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 15232458)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2671 (class 1259 OID 15232548)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 15232549)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2441 (class 1259 OID 15231818)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2442 (class 1259 OID 15231817)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2450 (class 1259 OID 15231850)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2451 (class 1259 OID 15231851)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 15232039)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 15232038)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 15232037)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2497 (class 1259 OID 15232000)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2498 (class 1259 OID 15231996)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2499 (class 1259 OID 15231993)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2500 (class 1259 OID 15231994)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2501 (class 1259 OID 15231992)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2502 (class 1259 OID 15231997)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2503 (class 1259 OID 15231995)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2457 (class 1259 OID 15231870)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 15231934)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15231936)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2477 (class 1259 OID 15231935)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2478 (class 1259 OID 15231937)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 15232064)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 15232248)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 15232279)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 15231841)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 15231842)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 15232166)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 15232482)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 15231906)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 15232470)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 15232115)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 15232114)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15232310)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 15231894)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 15232261)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 15232522)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2635 (class 1259 OID 15232429)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 15232430)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 15232026)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2434 (class 1259 OID 15231791)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2504 (class 1259 OID 15231999)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 2606 OID 15232709)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2710 (class 2606 OID 15232694)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2709 (class 2606 OID 15232699)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2705 (class 2606 OID 15232719)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2711 (class 2606 OID 15232689)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2706 (class 2606 OID 15232714)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 15232704)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2741 (class 2606 OID 15232864)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2740 (class 2606 OID 15232869)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 15233039)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15233034)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 15232624)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2728 (class 2606 OID 15232804)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2769 (class 2606 OID 15233019)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2770 (class 2606 OID 15233014)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2768 (class 2606 OID 15233024)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 15233009)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2772 (class 2606 OID 15233004)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2726 (class 2606 OID 15232799)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2727 (class 2606 OID 15232794)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 15232684)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15232834)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2734 (class 2606 OID 15232844)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2735 (class 2606 OID 15232839)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2698 (class 2606 OID 15232659)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 15232654)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15232784)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 15232989)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2744 (class 2606 OID 15232874)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 15232879)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 15232884)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2773 (class 2606 OID 15233029)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2746 (class 2606 OID 15232904)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2749 (class 2606 OID 15232889)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2745 (class 2606 OID 15232909)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2747 (class 2606 OID 15232899)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2748 (class 2606 OID 15232894)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2696 (class 2606 OID 15232649)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 15232644)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 15232609)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2689 (class 2606 OID 15232604)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 15232814)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2712 (class 2606 OID 15232724)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 15232584)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 15232589)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2731 (class 2606 OID 15232829)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2732 (class 2606 OID 15232824)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2733 (class 2606 OID 15232819)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2702 (class 2606 OID 15232664)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 15232674)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2701 (class 2606 OID 15232669)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2767 (class 2606 OID 15232999)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2716 (class 2606 OID 15232759)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2718 (class 2606 OID 15232749)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2719 (class 2606 OID 15232744)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2717 (class 2606 OID 15232754)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 15232574)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 15232579)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 15232809)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2778 (class 2606 OID 15233054)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 15233059)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2779 (class 2606 OID 15233064)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2725 (class 2606 OID 15232789)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2739 (class 2606 OID 15232854)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2738 (class 2606 OID 15232859)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 15232964)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 15232959)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15232944)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2759 (class 2606 OID 15232949)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2758 (class 2606 OID 15232954)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 15232634)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15232629)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2693 (class 2606 OID 15232639)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2763 (class 2606 OID 15232974)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2762 (class 2606 OID 15232979)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2753 (class 2606 OID 15232934)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2752 (class 2606 OID 15232939)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2755 (class 2606 OID 15232924)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2754 (class 2606 OID 15232929)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2737 (class 2606 OID 15232849)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 15232779)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2721 (class 2606 OID 15232774)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2723 (class 2606 OID 15232764)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2722 (class 2606 OID 15232769)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 15232919)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15232914)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 15232969)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2703 (class 2606 OID 15232679)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 15232984)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 15232994)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15233044)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 15233049)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2686 (class 2606 OID 15232599)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 15232594)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2691 (class 2606 OID 15232614)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 15232619)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 15232739)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 15232734)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2715 (class 2606 OID 15232729)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-21 15:58:59 CEST

--
-- PostgreSQL database dump complete
--

