--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-17 17:36:22 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 239 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10675278)
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
-- TOC entry 228 (class 1259 OID 10675777)
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
-- TOC entry 227 (class 1259 OID 10675760)
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
-- TOC entry 221 (class 1259 OID 10675672)
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
-- TOC entry 197 (class 1259 OID 10675457)
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
-- TOC entry 200 (class 1259 OID 10675491)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 10675895)
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
-- TOC entry 192 (class 1259 OID 10675400)
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
-- TOC entry 229 (class 1259 OID 10675790)
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
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskepravice numeric(15,2) DEFAULT 0::numeric NOT NULL,
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
    utemeljitev text NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stokroglihmiz integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    opredelitevdrugidogodki text,
    stprodukcij integer,
    caspriprave character varying(255) DEFAULT NULL::character varying,
    casizvedbe character varying(255) DEFAULT NULL::character varying,
    prizorisca text,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    soorganizatorji text,
    sttujihselektorjev integer
);


--
-- TOC entry 216 (class 1259 OID 10675617)
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
-- TOC entry 195 (class 1259 OID 10675437)
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
-- TOC entry 199 (class 1259 OID 10675485)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10675417)
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
-- TOC entry 170 (class 1259 OID 529271)
-- Name: kose; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kose (
    id uuid NOT NULL,
    naslov_id uuid,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    pesvdonim character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    email character varying(40) DEFAULT NULL::character varying,
    datumrojstva character varying(255) DEFAULT NULL::character varying,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 10675534)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10675559)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10675374)
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
-- TOC entry 184 (class 1259 OID 10675287)
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
-- TOC entry 185 (class 1259 OID 10675298)
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
-- TOC entry 172 (class 1259 OID 4729417)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 10675252)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10675271)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10675566)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10675597)
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
-- TOC entry 224 (class 1259 OID 10675711)
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
-- TOC entry 187 (class 1259 OID 10675331)
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
-- TOC entry 189 (class 1259 OID 10675366)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10675540)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 171 (class 1259 OID 692701)
-- Name: postninaslov; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslov (
    id uuid NOT NULL,
    klient_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean,
    privzeti boolean NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 10675351)
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
-- TOC entry 194 (class 1259 OID 10675429)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10675552)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10675855)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 232 (class 1259 OID 10675866)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10675836)
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
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stnekomerc integer,
    stizvponprem integer,
    stizvprej integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stgostovanjslo integer,
    stgostovanjzam integer,
    stgostovanjint integer,
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
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 175 (class 1259 OID 7936450)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    zvrst character varying(255) NOT NULL,
    stpredstav integer,
    stpredavanj integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    opredelitevdrugidogodki text,
    stprodukcij integer,
    stobisk integer,
    caspriprave character varying(255) NOT NULL,
    casizvedbe character varying(255) NOT NULL,
    prizorisca character varying(255) DEFAULT NULL::character varying,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    soorganizatorji character varying(255) DEFAULT NULL::character varying,
    sttujihselektorjev integer,
    stzaposlenih integer,
    sthonorarnih integer,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opredelitevdrugiviri text,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 173 (class 1259 OID 7899147)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    krajgostovanja character varying(255) NOT NULL,
    ustanova character varying(255) NOT NULL,
    datumgostovanja date,
    stponovitev integer DEFAULT 0 NOT NULL,
    stgledalcev integer DEFAULT 0 NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    transportnistroski numeric(15,2) NOT NULL,
    stroskiavtorzun numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 174 (class 1259 OID 7924205)
-- Name: programrazno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programrazno (
    id uuid NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    nazivsklopa character varying(255) NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stpe integer DEFAULT 0 NOT NULL,
    stobiskovalcev integer DEFAULT 0 NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    sthonoranih integer DEFAULT 0 NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 233 (class 1259 OID 10675874)
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
-- TOC entry 212 (class 1259 OID 10675581)
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
-- TOC entry 204 (class 1259 OID 10675525)
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
-- TOC entry 203 (class 1259 OID 10675515)
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
-- TOC entry 223 (class 1259 OID 10675700)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10675649)
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
-- TOC entry 177 (class 1259 OID 10675223)
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
-- TOC entry 176 (class 1259 OID 10675221)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10675591)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10675261)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10675245)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10675605)
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
-- TOC entry 207 (class 1259 OID 10675546)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10675496)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    imesezone character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date,
    aktivna boolean
);


--
-- TOC entry 238 (class 1259 OID 10675915)
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
-- TOC entry 237 (class 1259 OID 10675907)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 10675902)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10675659)
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
-- TOC entry 186 (class 1259 OID 10675323)
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
-- TOC entry 202 (class 1259 OID 10675502)
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
-- TOC entry 222 (class 1259 OID 10675689)
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
-- TOC entry 234 (class 1259 OID 10675884)
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
-- TOC entry 191 (class 1259 OID 10675386)
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
-- TOC entry 178 (class 1259 OID 10675232)
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
-- TOC entry 226 (class 1259 OID 10675737)
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
-- TOC entry 196 (class 1259 OID 10675448)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10675573)
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
-- TOC entry 218 (class 1259 OID 10675642)
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
-- TOC entry 198 (class 1259 OID 10675480)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10675727)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10675632)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2213 (class 2604 OID 10675226)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2865 (class 0 OID 10675278)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 10675777)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a9-20f5-4ad2-0dd971650220	000d0000-55a9-20f5-020e-5a6b0110d97d	\N	00090000-55a9-20f5-1f13-2884ea51e4d7	000b0000-55a9-20f5-69fd-276249fed720	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a9-20f5-9cba-1a15ee6cdb50	000d0000-55a9-20f5-4f86-3adeead0dc56	00100000-55a9-20f5-edbd-5306e1844396	00090000-55a9-20f5-1350-3a7d754f38c6	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a9-20f5-52bb-91746c70219a	000d0000-55a9-20f5-935a-4c8f73b4cc20	00100000-55a9-20f5-8434-0f5328a41464	00090000-55a9-20f5-b731-d7a8ef38ca3f	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a9-20f5-1dba-b4f56a558681	000d0000-55a9-20f5-842f-925d74680cf7	\N	00090000-55a9-20f5-bfe2-0c47e85c5f9d	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a9-20f5-0f5c-38355351b41f	000d0000-55a9-20f5-379b-8ad6c465b317	\N	00090000-55a9-20f5-3f3c-8cc7922920ae	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a9-20f5-3785-771bc3fb6ffa	000d0000-55a9-20f5-d469-a3e02a5ce327	\N	00090000-55a9-20f5-0ad0-898eee9d5f2e	000b0000-55a9-20f5-095c-05de72e275f4	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a9-20f5-ceb5-4f70e49cddf2	000d0000-55a9-20f5-64cc-8e57e19f1748	00100000-55a9-20f5-4fea-84251c43c0f4	00090000-55a9-20f5-c458-67057fed5bff	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a9-20f5-a1b3-aff7707eb07e	000d0000-55a9-20f5-e9a2-596631759096	\N	00090000-55a9-20f5-4a1e-1836e1faf692	000b0000-55a9-20f5-9182-bb7de4858567	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2909 (class 0 OID 10675760)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 10675672)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a9-20f5-b658-0ea7437d7186	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a9-20f5-71da-6791a0ba065a	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a9-20f5-6e81-79aea389697e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2879 (class 0 OID 10675457)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a9-20f5-7b44-2521f33f7a41	\N	\N	00200000-55a9-20f5-96a3-66963d67b85c	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a9-20f5-89a9-4a8f9926bbb8	\N	\N	00200000-55a9-20f5-18aa-d10dc6455eec	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a9-20f5-8047-0b8ebd9607b1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a9-20f5-5791-5e7b958a0f6d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a9-20f5-22a5-7c40cd8fbf9e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2882 (class 0 OID 10675491)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 10675895)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 10675400)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a9-20f3-02d1-97d79fd910b9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a9-20f3-86fa-8bf8761c1209	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a9-20f3-d736-8182cee25bc5	AL	ALB	008	Albania 	Albanija	\N
00040000-55a9-20f3-e61e-c85f465fa960	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a9-20f3-12fe-2247060362fd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a9-20f3-7d1c-6d32d8a052d2	AD	AND	020	Andorra 	Andora	\N
00040000-55a9-20f3-66c3-6fd74dad20fe	AO	AGO	024	Angola 	Angola	\N
00040000-55a9-20f3-d8a9-711d04ba0edd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a9-20f3-bfba-f1f96ba49599	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a9-20f3-e7ad-1af22dccf626	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a9-20f3-f546-6fd3a74e4604	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a9-20f3-5849-da552140f7f3	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a9-20f3-5d0c-c74d20a8cf46	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a9-20f3-60b2-7a3e0e3b7e50	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a9-20f3-632c-381dc5507794	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a9-20f3-f0a4-f57c34484695	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a9-20f3-0e04-46bb306e709a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a9-20f3-08ea-81af08a50e9e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a9-20f3-5ae4-4d7213b41011	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a9-20f3-8006-ba5522b3b5cc	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a9-20f3-72e0-3d4157dacd9e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a9-20f3-a7e3-1924da685df0	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a9-20f3-45ad-f1c3a0978a6f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a9-20f3-8bd3-ad7c7de72983	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a9-20f3-dbf8-2c9451837de6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a9-20f3-974d-b5c4d4fd43ce	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a9-20f3-48e0-ed73c49f9798	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a9-20f3-2144-f2890cac0a8e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a9-20f3-a34e-025261d5cfc6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a9-20f3-fe35-86410432e1af	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a9-20f3-8f16-a9979f2b84ea	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a9-20f3-0648-97e5dc0babe0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a9-20f3-2e36-bc8916cca696	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a9-20f3-dc25-12b2039b2f07	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a9-20f3-437b-65c24651a41c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a9-20f3-fc8c-de2dd3c9c3bb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a9-20f3-4678-bb71c8d23d35	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a9-20f3-a8bd-e4c2e637e37b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a9-20f3-2b12-3821e0419122	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a9-20f3-13a5-ba504c164234	CA	CAN	124	Canada 	Kanada	\N
00040000-55a9-20f3-0fe1-7d5b3827d56f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a9-20f3-c171-67c0488709bd	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a9-20f3-f94d-d803a2792cca	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a9-20f3-e06a-675ef9c1da3c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a9-20f3-7fbe-4e603eb0b1f9	CL	CHL	152	Chile 	Čile	\N
00040000-55a9-20f3-1f4f-172364903096	CN	CHN	156	China 	Kitajska	\N
00040000-55a9-20f3-5dc9-b6a7d51ffb1a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a9-20f3-04f2-b9d882dd749c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a9-20f3-28cc-ea789bb61422	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a9-20f3-c623-e58e73d2fd5a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a9-20f3-0e24-07c40979a0d7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a9-20f3-fb91-0b4f65e6bd32	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a9-20f3-fe45-0effed6d2b7a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a9-20f3-e0ca-a4a4a0575b06	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a9-20f3-d824-c705bc3f213f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a9-20f3-5111-c936675f4abb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a9-20f3-5806-1377ded1ee87	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a9-20f3-b782-e2684e201ca4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a9-20f3-0d99-1ab5e3a052a8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a9-20f3-317e-ee762e4a6de2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a9-20f3-d68c-f83cb2938e59	DK	DNK	208	Denmark 	Danska	\N
00040000-55a9-20f3-5e71-bdae6071517b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a9-20f3-d500-b62fb992b154	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a9-20f3-de4a-1d3244d3d378	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a9-20f3-8a7a-45ba6534eac3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a9-20f3-d171-d8b2439813ee	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a9-20f3-5abd-0f0092d83c4e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a9-20f3-4d83-b22c2f5176a2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a9-20f3-5b79-332bd6bfa059	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a9-20f3-458f-e1126c72c33b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a9-20f3-9688-78da385cc346	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a9-20f3-52d7-1f2d39f5c0ce	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a9-20f3-cd39-e274660c63de	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a9-20f3-403f-089548ff147f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a9-20f3-7e7d-0ea506c0fac3	FI	FIN	246	Finland 	Finska	\N
00040000-55a9-20f3-e500-6a5b31939fa3	FR	FRA	250	France 	Francija	\N
00040000-55a9-20f3-fd44-959c884a5d73	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a9-20f3-44ef-9929b2f442e0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a9-20f3-17b9-611b89e25164	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a9-20f3-452c-f40b9f2b5a1c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a9-20f3-870c-9ea4464799e4	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a9-20f3-2c6b-d927073028e5	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a9-20f3-f16e-7b22248a0cca	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a9-20f3-5660-bf59b3d260a8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a9-20f3-8965-a125ccb16229	GH	GHA	288	Ghana 	Gana	\N
00040000-55a9-20f3-1f05-50e10f99a7b1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a9-20f3-c420-e71cd39aae41	GR	GRC	300	Greece 	Grčija	\N
00040000-55a9-20f3-6b44-289737a04ff4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a9-20f3-f98d-1ed60bfe628c	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a9-20f3-55ae-a71f4f7253a7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a9-20f3-d518-cde58151835c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a9-20f3-ec53-072510e1ba8d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a9-20f3-5416-6262e4e2939b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a9-20f3-6e1d-d24c7400f76b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a9-20f3-1250-bf21f5f25e48	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a9-20f3-6581-31bb3e01aa37	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a9-20f3-0057-b021b0febbe1	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a9-20f3-cbb9-0bb7e4209dd3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a9-20f3-9110-b39245d860a9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a9-20f3-21e6-0a6899839254	HN	HND	340	Honduras 	Honduras	\N
00040000-55a9-20f3-4b7c-620ea4df2543	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a9-20f3-fffa-5b9bbc41e5b5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a9-20f3-4776-b2a84c938653	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a9-20f3-e12c-f664fdff9b0a	IN	IND	356	India 	Indija	\N
00040000-55a9-20f3-6f56-7a68b07701f7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a9-20f3-bc55-3e5f8fc8bc14	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a9-20f3-687f-e819a3dd9987	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a9-20f3-3da1-6d341e1a3d7c	IE	IRL	372	Ireland 	Irska	\N
00040000-55a9-20f3-0361-4ce604f0d2ef	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a9-20f3-2431-9cd264043abc	IL	ISR	376	Israel 	Izrael	\N
00040000-55a9-20f3-c4a7-e3a456a624d4	IT	ITA	380	Italy 	Italija	\N
00040000-55a9-20f3-3f17-17f55bd6775b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a9-20f3-0779-54b2120b6c0a	JP	JPN	392	Japan 	Japonska	\N
00040000-55a9-20f3-e7e4-7c6a4b6b3f20	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a9-20f3-2352-80da974e6698	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a9-20f3-0e13-7bf518b024a0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a9-20f3-4417-0f9832b4d753	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a9-20f3-a688-b5dfe7e5b8ea	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a9-20f3-0be6-7a1f6120cd5f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a9-20f3-b839-76ff43340b85	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a9-20f3-cbc0-9d3214650d0d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a9-20f3-73b4-6049b285a674	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a9-20f3-8b25-f3929d7cf43b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a9-20f3-ab75-3821201126d3	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a9-20f3-4320-7d6d2057f278	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a9-20f3-3e4f-660f8421652e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a9-20f3-d12e-dd94ad7c93ae	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a9-20f3-5a87-f063aeb075a8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a9-20f3-60c3-35eb7381fbbc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a9-20f3-2c8e-5e8cc431152d	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a9-20f3-a1a7-7b2957f0c8bb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a9-20f3-422d-80f1e6e181ec	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a9-20f3-6373-a98a048b8268	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a9-20f3-c220-a590d8b82890	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a9-20f3-9135-e4c1758be008	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a9-20f3-f552-8ef75a5eba6d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a9-20f3-a9a1-34cd9a99b86b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a9-20f3-bee0-15a9d4148788	ML	MLI	466	Mali 	Mali	\N
00040000-55a9-20f3-686f-3638a20d618b	MT	MLT	470	Malta 	Malta	\N
00040000-55a9-20f3-e5d8-d23ba2fa284f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a9-20f3-b97f-719ee1b53625	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a9-20f3-f5ea-421fc72bc253	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a9-20f3-1398-2c45be14172b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a9-20f3-10b1-8c3df7515db3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a9-20f3-4192-2c895559fd4b	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a9-20f3-6b55-b711b0a1281d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a9-20f3-b41d-730cd0df6c5d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a9-20f3-6513-ffa03fa66e91	MC	MCO	492	Monaco 	Monako	\N
00040000-55a9-20f3-a257-6027d32b52d4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a9-20f3-757e-d5b0fe0b5caf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a9-20f3-909e-af955669cea8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a9-20f3-374a-519ff89edf02	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a9-20f3-11e6-4faa14a2cd55	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a9-20f3-a768-df81fb939e36	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a9-20f3-4214-ea3b837692b4	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a9-20f3-c188-af72e2f1f922	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a9-20f3-2686-2e2dbe0d75ce	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a9-20f3-6911-d46ab38aeea7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a9-20f3-f19e-6712806be32b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a9-20f3-d8cf-1995fbfc7987	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a9-20f3-c438-3fff7bdedc86	NE	NER	562	Niger 	Niger 	\N
00040000-55a9-20f3-7ba9-b4904406096b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a9-20f3-edea-3d658e372aef	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a9-20f3-ae24-dedef38fb08d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a9-20f3-379c-3ad03aa9f782	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a9-20f3-5fc4-4f43c008a84a	NO	NOR	578	Norway 	Norveška	\N
00040000-55a9-20f3-df40-8ecbb901c949	OM	OMN	512	Oman 	Oman	\N
00040000-55a9-20f3-c515-8b43d78a1c69	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a9-20f3-9115-358a09f7c9b3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a9-20f3-bd5c-01f8db68936b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a9-20f3-bb25-8b124a4556cc	PA	PAN	591	Panama 	Panama	\N
00040000-55a9-20f3-7035-7ed043173b33	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a9-20f3-1263-8f9782f9e504	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a9-20f3-8720-e6c78b7b0257	PE	PER	604	Peru 	Peru	\N
00040000-55a9-20f3-4356-ee18664407de	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a9-20f3-873b-45f64455b4db	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a9-20f3-b4ec-17d8fe8578be	PL	POL	616	Poland 	Poljska	\N
00040000-55a9-20f3-5278-cfa603f9e0e7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a9-20f3-f65a-dbb6ab63c6cb	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a9-20f3-2d7b-b6a00465d03c	QA	QAT	634	Qatar 	Katar	\N
00040000-55a9-20f3-276e-6fac9a8fc9c3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a9-20f3-6760-f65550a0a6a1	RO	ROU	642	Romania 	Romunija	\N
00040000-55a9-20f3-2156-8ced10c4d4e9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a9-20f3-6977-18b8fbbec3f0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a9-20f3-09a0-610f62b28407	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a9-20f3-ca33-d630709fffa6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a9-20f3-3d0f-00fa91865eeb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a9-20f3-cd34-b985e574fe6d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a9-20f3-7524-4253fa651869	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a9-20f3-0a81-71e261c506d8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a9-20f3-fdf8-0c97e2b6081b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a9-20f3-4388-b9cef5474b16	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a9-20f3-f964-98826079b822	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a9-20f3-ac0b-9fee69659de2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a9-20f3-3ec8-185d6ebd741f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a9-20f3-431b-c172eac63cc1	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a9-20f3-4536-0adda0454872	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a9-20f3-7834-95b044a8f9dc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a9-20f3-9441-6d1dc7d8df46	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a9-20f3-5642-b77ce07d26ce	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a9-20f3-2297-8e849bb1ebe8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a9-20f3-a087-9bbd2a31e03c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a9-20f3-2267-8c0f3aa33982	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a9-20f3-0791-ab691fbf13b3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a9-20f3-eeac-e189e67692b5	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a9-20f3-9f83-84cb130072f2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a9-20f3-fb74-a2ab8032a48c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a9-20f3-2cd9-1880fd206f8c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a9-20f3-c38b-35b3792f865b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a9-20f3-f66a-a1016f6a535a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a9-20f3-0609-f517a20c2202	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a9-20f3-fee6-99ba42d9d80c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a9-20f3-f106-563de93e2dcf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a9-20f3-6c1c-30e5841624a7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a9-20f3-cfd9-56d75d72bc61	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a9-20f3-63ed-057d00b8b694	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a9-20f3-f976-ea5d29ba7cee	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a9-20f3-a571-0849e3cb2ee3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a9-20f3-729d-7244b149eccd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a9-20f3-3ee3-65a87a2c2a33	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a9-20f3-03f1-9b6f2e81ad29	TH	THA	764	Thailand 	Tajska	\N
00040000-55a9-20f3-1c0f-7df9b5560632	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a9-20f3-6f1c-ddee3ca5275f	TG	TGO	768	Togo 	Togo	\N
00040000-55a9-20f3-08e2-07b1ab580c44	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a9-20f3-6593-f84791da4697	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a9-20f3-e21b-a2fb90037950	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a9-20f3-c941-02f16b3c0741	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a9-20f3-4bf2-1a8e7fbceb2a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a9-20f3-39d8-718f679dd841	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a9-20f3-cc9d-a205c71f46dc	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a9-20f3-9d75-4fe4f4096f42	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a9-20f3-c5d6-7b27da395889	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a9-20f3-30cc-c0fba0a86244	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a9-20f3-150b-0798be15b14c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a9-20f3-f48d-a916f6422b30	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a9-20f3-762c-db1f37d3e387	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a9-20f3-7e94-f5863cdb3eb1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a9-20f3-c3f1-0894ceb485a7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a9-20f3-1270-3d7a3913551f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a9-20f3-a7f6-af462282c138	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a9-20f3-4166-c66f671418e8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a9-20f3-0325-6ac56d5640f1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a9-20f3-2d1c-14144d77c7be	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a9-20f3-bf21-b3ee37996f51	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a9-20f3-6ac2-2566df5dca63	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a9-20f3-7e8a-9fa04e675335	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a9-20f3-79cf-23f256958861	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a9-20f3-1cef-b36abe0c782e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a9-20f3-9c82-24d839af77a0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2911 (class 0 OID 10675790)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a9-20f5-8e65-4f1b82372746	000e0000-55a9-20f5-7dfd-63b6e5fd3b01	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0	Raznovrstni dogodek		\N	002b0000-55a9-20f4-46e0-49d82393bef4	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a9-20f5-ef66-98d8579742ac	000e0000-55a9-20f5-02b6-6177649afd67	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a9-20f4-815f-03bac69844e5	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a9-20f5-8bce-451bb6ec8e37	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0		Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a9-20f5-4eb1-244025202844	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0		Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2898 (class 0 OID 10675617)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a9-20f5-64cc-8e57e19f1748	000e0000-55a9-20f5-02b6-6177649afd67	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a9-20f4-f58e-788bff772b8f
000d0000-55a9-20f5-020e-5a6b0110d97d	000e0000-55a9-20f5-02b6-6177649afd67	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a9-20f4-f58e-788bff772b8f
000d0000-55a9-20f5-4f86-3adeead0dc56	000e0000-55a9-20f5-02b6-6177649afd67	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a9-20f4-ca22-d9cd6944c734
000d0000-55a9-20f5-935a-4c8f73b4cc20	000e0000-55a9-20f5-02b6-6177649afd67	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55a9-20f4-f9be-82181da57628
000d0000-55a9-20f5-842f-925d74680cf7	000e0000-55a9-20f5-02b6-6177649afd67	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a9-20f4-6fb9-3b1d33274011
000d0000-55a9-20f5-379b-8ad6c465b317	000e0000-55a9-20f5-02b6-6177649afd67	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a9-20f4-e13c-6ae1535ff932
000d0000-55a9-20f5-d469-a3e02a5ce327	000e0000-55a9-20f5-02b6-6177649afd67	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a9-20f4-f58e-788bff772b8f
000d0000-55a9-20f5-e9a2-596631759096	000e0000-55a9-20f5-02b6-6177649afd67	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a9-20f4-1d8c-8d111df3f1ff
\.


--
-- TOC entry 2877 (class 0 OID 10675437)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 10675485)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10675417)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a9-20f5-7b70-76d9f5aa9dca	00080000-55a9-20f5-441d-f57f00478e58	00090000-55a9-20f5-21bf-5f89e36a2e76	AK		
\.


--
-- TOC entry 2852 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 10675534)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 10675559)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 10675374)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a9-20f3-438d-513718894d8f	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a9-20f3-4c73-6b4750af83b4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a9-20f3-9ae1-cb134c4a1e8a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a9-20f3-0915-64376ba9bb60	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a9-20f3-4f38-f8552c9c8026	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a9-20f3-8403-d90bafabca0a	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a9-20f3-4fa7-42f490bae9d9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a9-20f3-204a-2c68de7d6967	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a9-20f3-9ef5-54d55d22fc2a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a9-20f3-3ba0-b0e967afadfa	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a9-20f3-70a9-62d50d32937d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a9-20f3-67f2-0920e2dfe180	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a9-20f3-b7f3-c6e0b7a893ee	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55a9-20f5-904f-8dd0c95e4de1	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a9-20f5-950f-02b4962b0460	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a9-20f5-7f0f-640623a7d3a5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a9-20f5-7e38-e05618f0de57	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a9-20f5-368b-01f18713d0ef	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a9-20f5-1693-5890cdc304e8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2866 (class 0 OID 10675287)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a9-20f5-709c-0df8a8b1b7f8	00000000-55a9-20f5-950f-02b4962b0460	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a9-20f5-bd98-4e1267dd0222	00000000-55a9-20f5-950f-02b4962b0460	00010000-55a9-20f3-c39c-e78e834d135c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a9-20f5-a775-01ed349d68ab	00000000-55a9-20f5-7f0f-640623a7d3a5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2867 (class 0 OID 10675298)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a9-20f5-1f13-2884ea51e4d7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a9-20f5-bfe2-0c47e85c5f9d	00010000-55a9-20f5-a62f-fea9cc28f71c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a9-20f5-b731-d7a8ef38ca3f	00010000-55a9-20f5-885e-e061d817c624	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a9-20f5-3dd3-1f3b6f524c37	00010000-55a9-20f5-bc04-2d8c4161cfbe	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a9-20f5-d03c-a8b98816768c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a9-20f5-0ad0-898eee9d5f2e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a9-20f5-24f3-08f1c3f2b38b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a9-20f5-c458-67057fed5bff	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a9-20f5-21bf-5f89e36a2e76	00010000-55a9-20f5-a80c-8f2715b97a22	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a9-20f5-1350-3a7d754f38c6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a9-20f5-9546-1ca1710426f2	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a9-20f5-3f3c-8cc7922920ae	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a9-20f5-4a1e-1836e1faf692	00010000-55a9-20f5-8d7b-ecc215a03a30	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2854 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 10675252)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a9-20f3-41b1-e8d4ff8fe18a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a9-20f3-cc88-d1115912ca4d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a9-20f3-fae5-0d68ff4b00c1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a9-20f3-d0c4-2faf0460b959	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a9-20f3-424d-7a523af53796	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a9-20f3-c514-bafe858a10dc	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a9-20f3-03e9-1df58c84b14d	Abonma-read	Abonma - branje	f
00030000-55a9-20f3-c1f6-1f0b8a0d8e2b	Abonma-write	Abonma - spreminjanje	f
00030000-55a9-20f3-01ee-abdd03dce202	Alternacija-read	Alternacija - branje	f
00030000-55a9-20f3-6f22-7f512a2d269d	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a9-20f3-6b96-0bf7d9eaf281	Arhivalija-read	Arhivalija - branje	f
00030000-55a9-20f3-9872-b4a59bbbb52e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a9-20f3-2716-68fe1f4423e5	Besedilo-read	Besedilo - branje	f
00030000-55a9-20f3-beeb-933b374e5a93	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a9-20f3-babb-21e14c45f497	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a9-20f3-d19a-1e5ec682c991	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a9-20f3-9e96-f596c7b6baac	Dogodek-read	Dogodek - branje	f
00030000-55a9-20f3-1752-45c89c322fe7	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a9-20f3-021d-217b5e4e2cb9	DrugiVir-read	DrugiVir - branje	f
00030000-55a9-20f3-98c5-8a3cd522a83f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a9-20f3-d943-2fae746f3b64	Drzava-read	Drzava - branje	f
00030000-55a9-20f3-a72b-858c86c57af1	Drzava-write	Drzava - spreminjanje	f
00030000-55a9-20f3-b226-e424cea707c9	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a9-20f3-6da3-3069ff2aaf22	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a9-20f3-c714-218b5d54bfea	Funkcija-read	Funkcija - branje	f
00030000-55a9-20f3-b7f1-631c17b2695d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a9-20f3-6eeb-2e723d24c2b0	Gostovanje-read	Gostovanje - branje	f
00030000-55a9-20f3-a14c-48f98e298326	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a9-20f3-fcee-608bebae8a39	Gostujoca-read	Gostujoca - branje	f
00030000-55a9-20f3-30f0-5851bfedd9b2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a9-20f3-31bf-91f88122e1f4	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a9-20f3-ab89-154ee342a29c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a9-20f3-2548-034e75ae902e	Kupec-read	Kupec - branje	f
00030000-55a9-20f3-ff00-f9ed1db095cb	Kupec-write	Kupec - spreminjanje	f
00030000-55a9-20f3-a536-29d86afaf606	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a9-20f3-b8cb-548575e1362e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a9-20f3-6ddb-1d49244a2784	Option-read	Option - branje	f
00030000-55a9-20f3-c016-70444ad76c9d	Option-write	Option - spreminjanje	f
00030000-55a9-20f3-f78c-3f34d3862d4a	OptionValue-read	OptionValue - branje	f
00030000-55a9-20f3-ef34-c8a7ce6504a1	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a9-20f3-e779-bb6660ddeacb	Oseba-read	Oseba - branje	f
00030000-55a9-20f3-a5db-7b6862930e72	Oseba-write	Oseba - spreminjanje	f
00030000-55a9-20f3-9238-918e4320c997	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a9-20f3-c210-03b5bc2d7efc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a9-20f3-a0e5-2b76cd351efb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a9-20f3-c92a-ae5acc935954	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a9-20f3-a405-83150adaeca8	Pogodba-read	Pogodba - branje	f
00030000-55a9-20f3-b6ef-15bdd867a78a	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a9-20f3-f90f-690386891cff	Popa-read	Popa - branje	f
00030000-55a9-20f3-9d93-c2e443b601a4	Popa-write	Popa - spreminjanje	f
00030000-55a9-20f3-7f44-18ca06559484	Posta-read	Posta - branje	f
00030000-55a9-20f3-4b65-53d9ea8ca7bb	Posta-write	Posta - spreminjanje	f
00030000-55a9-20f3-b3c6-7a3298600598	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a9-20f3-7dce-9a9e8b544551	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a9-20f3-ca7c-6922321e536b	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a9-20f3-a07c-6d973dc92994	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a9-20f3-0576-81204e572f14	Predstava-read	Predstava - branje	f
00030000-55a9-20f3-be4f-5b94d2e69439	Predstava-write	Predstava - spreminjanje	f
00030000-55a9-20f3-fa68-9215ace8e045	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a9-20f3-ea19-a8cbf4c85bd1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a9-20f3-dea7-f841d404dbfd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a9-20f3-cec0-a3c9021c9d37	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a9-20f3-bb9a-77f5a87cf621	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a9-20f3-2ea6-29082441d6bb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a9-20f3-92ae-2cbec118cfeb	ProgramDela-read	ProgramDela - branje	f
00030000-55a9-20f3-404d-659ebb6b9e53	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a9-20f3-e600-93ccaf9f0009	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a9-20f3-0198-5ed93d943f17	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a9-20f3-791c-05132e37dca2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a9-20f3-de81-6789d33bbf0d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a9-20f3-6022-58a1f436177e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a9-20f3-6e54-a9f038e96338	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a9-20f3-da38-fd1e5d0ba76e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a9-20f3-a6a7-0c2b9cd0ff94	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a9-20f3-00e1-72c750e53a8a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a9-20f3-a155-2c9d9f960b0c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a9-20f3-5e28-5d1b301a7267	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a9-20f3-1b55-87e46352a497	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a9-20f3-9022-62e6f7e62cad	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a9-20f3-c69d-b1ef97c5c5d2	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a9-20f3-faa9-7654ed3ca54d	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a9-20f3-1f55-3432401239d8	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a9-20f3-ffcb-3206c4602e80	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55a9-20f3-42cc-a4355fb70b93	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55a9-20f3-7d68-4e9ca3b8d50c	Prostor-read	Prostor - branje	f
00030000-55a9-20f3-d40f-229261761daf	Prostor-write	Prostor - spreminjanje	f
00030000-55a9-20f3-ae73-0b5a495ca285	Racun-read	Racun - branje	f
00030000-55a9-20f3-c887-4b7b87b96387	Racun-write	Racun - spreminjanje	f
00030000-55a9-20f3-06cb-3c25ac6211a0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a9-20f3-0b01-36716d5318d0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a9-20f3-320b-8165c06f6015	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a9-20f3-28c6-5784c01b60f3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a9-20f3-ccf9-866abcd5445d	Rekvizit-read	Rekvizit - branje	f
00030000-55a9-20f3-c5f1-29afbd136810	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a9-20f3-3e0c-6a1edbe98c7b	Revizija-read	Revizija - branje	f
00030000-55a9-20f3-a835-0f9f380591fc	Revizija-write	Revizija - spreminjanje	f
00030000-55a9-20f3-b951-122f0cd44974	Rezervacija-read	Rezervacija - branje	f
00030000-55a9-20f3-160a-d1d5796774d6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a9-20f3-bbd7-f4a13b516b21	SedezniRed-read	SedezniRed - branje	f
00030000-55a9-20f3-ae95-72d7f92c8634	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a9-20f3-764c-a5bd0daa9ba3	Sedez-read	Sedez - branje	f
00030000-55a9-20f3-1a62-37ea12fd0c04	Sedez-write	Sedez - spreminjanje	f
00030000-55a9-20f3-5b31-6bd94c229d0d	Sezona-read	Sezona - branje	f
00030000-55a9-20f3-3902-5bcc2d0f7ef2	Sezona-write	Sezona - spreminjanje	f
00030000-55a9-20f3-b46c-b8a67311fbd1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a9-20f3-9261-9489c35a2970	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a9-20f3-48e4-38e040fc0aa9	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a9-20f3-198a-1c5c1a807b9f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a9-20f3-3bb7-2ee5d8ed2035	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a9-20f3-9502-e00a71f8a836	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a9-20f3-2a28-900a734fe087	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a9-20f3-0e43-71d76d831969	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a9-20f3-42ed-f502dea3877c	Telefonska-read	Telefonska - branje	f
00030000-55a9-20f3-0c67-d1361a54de90	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a9-20f3-a9f2-d07619bac3d8	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a9-20f3-2927-c52b3381983e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a9-20f3-ef72-d182cff958ca	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a9-20f3-42b6-e6184eb5293d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a9-20f3-18cd-384b4b868a53	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a9-20f3-ee1e-e568d8ac492d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a9-20f3-296e-4167b8add750	Trr-read	Trr - branje	f
00030000-55a9-20f3-d12b-22d86d6d8b2e	Trr-write	Trr - spreminjanje	f
00030000-55a9-20f3-9cdf-5926efcf441b	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a9-20f3-fe76-d7fed7280295	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a9-20f3-340b-c4265387f352	Vaja-read	Vaja - branje	f
00030000-55a9-20f3-2de2-494c5aeafe3d	Vaja-write	Vaja - spreminjanje	f
00030000-55a9-20f3-fb8a-06cbf23772bf	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a9-20f3-4297-f1b5772a1a98	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a9-20f3-8d01-ee62633c4267	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a9-20f3-14af-ee4f3e93b0c9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a9-20f3-2874-0543bac38c8a	Zasedenost-read	Zasedenost - branje	f
00030000-55a9-20f3-5d71-e483fa61d952	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a9-20f3-aada-31eb93794378	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a9-20f3-d275-b9b27a43ddc9	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a9-20f3-34f3-7843f0acf33e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a9-20f3-aec1-9829f5a5942b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2864 (class 0 OID 10675271)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a9-20f3-bc2c-5d1442a3cb5c	00030000-55a9-20f3-cc88-d1115912ca4d
00020000-55a9-20f3-bd47-e8b8edd845b1	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-03e9-1df58c84b14d
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-c1f6-1f0b8a0d8e2b
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-01ee-abdd03dce202
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-6f22-7f512a2d269d
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-6b96-0bf7d9eaf281
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-9e96-f596c7b6baac
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-d0c4-2faf0460b959
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-1752-45c89c322fe7
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-a72b-858c86c57af1
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-c714-218b5d54bfea
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-b7f1-631c17b2695d
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-6eeb-2e723d24c2b0
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-a14c-48f98e298326
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-fcee-608bebae8a39
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-30f0-5851bfedd9b2
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-31bf-91f88122e1f4
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-ab89-154ee342a29c
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-6ddb-1d49244a2784
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-f78c-3f34d3862d4a
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-e779-bb6660ddeacb
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-a5db-7b6862930e72
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-f90f-690386891cff
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-9d93-c2e443b601a4
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-7f44-18ca06559484
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-4b65-53d9ea8ca7bb
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-ca7c-6922321e536b
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-a07c-6d973dc92994
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-0576-81204e572f14
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-be4f-5b94d2e69439
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-bb9a-77f5a87cf621
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-2ea6-29082441d6bb
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-7d68-4e9ca3b8d50c
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-d40f-229261761daf
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-320b-8165c06f6015
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-28c6-5784c01b60f3
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-ccf9-866abcd5445d
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-c5f1-29afbd136810
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-5b31-6bd94c229d0d
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-3902-5bcc2d0f7ef2
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-ef72-d182cff958ca
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-9cdf-5926efcf441b
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-fe76-d7fed7280295
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-340b-c4265387f352
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-2de2-494c5aeafe3d
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-2874-0543bac38c8a
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-5d71-e483fa61d952
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-aada-31eb93794378
00020000-55a9-20f3-e032-0e0e0890b216	00030000-55a9-20f3-34f3-7843f0acf33e
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-03e9-1df58c84b14d
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-6b96-0bf7d9eaf281
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-9e96-f596c7b6baac
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-6eeb-2e723d24c2b0
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-fcee-608bebae8a39
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-31bf-91f88122e1f4
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-ab89-154ee342a29c
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-6ddb-1d49244a2784
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-f78c-3f34d3862d4a
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-e779-bb6660ddeacb
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-a5db-7b6862930e72
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-f90f-690386891cff
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-7f44-18ca06559484
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-ca7c-6922321e536b
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-a07c-6d973dc92994
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-0576-81204e572f14
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-7d68-4e9ca3b8d50c
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-320b-8165c06f6015
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-ccf9-866abcd5445d
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-5b31-6bd94c229d0d
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-42ed-f502dea3877c
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-0c67-d1361a54de90
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-296e-4167b8add750
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-d12b-22d86d6d8b2e
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-8d01-ee62633c4267
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-14af-ee4f3e93b0c9
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-aada-31eb93794378
00020000-55a9-20f3-1da9-dddbfe221788	00030000-55a9-20f3-34f3-7843f0acf33e
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-03e9-1df58c84b14d
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-01ee-abdd03dce202
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-6b96-0bf7d9eaf281
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-9872-b4a59bbbb52e
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-2716-68fe1f4423e5
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-babb-21e14c45f497
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-9e96-f596c7b6baac
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-c714-218b5d54bfea
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-6eeb-2e723d24c2b0
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-fcee-608bebae8a39
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-31bf-91f88122e1f4
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-6ddb-1d49244a2784
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-f78c-3f34d3862d4a
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-e779-bb6660ddeacb
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-f90f-690386891cff
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-7f44-18ca06559484
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-0576-81204e572f14
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-bb9a-77f5a87cf621
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-7d68-4e9ca3b8d50c
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-320b-8165c06f6015
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-ccf9-866abcd5445d
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-5b31-6bd94c229d0d
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-ef72-d182cff958ca
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-340b-c4265387f352
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-2874-0543bac38c8a
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-aada-31eb93794378
00020000-55a9-20f3-3f80-226a35435309	00030000-55a9-20f3-34f3-7843f0acf33e
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-03e9-1df58c84b14d
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-c1f6-1f0b8a0d8e2b
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-6f22-7f512a2d269d
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-6b96-0bf7d9eaf281
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-9e96-f596c7b6baac
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-6eeb-2e723d24c2b0
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-fcee-608bebae8a39
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-6ddb-1d49244a2784
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-f78c-3f34d3862d4a
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-f90f-690386891cff
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-7f44-18ca06559484
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-0576-81204e572f14
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-7d68-4e9ca3b8d50c
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-320b-8165c06f6015
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-ccf9-866abcd5445d
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-5b31-6bd94c229d0d
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-ef72-d182cff958ca
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-aada-31eb93794378
00020000-55a9-20f3-58c7-f4d8570c546e	00030000-55a9-20f3-34f3-7843f0acf33e
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-03e9-1df58c84b14d
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-6b96-0bf7d9eaf281
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-9e96-f596c7b6baac
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-6eeb-2e723d24c2b0
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-fcee-608bebae8a39
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-6ddb-1d49244a2784
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-f78c-3f34d3862d4a
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-f90f-690386891cff
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-7f44-18ca06559484
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-0576-81204e572f14
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-7d68-4e9ca3b8d50c
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-320b-8165c06f6015
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-ccf9-866abcd5445d
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-5b31-6bd94c229d0d
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-a9f2-d07619bac3d8
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-fae5-0d68ff4b00c1
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-ef72-d182cff958ca
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-aada-31eb93794378
00020000-55a9-20f3-6dc3-6a8c9759ac44	00030000-55a9-20f3-34f3-7843f0acf33e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-41b1-e8d4ff8fe18a
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-cc88-d1115912ca4d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-fae5-0d68ff4b00c1
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-d0c4-2faf0460b959
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-424d-7a523af53796
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c514-bafe858a10dc
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-03e9-1df58c84b14d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c1f6-1f0b8a0d8e2b
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-01ee-abdd03dce202
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6f22-7f512a2d269d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6b96-0bf7d9eaf281
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9872-b4a59bbbb52e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2716-68fe1f4423e5
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-beeb-933b374e5a93
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-babb-21e14c45f497
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-d19a-1e5ec682c991
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9e96-f596c7b6baac
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-1752-45c89c322fe7
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-d943-2fae746f3b64
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a72b-858c86c57af1
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-021d-217b5e4e2cb9
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-98c5-8a3cd522a83f
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b226-e424cea707c9
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6da3-3069ff2aaf22
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c714-218b5d54bfea
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b7f1-631c17b2695d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6eeb-2e723d24c2b0
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a14c-48f98e298326
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-fcee-608bebae8a39
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-30f0-5851bfedd9b2
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-31bf-91f88122e1f4
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ab89-154ee342a29c
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2548-034e75ae902e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ff00-f9ed1db095cb
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a536-29d86afaf606
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b8cb-548575e1362e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6ddb-1d49244a2784
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c016-70444ad76c9d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-f78c-3f34d3862d4a
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ef34-c8a7ce6504a1
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-e779-bb6660ddeacb
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a5db-7b6862930e72
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9238-918e4320c997
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c210-03b5bc2d7efc
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a0e5-2b76cd351efb
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c92a-ae5acc935954
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a405-83150adaeca8
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b6ef-15bdd867a78a
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-f90f-690386891cff
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9d93-c2e443b601a4
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-7f44-18ca06559484
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-4b65-53d9ea8ca7bb
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b3c6-7a3298600598
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-7dce-9a9e8b544551
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ca7c-6922321e536b
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a07c-6d973dc92994
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-0576-81204e572f14
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-be4f-5b94d2e69439
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-fa68-9215ace8e045
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ea19-a8cbf4c85bd1
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-dea7-f841d404dbfd
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-cec0-a3c9021c9d37
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-bb9a-77f5a87cf621
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2ea6-29082441d6bb
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-92ae-2cbec118cfeb
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-404d-659ebb6b9e53
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-e600-93ccaf9f0009
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-0198-5ed93d943f17
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-791c-05132e37dca2
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-de81-6789d33bbf0d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6022-58a1f436177e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-6e54-a9f038e96338
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-da38-fd1e5d0ba76e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a6a7-0c2b9cd0ff94
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-00e1-72c750e53a8a
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a155-2c9d9f960b0c
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-5e28-5d1b301a7267
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-1b55-87e46352a497
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9022-62e6f7e62cad
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c69d-b1ef97c5c5d2
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-faa9-7654ed3ca54d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-1f55-3432401239d8
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ffcb-3206c4602e80
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-42cc-a4355fb70b93
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-7d68-4e9ca3b8d50c
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-d40f-229261761daf
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ae73-0b5a495ca285
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c887-4b7b87b96387
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-06cb-3c25ac6211a0
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-0b01-36716d5318d0
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-320b-8165c06f6015
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-28c6-5784c01b60f3
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ccf9-866abcd5445d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-c5f1-29afbd136810
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-3e0c-6a1edbe98c7b
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a835-0f9f380591fc
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b951-122f0cd44974
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-160a-d1d5796774d6
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-bbd7-f4a13b516b21
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ae95-72d7f92c8634
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-764c-a5bd0daa9ba3
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-1a62-37ea12fd0c04
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-5b31-6bd94c229d0d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-3902-5bcc2d0f7ef2
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-b46c-b8a67311fbd1
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9261-9489c35a2970
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-48e4-38e040fc0aa9
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-198a-1c5c1a807b9f
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-3bb7-2ee5d8ed2035
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9502-e00a71f8a836
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2a28-900a734fe087
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-0e43-71d76d831969
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-42ed-f502dea3877c
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-0c67-d1361a54de90
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-a9f2-d07619bac3d8
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2927-c52b3381983e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ef72-d182cff958ca
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-42b6-e6184eb5293d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-18cd-384b4b868a53
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-ee1e-e568d8ac492d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-296e-4167b8add750
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-d12b-22d86d6d8b2e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-9cdf-5926efcf441b
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-fe76-d7fed7280295
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-340b-c4265387f352
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2de2-494c5aeafe3d
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-fb8a-06cbf23772bf
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-4297-f1b5772a1a98
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-8d01-ee62633c4267
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-14af-ee4f3e93b0c9
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-2874-0543bac38c8a
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-5d71-e483fa61d952
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-aada-31eb93794378
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-d275-b9b27a43ddc9
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-34f3-7843f0acf33e
00020000-55a9-20f5-2c08-adb797114dca	00030000-55a9-20f3-aec1-9829f5a5942b
\.


--
-- TOC entry 2892 (class 0 OID 10675566)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 10675597)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 10675711)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55a9-20f5-69fd-276249fed720	00090000-55a9-20f5-1f13-2884ea51e4d7	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55a9-20f5-095c-05de72e275f4	00090000-55a9-20f5-0ad0-898eee9d5f2e	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55a9-20f5-9182-bb7de4858567	00090000-55a9-20f5-4a1e-1836e1faf692	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2869 (class 0 OID 10675331)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a9-20f5-441d-f57f00478e58	00040000-55a9-20f3-2267-8c0f3aa33982	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-df77-5353e01f87b6	00040000-55a9-20f3-2267-8c0f3aa33982	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a9-20f5-99be-946a1f30aa26	00040000-55a9-20f3-2267-8c0f3aa33982	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-6ffd-3902feb02505	00040000-55a9-20f3-2267-8c0f3aa33982	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-8ddd-5547c9705447	00040000-55a9-20f3-2267-8c0f3aa33982	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-cb8e-3c6c369949fc	00040000-55a9-20f3-f546-6fd3a74e4604	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-dea3-1e533719455b	00040000-55a9-20f3-5111-c936675f4abb	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-9a4b-748a646eddcc	00040000-55a9-20f3-632c-381dc5507794	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a9-20f5-28d1-a194e4cb6ab4	00040000-55a9-20f3-2267-8c0f3aa33982	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2871 (class 0 OID 10675366)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a9-20f3-0d53-d46bf29d2d2a	8341	Adlešiči
00050000-55a9-20f3-f90e-a83b43b1c104	5270	Ajdovščina
00050000-55a9-20f3-235f-2714523015a5	6280	Ankaran/Ancarano
00050000-55a9-20f3-eb3c-a8add11ef5e8	9253	Apače
00050000-55a9-20f3-9a46-200d9dd4c580	8253	Artiče
00050000-55a9-20f3-3a7b-be2bf8a78b66	4275	Begunje na Gorenjskem
00050000-55a9-20f3-b163-357b444dd2df	1382	Begunje pri Cerknici
00050000-55a9-20f3-838a-52cca5f011e1	9231	Beltinci
00050000-55a9-20f3-b7c6-db78100814d6	2234	Benedikt
00050000-55a9-20f3-8517-b6d4647ec4ac	2345	Bistrica ob Dravi
00050000-55a9-20f3-6105-4cd652668421	3256	Bistrica ob Sotli
00050000-55a9-20f3-c078-80215bc5c521	8259	Bizeljsko
00050000-55a9-20f3-89ab-06b3747445f8	1223	Blagovica
00050000-55a9-20f3-9426-db8a59ed577d	8283	Blanca
00050000-55a9-20f3-f46b-4e6184c36a28	4260	Bled
00050000-55a9-20f3-841c-0de3bd06d9c7	4273	Blejska Dobrava
00050000-55a9-20f3-3eb3-08aad31fb6e9	9265	Bodonci
00050000-55a9-20f3-0469-8b3b9d1cde36	9222	Bogojina
00050000-55a9-20f3-8893-1398bd42a4ea	4263	Bohinjska Bela
00050000-55a9-20f3-b668-8c6a2ff824be	4264	Bohinjska Bistrica
00050000-55a9-20f3-4139-8af062ec7eca	4265	Bohinjsko jezero
00050000-55a9-20f3-422d-332193c69f0f	1353	Borovnica
00050000-55a9-20f3-1f52-3211002df113	8294	Boštanj
00050000-55a9-20f3-0cd2-64aa1f9bba12	5230	Bovec
00050000-55a9-20f3-4270-18bae3ba2715	5295	Branik
00050000-55a9-20f3-c3a8-354adbf7af25	3314	Braslovče
00050000-55a9-20f3-ead7-4fae4b272e96	5223	Breginj
00050000-55a9-20f3-96c3-e6d9ba59c852	8280	Brestanica
00050000-55a9-20f3-e736-0987e21328cc	2354	Bresternica
00050000-55a9-20f3-939d-d76efa9866b4	4243	Brezje
00050000-55a9-20f3-1bf2-935f20d67c95	1351	Brezovica pri Ljubljani
00050000-55a9-20f3-00bf-f82bcfef5a21	8250	Brežice
00050000-55a9-20f3-f700-59604f6b0d96	4210	Brnik - Aerodrom
00050000-55a9-20f3-e29d-fee8985c4f9f	8321	Brusnice
00050000-55a9-20f3-80ec-83eea4c6410e	3255	Buče
00050000-55a9-20f3-de02-be600a492989	8276	Bučka 
00050000-55a9-20f3-351c-cd7835144b42	9261	Cankova
00050000-55a9-20f3-c34a-6f67244957b9	3000	Celje 
00050000-55a9-20f3-171b-1e0d21ddf907	3001	Celje - poštni predali
00050000-55a9-20f3-bbec-5b4cbd6a2908	4207	Cerklje na Gorenjskem
00050000-55a9-20f3-19af-da4f1ed9a56b	8263	Cerklje ob Krki
00050000-55a9-20f3-8524-8ba404bbf220	1380	Cerknica
00050000-55a9-20f3-712e-9151ee54bb22	5282	Cerkno
00050000-55a9-20f3-caf8-8912bed72ee0	2236	Cerkvenjak
00050000-55a9-20f3-0caa-76bb484f1a91	2215	Ceršak
00050000-55a9-20f3-35e8-28ce140f48c7	2326	Cirkovce
00050000-55a9-20f3-6f52-50ccaedc6e38	2282	Cirkulane
00050000-55a9-20f3-892f-30f09cf75779	5273	Col
00050000-55a9-20f3-1dad-9ca7d1d31d63	8251	Čatež ob Savi
00050000-55a9-20f3-2727-3c9778433712	1413	Čemšenik
00050000-55a9-20f3-9e78-da9b5771ab85	5253	Čepovan
00050000-55a9-20f3-f72f-492e31c70ccf	9232	Črenšovci
00050000-55a9-20f3-a028-e8466d2e7178	2393	Črna na Koroškem
00050000-55a9-20f3-5cd1-e0fca261af0d	6275	Črni Kal
00050000-55a9-20f3-8f41-e51c40a8e87f	5274	Črni Vrh nad Idrijo
00050000-55a9-20f3-2481-0d66e4cf1ce3	5262	Črniče
00050000-55a9-20f3-6e07-3846fa4090a5	8340	Črnomelj
00050000-55a9-20f3-c2ab-70be3596a583	6271	Dekani
00050000-55a9-20f3-c243-35359465f787	5210	Deskle
00050000-55a9-20f3-7a5c-f8f0a9769513	2253	Destrnik
00050000-55a9-20f3-cbf9-95cce507490a	6215	Divača
00050000-55a9-20f3-fb07-1888d873f4fa	1233	Dob
00050000-55a9-20f3-07ca-64c3acd92b08	3224	Dobje pri Planini
00050000-55a9-20f3-38fa-eef280afcd63	8257	Dobova
00050000-55a9-20f3-d8f4-e5afc32cb1c1	1423	Dobovec
00050000-55a9-20f3-1f47-93c43275bf7c	5263	Dobravlje
00050000-55a9-20f3-4eb8-4990456eb4c5	3204	Dobrna
00050000-55a9-20f3-10b1-0e4f9e177ea1	8211	Dobrnič
00050000-55a9-20f3-012c-90440ee1b3ee	1356	Dobrova
00050000-55a9-20f3-a43a-164dc30f59b1	9223	Dobrovnik/Dobronak 
00050000-55a9-20f3-aad9-2ecf4ba553ea	5212	Dobrovo v Brdih
00050000-55a9-20f3-820e-debd4c5cc4b1	1431	Dol pri Hrastniku
00050000-55a9-20f3-b235-e0e1b3563747	1262	Dol pri Ljubljani
00050000-55a9-20f3-42d3-5235fc77dbef	1273	Dole pri Litiji
00050000-55a9-20f3-e093-9e78f343257b	1331	Dolenja vas
00050000-55a9-20f3-d05c-71cacb7a468c	8350	Dolenjske Toplice
00050000-55a9-20f3-47b7-efa96879666e	1230	Domžale
00050000-55a9-20f3-2736-42d3822a26a9	2252	Dornava
00050000-55a9-20f3-993d-5cb86783669f	5294	Dornberk
00050000-55a9-20f3-438b-0e61794873ef	1319	Draga
00050000-55a9-20f3-92b5-25a0920664dd	8343	Dragatuš
00050000-55a9-20f3-4e49-a95e88166ffb	3222	Dramlje
00050000-55a9-20f3-6964-e245b27cb544	2370	Dravograd
00050000-55a9-20f3-05c9-93c76a09790d	4203	Duplje
00050000-55a9-20f3-9f80-94029b0ceb55	6221	Dutovlje
00050000-55a9-20f3-dd84-ae12e4b7c1cd	8361	Dvor
00050000-55a9-20f3-41ea-5a2f9c4d69ef	2343	Fala
00050000-55a9-20f3-6d7a-6190d4f3ece3	9208	Fokovci
00050000-55a9-20f3-23ff-4a31418f998a	2313	Fram
00050000-55a9-20f3-0005-27ce20f72f4b	3213	Frankolovo
00050000-55a9-20f3-f9a1-e4f46d5a066b	1274	Gabrovka
00050000-55a9-20f3-e799-e15bc3f02485	8254	Globoko
00050000-55a9-20f3-62f2-3ca2fe905c7d	5275	Godovič
00050000-55a9-20f3-e894-855e9ca314a7	4204	Golnik
00050000-55a9-20f3-2bcf-088173217785	3303	Gomilsko
00050000-55a9-20f3-fc56-bd6cf62420ed	4224	Gorenja vas
00050000-55a9-20f3-a511-b7c78d5002da	3263	Gorica pri Slivnici
00050000-55a9-20f3-2ac4-2be579081095	2272	Gorišnica
00050000-55a9-20f3-effd-5a5b12d061ea	9250	Gornja Radgona
00050000-55a9-20f3-70ff-00b6edc65a46	3342	Gornji Grad
00050000-55a9-20f3-b37e-995531afa95f	4282	Gozd Martuljek
00050000-55a9-20f3-0056-11b549b84d1f	6272	Gračišče
00050000-55a9-20f3-2a8c-4990bd198622	9264	Grad
00050000-55a9-20f3-2c40-ae5baf2ec4df	8332	Gradac
00050000-55a9-20f3-2d5f-7bf849c5ead1	1384	Grahovo
00050000-55a9-20f3-a4bf-fe6a83c5d3c6	5242	Grahovo ob Bači
00050000-55a9-20f3-22f3-d5f147cc31e9	5251	Grgar
00050000-55a9-20f3-a34a-6bf34067f2df	3302	Griže
00050000-55a9-20f3-def4-589ffa07e480	3231	Grobelno
00050000-55a9-20f3-63f4-34a104c04763	1290	Grosuplje
00050000-55a9-20f3-f0d3-a96fed78bdb4	2288	Hajdina
00050000-55a9-20f3-8099-b652ba3eef1c	8362	Hinje
00050000-55a9-20f3-0206-d2e52011bc45	2311	Hoče
00050000-55a9-20f3-7393-49ec5134d0a0	9205	Hodoš/Hodos
00050000-55a9-20f3-f6dd-08cee992e8fb	1354	Horjul
00050000-55a9-20f3-e9d3-86358b13ca90	1372	Hotedršica
00050000-55a9-20f3-6016-b3973642d27b	1430	Hrastnik
00050000-55a9-20f3-d0d6-c5fabf71640c	6225	Hruševje
00050000-55a9-20f3-c101-e313407af99d	4276	Hrušica
00050000-55a9-20f3-45a7-edbaed401477	5280	Idrija
00050000-55a9-20f3-f393-19f89d2d0e88	1292	Ig
00050000-55a9-20f3-5e79-0d4a95fd6960	6250	Ilirska Bistrica
00050000-55a9-20f3-67b9-e0e73210bc2f	6251	Ilirska Bistrica-Trnovo
00050000-55a9-20f3-8b3d-517cb20f88c8	1295	Ivančna Gorica
00050000-55a9-20f3-91f7-ee3741c21e97	2259	Ivanjkovci
00050000-55a9-20f3-d3e3-cc01a09b4e82	1411	Izlake
00050000-55a9-20f3-416c-07bba113962a	6310	Izola/Isola
00050000-55a9-20f3-f339-7619780c3a34	2222	Jakobski Dol
00050000-55a9-20f3-530f-e3058843f6f5	2221	Jarenina
00050000-55a9-20f3-7a79-1f26c7e54476	6254	Jelšane
00050000-55a9-20f3-8109-d7dfc6386510	4270	Jesenice
00050000-55a9-20f3-6e0c-40a3e7a113e5	8261	Jesenice na Dolenjskem
00050000-55a9-20f3-4dcd-1a3252e37773	3273	Jurklošter
00050000-55a9-20f3-30f5-dc1371f71ba6	2223	Jurovski Dol
00050000-55a9-20f3-e1c9-05b8ec261d9f	2256	Juršinci
00050000-55a9-20f3-ad43-a8fc36ef9730	5214	Kal nad Kanalom
00050000-55a9-20f3-a9c2-aa9ebb68dbae	3233	Kalobje
00050000-55a9-20f3-e65f-85f61996d9f6	4246	Kamna Gorica
00050000-55a9-20f3-03e9-48d6be8261de	2351	Kamnica
00050000-55a9-20f3-365c-0c596cf657bd	1241	Kamnik
00050000-55a9-20f3-7bc5-8269a935bcfa	5213	Kanal
00050000-55a9-20f3-b134-2ddc9b9280a4	8258	Kapele
00050000-55a9-20f3-138a-b79004fda36f	2362	Kapla
00050000-55a9-20f3-657f-ea229f739424	2325	Kidričevo
00050000-55a9-20f3-581b-c38ddd3bf3f4	1412	Kisovec
00050000-55a9-20f3-d518-d5b65aaaca37	6253	Knežak
00050000-55a9-20f3-d623-b01e9f9f700c	5222	Kobarid
00050000-55a9-20f3-7b3b-72e55a0a178d	9227	Kobilje
00050000-55a9-20f3-d87a-e6acb78eac9d	1330	Kočevje
00050000-55a9-20f3-e960-5c268f6d1945	1338	Kočevska Reka
00050000-55a9-20f3-3e5e-048cbaf9e067	2276	Kog
00050000-55a9-20f3-5c20-2c9a94b98ddf	5211	Kojsko
00050000-55a9-20f3-14ed-583f70f01494	6223	Komen
00050000-55a9-20f3-8071-98cd9adb6c00	1218	Komenda
00050000-55a9-20f3-7bc7-530367c81bf0	6000	Koper/Capodistria 
00050000-55a9-20f3-eba1-bcad278f7a3d	6001	Koper/Capodistria - poštni predali
00050000-55a9-20f3-117f-2f122209c0b2	8282	Koprivnica
00050000-55a9-20f3-beb6-19e4fc256c4d	5296	Kostanjevica na Krasu
00050000-55a9-20f3-084e-0f47e1ea873f	8311	Kostanjevica na Krki
00050000-55a9-20f3-a342-3faf3c1dd90e	1336	Kostel
00050000-55a9-20f3-f644-607d9fbe62a0	6256	Košana
00050000-55a9-20f3-68ee-39f3b261443f	2394	Kotlje
00050000-55a9-20f3-48c9-e329bc586f8c	6240	Kozina
00050000-55a9-20f3-7176-7082cbaa73dc	3260	Kozje
00050000-55a9-20f3-70dc-770c2b6cc33b	4000	Kranj 
00050000-55a9-20f3-fc64-18c8c77eda78	4001	Kranj - poštni predali
00050000-55a9-20f3-5c24-5951aff1d3f1	4280	Kranjska Gora
00050000-55a9-20f3-332f-6e28dbcfecd0	1281	Kresnice
00050000-55a9-20f3-0fda-2575bb71163e	4294	Križe
00050000-55a9-20f3-c387-b6e199667977	9206	Križevci
00050000-55a9-20f3-dd67-bd8b45c4fc4b	9242	Križevci pri Ljutomeru
00050000-55a9-20f3-9b29-8fcafcf91b14	1301	Krka
00050000-55a9-20f3-1375-5fc6b9eac709	8296	Krmelj
00050000-55a9-20f3-dd5b-68342e222c08	4245	Kropa
00050000-55a9-20f3-51c9-507abf929893	8262	Krška vas
00050000-55a9-20f3-27fa-1148fcb30844	8270	Krško
00050000-55a9-20f3-33a1-8b90b960d7d7	9263	Kuzma
00050000-55a9-20f3-5e79-ef9c653ee133	2318	Laporje
00050000-55a9-20f3-0a09-556d08d2183d	3270	Laško
00050000-55a9-20f3-6119-240f99c61d47	1219	Laze v Tuhinju
00050000-55a9-20f3-1806-3346fd3cd0fc	2230	Lenart v Slovenskih goricah
00050000-55a9-20f3-2354-a67524d97f30	9220	Lendava/Lendva
00050000-55a9-20f3-735c-2881497e0289	4248	Lesce
00050000-55a9-20f3-abe6-40f4f844e8c3	3261	Lesično
00050000-55a9-20f3-3ed5-4a1c1a65147e	8273	Leskovec pri Krškem
00050000-55a9-20f3-8e7c-805be7814339	2372	Libeliče
00050000-55a9-20f3-3164-798b804a163e	2341	Limbuš
00050000-55a9-20f3-1e46-fd138a530cf4	1270	Litija
00050000-55a9-20f3-28aa-0c9ed4d29d08	3202	Ljubečna
00050000-55a9-20f3-9935-dca28d518540	1000	Ljubljana 
00050000-55a9-20f3-8186-094d1a79405b	1001	Ljubljana - poštni predali
00050000-55a9-20f3-f36a-c0a03faa5272	1231	Ljubljana - Črnuče
00050000-55a9-20f3-ad44-6649d96e308c	1261	Ljubljana - Dobrunje
00050000-55a9-20f3-1895-fdb049a26640	1260	Ljubljana - Polje
00050000-55a9-20f3-1f92-1f44e338808d	1210	Ljubljana - Šentvid
00050000-55a9-20f3-a949-b712f28ba9e6	1211	Ljubljana - Šmartno
00050000-55a9-20f3-99e5-f606783721fc	3333	Ljubno ob Savinji
00050000-55a9-20f3-70fc-849d1f16a0ea	9240	Ljutomer
00050000-55a9-20f3-45bd-99e2abbbbb19	3215	Loče
00050000-55a9-20f3-f410-e538175b21ab	5231	Log pod Mangartom
00050000-55a9-20f3-cce4-27f378bb0ac5	1358	Log pri Brezovici
00050000-55a9-20f3-0451-765f4f9cc568	1370	Logatec
00050000-55a9-20f3-0b35-4514efbecc13	1371	Logatec
00050000-55a9-20f3-a729-b6e5e58c0afb	1434	Loka pri Zidanem Mostu
00050000-55a9-20f3-4d31-3b5b8fd9bfca	3223	Loka pri Žusmu
00050000-55a9-20f3-dcac-83acb4350144	6219	Lokev
00050000-55a9-20f3-d1de-4b980c45fbf4	1318	Loški Potok
00050000-55a9-20f3-2834-3e489c07e9ad	2324	Lovrenc na Dravskem polju
00050000-55a9-20f3-8505-d5ddaa6f439f	2344	Lovrenc na Pohorju
00050000-55a9-20f3-4a73-f40e6bb236c9	3334	Luče
00050000-55a9-20f3-6ec2-b99fb20bf68f	1225	Lukovica
00050000-55a9-20f3-776b-31bc5afb5da6	9202	Mačkovci
00050000-55a9-20f3-cae8-f329a47fe1ed	2322	Majšperk
00050000-55a9-20f3-2215-80be3f52b096	2321	Makole
00050000-55a9-20f3-a71f-521ae5ea2e75	9243	Mala Nedelja
00050000-55a9-20f3-4636-f7cc6a427293	2229	Malečnik
00050000-55a9-20f3-3c76-e99cd0db341e	6273	Marezige
00050000-55a9-20f3-7b55-29a9543fa8f3	2000	Maribor 
00050000-55a9-20f3-4082-e404c9877a85	2001	Maribor - poštni predali
00050000-55a9-20f3-bb4d-6ea72142b802	2206	Marjeta na Dravskem polju
00050000-55a9-20f3-3f22-d93e2b3c2a41	2281	Markovci
00050000-55a9-20f3-6837-785660bc8f9f	9221	Martjanci
00050000-55a9-20f3-c818-ac5cba5bd393	6242	Materija
00050000-55a9-20f3-b790-f19d8b02bcd0	4211	Mavčiče
00050000-55a9-20f3-e16b-bfe65e7e6295	1215	Medvode
00050000-55a9-20f3-95ed-e51e3dd9282b	1234	Mengeš
00050000-55a9-20f3-9691-45e36f973c3e	8330	Metlika
00050000-55a9-20f3-1352-46c269ab1731	2392	Mežica
00050000-55a9-20f3-ebcb-288402a44b0d	2204	Miklavž na Dravskem polju
00050000-55a9-20f3-b3f8-0a87839eab3d	2275	Miklavž pri Ormožu
00050000-55a9-20f3-4019-4b13ce451128	5291	Miren
00050000-55a9-20f3-0cbd-897f171579fa	8233	Mirna
00050000-55a9-20f3-bede-12b4c325c90e	8216	Mirna Peč
00050000-55a9-20f3-8691-17a84cd574d2	2382	Mislinja
00050000-55a9-20f3-2f8f-ee190c13fa58	4281	Mojstrana
00050000-55a9-20f3-c598-fb62c6a2038d	8230	Mokronog
00050000-55a9-20f3-9f1d-657096457d18	1251	Moravče
00050000-55a9-20f3-0174-2eed06aa7879	9226	Moravske Toplice
00050000-55a9-20f3-a604-c6537f17009e	5216	Most na Soči
00050000-55a9-20f3-9ac4-3f32204486e3	1221	Motnik
00050000-55a9-20f3-2c79-f3482b029f79	3330	Mozirje
00050000-55a9-20f3-ef9d-fed010be2663	9000	Murska Sobota 
00050000-55a9-20f3-c8ab-7605d926e59d	9001	Murska Sobota - poštni predali
00050000-55a9-20f3-576a-c974d81b94d4	2366	Muta
00050000-55a9-20f3-f22a-c49f31dc363a	4202	Naklo
00050000-55a9-20f3-3ba6-65bb8859655a	3331	Nazarje
00050000-55a9-20f3-c725-9e2bab9d69bc	1357	Notranje Gorice
00050000-55a9-20f3-8e13-3fc7c6d8fa86	3203	Nova Cerkev
00050000-55a9-20f3-09e3-b12d21b885a2	5000	Nova Gorica 
00050000-55a9-20f3-2c07-9a725441313e	5001	Nova Gorica - poštni predali
00050000-55a9-20f3-4325-65c3def965af	1385	Nova vas
00050000-55a9-20f3-1aa6-c83df31df57c	8000	Novo mesto
00050000-55a9-20f3-d330-613c75934a48	8001	Novo mesto - poštni predali
00050000-55a9-20f3-a646-1c6f0b4d05fe	6243	Obrov
00050000-55a9-20f3-8486-86a8c8f25bb4	9233	Odranci
00050000-55a9-20f3-7fc0-74b5dc866087	2317	Oplotnica
00050000-55a9-20f3-4687-90dbe8aa8dcc	2312	Orehova vas
00050000-55a9-20f3-068d-b8a2397d813b	2270	Ormož
00050000-55a9-20f3-3b73-39c55c466c81	1316	Ortnek
00050000-55a9-20f3-03d1-54d86aeaccda	1337	Osilnica
00050000-55a9-20f3-a1c8-df2787c22577	8222	Otočec
00050000-55a9-20f3-e1a9-f490bf021ab3	2361	Ožbalt
00050000-55a9-20f3-9070-590502b0c421	2231	Pernica
00050000-55a9-20f3-ae35-8495f564f9e0	2211	Pesnica pri Mariboru
00050000-55a9-20f3-f56e-9202cf0ad467	9203	Petrovci
00050000-55a9-20f3-05f4-36e71218014d	3301	Petrovče
00050000-55a9-20f3-b883-42922366196b	6330	Piran/Pirano
00050000-55a9-20f4-7e20-5bcc5f722bdc	8255	Pišece
00050000-55a9-20f4-8187-704833b8f9d7	6257	Pivka
00050000-55a9-20f4-1d9d-090b7ea93e62	6232	Planina
00050000-55a9-20f4-c4e1-d655ceabbc1e	3225	Planina pri Sevnici
00050000-55a9-20f4-4b2b-1ca644a02c05	6276	Pobegi
00050000-55a9-20f4-803a-24b688959e10	8312	Podbočje
00050000-55a9-20f4-cb27-e432cc9352dd	5243	Podbrdo
00050000-55a9-20f4-9fe5-0e155eb5ce11	3254	Podčetrtek
00050000-55a9-20f4-10c9-50b7318b5c54	2273	Podgorci
00050000-55a9-20f4-d3e7-3efebd9942c5	6216	Podgorje
00050000-55a9-20f4-a7b7-1afb8e7fb66e	2381	Podgorje pri Slovenj Gradcu
00050000-55a9-20f4-7dff-7d96a138cff6	6244	Podgrad
00050000-55a9-20f4-9102-e3ce471b82f5	1414	Podkum
00050000-55a9-20f4-ee2a-4396ab7ab56c	2286	Podlehnik
00050000-55a9-20f4-cede-4290e96230d8	5272	Podnanos
00050000-55a9-20f4-8864-fa2f1e3926d6	4244	Podnart
00050000-55a9-20f4-1edb-f2aad268824c	3241	Podplat
00050000-55a9-20f4-6247-e929b13143a9	3257	Podsreda
00050000-55a9-20f4-f842-8b5987ae0ad7	2363	Podvelka
00050000-55a9-20f4-32cf-23bb8c83c8b3	2208	Pohorje
00050000-55a9-20f4-6978-5233e196ece5	2257	Polenšak
00050000-55a9-20f4-df33-383f8f3275df	1355	Polhov Gradec
00050000-55a9-20f4-ec40-3fe55357ece0	4223	Poljane nad Škofjo Loko
00050000-55a9-20f4-d7c3-a1544d841156	2319	Poljčane
00050000-55a9-20f4-a5c9-ea4c566ad18a	1272	Polšnik
00050000-55a9-20f4-d763-e96365904fb0	3313	Polzela
00050000-55a9-20f4-a4e1-755048bd013e	3232	Ponikva
00050000-55a9-20f4-1ecc-6d6545fcbeb0	6320	Portorož/Portorose
00050000-55a9-20f4-c9c9-d5805d3cddb3	6230	Postojna
00050000-55a9-20f4-5b38-07147216199e	2331	Pragersko
00050000-55a9-20f4-e903-d8e1ecfc7362	3312	Prebold
00050000-55a9-20f4-b7c1-9afdacfc36b0	4205	Preddvor
00050000-55a9-20f4-8973-4c6817c19521	6255	Prem
00050000-55a9-20f4-f46c-d0fa488b0d95	1352	Preserje
00050000-55a9-20f4-5024-5a59ec4578ea	6258	Prestranek
00050000-55a9-20f4-7978-9a751608e363	2391	Prevalje
00050000-55a9-20f4-ac2d-c382a30ecc67	3262	Prevorje
00050000-55a9-20f4-3597-ab2871cf383e	1276	Primskovo 
00050000-55a9-20f4-4d2c-3917b4a9d8e0	3253	Pristava pri Mestinju
00050000-55a9-20f4-ca22-c9e5cb9f56cf	9207	Prosenjakovci/Partosfalva
00050000-55a9-20f4-ce82-e357eb81b83b	5297	Prvačina
00050000-55a9-20f4-8d3e-dda36d95268a	2250	Ptuj
00050000-55a9-20f4-da1d-3ec24bb5f640	2323	Ptujska Gora
00050000-55a9-20f4-e7fd-46c5985cc731	9201	Puconci
00050000-55a9-20f4-1212-da5e92df63b2	2327	Rače
00050000-55a9-20f4-ff0a-1caf7ad236e8	1433	Radeče
00050000-55a9-20f4-9b44-0740cb7da262	9252	Radenci
00050000-55a9-20f4-1b51-06f7ed5d55e4	2360	Radlje ob Dravi
00050000-55a9-20f4-4ff4-125a2a9bb36f	1235	Radomlje
00050000-55a9-20f4-500d-27089f4f6b4f	4240	Radovljica
00050000-55a9-20f4-f49e-ae3819606759	8274	Raka
00050000-55a9-20f4-9c71-a753209c4f5c	1381	Rakek
00050000-55a9-20f4-0cf6-eb7063a377ab	4283	Rateče - Planica
00050000-55a9-20f4-d3bd-c20498916b11	2390	Ravne na Koroškem
00050000-55a9-20f4-dd54-d49564f84f2c	9246	Razkrižje
00050000-55a9-20f4-4e83-3883156496a7	3332	Rečica ob Savinji
00050000-55a9-20f4-7145-fdff0f65be35	5292	Renče
00050000-55a9-20f4-e572-b9948e788863	1310	Ribnica
00050000-55a9-20f4-d995-6d0ec97b4264	2364	Ribnica na Pohorju
00050000-55a9-20f4-ac85-21d65713543d	3272	Rimske Toplice
00050000-55a9-20f4-582e-a2720d718f21	1314	Rob
00050000-55a9-20f4-0971-08c28b6feb92	5215	Ročinj
00050000-55a9-20f4-af8f-6bc15ddee4ab	3250	Rogaška Slatina
00050000-55a9-20f4-77e6-6bb085d9796c	9262	Rogašovci
00050000-55a9-20f4-4c50-9556d78330ef	3252	Rogatec
00050000-55a9-20f4-122e-d9facb6c9a19	1373	Rovte
00050000-55a9-20f4-1fd7-6f4f525a8b48	2342	Ruše
00050000-55a9-20f4-2201-542dacba715d	1282	Sava
00050000-55a9-20f4-892d-25fc5ab3e7e7	6333	Sečovlje/Sicciole
00050000-55a9-20f4-fb48-e545ce8d9705	4227	Selca
00050000-55a9-20f4-d619-5210ab2122d9	2352	Selnica ob Dravi
00050000-55a9-20f4-fcb3-2cb6ed390e5d	8333	Semič
00050000-55a9-20f4-071b-273387673aba	8281	Senovo
00050000-55a9-20f4-25b9-f1f1d8c14644	6224	Senožeče
00050000-55a9-20f4-54aa-ff3cd7139b43	8290	Sevnica
00050000-55a9-20f4-f3b0-03233b253952	6210	Sežana
00050000-55a9-20f4-3715-d9537548cf99	2214	Sladki Vrh
00050000-55a9-20f4-e961-2b9eb84a4cac	5283	Slap ob Idrijci
00050000-55a9-20f4-f657-c93be2029211	2380	Slovenj Gradec
00050000-55a9-20f4-7c2c-392ab3184693	2310	Slovenska Bistrica
00050000-55a9-20f4-0a59-daf9f7a0787d	3210	Slovenske Konjice
00050000-55a9-20f4-b6d1-c1ab5de8424c	1216	Smlednik
00050000-55a9-20f4-e693-a26e9cb2f255	5232	Soča
00050000-55a9-20f4-8d87-72fbbd10fe62	1317	Sodražica
00050000-55a9-20f4-c6f7-8470abd5d25c	3335	Solčava
00050000-55a9-20f4-f707-964d59463835	5250	Solkan
00050000-55a9-20f4-ec78-bf680e8e3fd6	4229	Sorica
00050000-55a9-20f4-d22f-5847c0e6960a	4225	Sovodenj
00050000-55a9-20f4-fad7-007c05163b0f	5281	Spodnja Idrija
00050000-55a9-20f4-ea02-286d2a8e4bc7	2241	Spodnji Duplek
00050000-55a9-20f4-8b18-884acdc25bcf	9245	Spodnji Ivanjci
00050000-55a9-20f4-ccf5-5c7e1653c853	2277	Središče ob Dravi
00050000-55a9-20f4-2973-411f5dde4211	4267	Srednja vas v Bohinju
00050000-55a9-20f4-938f-09554d49a469	8256	Sromlje 
00050000-55a9-20f4-e6e6-29dc1253f60a	5224	Srpenica
00050000-55a9-20f4-53b7-3373c040f527	1242	Stahovica
00050000-55a9-20f4-e84c-4f013152429e	1332	Stara Cerkev
00050000-55a9-20f4-0795-ce606510f233	8342	Stari trg ob Kolpi
00050000-55a9-20f4-62a5-3221b4794c3e	1386	Stari trg pri Ložu
00050000-55a9-20f4-eba3-f50443d9bf05	2205	Starše
00050000-55a9-20f4-f4eb-e03bd4fdd350	2289	Stoperce
00050000-55a9-20f4-3b4e-ab32c25d9efd	8322	Stopiče
00050000-55a9-20f4-d20b-296b26893b5b	3206	Stranice
00050000-55a9-20f4-ac66-71eb4dc18afc	8351	Straža
00050000-55a9-20f4-04b7-ffa8eedf4d64	1313	Struge
00050000-55a9-20f4-c343-de2d938d29ec	8293	Studenec
00050000-55a9-20f4-5592-e33e92680af5	8331	Suhor
00050000-55a9-20f4-369a-a6a779a2b482	2233	Sv. Ana v Slovenskih goricah
00050000-55a9-20f4-1bc0-52ed9372bb7e	2235	Sv. Trojica v Slovenskih goricah
00050000-55a9-20f4-3844-12f20286ca29	2353	Sveti Duh na Ostrem Vrhu
00050000-55a9-20f4-c9c5-de5b09171cd9	9244	Sveti Jurij ob Ščavnici
00050000-55a9-20f4-6b47-b19556be3cba	3264	Sveti Štefan
00050000-55a9-20f4-1638-3eab7617c052	2258	Sveti Tomaž
00050000-55a9-20f4-c81d-15a597c187d6	9204	Šalovci
00050000-55a9-20f4-53ed-42c3f3b378e5	5261	Šempas
00050000-55a9-20f4-5e0a-5089e2e3394b	5290	Šempeter pri Gorici
00050000-55a9-20f4-c113-b5dc7453820d	3311	Šempeter v Savinjski dolini
00050000-55a9-20f4-15ae-0ded67904717	4208	Šenčur
00050000-55a9-20f4-dacf-96b16fb57b42	2212	Šentilj v Slovenskih goricah
00050000-55a9-20f4-02b6-451c56d548bf	8297	Šentjanž
00050000-55a9-20f4-1e16-55577094dfce	2373	Šentjanž pri Dravogradu
00050000-55a9-20f4-e4d8-26fc9679725e	8310	Šentjernej
00050000-55a9-20f4-222b-3acb8e7d7620	3230	Šentjur
00050000-55a9-20f4-6da9-505244399a12	3271	Šentrupert
00050000-55a9-20f4-8337-1847ec5e7e45	8232	Šentrupert
00050000-55a9-20f4-1e02-75d3e0a3ea2c	1296	Šentvid pri Stični
00050000-55a9-20f4-bfc8-070c5b17bd5c	8275	Škocjan
00050000-55a9-20f4-38c4-01f796a31ba7	6281	Škofije
00050000-55a9-20f4-d341-ac7db86488c2	4220	Škofja Loka
00050000-55a9-20f4-d66d-36486abfb758	3211	Škofja vas
00050000-55a9-20f4-a822-b72ca6eba0b3	1291	Škofljica
00050000-55a9-20f4-a297-fd0fcefeebe4	6274	Šmarje
00050000-55a9-20f4-1184-d631c51d51fa	1293	Šmarje - Sap
00050000-55a9-20f4-ace0-bf7e87cc746c	3240	Šmarje pri Jelšah
00050000-55a9-20f4-51ed-7a5f94baae6f	8220	Šmarješke Toplice
00050000-55a9-20f4-ef4f-009698150b3d	2315	Šmartno na Pohorju
00050000-55a9-20f4-582f-dbb638470cbd	3341	Šmartno ob Dreti
00050000-55a9-20f4-6148-c962b2f70d80	3327	Šmartno ob Paki
00050000-55a9-20f4-e8f2-136f1846009b	1275	Šmartno pri Litiji
00050000-55a9-20f4-1f33-b03c8633c994	2383	Šmartno pri Slovenj Gradcu
00050000-55a9-20f4-9071-e607b0e3948a	3201	Šmartno v Rožni dolini
00050000-55a9-20f4-09e9-ae57762287d4	3325	Šoštanj
00050000-55a9-20f4-4ce2-014fa77b745b	6222	Štanjel
00050000-55a9-20f4-c7b8-12791e7c1e66	3220	Štore
00050000-55a9-20f4-0ea1-18344d49d975	3304	Tabor
00050000-55a9-20f4-5fa1-618aabf32f08	3221	Teharje
00050000-55a9-20f4-4c53-3f5a3f403ba9	9251	Tišina
00050000-55a9-20f4-5892-71828e885330	5220	Tolmin
00050000-55a9-20f4-7b3d-543d43ff3ae6	3326	Topolšica
00050000-55a9-20f4-5a15-751055058137	2371	Trbonje
00050000-55a9-20f4-efbd-56b81a5145d9	1420	Trbovlje
00050000-55a9-20f4-8bbf-b67a47aeb496	8231	Trebelno 
00050000-55a9-20f4-ae3e-ffd3d6bd99cb	8210	Trebnje
00050000-55a9-20f4-0a42-20b55240ca15	5252	Trnovo pri Gorici
00050000-55a9-20f4-1031-52ab28839915	2254	Trnovska vas
00050000-55a9-20f4-efc4-f43e39fba48a	1222	Trojane
00050000-55a9-20f4-c94a-fd4168af748b	1236	Trzin
00050000-55a9-20f4-c69b-85a9cd14f024	4290	Tržič
00050000-55a9-20f4-0513-b63128f9465a	8295	Tržišče
00050000-55a9-20f4-cbef-0034bbfbd4ae	1311	Turjak
00050000-55a9-20f4-842a-b1877b0d970b	9224	Turnišče
00050000-55a9-20f4-1550-d74a104b527c	8323	Uršna sela
00050000-55a9-20f4-9f88-a4bf80e0a07f	1252	Vače
00050000-55a9-20f4-e677-93848fa85198	3320	Velenje 
00050000-55a9-20f4-281d-a96df4786808	3322	Velenje - poštni predali
00050000-55a9-20f4-ef69-f7a843022bda	8212	Velika Loka
00050000-55a9-20f4-1a17-50729b1eeee1	2274	Velika Nedelja
00050000-55a9-20f4-c412-a4d94d3ab05a	9225	Velika Polana
00050000-55a9-20f4-d004-0e8af926a648	1315	Velike Lašče
00050000-55a9-20f4-a835-4bbf84e87e58	8213	Veliki Gaber
00050000-55a9-20f4-4766-606557793565	9241	Veržej
00050000-55a9-20f4-479d-125031b62f92	1312	Videm - Dobrepolje
00050000-55a9-20f4-490d-c3dfacc1f8f3	2284	Videm pri Ptuju
00050000-55a9-20f4-2b20-ff30ed97763b	8344	Vinica
00050000-55a9-20f4-f340-c4db6165d699	5271	Vipava
00050000-55a9-20f4-7434-e5d763aa4b02	4212	Visoko
00050000-55a9-20f4-813c-ad5a7db59ab2	1294	Višnja Gora
00050000-55a9-20f4-235d-f08b2c0457f5	3205	Vitanje
00050000-55a9-20f4-69ce-644f673dd34d	2255	Vitomarci
00050000-55a9-20f4-ccbf-d9fdf0d63af9	1217	Vodice
00050000-55a9-20f4-6fbe-0639f8edb57d	3212	Vojnik\t
00050000-55a9-20f4-759b-51f1ca7a80d1	5293	Volčja Draga
00050000-55a9-20f4-b9bb-dcd8d80bbbbb	2232	Voličina
00050000-55a9-20f4-58d5-37325b940638	3305	Vransko
00050000-55a9-20f4-83c5-4234a790dd37	6217	Vremski Britof
00050000-55a9-20f4-a374-d19c68328d15	1360	Vrhnika
00050000-55a9-20f4-5dfb-cdfff396c24a	2365	Vuhred
00050000-55a9-20f4-0882-dc694a0a4037	2367	Vuzenica
00050000-55a9-20f4-49e2-cde8c4f4b469	8292	Zabukovje 
00050000-55a9-20f4-8736-e8454a8b504b	1410	Zagorje ob Savi
00050000-55a9-20f4-d7ae-164799e47ec1	1303	Zagradec
00050000-55a9-20f4-e39c-3728f6ae78a4	2283	Zavrč
00050000-55a9-20f4-98d6-8c4ffc075d3b	8272	Zdole 
00050000-55a9-20f4-bbdf-a0c9ab4719b2	4201	Zgornja Besnica
00050000-55a9-20f4-be90-a66dfdbdf58d	2242	Zgornja Korena
00050000-55a9-20f4-7d75-94bd033ed825	2201	Zgornja Kungota
00050000-55a9-20f4-db90-cd0a067d5faf	2316	Zgornja Ložnica
00050000-55a9-20f4-9030-6d09b0f34908	2314	Zgornja Polskava
00050000-55a9-20f4-ea16-e4a688ee922a	2213	Zgornja Velka
00050000-55a9-20f4-7b1f-985d3f46fb74	4247	Zgornje Gorje
00050000-55a9-20f4-2951-7c0559d34ad1	4206	Zgornje Jezersko
00050000-55a9-20f4-0318-ed51f211935b	2285	Zgornji Leskovec
00050000-55a9-20f4-3e3e-77c1367921ff	1432	Zidani Most
00050000-55a9-20f4-77ec-5697faaa74ec	3214	Zreče
00050000-55a9-20f4-0265-86bed073de2f	4209	Žabnica
00050000-55a9-20f4-04b3-f9804d26f326	3310	Žalec
00050000-55a9-20f4-b9cf-79e2dcb0fae3	4228	Železniki
00050000-55a9-20f4-678c-d3dd5b82871a	2287	Žetale
00050000-55a9-20f4-a1ba-7fe32320e38a	4226	Žiri
00050000-55a9-20f4-e534-a810502327b5	4274	Žirovnica
00050000-55a9-20f4-3cec-5e4e92332319	8360	Žužemberk
\.


--
-- TOC entry 2888 (class 0 OID 10675540)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 10675351)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 10675429)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10675552)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10675855)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 10675866)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a9-20f5-768c-b0f87077ef73	00080000-55a9-20f5-28d1-a194e4cb6ab4	0900	AK
00190000-55a9-20f5-02d9-bc23cab6cb0f	00080000-55a9-20f5-99be-946a1f30aa26	0987	AK
00190000-55a9-20f5-e95e-61474062c2fc	00080000-55a9-20f5-df77-5353e01f87b6	0989	AK
00190000-55a9-20f5-601f-a81811f79049	00080000-55a9-20f5-6ffd-3902feb02505	0986	AK
00190000-55a9-20f5-981f-5c99c408cdb1	00080000-55a9-20f5-cb8e-3c6c369949fc	0984	AK
00190000-55a9-20f5-1ee1-5befb110ac44	00080000-55a9-20f5-dea3-1e533719455b	0983	AK
00190000-55a9-20f5-9caf-79a7dcde07b0	00080000-55a9-20f5-9a4b-748a646eddcc	0982	AK
\.


--
-- TOC entry 2912 (class 0 OID 10675836)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a9-20f5-54cd-e31ebe3bb176	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2857 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 10675874)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 10675581)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a9-20f5-e650-6a98b2f2e931	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a9-20f5-1fa2-54d62783c14e	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a9-20f5-5b7e-a11c448f7522	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a9-20f5-2f09-80376f4a9d4b	0004	Mali oder	t	24	Mali oder 
00220000-55a9-20f5-61e1-8a6871431460	0005	Komorni oder	t	15	Komorni oder
00220000-55a9-20f5-6a59-a8cc8bac9886	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a9-20f5-016c-04230ed756b4	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2886 (class 0 OID 10675525)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 10675515)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 10675700)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10675649)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 10675223)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2895 (class 0 OID 10675591)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 10675261)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a9-20f3-bc2c-5d1442a3cb5c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a9-20f3-bd47-e8b8edd845b1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a9-20f3-e9c6-37722e1b83dd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a9-20f3-e13a-7a542e25d5f1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a9-20f3-e032-0e0e0890b216	planer	Planer dogodkov v koledarju	t
00020000-55a9-20f3-1da9-dddbfe221788	kadrovska	Kadrovska služba	t
00020000-55a9-20f3-3f80-226a35435309	arhivar	Ažuriranje arhivalij	t
00020000-55a9-20f3-58c7-f4d8570c546e	igralec	Igralec	t
00020000-55a9-20f3-6dc3-6a8c9759ac44	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a9-20f5-2c08-adb797114dca	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2861 (class 0 OID 10675245)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a9-20f3-c39c-e78e834d135c	00020000-55a9-20f3-e9c6-37722e1b83dd
00010000-55a9-20f3-84aa-81ddb9823ccd	00020000-55a9-20f3-e9c6-37722e1b83dd
00010000-55a9-20f5-bbfa-6aea19c849cd	00020000-55a9-20f5-2c08-adb797114dca
\.


--
-- TOC entry 2897 (class 0 OID 10675605)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 10675546)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10675496)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 10675915)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a9-20f4-ccb5-fe8c54759fef	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a9-20f4-af47-94b63e84e3d8	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a9-20f4-4a12-04bb2389a24f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a9-20f4-b73a-b6215e4dd458	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a9-20f4-b0d2-7a80287e6bca	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2919 (class 0 OID 10675907)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a9-20f4-2455-9266a015f3e4	00230000-55a9-20f4-b73a-b6215e4dd458	popa
00240000-55a9-20f4-1a35-dc1a2ec87b5b	00230000-55a9-20f4-b73a-b6215e4dd458	oseba
00240000-55a9-20f4-dc66-54eb9b9cfc86	00230000-55a9-20f4-af47-94b63e84e3d8	prostor
00240000-55a9-20f4-d699-6ae9d386ada6	00230000-55a9-20f4-b73a-b6215e4dd458	besedilo
00240000-55a9-20f4-c59e-a4e1fb7a9688	00230000-55a9-20f4-b73a-b6215e4dd458	uprizoritev
00240000-55a9-20f4-e508-cf7a60587a46	00230000-55a9-20f4-b73a-b6215e4dd458	funkcija
00240000-55a9-20f4-b600-627816983497	00230000-55a9-20f4-b73a-b6215e4dd458	tipfunkcije
00240000-55a9-20f4-2625-a21e689ae80a	00230000-55a9-20f4-b73a-b6215e4dd458	alternacija
00240000-55a9-20f4-3662-86626aa2b441	00230000-55a9-20f4-ccb5-fe8c54759fef	pogodba
00240000-55a9-20f4-61ec-63aef50998dc	00230000-55a9-20f4-b73a-b6215e4dd458	zaposlitev
00240000-55a9-20f4-942c-fef9a416d1dc	00230000-55a9-20f4-ccb5-fe8c54759fef	programdela
\.


--
-- TOC entry 2918 (class 0 OID 10675902)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 10675659)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a9-20f5-c901-f6cbba08e083	000e0000-55a9-20f5-02b6-6177649afd67	00080000-55a9-20f5-441d-f57f00478e58	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a9-20f5-7529-665b2003f7c1	000e0000-55a9-20f5-02b6-6177649afd67	00080000-55a9-20f5-441d-f57f00478e58	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a9-20f5-23b1-cb14c5c076eb	000e0000-55a9-20f5-02b6-6177649afd67	00080000-55a9-20f5-8ddd-5547c9705447	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55a9-20f5-99e9-c1c9f2607f91	000e0000-55a9-20f5-02b6-6177649afd67	00080000-55a9-20f5-8ddd-5547c9705447	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2868 (class 0 OID 10675323)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10675502)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a9-20f5-8e69-3b77cd6bdac2	00180000-55a9-20f5-7b44-2521f33f7a41	000c0000-55a9-20f5-4ad2-0dd971650220	00090000-55a9-20f5-21bf-5f89e36a2e76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a9-20f5-3967-518fc0b877e0	00180000-55a9-20f5-7b44-2521f33f7a41	000c0000-55a9-20f5-9cba-1a15ee6cdb50	00090000-55a9-20f5-1350-3a7d754f38c6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a9-20f5-cb22-4d2017b8de13	00180000-55a9-20f5-7b44-2521f33f7a41	000c0000-55a9-20f5-52bb-91746c70219a	00090000-55a9-20f5-b731-d7a8ef38ca3f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a9-20f5-336b-9ff841c446dd	00180000-55a9-20f5-7b44-2521f33f7a41	000c0000-55a9-20f5-1dba-b4f56a558681	00090000-55a9-20f5-bfe2-0c47e85c5f9d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a9-20f5-923e-777566e9ac34	00180000-55a9-20f5-7b44-2521f33f7a41	000c0000-55a9-20f5-0f5c-38355351b41f	00090000-55a9-20f5-3f3c-8cc7922920ae	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a9-20f5-e23d-9492e1fd09c1	00180000-55a9-20f5-8047-0b8ebd9607b1	\N	00090000-55a9-20f5-3f3c-8cc7922920ae	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2904 (class 0 OID 10675689)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55a9-20f4-f58e-788bff772b8f	Igralec ali animator	Igralci in animatorji	Igralka ali animatorka	igralec
000f0000-55a9-20f4-b1d8-21a6ff39fa4a	Baletnik ali plesalec	Baletniki in plesalci	Baletnica ali plesalka	igralec
000f0000-55a9-20f4-c1b9-6353b8cabfc8	Avtor	Avtorji	Avtorka	umetnik
000f0000-55a9-20f4-ca22-d9cd6944c734	Režiser	Režiserji	Režiserka	umetnik
000f0000-55a9-20f4-61d5-55af09fd8d14	Scenograf	Scenografi	Scenografka	tehnik
000f0000-55a9-20f4-b51c-913d04f1ef19	Kostumograf	Kostumografi	Kostumografinja	tehnik
000f0000-55a9-20f4-df10-0f794ce5b9eb	Oblikovalec maske	Oblikovalci maske	Oblikovalka maske	tehnik
000f0000-55a9-20f4-767d-5807150c086d	Avtor glasbe	Avtorji glasbe	Avtorica glasbe	umetnik
000f0000-55a9-20f4-e13c-6ae1535ff932	Oblikovalec svetlobe	Oblikovalci svetlobe	Oblikovalka svetlobe	tehnik
000f0000-55a9-20f4-bcea-730039aa23cc	Koreograf	Koreografi	Koreografinja	umetnik
000f0000-55a9-20f4-d2b5-dbfb27ca5724	Dramaturg	Dramaturgi	Dramaturginja	umetnik
000f0000-55a9-20f4-1d8c-8d111df3f1ff	Lektor	Lektorji	Lektorica	umetnik
000f0000-55a9-20f4-0626-74c5923466e6	Prevajalec	Prevajalci	Prevajalka	umetnik
000f0000-55a9-20f4-d675-ac87785f6aba	Oblikovalec videa	Oblikovalci videa	Oblikovalka videa	umetnik
000f0000-55a9-20f4-151e-42d624d60d1e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijska ustvarjalka	umetnik
000f0000-55a9-20f4-ff67-4b9f31f22e6b	Nerazvrščeno	Nerazvrščeno	Nerazvrščeno	\N
000f0000-55a9-20f4-f9be-82181da57628	Inšpicient	Inšpicienti	Inšpicientka	inspicient
000f0000-55a9-20f4-3626-c053eb21b7c2	Šepetalec	Šepetalci	Šepetalka	sepetalec
000f0000-55a9-20f4-6fb9-3b1d33274011	Tehnični vodja	Tehnične vodje	Tehnični vodja	tehnik
\.


--
-- TOC entry 2916 (class 0 OID 10675884)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a9-20f4-a729-c88c3b4917ed	01	Velika predstava	f	1.00	1.00
002b0000-55a9-20f4-8b31-ba301f79d768	02	Mala predstava	f	0.50	0.50
002b0000-55a9-20f4-9c38-3e0b6f6b6299	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a9-20f4-46e0-49d82393bef4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a9-20f4-815f-03bac69844e5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2873 (class 0 OID 10675386)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 10675232)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a9-20f3-84aa-81ddb9823ccd	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSqj7Iu3ZcP0gvezyZvki25eX1.aOt8S	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-885e-e061d817c624	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-a62f-fea9cc28f71c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-a80c-8f2715b97a22	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-8d7b-ecc215a03a30	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-bc04-2d8c4161cfbe	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-84ef-7ca925ede823	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-9c70-4676894b269a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-4c22-70c61d4f1350	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-9e0b-b8ec0afaac8c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a9-20f5-bbfa-6aea19c849cd	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a9-20f3-c39c-e78e834d135c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 10675737)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a9-20f5-7dfd-63b6e5fd3b01	00160000-55a9-20f5-b658-0ea7437d7186	00150000-55a9-20f4-a4c8-471806a9b50a	00140000-55a9-20f3-6342-3d8f31fa967c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a9-20f5-61e1-8a6871431460
000e0000-55a9-20f5-02b6-6177649afd67	00160000-55a9-20f5-6e81-79aea389697e	00150000-55a9-20f4-a693-1f156d0e2144	00140000-55a9-20f3-a4fa-809fae2bde72	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a9-20f5-6a59-a8cc8bac9886
000e0000-55a9-20f5-9f40-301aa98b88e4	\N	00150000-55a9-20f4-a693-1f156d0e2144	00140000-55a9-20f3-a4fa-809fae2bde72	00190000-55a9-20f5-02d9-bc23cab6cb0f	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a9-20f5-61e1-8a6871431460
000e0000-55a9-20f5-ae49-1886f53ee12a	\N	00150000-55a9-20f4-a693-1f156d0e2144	00140000-55a9-20f3-a4fa-809fae2bde72	00190000-55a9-20f5-02d9-bc23cab6cb0f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a9-20f5-61e1-8a6871431460
000e0000-55a9-20f5-1dc3-4b812f6c847d	\N	00150000-55a9-20f4-a693-1f156d0e2144	00140000-55a9-20f3-a4fa-809fae2bde72	00190000-55a9-20f5-02d9-bc23cab6cb0f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a9-20f5-e650-6a98b2f2e931
\.


--
-- TOC entry 2878 (class 0 OID 10675448)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a9-20f5-96a3-66963d67b85c	000e0000-55a9-20f5-02b6-6177649afd67	1	
00200000-55a9-20f5-18aa-d10dc6455eec	000e0000-55a9-20f5-02b6-6177649afd67	2	
\.


--
-- TOC entry 2893 (class 0 OID 10675573)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10675642)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a9-20f5-edbd-5306e1844396	00090000-55a9-20f5-1350-3a7d754f38c6	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a9-20f5-8434-0f5328a41464	00090000-55a9-20f5-b731-d7a8ef38ca3f	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a9-20f5-4fea-84251c43c0f4	00090000-55a9-20f5-c458-67057fed5bff	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2880 (class 0 OID 10675480)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 10675727)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a9-20f3-6342-3d8f31fa967c	01	Drama	drama (SURS 01)
00140000-55a9-20f3-ac05-2de397d52072	02	Opera	opera (SURS 02)
00140000-55a9-20f3-3e6a-cad719881c5a	03	Balet	balet (SURS 03)
00140000-55a9-20f3-5846-5903939991a3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a9-20f3-aa52-e3448253d96f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a9-20f3-a4fa-809fae2bde72	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a9-20f3-20da-348050f4f945	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2899 (class 0 OID 10675632)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a9-20f4-4350-a742779a2f0f	01	Opera	opera
00150000-55a9-20f4-e2fc-d60413444ae6	02	Opereta	opereta
00150000-55a9-20f4-e9ff-2eb0171d8b0b	03	Balet	balet
00150000-55a9-20f4-17b3-4ec574a6c15d	04	Plesne prireditve	plesne prireditve
00150000-55a9-20f4-5de2-d706a22f0d0b	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a9-20f4-7d2c-329f4e2b9f94	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a9-20f4-09ab-c26bc9f49891	07	Biografska drama	biografska drama
00150000-55a9-20f4-a4c8-471806a9b50a	08	Komedija	komedija
00150000-55a9-20f4-d616-6cdea026e98d	09	Črna komedija	črna komedija
00150000-55a9-20f4-983f-4dfacb01a016	10	E-igra	E-igra
00150000-55a9-20f4-a693-1f156d0e2144	11	Kriminalka	kriminalka
00150000-55a9-20f4-3194-8f925efe3cbb	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 10675286)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 10675784)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 10675774)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 10675688)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 10675470)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 10675495)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 10675900)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 10675412)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 10675830)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 10675628)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 10675446)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 10675489)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 10675426)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 10675538)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 10675565)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 10675384)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 10675295)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2453 (class 2606 OID 10675319)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 10675275)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 10675260)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 10675571)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 10675604)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 10675722)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 10675348)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 10675372)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 10675544)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 10675362)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 10675433)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 10675556)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 10675863)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 10675871)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 10675853)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 10675882)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 10675588)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10675529)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 10675520)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 10675710)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 10675656)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 10675231)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 10675595)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 10675249)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 10675269)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 10675613)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 10675551)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 10675501)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 10675924)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 10675912)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 10675906)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 10675669)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 10675328)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 10675511)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10675699)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 10675894)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 10675397)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 10675244)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 10675753)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 10675455)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10675579)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 10675647)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 10675484)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 10675735)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 10675640)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 10675477)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 10675670)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2587 (class 1259 OID 10675671)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2460 (class 1259 OID 10675350)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2407 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2409 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2551 (class 1259 OID 10675572)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2545 (class 1259 OID 10675558)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2546 (class 1259 OID 10675557)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 10675456)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10675629)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2574 (class 1259 OID 10675631)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2575 (class 1259 OID 10675630)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 10675428)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 10675427)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 10675883)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2596 (class 1259 OID 10675724)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2597 (class 1259 OID 10675725)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 10675726)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2421 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2422 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2605 (class 1259 OID 10675758)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2606 (class 1259 OID 10675755)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2607 (class 1259 OID 10675759)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2608 (class 1259 OID 10675757)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2609 (class 1259 OID 10675756)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 10675399)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 10675398)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2412 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 10675322)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 10675596)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 10675490)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 10675276)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 10675277)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2566 (class 1259 OID 10675616)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2567 (class 1259 OID 10675615)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2568 (class 1259 OID 10675614)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 10675434)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 10675436)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 10675435)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2652 (class 1259 OID 10675914)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2525 (class 1259 OID 10675524)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2526 (class 1259 OID 10675522)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2527 (class 1259 OID 10675521)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2528 (class 1259 OID 10675523)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 10675250)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 10675251)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2554 (class 1259 OID 10675580)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2540 (class 1259 OID 10675545)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2582 (class 1259 OID 10675657)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2583 (class 1259 OID 10675658)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 10675835)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2627 (class 1259 OID 10675834)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2628 (class 1259 OID 10675831)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 10675832)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2630 (class 1259 OID 10675833)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 10675364)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 10675363)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 10675365)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2425 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2634 (class 1259 OID 10675864)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2635 (class 1259 OID 10675865)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2619 (class 1259 OID 10675788)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 10675786)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 10675787)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2579 (class 1259 OID 10675648)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 10675533)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2532 (class 1259 OID 10675532)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2533 (class 1259 OID 10675530)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2534 (class 1259 OID 10675531)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2403 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 10675776)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 10675775)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2631 (class 1259 OID 10675854)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 10675447)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2649 (class 1259 OID 10675901)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2447 (class 1259 OID 10675297)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 10675296)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 10675329)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 10675330)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 10675514)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 10675513)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2522 (class 1259 OID 10675512)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2416 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2417 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2418 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 10675479)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 10675475)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 10675472)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 10675473)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 10675471)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 10675476)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 10675474)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 10675349)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10675413)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 10675415)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 10675414)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 10675416)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2539 (class 1259 OID 10675539)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 10675723)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 10675754)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10675320)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 10675321)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2576 (class 1259 OID 10675641)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2658 (class 1259 OID 10675925)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 10675385)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2655 (class 1259 OID 10675913)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2559 (class 1259 OID 10675590)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2560 (class 1259 OID 10675589)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10675785)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 10675789)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 10675373)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 10675736)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10675872)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 10675873)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 10675270)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 10675478)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2684 (class 2606 OID 10676061)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2687 (class 2606 OID 10676046)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2686 (class 2606 OID 10676051)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2682 (class 2606 OID 10676071)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2688 (class 2606 OID 10676041)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2683 (class 2606 OID 10676066)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2685 (class 2606 OID 10676056)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2718 (class 2606 OID 10676216)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2717 (class 2606 OID 10676221)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2669 (class 2606 OID 10675976)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 10676156)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2703 (class 2606 OID 10676151)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2704 (class 2606 OID 10676146)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2681 (class 2606 OID 10676036)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 10676186)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 10676196)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2712 (class 2606 OID 10676191)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2675 (class 2606 OID 10676011)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 10676006)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 10676136)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 10676341)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2721 (class 2606 OID 10676226)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 10676231)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2719 (class 2606 OID 10676236)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2723 (class 2606 OID 10676256)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2726 (class 2606 OID 10676241)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2722 (class 2606 OID 10676261)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 10676251)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2725 (class 2606 OID 10676246)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2673 (class 2606 OID 10676001)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2674 (class 2606 OID 10675996)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 10675961)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2666 (class 2606 OID 10675956)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2707 (class 2606 OID 10676166)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2689 (class 2606 OID 10676076)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 10675936)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2661 (class 2606 OID 10675941)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2708 (class 2606 OID 10676181)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2709 (class 2606 OID 10676176)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2710 (class 2606 OID 10676171)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2679 (class 2606 OID 10676016)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 10676026)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2678 (class 2606 OID 10676021)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2744 (class 2606 OID 10676351)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2693 (class 2606 OID 10676111)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2695 (class 2606 OID 10676101)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2696 (class 2606 OID 10676096)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2694 (class 2606 OID 10676106)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2660 (class 2606 OID 10675926)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 10675931)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2706 (class 2606 OID 10676161)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2702 (class 2606 OID 10676141)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2716 (class 2606 OID 10676206)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2715 (class 2606 OID 10676211)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2733 (class 2606 OID 10676316)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 10676311)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2737 (class 2606 OID 10676296)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 10676301)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2735 (class 2606 OID 10676306)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2671 (class 2606 OID 10675986)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 10675981)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2670 (class 2606 OID 10675991)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2740 (class 2606 OID 10676326)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2739 (class 2606 OID 10676331)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2730 (class 2606 OID 10676286)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2729 (class 2606 OID 10676291)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2732 (class 2606 OID 10676276)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2731 (class 2606 OID 10676281)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2714 (class 2606 OID 10676201)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 10676131)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2698 (class 2606 OID 10676126)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2700 (class 2606 OID 10676116)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2699 (class 2606 OID 10676121)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 10676271)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 10676266)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 10676321)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2680 (class 2606 OID 10676031)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 10676336)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2743 (class 2606 OID 10676346)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2663 (class 2606 OID 10675951)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2664 (class 2606 OID 10675946)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2668 (class 2606 OID 10675966)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 10675971)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 10676091)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 10676086)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2692 (class 2606 OID 10676081)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-17 17:36:22 CEST

--
-- PostgreSQL database dump complete
--

