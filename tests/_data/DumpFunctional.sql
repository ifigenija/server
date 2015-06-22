--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-22 15:12:01 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 237 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 7935848)
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
-- TOC entry 229 (class 1259 OID 7936370)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    zaposlitev_id uuid,
    oseba_id uuid,
    koprodukcija_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean,
    imapogodbo boolean
);


--
-- TOC entry 228 (class 1259 OID 7936353)
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
-- TOC entry 221 (class 1259 OID 7936257)
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
    letoizida date,
    krajizida date,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 7936027)
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
-- TOC entry 199 (class 1259 OID 7936061)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 7935970)
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
-- TOC entry 230 (class 1259 OID 7936384)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opredelitevdrugiviri text,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stdrugih integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    utemeljitev text NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    odkup numeric(15,2) DEFAULT NULL::numeric,
    nazivsklopa character varying(255) DEFAULT NULL::character varying,
    naslovpe character varying(255) DEFAULT NULL::character varying,
    avtorpe character varying(255) DEFAULT NULL::character varying,
    obsegpe character varying(255) DEFAULT NULL::character varying,
    mesecpe character varying(255) DEFAULT NULL::character varying,
    vrednostpe numeric(15,2) DEFAULT 0::numeric,
    stpe integer DEFAULT 0
);


--
-- TOC entry 215 (class 1259 OID 7936187)
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
-- TOC entry 194 (class 1259 OID 7936007)
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
-- TOC entry 198 (class 1259 OID 7936055)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 192 (class 1259 OID 7935987)
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
-- TOC entry 204 (class 1259 OID 7936104)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 208 (class 1259 OID 7936129)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 7935944)
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
-- TOC entry 183 (class 1259 OID 7935857)
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
-- TOC entry 184 (class 1259 OID 7935868)
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
-- TOC entry 179 (class 1259 OID 7935822)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 7935841)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 7936136)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 7936167)
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
-- TOC entry 225 (class 1259 OID 7936303)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostdo numeric(12,2) DEFAULT NULL::numeric,
    zacetek date,
    konec date,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    opis text
);


--
-- TOC entry 186 (class 1259 OID 7935901)
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
-- TOC entry 188 (class 1259 OID 7935936)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 7936110)
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
-- TOC entry 187 (class 1259 OID 7935921)
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
-- TOC entry 193 (class 1259 OID 7935999)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 207 (class 1259 OID 7936122)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 7936242)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    nasstrosek boolean,
    lastnasredstva numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    drugijavni numeric(15,2) DEFAULT NULL::numeric,
    avtorskih numeric(15,2) DEFAULT NULL::numeric,
    tantieme numeric(15,2) DEFAULT NULL::numeric,
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 224 (class 1259 OID 7936295)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 7936426)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    potrjenprogram boolean NOT NULL,
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 233 (class 1259 OID 7936450)
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
-- TOC entry 211 (class 1259 OID 7936151)
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
-- TOC entry 203 (class 1259 OID 7936095)
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
-- TOC entry 202 (class 1259 OID 7936085)
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
-- TOC entry 223 (class 1259 OID 7936284)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 7936219)
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
-- TOC entry 176 (class 1259 OID 7935793)
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
-- TOC entry 175 (class 1259 OID 7935791)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 7936161)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 180 (class 1259 OID 7935831)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 7935815)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 7936175)
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
-- TOC entry 206 (class 1259 OID 7936116)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 7936066)
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
-- TOC entry 236 (class 1259 OID 7936483)
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
-- TOC entry 235 (class 1259 OID 7936475)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7936470)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 219 (class 1259 OID 7936229)
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
-- TOC entry 185 (class 1259 OID 7935893)
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
-- TOC entry 201 (class 1259 OID 7936072)
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
    planiranotraja numeric(10,0) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 7936273)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    nastopajoc boolean,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 7936439)
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
-- TOC entry 190 (class 1259 OID 7935956)
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
-- TOC entry 177 (class 1259 OID 7935802)
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
-- TOC entry 227 (class 1259 OID 7936330)
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
-- TOC entry 195 (class 1259 OID 7936018)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 210 (class 1259 OID 7936143)
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
-- TOC entry 217 (class 1259 OID 7936212)
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
-- TOC entry 197 (class 1259 OID 7936050)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 7936320)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 7936202)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2193 (class 2604 OID 7935796)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2841 (class 0 OID 7935848)
-- Dependencies: 182
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 7936370)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5588-09a0-9858-2da72e935ec4	000d0000-5588-09a0-6a12-7e944cfda815	\N	00090000-5588-09a0-1619-3cabfd66a13c	\N	000b0000-5588-09a0-8252-0aea213e5e12	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-09a0-1a0f-d271d685506a	000d0000-5588-09a0-bb53-17eec6d8c57f	\N	00090000-5588-09a0-384e-78f564e2cec6	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-09a0-687a-c188cc0c8147	000d0000-5588-09a0-08b1-74851c01f122	\N	00090000-5588-09a0-61b6-fb0e2d4964ac	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-09a0-4f49-962d93104017	000d0000-5588-09a0-f75c-f8d799e49626	\N	00090000-5588-09a0-0e13-62206238da45	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-09a0-f8dc-fca7ba98c0db	000d0000-5588-09a0-5d4b-0eaedfc3477a	\N	00090000-5588-09a0-6d21-e7aaa24ed9b2	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-09a0-d3f5-8e0c4c05feef	000d0000-5588-09a0-aef1-f3caa5d54cd5	\N	00090000-5588-09a0-384e-78f564e2cec6	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 7936353)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7936257)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5588-09a0-c68f-eab58779dadf	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5588-09a0-d6f5-34724b650354	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5588-09a0-bc75-de08797b715f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2855 (class 0 OID 7936027)
-- Dependencies: 196
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5588-09a0-37e9-6dee29a30133	\N	\N	00200000-5588-09a0-b7ab-1fae83fa1247	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5588-09a0-4dd0-db886cdbccc9	\N	\N	00200000-5588-09a0-867f-d99b144f207b	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5588-09a0-4006-d3baee4c5e01	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5588-09a0-d9e2-aad3b3da5d83	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5588-09a0-4f51-2a913af7a862	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2858 (class 0 OID 7936061)
-- Dependencies: 199
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7935970)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5588-099e-fca6-8f1fac71f788	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5588-099e-e216-5332188b3ffc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5588-099e-4c6d-4d41198e7b8d	AL	ALB	008	Albania 	Albanija	\N
00040000-5588-099e-6a87-132aee6b583b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5588-099e-5523-c02a9c8acc8c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5588-099e-4daa-5f284b11994c	AD	AND	020	Andorra 	Andora	\N
00040000-5588-099e-b3c9-b5d5e784ba40	AO	AGO	024	Angola 	Angola	\N
00040000-5588-099e-1b36-be5db59405fe	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5588-099e-57ce-42db7d4d5df9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5588-099e-1b6d-3d70ec0bcede	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-099e-74d2-b967d938b7bb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5588-099e-7424-09cb62a7115a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5588-099e-d0c2-ea2f32ab4424	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5588-099e-a3af-1cf6fd6aeb09	AU	AUS	036	Australia 	Avstralija	\N
00040000-5588-099e-b5c2-ca5b87575b71	AT	AUT	040	Austria 	Avstrija	\N
00040000-5588-099e-519a-c115827262a2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5588-099e-044b-7169290390f0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5588-099e-7069-31add7aa1587	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5588-099e-2f0c-955307de8c81	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5588-099e-7251-59d9fb4132e8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5588-099e-8c9a-98913776dfa4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5588-099e-ac29-5a8ebf5c7a5c	BE	BEL	056	Belgium 	Belgija	\N
00040000-5588-099e-5f0e-021fdf88b432	BZ	BLZ	084	Belize 	Belize	\N
00040000-5588-099e-d0b8-9e5f66336c77	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5588-099e-8c76-84a9aa6a6ef3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5588-099e-11ee-6a1c41144840	BT	BTN	064	Bhutan 	Butan	\N
00040000-5588-099e-f565-58c046ec6f45	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5588-099e-d640-1e359c46e500	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5588-099e-9a74-c4522a593953	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5588-099e-77b8-1763c71853e5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5588-099e-7cfd-b2b4d3216ec5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5588-099e-4703-ffe764cc02fa	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5588-099e-9106-1534ceafd811	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5588-099e-3125-66096708eb90	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5588-099e-8194-852b66227dc5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5588-099e-27cf-a27104c87da3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5588-099e-e3a7-ef362287bf19	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5588-099e-67d3-7bb6df52b0ce	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5588-099e-a2a2-793960cacdfb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5588-099e-07cc-b7f90bd055d2	CA	CAN	124	Canada 	Kanada	\N
00040000-5588-099e-2eac-4f75ba4da3b5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5588-099e-513c-1582121fe006	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5588-099e-a615-0f43b151b5de	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5588-099e-aa8f-1040e23ddbff	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5588-099e-4d73-7191b6bfdf80	CL	CHL	152	Chile 	Čile	\N
00040000-5588-099e-b427-0aeed382f37d	CN	CHN	156	China 	Kitajska	\N
00040000-5588-099e-e397-452843e744f0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5588-099e-beb3-f428b23194d6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5588-099e-fcc4-e1f6d45f2d79	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5588-099e-f430-b7ff6a2ab0ad	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5588-099e-7689-6a8abea696d1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5588-099e-87ed-c5766f96c02b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5588-099e-5e53-c75cabc5e8fb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5588-099e-44dc-5595846e6416	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5588-099e-3f6e-6176c6c7d101	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5588-099e-2987-fab34f2fe147	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5588-099e-133b-1445e5898a07	CU	CUB	192	Cuba 	Kuba	\N
00040000-5588-099e-1449-21848f4253d4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5588-099e-eff6-1cbe7f13a28d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5588-099e-1c23-1b976a52d21d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5588-099e-9990-ce781907af2b	DK	DNK	208	Denmark 	Danska	\N
00040000-5588-099e-d018-bf61865038cd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5588-099e-50ec-3f69c7df2305	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-099e-613a-f351e6a93b60	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5588-099e-4db3-3f2fa152083d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5588-099e-9af1-5724711646a1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5588-099e-afdb-e550b2879d6a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5588-099e-58c6-4eb054bf95e6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5588-099e-0c48-4cff8c13e0a4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5588-099e-7d9e-aa8dfc3dcd1a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5588-099e-1453-aa3d47cb905e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5588-099e-49c0-81f43f19be29	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5588-099e-80d3-15403df7c2a0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5588-099e-46f9-b8ec9d615b37	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5588-099e-3ad6-48ea5bce4c28	FI	FIN	246	Finland 	Finska	\N
00040000-5588-099e-a46d-1be178b7646c	FR	FRA	250	France 	Francija	\N
00040000-5588-099e-df11-9b0f9a7e4fe6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5588-099f-24cc-05d08d98fb78	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5588-099e-11fd-3c60f9855208	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5588-099e-1637-d4e50295e0f1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5588-099e-dba3-dd4a6158c7b0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5588-099e-c71a-77cd1248d31b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5588-099e-4db5-8b041dc30579	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5588-099e-0aaf-53769529e95a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5588-099e-c85a-2f707992ff45	GH	GHA	288	Ghana 	Gana	\N
00040000-5588-099e-743d-2a7fdb4f9bda	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5588-099e-94a5-49facef35b1b	GR	GRC	300	Greece 	Grčija	\N
00040000-5588-099e-86c6-a0c2ba67d272	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5588-099f-4067-3749d0949f2a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5588-099f-8e83-a0d651aa2efe	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5588-099f-08db-d41248eaa2eb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5588-099f-aa7c-480f7ff6077d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5588-099f-a8f6-7dab185d7d9f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5588-099f-a392-ce64df2f91f2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5588-099f-4311-ab4b7c8dbd4e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5588-099f-a5f8-ec8413823902	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5588-099f-4a29-a6383a58d377	HT	HTI	332	Haiti 	Haiti	\N
00040000-5588-099f-8921-3d6a1f705e43	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5588-099f-96e2-4a98af61e7c9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5588-099f-f537-6cf04a611acb	HN	HND	340	Honduras 	Honduras	\N
00040000-5588-099f-2c96-3669439c1f4f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5588-099f-d386-459136039b77	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5588-099f-a4cf-8a0982647a0c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5588-099f-8193-4305d9e1e489	IN	IND	356	India 	Indija	\N
00040000-5588-099f-e888-490fa661c98a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5588-099f-87fb-361c7cf7b9e9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5588-099f-197f-6cb1e00107ba	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5588-099f-0204-5ee0cbce0605	IE	IRL	372	Ireland 	Irska	\N
00040000-5588-099f-9a95-1882d447201f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5588-099f-5636-a94e80fa3984	IL	ISR	376	Israel 	Izrael	\N
00040000-5588-099f-56d6-236fa1e324f7	IT	ITA	380	Italy 	Italija	\N
00040000-5588-099f-b907-a6f458ce398c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5588-099f-2958-a8c2c5b0d3b6	JP	JPN	392	Japan 	Japonska	\N
00040000-5588-099f-f6f3-1b9acb9e5421	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5588-099f-fe03-9a8f9e74710c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5588-099f-1fa0-581b1856fce7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5588-099f-b61d-694f3c664f87	KE	KEN	404	Kenya 	Kenija	\N
00040000-5588-099f-e606-fbb9b6254954	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5588-099f-4c4b-528b760baa64	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5588-099f-afa6-491291d4306e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5588-099f-7e0a-da553368adeb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5588-099f-d333-74308c2fd6d0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5588-099f-b5aa-2cae32fa8f05	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5588-099f-2ef6-ed82bdafea85	LV	LVA	428	Latvia 	Latvija	\N
00040000-5588-099f-94b4-53ee758e71f4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5588-099f-f307-659a2b83246b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5588-099f-dab4-43c3c007d105	LR	LBR	430	Liberia 	Liberija	\N
00040000-5588-099f-7f31-e6d921e1e5c0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5588-099f-1198-096f932e8d4b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5588-099f-c9c5-b365dd644399	LT	LTU	440	Lithuania 	Litva	\N
00040000-5588-099f-f75e-ec2e56b28620	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5588-099f-a696-cbf91cd3aeb4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5588-099f-3b8e-a8cfd85ba14b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5588-099f-73e5-eb77dd3bbd36	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5588-099f-f629-f549672e53b7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5588-099f-b33a-8c013582e180	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5588-099f-c05f-092af493aaba	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5588-099f-2adb-5c45d0618101	ML	MLI	466	Mali 	Mali	\N
00040000-5588-099f-806e-2d3a9ee8d72e	MT	MLT	470	Malta 	Malta	\N
00040000-5588-099f-698d-9c2dcd71305b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5588-099f-2ea5-9fd48a22a1ea	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5588-099f-d98d-b8d8994aefeb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5588-099f-9deb-2a14fd4d2f37	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5588-099f-1e87-14a94354b3f3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5588-099f-7e11-cc706e463f68	MX	MEX	484	Mexico 	Mehika	\N
00040000-5588-099f-0294-bd67a70424c3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5588-099f-787c-a66dfdc2f492	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5588-099f-8b9c-d5256379b001	MC	MCO	492	Monaco 	Monako	\N
00040000-5588-099f-c2d8-ac0f44f61055	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5588-099f-41a5-3fbded7a34df	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5588-099f-15b6-88023f7b2435	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5588-099f-8b37-5983373849cc	MA	MAR	504	Morocco 	Maroko	\N
00040000-5588-099f-b4b4-9846ee544a0a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5588-099f-ca66-b6596a049c2e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5588-099f-57c9-629f221b80b7	NA	NAM	516	Namibia 	Namibija	\N
00040000-5588-099f-55c8-26426e2d476a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5588-099f-dd30-24a6fe4f4ad6	NP	NPL	524	Nepal 	Nepal	\N
00040000-5588-099f-135a-23ac9787bf9d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5588-099f-92ad-09b4d0d77077	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5588-099f-99f8-ec37d4f8e60d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5588-099f-c96c-46bd296459de	NE	NER	562	Niger 	Niger 	\N
00040000-5588-099f-37bd-555c478c44ed	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5588-099f-af23-1e2261d802bf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5588-099f-a5c5-920bcef66590	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5588-099f-c7e0-99b14367fba1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5588-099f-e4f7-f6329c5db145	NO	NOR	578	Norway 	Norveška	\N
00040000-5588-099f-37c6-4131bfbbfa28	OM	OMN	512	Oman 	Oman	\N
00040000-5588-099f-e095-4152cb2d1226	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5588-099f-613e-b44dc17ef512	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5588-099f-71e0-916ea7fcd501	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5588-099f-a1a5-2132756fbfb8	PA	PAN	591	Panama 	Panama	\N
00040000-5588-099f-86d0-430594c0a1ee	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5588-099f-8d37-2a7839734491	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5588-099f-f7ed-84384668d1e4	PE	PER	604	Peru 	Peru	\N
00040000-5588-099f-2371-db8114a3c1ca	PH	PHL	608	Philippines 	Filipini	\N
00040000-5588-099f-cf7e-4270101c85ec	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5588-099f-0fea-20032974a8f2	PL	POL	616	Poland 	Poljska	\N
00040000-5588-099f-6afa-294bfb5b8dea	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5588-099f-31ec-ed62b2cc1e51	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5588-099f-50cb-18739d0e6b9a	QA	QAT	634	Qatar 	Katar	\N
00040000-5588-099f-b97b-632180d91179	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5588-099f-7dab-b917f1173a7e	RO	ROU	642	Romania 	Romunija	\N
00040000-5588-099f-3749-d2d865474d47	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5588-099f-cce0-776794b12ed9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5588-099f-dfa5-ee930b95468a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5588-099f-6a13-5015a320e31c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5588-099f-1d7e-028aac4f0bf4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5588-099f-36b5-c4c902041614	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5588-099f-f0a1-3488cf80377d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5588-099f-19c6-265612bf2389	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5588-099f-3b5b-d4a7e78a05d6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5588-099f-2665-b657c2cd32e7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5588-099f-6d27-08030b276713	SM	SMR	674	San Marino 	San Marino	\N
00040000-5588-099f-a272-2545e8a88883	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5588-099f-7e69-4d6a3c5b44ac	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5588-099f-cf97-c1b61d6ab28a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5588-099f-fe2c-90b2c16becd9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5588-099f-56de-67aea0fde672	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5588-099f-db31-210938197e1d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5588-099f-2e4a-4e877e121b49	SG	SGP	702	Singapore 	Singapur	\N
00040000-5588-099f-d26e-3a4152c97eaf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5588-099f-622c-17b1e92acd26	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5588-099f-8d49-74d747de13d4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5588-099f-bb44-c50b3ed4c3a7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5588-099f-faad-81432a164437	SO	SOM	706	Somalia 	Somalija	\N
00040000-5588-099f-ddff-275ff5d1f5b8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5588-099f-3125-d2b74ef8e664	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5588-099f-bee2-3b0e7961f5e3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5588-099f-a019-48bc7dd66ba4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5588-099f-0e53-60844f3e2671	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5588-099f-d3f9-7f1257ca5fe6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5588-099f-11c3-b1be544f71ba	SR	SUR	740	Suriname 	Surinam	\N
00040000-5588-099f-2c20-7b8254afe46c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5588-099f-af67-8797da8c0d20	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5588-099f-72a3-78be55c140a4	SE	SWE	752	Sweden 	Švedska	\N
00040000-5588-099f-4aa9-bab15fce52c3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5588-099f-245f-d8a56c6acfa1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5588-099f-63c2-d2f79ae4db61	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5588-099f-92a5-c0eb5d9130ec	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5588-099f-abd9-9f1863ff173f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5588-099f-5e0d-a65d4e8e85d1	TH	THA	764	Thailand 	Tajska	\N
00040000-5588-099f-078e-0adfc6260183	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5588-099f-d3b3-9e427ba969c1	TG	TGO	768	Togo 	Togo	\N
00040000-5588-099f-56b4-fc5bec32b604	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5588-099f-9200-ec8f54816f53	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5588-099f-28b1-69459b6e4d79	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5588-099f-3e04-b5db82ee0826	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5588-099f-882e-22adef3a119d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5588-099f-f491-40f3f1fe1412	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5588-099f-4a8f-44b7970e2f99	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-099f-172a-d25c47e1add0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5588-099f-e959-a9602ac3e4d7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5588-099f-5886-378730238778	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5588-099f-f676-6c94e4578f8c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5588-099f-fe2e-f3c7e7e15268	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5588-099f-614e-11c446cd4bfc	US	USA	840	United States 	Združene države Amerike	\N
00040000-5588-099f-0f4c-04b1bfb35915	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5588-099f-aed4-2591e5d785c9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5588-099f-4211-f244623dd8c6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5588-099f-8f6b-c91ab807cf35	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5588-099f-065c-d9a72ee28580	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5588-099f-a850-62558876af62	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5588-099f-3ea6-f7fb5c603295	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-099f-7056-54586c03c3cc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5588-099f-ff19-25e45fb8c740	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5588-099f-62b5-eb7491024a12	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5588-099f-c8f0-c26c9110a653	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5588-099f-09cf-6ca6b512a1b3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5588-099f-0384-08eb45588cc2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2889 (class 0 OID 7936384)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7936187)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5588-09a0-aab1-22134332ea4e	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5588-099f-dfca-a86d94106002
000d0000-5588-09a0-6a12-7e944cfda815	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-099f-dfca-a86d94106002
000d0000-5588-09a0-bb53-17eec6d8c57f	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5588-099f-7fdb-26759d5a0047
000d0000-5588-09a0-08b1-74851c01f122	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5588-099f-5ee1-b1d148ab2fb2
000d0000-5588-09a0-f75c-f8d799e49626	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5588-099f-5ee1-b1d148ab2fb2
000d0000-5588-09a0-5d4b-0eaedfc3477a	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5588-099f-5ee1-b1d148ab2fb2
000d0000-5588-09a0-aef1-f3caa5d54cd5	000e0000-5588-09a0-0ba2-b99a16ee4449	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-099f-dfca-a86d94106002
\.


--
-- TOC entry 2853 (class 0 OID 7936007)
-- Dependencies: 194
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7936055)
-- Dependencies: 198
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7935987)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5588-09a0-777a-69f26f7e9beb	00080000-5588-09a0-efd9-0230c84b7114	00090000-5588-09a0-1619-3cabfd66a13c	AK		
\.


--
-- TOC entry 2829 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7936104)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7936129)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7935944)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5588-099f-6bc5-8916adf4bea1	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5588-099f-3a51-8c45da90ba49	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5588-099f-022d-827ab691f4b1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5588-099f-e8b2-4dbd8c659695	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5588-099f-558e-ea93d61ef3d0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5588-099f-71cb-6b7807fb9da3	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5588-099f-ead7-f70e8485f172	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5588-099f-53c2-813d1b6dbeb0	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-099f-d400-db126afcc20e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-099f-7244-760713fea968	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5588-099f-0703-1c4447964a95	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5588-099f-b842-96dbd525551d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5588-099f-0abc-df15e7bac6bd	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5588-09a0-3fd4-7623b052f923	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5588-09a0-cbbf-2d3f4e705c8a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5588-09a0-c46b-b7889af45975	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5588-09a0-9300-02dfae5184c6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5588-09a0-24a5-e7163a83e12b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5588-09a0-043c-6a31898d2a39	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2842 (class 0 OID 7935857)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5588-09a0-36b0-039a6e03e9b5	00000000-5588-09a0-cbbf-2d3f4e705c8a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5588-09a0-89db-0af40eb48a50	00000000-5588-09a0-cbbf-2d3f4e705c8a	00010000-5588-099f-0971-fecbcab44d63	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5588-09a0-acae-436735342a40	00000000-5588-09a0-c46b-b7889af45975	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2843 (class 0 OID 7935868)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5588-09a0-3929-7dd96fdaef17	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5588-09a0-0e13-62206238da45	00010000-5588-09a0-0400-d6a81c946566	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5588-09a0-61b6-fb0e2d4964ac	00010000-5588-09a0-2cef-f1e62ad25ece	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5588-09a0-ece0-03e292a6f1c8	00010000-5588-09a0-d439-89bef807204f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5588-09a0-64e9-aace2f34e679	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5588-09a0-a79f-4ba6e7c23d84	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5588-09a0-079b-8975a5f7cab4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5588-09a0-11ac-49dd86a746f5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5588-09a0-1619-3cabfd66a13c	00010000-5588-09a0-6f9c-6cb05a551712	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5588-09a0-384e-78f564e2cec6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5588-09a0-8474-d5dec7c95def	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5588-09a0-6d21-e7aaa24ed9b2	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5588-09a0-8bd0-fdad83adc9a2	00010000-5588-09a0-89ed-136b16737a91	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7935822)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5588-099f-763f-19fccfe8f8f7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5588-099f-1a8c-c6466f820df9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5588-099f-40e0-6a8e7745e96d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5588-099f-b1cb-bb4cc9edbad8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5588-099f-d1d7-6e190cf90047	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5588-099f-ac53-d50f00d46345	Abonma-read	Abonma - branje	f
00030000-5588-099f-2d55-73eb49b8ab01	Abonma-write	Abonma - spreminjanje	f
00030000-5588-099f-6352-80c35d3d750d	Alternacija-read	Alternacija - branje	f
00030000-5588-099f-6249-2d520134b8c9	Alternacija-write	Alternacija - spreminjanje	f
00030000-5588-099f-9779-eb13659d047a	Arhivalija-read	Arhivalija - branje	f
00030000-5588-099f-b0a3-308da3f44521	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5588-099f-9fc5-b4c28bb80ce4	Besedilo-read	Besedilo - branje	f
00030000-5588-099f-0d8f-e2604b2dd58b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5588-099f-0818-867ee418a4fb	DogodekIzven-read	DogodekIzven - branje	f
00030000-5588-099f-ad9c-d8abce2e6e6a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5588-099f-7546-a4a81add38e0	Dogodek-read	Dogodek - branje	f
00030000-5588-099f-c799-5648289d0f7a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5588-099f-bf17-5dae5f9faa91	Drzava-read	Drzava - branje	f
00030000-5588-099f-9957-2edd18a9a9f2	Drzava-write	Drzava - spreminjanje	f
00030000-5588-099f-705c-9c97fe83eaeb	Funkcija-read	Funkcija - branje	f
00030000-5588-099f-28c6-a54422ebf2dc	Funkcija-write	Funkcija - spreminjanje	f
00030000-5588-099f-6f04-4cf4b2285719	Gostovanje-read	Gostovanje - branje	f
00030000-5588-099f-b601-e518372428ef	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5588-099f-a3dc-e01f87724d82	Gostujoca-read	Gostujoca - branje	f
00030000-5588-099f-5a00-940007bf5c91	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5588-099f-3300-73917fdbd91f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5588-099f-cdc3-f5b67d346972	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5588-099f-67e3-86545fd66000	Kupec-read	Kupec - branje	f
00030000-5588-099f-37c8-e9234f6816be	Kupec-write	Kupec - spreminjanje	f
00030000-5588-099f-3f26-299050efa427	NacinPlacina-read	NacinPlacina - branje	f
00030000-5588-099f-d23d-7f8aea7d8bda	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5588-099f-1331-809601e3bc43	Option-read	Option - branje	f
00030000-5588-099f-d7bc-44ade5705ced	Option-write	Option - spreminjanje	f
00030000-5588-099f-3f45-96a4cf1d7c8c	OptionValue-read	OptionValue - branje	f
00030000-5588-099f-ff25-85a85705e344	OptionValue-write	OptionValue - spreminjanje	f
00030000-5588-099f-db13-fac49cad870f	Oseba-read	Oseba - branje	f
00030000-5588-099f-e90e-b4292660a9ea	Oseba-write	Oseba - spreminjanje	f
00030000-5588-099f-86fe-5a8dc33f7b79	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5588-099f-1cd2-f5ff7c9c0beb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5588-099f-8729-c690c42cb75a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5588-099f-45d7-b25298418b51	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5588-099f-37ff-e6e07315501c	Pogodba-read	Pogodba - branje	f
00030000-5588-099f-66ff-10254f4570f5	Pogodba-write	Pogodba - spreminjanje	f
00030000-5588-099f-5700-86661fa86b86	Popa-read	Popa - branje	f
00030000-5588-099f-cb6b-86c9a8adce72	Popa-write	Popa - spreminjanje	f
00030000-5588-099f-d8e6-4ff5e40e0e85	Posta-read	Posta - branje	f
00030000-5588-099f-6439-110a897fecad	Posta-write	Posta - spreminjanje	f
00030000-5588-099f-593f-78bc3074339c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5588-099f-9737-aabcaafacddd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5588-099f-0b62-4a5893720234	PostniNaslov-read	PostniNaslov - branje	f
00030000-5588-099f-7496-4cd706cdf879	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5588-099f-4eb9-5d9703997a84	Predstava-read	Predstava - branje	f
00030000-5588-099f-2b05-950ecc5d8b2d	Predstava-write	Predstava - spreminjanje	f
00030000-5588-099f-fd08-71566769e18b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5588-099f-787b-c5540d35b5ac	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5588-099f-7256-bac2fafb473a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5588-099f-5c3d-55453916fc58	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5588-099f-96e6-bc7d4af0ea58	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5588-099f-b441-bac875c0629e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5588-099f-52ed-4519393bfebe	ProgramDela-read	ProgramDela - branje	f
00030000-5588-099f-e3a1-05c30a7f5373	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5588-099f-80a1-43b0d1dd9369	ProgramFestival-read	ProgramFestival - branje	f
00030000-5588-099f-07b7-0f8e669366a6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5588-099f-b2ba-a39cc348bc2d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5588-099f-82cc-71a150639017	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5588-099f-b3ac-f52059a873bf	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5588-099f-f48b-dac85fcb6922	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5588-099f-24d0-0867e6d70fb1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5588-099f-faf0-9580bbf19a02	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5588-099f-5fa2-ae9cdbf02e97	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5588-099f-0b76-f9843089bf07	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5588-099f-6f20-42a86a65e285	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5588-099f-99d2-778677688691	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5588-099f-3002-32eff23a1f92	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5588-099f-5696-5152aac75b05	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5588-099f-eda5-884cb454482b	ProgramRazno-read	ProgramRazno - branje	f
00030000-5588-099f-3e2e-f3007ff63036	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5588-099f-e460-7a77741b4515	Prostor-read	Prostor - branje	f
00030000-5588-099f-6a44-84c0a0492754	Prostor-write	Prostor - spreminjanje	f
00030000-5588-099f-5cac-63af5a5e4ae0	Racun-read	Racun - branje	f
00030000-5588-099f-46ff-889199daefe7	Racun-write	Racun - spreminjanje	f
00030000-5588-099f-78a6-615c4e6e9803	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5588-099f-d93a-846b1fb0ef38	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5588-099f-3802-a0e09b824c93	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5588-099f-1c9f-a26294523578	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5588-099f-c2d1-80a927e0d087	Rekvizit-read	Rekvizit - branje	f
00030000-5588-099f-fa07-9e697f8f1733	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5588-099f-c56a-991ebe66213e	Revizija-read	Revizija - branje	f
00030000-5588-099f-89d3-63227579423a	Revizija-write	Revizija - spreminjanje	f
00030000-5588-099f-7145-7e2a6c3cb41c	Rezervacija-read	Rezervacija - branje	f
00030000-5588-099f-5f6d-6a682ee248ec	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5588-099f-fe2b-f5c979b8a85c	SedezniRed-read	SedezniRed - branje	f
00030000-5588-099f-f30a-ff0b6c3b14ec	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5588-099f-71b2-704cf7fd526d	Sedez-read	Sedez - branje	f
00030000-5588-099f-d11b-3c9075cdd618	Sedez-write	Sedez - spreminjanje	f
00030000-5588-099f-83a1-ed37392d4d10	Sezona-read	Sezona - branje	f
00030000-5588-099f-8b5a-546d84f08f7b	Sezona-write	Sezona - spreminjanje	f
00030000-5588-099f-cdef-f56b030e7900	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5588-099f-bda3-191d52648d43	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5588-099f-ebc0-e96d8c2e72f0	Stevilcenje-read	Stevilcenje - branje	f
00030000-5588-099f-e60f-ae2d80a27dbb	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5588-099f-182b-089cf243efd5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5588-099f-1076-566e6b794bbe	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5588-099f-5d1f-08744b2435c2	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5588-099f-0210-7213eb169daa	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5588-099f-6f10-f6f96572f431	Telefonska-read	Telefonska - branje	f
00030000-5588-099f-f1b4-bec3eb417c18	Telefonska-write	Telefonska - spreminjanje	f
00030000-5588-099f-2d35-392ff30a4b2f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5588-099f-713b-02dfd559eabf	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5588-099f-908b-45edcbbfc330	TipFunkcije-read	TipFunkcije - branje	f
00030000-5588-099f-e11e-7ef1a2b364b7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5588-099f-86df-88594af98247	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5588-099f-c768-a321c880e28a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5588-099f-f549-62b21c8b78fa	Trr-read	Trr - branje	f
00030000-5588-099f-19b8-5a1c8c4841cc	Trr-write	Trr - spreminjanje	f
00030000-5588-099f-536a-fbe194451945	Uprizoritev-read	Uprizoritev - branje	f
00030000-5588-099f-4dd2-56c909abcc19	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5588-099f-141a-2746820da6d3	Vaja-read	Vaja - branje	f
00030000-5588-099f-a063-ff4fd508df33	Vaja-write	Vaja - spreminjanje	f
00030000-5588-099f-bd7b-9933c97eb0f6	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5588-099f-d1ae-7e664a9f7dbd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5588-099f-d491-fd2ead30a4c8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5588-099f-24a6-f5b1c5d461a7	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5588-099f-d82e-ffd762c0369e	Zasedenost-read	Zasedenost - branje	f
00030000-5588-099f-9889-74bde96fae62	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5588-099f-b60f-fb968bb96848	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5588-099f-31a6-59ed55cdab1a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5588-099f-3abd-2a6b1740fa84	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5588-099f-9cd6-84be14bc633f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2840 (class 0 OID 7935841)
-- Dependencies: 181
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5588-099f-2d88-dfa5c052940e	00030000-5588-099f-1a8c-c6466f820df9
00020000-5588-099f-4e3c-a682d146a59e	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-ac53-d50f00d46345
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-2d55-73eb49b8ab01
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-6352-80c35d3d750d
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-6249-2d520134b8c9
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-9779-eb13659d047a
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-7546-a4a81add38e0
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-b1cb-bb4cc9edbad8
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-c799-5648289d0f7a
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-9957-2edd18a9a9f2
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-705c-9c97fe83eaeb
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-28c6-a54422ebf2dc
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-6f04-4cf4b2285719
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-b601-e518372428ef
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-a3dc-e01f87724d82
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-5a00-940007bf5c91
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-3300-73917fdbd91f
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-cdc3-f5b67d346972
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-1331-809601e3bc43
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-3f45-96a4cf1d7c8c
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-db13-fac49cad870f
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-e90e-b4292660a9ea
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-5700-86661fa86b86
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-cb6b-86c9a8adce72
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-d8e6-4ff5e40e0e85
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-6439-110a897fecad
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-0b62-4a5893720234
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-7496-4cd706cdf879
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-4eb9-5d9703997a84
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-2b05-950ecc5d8b2d
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-96e6-bc7d4af0ea58
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-b441-bac875c0629e
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-e460-7a77741b4515
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-6a44-84c0a0492754
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-3802-a0e09b824c93
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-1c9f-a26294523578
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-c2d1-80a927e0d087
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-fa07-9e697f8f1733
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-83a1-ed37392d4d10
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-8b5a-546d84f08f7b
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-908b-45edcbbfc330
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-536a-fbe194451945
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-4dd2-56c909abcc19
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-141a-2746820da6d3
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-a063-ff4fd508df33
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-d82e-ffd762c0369e
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-9889-74bde96fae62
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-b60f-fb968bb96848
00020000-5588-099f-d9a5-98ac88600a98	00030000-5588-099f-3abd-2a6b1740fa84
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-ac53-d50f00d46345
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-9779-eb13659d047a
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-7546-a4a81add38e0
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-6f04-4cf4b2285719
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-a3dc-e01f87724d82
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-3300-73917fdbd91f
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-cdc3-f5b67d346972
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-1331-809601e3bc43
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-3f45-96a4cf1d7c8c
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-db13-fac49cad870f
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-e90e-b4292660a9ea
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-5700-86661fa86b86
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-d8e6-4ff5e40e0e85
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-0b62-4a5893720234
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-7496-4cd706cdf879
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-4eb9-5d9703997a84
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-e460-7a77741b4515
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-3802-a0e09b824c93
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-c2d1-80a927e0d087
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-83a1-ed37392d4d10
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-6f10-f6f96572f431
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-f1b4-bec3eb417c18
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-f549-62b21c8b78fa
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-19b8-5a1c8c4841cc
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-d491-fd2ead30a4c8
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-24a6-f5b1c5d461a7
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-b60f-fb968bb96848
00020000-5588-099f-ea87-96e50e4d5a9e	00030000-5588-099f-3abd-2a6b1740fa84
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-ac53-d50f00d46345
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-6352-80c35d3d750d
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-9779-eb13659d047a
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-b0a3-308da3f44521
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-9fc5-b4c28bb80ce4
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-0818-867ee418a4fb
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-7546-a4a81add38e0
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-705c-9c97fe83eaeb
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-6f04-4cf4b2285719
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-a3dc-e01f87724d82
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-3300-73917fdbd91f
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-1331-809601e3bc43
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-3f45-96a4cf1d7c8c
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-db13-fac49cad870f
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-5700-86661fa86b86
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-d8e6-4ff5e40e0e85
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-4eb9-5d9703997a84
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-96e6-bc7d4af0ea58
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-e460-7a77741b4515
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-3802-a0e09b824c93
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-c2d1-80a927e0d087
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-83a1-ed37392d4d10
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-908b-45edcbbfc330
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-141a-2746820da6d3
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-d82e-ffd762c0369e
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-b60f-fb968bb96848
00020000-5588-099f-c7b6-01972b786d56	00030000-5588-099f-3abd-2a6b1740fa84
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-ac53-d50f00d46345
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-2d55-73eb49b8ab01
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-6249-2d520134b8c9
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-9779-eb13659d047a
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-7546-a4a81add38e0
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-6f04-4cf4b2285719
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-a3dc-e01f87724d82
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-1331-809601e3bc43
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-3f45-96a4cf1d7c8c
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-5700-86661fa86b86
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-d8e6-4ff5e40e0e85
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-4eb9-5d9703997a84
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-e460-7a77741b4515
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-3802-a0e09b824c93
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-c2d1-80a927e0d087
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-83a1-ed37392d4d10
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-908b-45edcbbfc330
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-b60f-fb968bb96848
00020000-5588-099f-bf74-41f49c77a319	00030000-5588-099f-3abd-2a6b1740fa84
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-ac53-d50f00d46345
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-9779-eb13659d047a
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-7546-a4a81add38e0
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-6f04-4cf4b2285719
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-a3dc-e01f87724d82
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-1331-809601e3bc43
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-3f45-96a4cf1d7c8c
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-5700-86661fa86b86
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-d8e6-4ff5e40e0e85
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-4eb9-5d9703997a84
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-e460-7a77741b4515
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-3802-a0e09b824c93
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-c2d1-80a927e0d087
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-83a1-ed37392d4d10
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-2d35-392ff30a4b2f
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-40e0-6a8e7745e96d
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-908b-45edcbbfc330
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-b60f-fb968bb96848
00020000-5588-099f-c53b-96fa8e7df263	00030000-5588-099f-3abd-2a6b1740fa84
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-763f-19fccfe8f8f7
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-1a8c-c6466f820df9
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-40e0-6a8e7745e96d
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b1cb-bb4cc9edbad8
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d1d7-6e190cf90047
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-ac53-d50f00d46345
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-2d55-73eb49b8ab01
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6352-80c35d3d750d
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6249-2d520134b8c9
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-9779-eb13659d047a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b0a3-308da3f44521
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-9fc5-b4c28bb80ce4
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-0d8f-e2604b2dd58b
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-0818-867ee418a4fb
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-ad9c-d8abce2e6e6a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-7546-a4a81add38e0
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-c799-5648289d0f7a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-bf17-5dae5f9faa91
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-9957-2edd18a9a9f2
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-705c-9c97fe83eaeb
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-28c6-a54422ebf2dc
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6f04-4cf4b2285719
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b601-e518372428ef
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-a3dc-e01f87724d82
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5a00-940007bf5c91
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3300-73917fdbd91f
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-cdc3-f5b67d346972
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-67e3-86545fd66000
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-37c8-e9234f6816be
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3f26-299050efa427
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d23d-7f8aea7d8bda
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-1331-809601e3bc43
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d7bc-44ade5705ced
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3f45-96a4cf1d7c8c
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-ff25-85a85705e344
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-db13-fac49cad870f
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-e90e-b4292660a9ea
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-86fe-5a8dc33f7b79
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-1cd2-f5ff7c9c0beb
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-8729-c690c42cb75a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-45d7-b25298418b51
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-37ff-e6e07315501c
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-66ff-10254f4570f5
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5700-86661fa86b86
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-cb6b-86c9a8adce72
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d8e6-4ff5e40e0e85
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6439-110a897fecad
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-593f-78bc3074339c
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-9737-aabcaafacddd
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-0b62-4a5893720234
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-7496-4cd706cdf879
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-4eb9-5d9703997a84
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-2b05-950ecc5d8b2d
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-fd08-71566769e18b
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-787b-c5540d35b5ac
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-7256-bac2fafb473a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5c3d-55453916fc58
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-96e6-bc7d4af0ea58
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b441-bac875c0629e
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-52ed-4519393bfebe
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-e3a1-05c30a7f5373
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-80a1-43b0d1dd9369
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-07b7-0f8e669366a6
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b2ba-a39cc348bc2d
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-82cc-71a150639017
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b3ac-f52059a873bf
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-f48b-dac85fcb6922
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-24d0-0867e6d70fb1
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-faf0-9580bbf19a02
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5fa2-ae9cdbf02e97
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-0b76-f9843089bf07
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6f20-42a86a65e285
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-99d2-778677688691
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3002-32eff23a1f92
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5696-5152aac75b05
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-eda5-884cb454482b
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3e2e-f3007ff63036
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-e460-7a77741b4515
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6a44-84c0a0492754
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5cac-63af5a5e4ae0
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-46ff-889199daefe7
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-78a6-615c4e6e9803
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d93a-846b1fb0ef38
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3802-a0e09b824c93
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-1c9f-a26294523578
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-c2d1-80a927e0d087
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-fa07-9e697f8f1733
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-c56a-991ebe66213e
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-89d3-63227579423a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-7145-7e2a6c3cb41c
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5f6d-6a682ee248ec
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-fe2b-f5c979b8a85c
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-f30a-ff0b6c3b14ec
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-71b2-704cf7fd526d
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d11b-3c9075cdd618
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-83a1-ed37392d4d10
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-8b5a-546d84f08f7b
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-cdef-f56b030e7900
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-bda3-191d52648d43
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-ebc0-e96d8c2e72f0
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-e60f-ae2d80a27dbb
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-182b-089cf243efd5
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-1076-566e6b794bbe
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-5d1f-08744b2435c2
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-0210-7213eb169daa
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-6f10-f6f96572f431
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-f1b4-bec3eb417c18
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-2d35-392ff30a4b2f
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-713b-02dfd559eabf
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-908b-45edcbbfc330
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-e11e-7ef1a2b364b7
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-86df-88594af98247
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-c768-a321c880e28a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-f549-62b21c8b78fa
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-19b8-5a1c8c4841cc
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-536a-fbe194451945
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-4dd2-56c909abcc19
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-141a-2746820da6d3
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-a063-ff4fd508df33
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-bd7b-9933c97eb0f6
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d1ae-7e664a9f7dbd
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d491-fd2ead30a4c8
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-24a6-f5b1c5d461a7
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-d82e-ffd762c0369e
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-9889-74bde96fae62
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-b60f-fb968bb96848
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-31a6-59ed55cdab1a
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-3abd-2a6b1740fa84
00020000-5588-09a0-1bc5-068d49bf63f5	00030000-5588-099f-9cd6-84be14bc633f
\.


--
-- TOC entry 2868 (class 0 OID 7936136)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7936167)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7936303)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5588-09a0-8252-0aea213e5e12	00090000-5588-09a0-3929-7dd96fdaef17	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2845 (class 0 OID 7935901)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5588-09a0-efd9-0230c84b7114	00040000-5588-099e-fca6-8f1fac71f788	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-09a0-f6aa-4e7f44729132	00040000-5588-099e-fca6-8f1fac71f788	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-09a0-3440-926438cc500e	00040000-5588-099e-fca6-8f1fac71f788	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-09a0-f2ac-251a1813b46a	00040000-5588-099e-fca6-8f1fac71f788	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-09a0-2358-4a52fc2159c0	00040000-5588-099e-fca6-8f1fac71f788	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-09a0-a723-be1f86618c57	00040000-5588-099f-8d49-74d747de13d4	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2847 (class 0 OID 7935936)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5588-099f-29a2-7fc897ecc0a1	8341	Adlešiči
00050000-5588-099f-ce61-2e063a130324	5270	Ajdovščina
00050000-5588-099f-00d0-37123bc02672	6280	Ankaran/Ancarano
00050000-5588-099f-c723-ce5a2aa79f01	9253	Apače
00050000-5588-099f-a4f1-712dd0d03a4d	8253	Artiče
00050000-5588-099f-4a74-3e528230fa48	4275	Begunje na Gorenjskem
00050000-5588-099f-ccf2-bcec3c0e974d	1382	Begunje pri Cerknici
00050000-5588-099f-50b1-a0e3a0b93eeb	9231	Beltinci
00050000-5588-099f-3cc2-03b45db3679f	2234	Benedikt
00050000-5588-099f-572b-64cf1b6e10cb	2345	Bistrica ob Dravi
00050000-5588-099f-08b0-2b4f5a712ffe	3256	Bistrica ob Sotli
00050000-5588-099f-e2a2-cb268321e749	8259	Bizeljsko
00050000-5588-099f-c9a6-524f62cff9d9	1223	Blagovica
00050000-5588-099f-4b86-20598a259041	8283	Blanca
00050000-5588-099f-2fcc-4b0a0ffaabf8	4260	Bled
00050000-5588-099f-68ad-c143e3577caa	4273	Blejska Dobrava
00050000-5588-099f-1cdc-829543a3f30f	9265	Bodonci
00050000-5588-099f-b0cf-37d5edd10b2b	9222	Bogojina
00050000-5588-099f-3d1d-a79d4d9d20e5	4263	Bohinjska Bela
00050000-5588-099f-74be-23c95050aa70	4264	Bohinjska Bistrica
00050000-5588-099f-ee31-78eb3cc21a8c	4265	Bohinjsko jezero
00050000-5588-099f-a44d-447553fff05e	1353	Borovnica
00050000-5588-099f-f612-a2ac0ef12d09	8294	Boštanj
00050000-5588-099f-8d67-288f8b0710fb	5230	Bovec
00050000-5588-099f-c34f-7bbd5cc7df2e	5295	Branik
00050000-5588-099f-2d82-59416730f595	3314	Braslovče
00050000-5588-099f-aafa-6712d9fb582c	5223	Breginj
00050000-5588-099f-19fe-26a7295fdd67	8280	Brestanica
00050000-5588-099f-615b-3882a657c783	2354	Bresternica
00050000-5588-099f-39ca-f0c0d924355f	4243	Brezje
00050000-5588-099f-d9b7-d9d540f19a7b	1351	Brezovica pri Ljubljani
00050000-5588-099f-d653-aaa5d28b0f85	8250	Brežice
00050000-5588-099f-2505-892d69d9cf13	4210	Brnik - Aerodrom
00050000-5588-099f-5d69-b14e53d1ce09	8321	Brusnice
00050000-5588-099f-07c9-8ec3f4fe3d44	3255	Buče
00050000-5588-099f-5151-ff8eb9d3b0e2	8276	Bučka 
00050000-5588-099f-6e9a-b6e9abc7af7c	9261	Cankova
00050000-5588-099f-7937-9884c622af23	3000	Celje 
00050000-5588-099f-7e64-eae4678a5590	3001	Celje - poštni predali
00050000-5588-099f-1084-9eedb66d240a	4207	Cerklje na Gorenjskem
00050000-5588-099f-8992-a4ed97e50e07	8263	Cerklje ob Krki
00050000-5588-099f-856d-1f1a606943e0	1380	Cerknica
00050000-5588-099f-1ac0-fdbcd218f012	5282	Cerkno
00050000-5588-099f-d902-a992f62a6b95	2236	Cerkvenjak
00050000-5588-099f-b9b0-9e28132c1720	2215	Ceršak
00050000-5588-099f-22c3-6d91110e16ac	2326	Cirkovce
00050000-5588-099f-65a6-e36917b39e31	2282	Cirkulane
00050000-5588-099f-f71a-c17f5d2180c2	5273	Col
00050000-5588-099f-ab8f-3b73fd4a570e	8251	Čatež ob Savi
00050000-5588-099f-e21a-850d330ae8d9	1413	Čemšenik
00050000-5588-099f-f12e-828c8f0454e1	5253	Čepovan
00050000-5588-099f-abba-b9bc84dd5e35	9232	Črenšovci
00050000-5588-099f-00c9-9caa1c2bb57d	2393	Črna na Koroškem
00050000-5588-099f-d45f-e41590d8e1f2	6275	Črni Kal
00050000-5588-099f-6994-5cad0b7810f0	5274	Črni Vrh nad Idrijo
00050000-5588-099f-5597-44c0fa7db7e9	5262	Črniče
00050000-5588-099f-35ce-5d4df83e792b	8340	Črnomelj
00050000-5588-099f-dae7-6c74917267bd	6271	Dekani
00050000-5588-099f-4175-378cadc74685	5210	Deskle
00050000-5588-099f-bb4b-27cd4277859d	2253	Destrnik
00050000-5588-099f-6f96-a457801891d2	6215	Divača
00050000-5588-099f-371f-d06ccbad7cc4	1233	Dob
00050000-5588-099f-0bc7-3add635ca290	3224	Dobje pri Planini
00050000-5588-099f-a75a-02cdc44b1941	8257	Dobova
00050000-5588-099f-7b7f-1dbdcb403f33	1423	Dobovec
00050000-5588-099f-f117-74b251f3abc0	5263	Dobravlje
00050000-5588-099f-a43b-d931053908fa	3204	Dobrna
00050000-5588-099f-1f2f-cbe451823cc5	8211	Dobrnič
00050000-5588-099f-1e9c-934c537c49d1	1356	Dobrova
00050000-5588-099f-7437-1a6ae9b9cc15	9223	Dobrovnik/Dobronak 
00050000-5588-099f-8d84-e75678dfc28b	5212	Dobrovo v Brdih
00050000-5588-099f-2c68-3be106e1b9f8	1431	Dol pri Hrastniku
00050000-5588-099f-efcf-4d9df3d42a94	1262	Dol pri Ljubljani
00050000-5588-099f-b802-9fcaa64f7c0e	1273	Dole pri Litiji
00050000-5588-099f-0d43-d35e1acde117	1331	Dolenja vas
00050000-5588-099f-bc07-0bac341b3f89	8350	Dolenjske Toplice
00050000-5588-099f-e090-7c5ed410dab5	1230	Domžale
00050000-5588-099f-d7b4-e18563ecdd60	2252	Dornava
00050000-5588-099f-9ab7-ae3e77517678	5294	Dornberk
00050000-5588-099f-4f2e-4d3697bc607d	1319	Draga
00050000-5588-099f-92b6-cbd092eb3886	8343	Dragatuš
00050000-5588-099f-0d1d-107ad6b90700	3222	Dramlje
00050000-5588-099f-2d81-2785f1759f80	2370	Dravograd
00050000-5588-099f-7da1-81e6cf3e8e91	4203	Duplje
00050000-5588-099f-d5af-7e0994999a63	6221	Dutovlje
00050000-5588-099f-6452-37d23200a23f	8361	Dvor
00050000-5588-099f-d8e7-f446c69ee646	2343	Fala
00050000-5588-099f-3130-0f5b4d4453a0	9208	Fokovci
00050000-5588-099f-6438-8e8a71011b46	2313	Fram
00050000-5588-099f-a379-d87761e9354d	3213	Frankolovo
00050000-5588-099f-8b25-cc5005b4a9a0	1274	Gabrovka
00050000-5588-099f-9f65-708f4bec8a68	8254	Globoko
00050000-5588-099f-fd12-096dbf9e2faa	5275	Godovič
00050000-5588-099f-f37a-181ca63d176b	4204	Golnik
00050000-5588-099f-9517-1389c163076e	3303	Gomilsko
00050000-5588-099f-19bc-a2deb7d4d678	4224	Gorenja vas
00050000-5588-099f-005d-166314b2425f	3263	Gorica pri Slivnici
00050000-5588-099f-b10c-1b86570f01e1	2272	Gorišnica
00050000-5588-099f-93ec-c9aaadd4174a	9250	Gornja Radgona
00050000-5588-099f-0dfc-4a9a845c3ff1	3342	Gornji Grad
00050000-5588-099f-3a75-87cf59be327f	4282	Gozd Martuljek
00050000-5588-099f-2a7c-c4285ca1e909	6272	Gračišče
00050000-5588-099f-44cf-cdfb749d6769	9264	Grad
00050000-5588-099f-eef6-e988e01551cb	8332	Gradac
00050000-5588-099f-302e-a6f7620d9489	1384	Grahovo
00050000-5588-099f-a86e-f34044152e9a	5242	Grahovo ob Bači
00050000-5588-099f-7c6d-a7e0fdb89ce1	5251	Grgar
00050000-5588-099f-ecc4-1c5ab2cddb5b	3302	Griže
00050000-5588-099f-ac1a-7b465e690d9e	3231	Grobelno
00050000-5588-099f-3f2a-760c7462d412	1290	Grosuplje
00050000-5588-099f-cae5-af1d5b225233	2288	Hajdina
00050000-5588-099f-b768-f68e563d92ab	8362	Hinje
00050000-5588-099f-3d75-bbe490de3f5b	2311	Hoče
00050000-5588-099f-b08e-58cc278e3175	9205	Hodoš/Hodos
00050000-5588-099f-04f2-de55ce636ed2	1354	Horjul
00050000-5588-099f-796c-d7feafdd5e8d	1372	Hotedršica
00050000-5588-099f-0cc6-8bb43d275ce7	1430	Hrastnik
00050000-5588-099f-0f74-f0ce6a31300d	6225	Hruševje
00050000-5588-099f-e1cc-8e71dfd04e87	4276	Hrušica
00050000-5588-099f-ca65-220fdb383bd8	5280	Idrija
00050000-5588-099f-7237-eb906053817e	1292	Ig
00050000-5588-099f-2e82-49f1644aac9a	6250	Ilirska Bistrica
00050000-5588-099f-f7a5-4b13e7d9532e	6251	Ilirska Bistrica-Trnovo
00050000-5588-099f-ebc9-d5a41aece2ef	1295	Ivančna Gorica
00050000-5588-099f-6eff-e008868fde3b	2259	Ivanjkovci
00050000-5588-099f-fb99-e108a6081df8	1411	Izlake
00050000-5588-099f-11d8-9ab972451be0	6310	Izola/Isola
00050000-5588-099f-4e09-bfba75d3cb4d	2222	Jakobski Dol
00050000-5588-099f-6749-b698add3bb95	2221	Jarenina
00050000-5588-099f-4164-a86523eb86e6	6254	Jelšane
00050000-5588-099f-e126-81ac6524435f	4270	Jesenice
00050000-5588-099f-2683-1d8afe132b82	8261	Jesenice na Dolenjskem
00050000-5588-099f-390f-42570c02473f	3273	Jurklošter
00050000-5588-099f-756a-b274268b566a	2223	Jurovski Dol
00050000-5588-099f-7770-b5a8303f314f	2256	Juršinci
00050000-5588-099f-077f-7355d85ff316	5214	Kal nad Kanalom
00050000-5588-099f-63e2-343f94d25704	3233	Kalobje
00050000-5588-099f-ac50-57351cc0089b	4246	Kamna Gorica
00050000-5588-099f-a6a7-2531fa8ef038	2351	Kamnica
00050000-5588-099f-9de2-540cc1069c2f	1241	Kamnik
00050000-5588-099f-ee99-ebf0e9ecdd8e	5213	Kanal
00050000-5588-099f-2a26-af93831aa8b9	8258	Kapele
00050000-5588-099f-376b-baf812464292	2362	Kapla
00050000-5588-099f-7320-52588633b3ff	2325	Kidričevo
00050000-5588-099f-76c8-316b9f1a43df	1412	Kisovec
00050000-5588-099f-468c-81f46ed83c47	6253	Knežak
00050000-5588-099f-b038-80c67914f614	5222	Kobarid
00050000-5588-099f-cb75-36f557a18026	9227	Kobilje
00050000-5588-099f-012e-73957a8fffa3	1330	Kočevje
00050000-5588-099f-296a-7f52dbfc0cb5	1338	Kočevska Reka
00050000-5588-099f-3d97-244e81f2166d	2276	Kog
00050000-5588-099f-e407-b87f1cf78b55	5211	Kojsko
00050000-5588-099f-51a6-cf96c0b775b8	6223	Komen
00050000-5588-099f-d98c-dd1eb8c68513	1218	Komenda
00050000-5588-099f-9a98-f039da4b659b	6000	Koper/Capodistria 
00050000-5588-099f-0288-e363090b3b7e	6001	Koper/Capodistria - poštni predali
00050000-5588-099f-bce6-62e94f47b2ba	8282	Koprivnica
00050000-5588-099f-15d1-959e9ab4b272	5296	Kostanjevica na Krasu
00050000-5588-099f-246e-f66f425efd5e	8311	Kostanjevica na Krki
00050000-5588-099f-7a5a-65dae12de74c	1336	Kostel
00050000-5588-099f-af13-3a13e03b08fb	6256	Košana
00050000-5588-099f-e2a0-8e63936957b7	2394	Kotlje
00050000-5588-099f-2fe1-980e28e4a6d8	6240	Kozina
00050000-5588-099f-9e7e-92268277ac1e	3260	Kozje
00050000-5588-099f-f19d-8a6ec593a4f1	4000	Kranj 
00050000-5588-099f-e2df-913633d1f84d	4001	Kranj - poštni predali
00050000-5588-099f-af6f-f7c72b12ba1a	4280	Kranjska Gora
00050000-5588-099f-3d2a-1f7a95eb06a0	1281	Kresnice
00050000-5588-099f-fe8b-eae715a3511a	4294	Križe
00050000-5588-099f-e537-c76761627db3	9206	Križevci
00050000-5588-099f-6dbe-d965cb4797fb	9242	Križevci pri Ljutomeru
00050000-5588-099f-c634-677a86d4f2ef	1301	Krka
00050000-5588-099f-8024-307b6ab6a9ba	8296	Krmelj
00050000-5588-099f-8172-b7eeee2bca11	4245	Kropa
00050000-5588-099f-2e6c-8bb28a8c6f9b	8262	Krška vas
00050000-5588-099f-899c-83d5aa92be39	8270	Krško
00050000-5588-099f-1b86-fe70eea13a81	9263	Kuzma
00050000-5588-099f-e341-208c811fc16b	2318	Laporje
00050000-5588-099f-6f5f-fe8ccbb6f26a	3270	Laško
00050000-5588-099f-2e90-7c339a90ccd6	1219	Laze v Tuhinju
00050000-5588-099f-ce96-c00e97425609	2230	Lenart v Slovenskih goricah
00050000-5588-099f-d23f-a9d1e5bd0c02	9220	Lendava/Lendva
00050000-5588-099f-eb0b-752cb0112199	4248	Lesce
00050000-5588-099f-d0a1-5762f0cccc32	3261	Lesično
00050000-5588-099f-dbef-6e9702befdb1	8273	Leskovec pri Krškem
00050000-5588-099f-05fa-12be2af15485	2372	Libeliče
00050000-5588-099f-e693-eec6c9d9b1a6	2341	Limbuš
00050000-5588-099f-e1c1-515778d069dc	1270	Litija
00050000-5588-099f-09a7-1f385bed9e73	3202	Ljubečna
00050000-5588-099f-2e3c-b92d1d271481	1000	Ljubljana 
00050000-5588-099f-4982-351b3ce48a1d	1001	Ljubljana - poštni predali
00050000-5588-099f-209a-b4335b0ba143	1231	Ljubljana - Črnuče
00050000-5588-099f-acec-0b7b56806fbe	1261	Ljubljana - Dobrunje
00050000-5588-099f-23ff-fc9ce9e0cdac	1260	Ljubljana - Polje
00050000-5588-099f-ac98-f15c6d680286	1210	Ljubljana - Šentvid
00050000-5588-099f-e0c5-caa47c2bfd38	1211	Ljubljana - Šmartno
00050000-5588-099f-080e-53e1c9055055	3333	Ljubno ob Savinji
00050000-5588-099f-6675-bd5ecf1521fe	9240	Ljutomer
00050000-5588-099f-4697-7c7398a7c2c7	3215	Loče
00050000-5588-099f-c109-8aef42ac5ce8	5231	Log pod Mangartom
00050000-5588-099f-2560-6201fd7456c8	1358	Log pri Brezovici
00050000-5588-099f-b07a-e0f7439c1a22	1370	Logatec
00050000-5588-099f-3568-91201a44830c	1371	Logatec
00050000-5588-099f-26f8-05e52ca97224	1434	Loka pri Zidanem Mostu
00050000-5588-099f-e2ed-0caf0c14a1c6	3223	Loka pri Žusmu
00050000-5588-099f-0980-faba01c466e0	6219	Lokev
00050000-5588-099f-e9c4-dffb445e58c2	1318	Loški Potok
00050000-5588-099f-c9fd-a8f90210fefa	2324	Lovrenc na Dravskem polju
00050000-5588-099f-5003-7425fe681550	2344	Lovrenc na Pohorju
00050000-5588-099f-6d2a-97cc8019812e	3334	Luče
00050000-5588-099f-bba9-9f11a15660d0	1225	Lukovica
00050000-5588-099f-2add-f222dae199b2	9202	Mačkovci
00050000-5588-099f-3c61-eec9663fc20f	2322	Majšperk
00050000-5588-099f-5599-b9491de1f59c	2321	Makole
00050000-5588-099f-3f4d-58e3d1abcbb8	9243	Mala Nedelja
00050000-5588-099f-972e-6edce0663ae6	2229	Malečnik
00050000-5588-099f-009f-901483b1e22f	6273	Marezige
00050000-5588-099f-8ad0-b4f8efb7d7db	2000	Maribor 
00050000-5588-099f-0214-bf8da62f9b18	2001	Maribor - poštni predali
00050000-5588-099f-3755-6f532a660ab5	2206	Marjeta na Dravskem polju
00050000-5588-099f-11ef-7f665dce7c55	2281	Markovci
00050000-5588-099f-4b81-55f837db5123	9221	Martjanci
00050000-5588-099f-92db-7fa84e8780d6	6242	Materija
00050000-5588-099f-b324-7f01f6430ce9	4211	Mavčiče
00050000-5588-099f-313f-96a594183db5	1215	Medvode
00050000-5588-099f-ad2b-e8cbea051031	1234	Mengeš
00050000-5588-099f-050e-e7ac1b65c59c	8330	Metlika
00050000-5588-099f-1b2a-c90b68e35b41	2392	Mežica
00050000-5588-099f-0e84-4ec3ad0b7edf	2204	Miklavž na Dravskem polju
00050000-5588-099f-669d-33ecfffdc189	2275	Miklavž pri Ormožu
00050000-5588-099f-b6c5-9dde010f459b	5291	Miren
00050000-5588-099f-3c86-20040a013ba2	8233	Mirna
00050000-5588-099f-9554-d94d68425108	8216	Mirna Peč
00050000-5588-099f-f6fa-c93122229c1f	2382	Mislinja
00050000-5588-099f-4fb9-e9afa683ada9	4281	Mojstrana
00050000-5588-099f-2c43-c17b103d51fa	8230	Mokronog
00050000-5588-099f-b684-646b1f9114a9	1251	Moravče
00050000-5588-099f-e812-927660462558	9226	Moravske Toplice
00050000-5588-099f-4c75-68331d9ef5c7	5216	Most na Soči
00050000-5588-099f-70a7-58072811f573	1221	Motnik
00050000-5588-099f-63e7-165ad7d6c103	3330	Mozirje
00050000-5588-099f-a179-b3437e0931c7	9000	Murska Sobota 
00050000-5588-099f-0383-e244d702f91c	9001	Murska Sobota - poštni predali
00050000-5588-099f-7669-69ea91cc05ef	2366	Muta
00050000-5588-099f-d016-64d654714a8b	4202	Naklo
00050000-5588-099f-0bc3-dc4278493fe5	3331	Nazarje
00050000-5588-099f-bd5d-b1a1c144618a	1357	Notranje Gorice
00050000-5588-099f-b49c-57ee4561fe8d	3203	Nova Cerkev
00050000-5588-099f-15a4-eec205b06c30	5000	Nova Gorica 
00050000-5588-099f-0d88-04df68caac10	5001	Nova Gorica - poštni predali
00050000-5588-099f-79df-0ca1579749d1	1385	Nova vas
00050000-5588-099f-5fd9-6d9f7b6bd00e	8000	Novo mesto
00050000-5588-099f-395c-190caf68ede6	8001	Novo mesto - poštni predali
00050000-5588-099f-45b9-9806dfd49dac	6243	Obrov
00050000-5588-099f-eefd-d5df9decc3a5	9233	Odranci
00050000-5588-099f-18a1-1ffd69f2f57b	2317	Oplotnica
00050000-5588-099f-5c78-be9ebba39211	2312	Orehova vas
00050000-5588-099f-a112-3ec808867d84	2270	Ormož
00050000-5588-099f-0858-e723d1da1818	1316	Ortnek
00050000-5588-099f-760f-dd1339e58780	1337	Osilnica
00050000-5588-099f-fc26-fc16704fc197	8222	Otočec
00050000-5588-099f-3273-b12011691734	2361	Ožbalt
00050000-5588-099f-cc62-3204561bcfef	2231	Pernica
00050000-5588-099f-8a82-a7e9ec848775	2211	Pesnica pri Mariboru
00050000-5588-099f-cc75-fc6baf0f9554	9203	Petrovci
00050000-5588-099f-b9c2-a63acf0ece42	3301	Petrovče
00050000-5588-099f-b2af-cc4d5fbafff4	6330	Piran/Pirano
00050000-5588-099f-bba1-87efae1ae1be	8255	Pišece
00050000-5588-099f-a3f6-101f20b798a3	6257	Pivka
00050000-5588-099f-77ae-d51286d204eb	6232	Planina
00050000-5588-099f-7331-fd2db25a5762	3225	Planina pri Sevnici
00050000-5588-099f-50c2-c954a7925697	6276	Pobegi
00050000-5588-099f-1696-fce2bfd48613	8312	Podbočje
00050000-5588-099f-800d-76630e793ccf	5243	Podbrdo
00050000-5588-099f-6c89-b1a2cdfc54f2	3254	Podčetrtek
00050000-5588-099f-deff-bd82afe8fb7b	2273	Podgorci
00050000-5588-099f-cb28-9b700a29190a	6216	Podgorje
00050000-5588-099f-30d0-83051427af49	2381	Podgorje pri Slovenj Gradcu
00050000-5588-099f-44fc-f407667c3a3f	6244	Podgrad
00050000-5588-099f-bd27-75a07ce1d1d0	1414	Podkum
00050000-5588-099f-ccee-329af1c4f174	2286	Podlehnik
00050000-5588-099f-ed19-86364cce7782	5272	Podnanos
00050000-5588-099f-279e-8d9d1f2dcaab	4244	Podnart
00050000-5588-099f-596a-ea0a5073b93d	3241	Podplat
00050000-5588-099f-30f4-a813204bdec5	3257	Podsreda
00050000-5588-099f-e275-f478101a5a7c	2363	Podvelka
00050000-5588-099f-0f92-9baadfc06abe	2208	Pohorje
00050000-5588-099f-8152-e0db8f5e1ebc	2257	Polenšak
00050000-5588-099f-919b-2165be52b9fd	1355	Polhov Gradec
00050000-5588-099f-4bdc-4778c4258d64	4223	Poljane nad Škofjo Loko
00050000-5588-099f-49b0-be4736da87f1	2319	Poljčane
00050000-5588-099f-865c-8aca8d1a949b	1272	Polšnik
00050000-5588-099f-51c0-eeb25cacaf1d	3313	Polzela
00050000-5588-099f-372c-c6ed10c18db2	3232	Ponikva
00050000-5588-099f-d6b4-7a4f53a90cfd	6320	Portorož/Portorose
00050000-5588-099f-12f8-1c7eec657669	6230	Postojna
00050000-5588-099f-8f00-187a2a13749c	2331	Pragersko
00050000-5588-099f-ce7d-e52ed9b63b98	3312	Prebold
00050000-5588-099f-733a-2f31804fe3f5	4205	Preddvor
00050000-5588-099f-488c-d47d8761b71b	6255	Prem
00050000-5588-099f-6024-c0956d923fc7	1352	Preserje
00050000-5588-099f-b039-8bca4cb5f02c	6258	Prestranek
00050000-5588-099f-8739-33a3de9f2649	2391	Prevalje
00050000-5588-099f-4179-d038ae3a2600	3262	Prevorje
00050000-5588-099f-76db-12218cf16db4	1276	Primskovo 
00050000-5588-099f-7f08-1c0459cfc6e9	3253	Pristava pri Mestinju
00050000-5588-099f-73a9-7acacec265cb	9207	Prosenjakovci/Partosfalva
00050000-5588-099f-0144-d2d964fa6a72	5297	Prvačina
00050000-5588-099f-e82a-680cf2c554fc	2250	Ptuj
00050000-5588-099f-16f4-8ff1c56488fa	2323	Ptujska Gora
00050000-5588-099f-0175-609bcc29181b	9201	Puconci
00050000-5588-099f-b616-139b785c2f0f	2327	Rače
00050000-5588-099f-11b2-c74eb14c6873	1433	Radeče
00050000-5588-099f-7413-f45d0ad02271	9252	Radenci
00050000-5588-099f-f2b3-84b16b4a06b8	2360	Radlje ob Dravi
00050000-5588-099f-b0c5-c84e4a6a7e21	1235	Radomlje
00050000-5588-099f-8dc2-5e0e9bac853f	4240	Radovljica
00050000-5588-099f-2d8f-bb04258b9447	8274	Raka
00050000-5588-099f-5458-3eb91ee7d518	1381	Rakek
00050000-5588-099f-a3fa-63f6acf11cf3	4283	Rateče - Planica
00050000-5588-099f-6352-f029716bf691	2390	Ravne na Koroškem
00050000-5588-099f-e41a-548e75645196	9246	Razkrižje
00050000-5588-099f-7d20-3b1772444067	3332	Rečica ob Savinji
00050000-5588-099f-d6f6-1375b1516dde	5292	Renče
00050000-5588-099f-f4cb-2fb1216035d1	1310	Ribnica
00050000-5588-099f-c416-d34f2545a981	2364	Ribnica na Pohorju
00050000-5588-099f-d820-b7d94e7ac949	3272	Rimske Toplice
00050000-5588-099f-db51-7623a3359ae8	1314	Rob
00050000-5588-099f-20cc-3c82a39e6e82	5215	Ročinj
00050000-5588-099f-0552-18ac1125a44e	3250	Rogaška Slatina
00050000-5588-099f-ffa6-78c32511e2e5	9262	Rogašovci
00050000-5588-099f-d244-8eb61e3f32c3	3252	Rogatec
00050000-5588-099f-05bd-6263dc71d810	1373	Rovte
00050000-5588-099f-4e41-fb4f9a27897b	2342	Ruše
00050000-5588-099f-c7dd-3b8961b38406	1282	Sava
00050000-5588-099f-6f2b-1722a47a5ed3	6333	Sečovlje/Sicciole
00050000-5588-099f-b53b-4f49d9ebe8ae	4227	Selca
00050000-5588-099f-0016-c2a022e25904	2352	Selnica ob Dravi
00050000-5588-099f-6e64-2cfe6aac5dd3	8333	Semič
00050000-5588-099f-4608-0ecc1c0b18e9	8281	Senovo
00050000-5588-099f-1b5b-70b386c60d34	6224	Senožeče
00050000-5588-099f-3b69-c62980bf0b29	8290	Sevnica
00050000-5588-099f-d2f6-06a0a196cc85	6210	Sežana
00050000-5588-099f-e0ae-1d366ee523eb	2214	Sladki Vrh
00050000-5588-099f-7690-f920d5fdb1b8	5283	Slap ob Idrijci
00050000-5588-099f-6d04-273c1fe5b5fe	2380	Slovenj Gradec
00050000-5588-099f-a858-8d6fbd4a1f6f	2310	Slovenska Bistrica
00050000-5588-099f-a372-439322910ff9	3210	Slovenske Konjice
00050000-5588-099f-494d-94c7c788bd4e	1216	Smlednik
00050000-5588-099f-d0bf-49390e84290b	5232	Soča
00050000-5588-099f-7a6a-07821852c37e	1317	Sodražica
00050000-5588-099f-ea46-618f5e3fb0b1	3335	Solčava
00050000-5588-099f-2780-d2e4c760f717	5250	Solkan
00050000-5588-099f-5984-9f67c5446fbc	4229	Sorica
00050000-5588-099f-f41c-ea863036655e	4225	Sovodenj
00050000-5588-099f-9cf9-10336f401a7b	5281	Spodnja Idrija
00050000-5588-099f-2069-9e1ece4d3ed7	2241	Spodnji Duplek
00050000-5588-099f-1d72-150c68dd4220	9245	Spodnji Ivanjci
00050000-5588-099f-2d0b-db4e6280bc2b	2277	Središče ob Dravi
00050000-5588-099f-2377-6293f2fd01d8	4267	Srednja vas v Bohinju
00050000-5588-099f-4e21-6d7d9b9dcc78	8256	Sromlje 
00050000-5588-099f-dd68-64c876598a68	5224	Srpenica
00050000-5588-099f-133e-f9d3c38fbb51	1242	Stahovica
00050000-5588-099f-ec2a-444bb58cad21	1332	Stara Cerkev
00050000-5588-099f-0115-d4dceed0f3ba	8342	Stari trg ob Kolpi
00050000-5588-099f-9a83-02b249801c42	1386	Stari trg pri Ložu
00050000-5588-099f-61dd-2eaaa47a4a80	2205	Starše
00050000-5588-099f-b436-f3461e847b8b	2289	Stoperce
00050000-5588-099f-9a7c-943ccaeeb670	8322	Stopiče
00050000-5588-099f-1c9b-4df5a1ca1617	3206	Stranice
00050000-5588-099f-e523-c7d035ca0267	8351	Straža
00050000-5588-099f-38a0-f7521695937e	1313	Struge
00050000-5588-099f-ca23-199a77761cda	8293	Studenec
00050000-5588-099f-f4d7-9535b21208c3	8331	Suhor
00050000-5588-099f-5e0a-c702eada6ad9	2233	Sv. Ana v Slovenskih goricah
00050000-5588-099f-02af-00d453693e91	2235	Sv. Trojica v Slovenskih goricah
00050000-5588-099f-d61d-a62832cd15be	2353	Sveti Duh na Ostrem Vrhu
00050000-5588-099f-3238-81027d67d777	9244	Sveti Jurij ob Ščavnici
00050000-5588-099f-7134-68c2b1d8de2c	3264	Sveti Štefan
00050000-5588-099f-279e-d7877afcb2f0	2258	Sveti Tomaž
00050000-5588-099f-b5c9-1b9e15a97979	9204	Šalovci
00050000-5588-099f-5945-97546b2349b5	5261	Šempas
00050000-5588-099f-b815-1824bf83a68c	5290	Šempeter pri Gorici
00050000-5588-099f-9454-bd25e08f4c6e	3311	Šempeter v Savinjski dolini
00050000-5588-099f-1f59-aac99cafbc33	4208	Šenčur
00050000-5588-099f-5bbd-c97e4faa6bca	2212	Šentilj v Slovenskih goricah
00050000-5588-099f-3bb4-695c8ccbb22b	8297	Šentjanž
00050000-5588-099f-b6f6-f02ed72f41d2	2373	Šentjanž pri Dravogradu
00050000-5588-099f-552b-4801aeb59d72	8310	Šentjernej
00050000-5588-099f-e081-ee56e2179a85	3230	Šentjur
00050000-5588-099f-e542-e10089a77127	3271	Šentrupert
00050000-5588-099f-7995-69b30070370b	8232	Šentrupert
00050000-5588-099f-c900-0fcee61de916	1296	Šentvid pri Stični
00050000-5588-099f-0357-4be3385194e7	8275	Škocjan
00050000-5588-099f-3c0e-4792d775849d	6281	Škofije
00050000-5588-099f-811d-5605a94b22f7	4220	Škofja Loka
00050000-5588-099f-7094-a5199dd9b6ec	3211	Škofja vas
00050000-5588-099f-cd9a-a418b13eda6e	1291	Škofljica
00050000-5588-099f-f993-6832956e89ca	6274	Šmarje
00050000-5588-099f-2791-d81b3e877d4d	1293	Šmarje - Sap
00050000-5588-099f-9a1d-65074fb1f01f	3240	Šmarje pri Jelšah
00050000-5588-099f-7b65-d8eec9a8ead0	8220	Šmarješke Toplice
00050000-5588-099f-da1f-38c76c96db15	2315	Šmartno na Pohorju
00050000-5588-099f-cf5e-99655f874c4a	3341	Šmartno ob Dreti
00050000-5588-099f-5249-d3e4a6af5596	3327	Šmartno ob Paki
00050000-5588-099f-86fb-2573b7e4cfbb	1275	Šmartno pri Litiji
00050000-5588-099f-169e-9d17dab454b2	2383	Šmartno pri Slovenj Gradcu
00050000-5588-099f-a4f5-1cfeb7fa87db	3201	Šmartno v Rožni dolini
00050000-5588-099f-95e7-997405829609	3325	Šoštanj
00050000-5588-099f-1473-06e6941d95e7	6222	Štanjel
00050000-5588-099f-efeb-22f8fa13de14	3220	Štore
00050000-5588-099f-9d30-91b2bfbb4eb1	3304	Tabor
00050000-5588-099f-ab38-a8be1bfd4a83	3221	Teharje
00050000-5588-099f-eb5a-c9d4bd1b1d0e	9251	Tišina
00050000-5588-099f-7e4d-7b17018219f0	5220	Tolmin
00050000-5588-099f-ffea-952b468d04d5	3326	Topolšica
00050000-5588-099f-ecc8-82851cd4d7e0	2371	Trbonje
00050000-5588-099f-ea1e-5fc39f514370	1420	Trbovlje
00050000-5588-099f-041c-70cc226344d2	8231	Trebelno 
00050000-5588-099f-f1a0-54875fa9f18a	8210	Trebnje
00050000-5588-099f-36b0-eafa48c5793d	5252	Trnovo pri Gorici
00050000-5588-099f-9d5d-6248403b900f	2254	Trnovska vas
00050000-5588-099f-6b37-0964297da949	1222	Trojane
00050000-5588-099f-6d9f-e16d685dc5e8	1236	Trzin
00050000-5588-099f-4a8f-831edd15d5de	4290	Tržič
00050000-5588-099f-c35f-4027269c2e57	8295	Tržišče
00050000-5588-099f-8363-0ee0f00990dd	1311	Turjak
00050000-5588-099f-e757-ea654fc3eaea	9224	Turnišče
00050000-5588-099f-312d-f59ef0846788	8323	Uršna sela
00050000-5588-099f-58dc-e42e93e6f779	1252	Vače
00050000-5588-099f-43b8-0fc3d2197a1d	3320	Velenje 
00050000-5588-099f-b529-6f857bd40e05	3322	Velenje - poštni predali
00050000-5588-099f-3748-e1da6b129c0e	8212	Velika Loka
00050000-5588-099f-8292-1070ec9249f9	2274	Velika Nedelja
00050000-5588-099f-f29f-e41880c83816	9225	Velika Polana
00050000-5588-099f-872e-43cd5eb6e351	1315	Velike Lašče
00050000-5588-099f-208c-158c474a67ae	8213	Veliki Gaber
00050000-5588-099f-0cd4-53430d761df8	9241	Veržej
00050000-5588-099f-d750-b4b543db129f	1312	Videm - Dobrepolje
00050000-5588-099f-65d9-3d06cf13c601	2284	Videm pri Ptuju
00050000-5588-099f-2f21-35226f7491b6	8344	Vinica
00050000-5588-099f-8a31-24322652bec4	5271	Vipava
00050000-5588-099f-d58e-971e86037bc3	4212	Visoko
00050000-5588-099f-d59b-b5ff4efb8ba7	1294	Višnja Gora
00050000-5588-099f-4d22-62a5a8c4ea63	3205	Vitanje
00050000-5588-099f-3491-e9b3256a58ce	2255	Vitomarci
00050000-5588-099f-c88f-d01f90361169	1217	Vodice
00050000-5588-099f-fb42-c9601fbd7ff8	3212	Vojnik\t
00050000-5588-099f-59e4-2875d2e5c7a0	5293	Volčja Draga
00050000-5588-099f-3842-09558e1ac4a3	2232	Voličina
00050000-5588-099f-aeb9-d7ed677104ea	3305	Vransko
00050000-5588-099f-b899-37373953677a	6217	Vremski Britof
00050000-5588-099f-078e-d99d94578247	1360	Vrhnika
00050000-5588-099f-8b6d-de3f51fc9b51	2365	Vuhred
00050000-5588-099f-c0c0-6b98a2a13937	2367	Vuzenica
00050000-5588-099f-06de-950ee2e0dc4b	8292	Zabukovje 
00050000-5588-099f-2518-9e800c5b4005	1410	Zagorje ob Savi
00050000-5588-099f-aeb4-abc53265cd4e	1303	Zagradec
00050000-5588-099f-b586-5c3dc4dba68d	2283	Zavrč
00050000-5588-099f-3195-617966809ef6	8272	Zdole 
00050000-5588-099f-8c76-3bbd381e1c77	4201	Zgornja Besnica
00050000-5588-099f-18c2-4f93dcd04b60	2242	Zgornja Korena
00050000-5588-099f-ef79-fb41b0a0975b	2201	Zgornja Kungota
00050000-5588-099f-2a8e-ff8100d91309	2316	Zgornja Ložnica
00050000-5588-099f-6db3-55ce8330797b	2314	Zgornja Polskava
00050000-5588-099f-c867-cde50af8f33e	2213	Zgornja Velka
00050000-5588-099f-b917-a62a479d37c4	4247	Zgornje Gorje
00050000-5588-099f-cbfe-7090f08a0a79	4206	Zgornje Jezersko
00050000-5588-099f-3e46-8529c9d12b0a	2285	Zgornji Leskovec
00050000-5588-099f-f8e4-56b92ea26c4f	1432	Zidani Most
00050000-5588-099f-9232-e33a06de48cf	3214	Zreče
00050000-5588-099f-fe8f-f6d0f5e42b3b	4209	Žabnica
00050000-5588-099f-d77c-a826d100196d	3310	Žalec
00050000-5588-099f-f945-c39be44d9ed1	4228	Železniki
00050000-5588-099f-5d0b-1880217b8dd8	2287	Žetale
00050000-5588-099f-0985-7ddbb0013085	4226	Žiri
00050000-5588-099f-31a8-8f62562d48d4	4274	Žirovnica
00050000-5588-099f-b9a9-8205224a49bc	8360	Žužemberk
\.


--
-- TOC entry 2864 (class 0 OID 7936110)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7935921)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7935999)
-- Dependencies: 193
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7936122)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 7936242)
-- Dependencies: 220
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7936295)
-- Dependencies: 224
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5588-09a0-80f4-aca27fb38245	00080000-5588-09a0-a723-be1f86618c57	0900	AK
00190000-5588-09a0-641d-1ddf8ef2c370	00080000-5588-09a0-3440-926438cc500e	0987	A
00190000-5588-09a0-d696-e12c88205cc5	00080000-5588-09a0-f6aa-4e7f44729132	0989	A
\.


--
-- TOC entry 2890 (class 0 OID 7936426)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 7936450)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7936151)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5588-09a0-6a93-acc5c149c526	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5588-09a0-6617-52757e263b8b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5588-09a0-7025-6850c7c9028e	0003	Kazinska	t	84	Kazinska dvorana
00220000-5588-09a0-daac-f47775ff7a27	0004	Mali oder	t	24	Mali oder 
00220000-5588-09a0-ee3f-3586001456af	0005	Komorni oder	t	15	Komorni oder
00220000-5588-09a0-944e-9f6cc37dc123	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5588-09a0-a8cc-e7b22bb79710	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2862 (class 0 OID 7936095)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 7936085)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7936284)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7936219)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7935793)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2871 (class 0 OID 7936161)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 7935831)
-- Dependencies: 180
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5588-099f-2d88-dfa5c052940e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5588-099f-4e3c-a682d146a59e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5588-099f-ba92-35dd76dcd25e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5588-099f-a85b-ee311f0eb599	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5588-099f-d9a5-98ac88600a98	planer	Planer dogodkov v koledarju	t
00020000-5588-099f-ea87-96e50e4d5a9e	kadrovska	Kadrovska služba	t
00020000-5588-099f-c7b6-01972b786d56	arhivar	Ažuriranje arhivalij	t
00020000-5588-099f-bf74-41f49c77a319	igralec	Igralec	t
00020000-5588-099f-c53b-96fa8e7df263	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5588-09a0-1bc5-068d49bf63f5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2837 (class 0 OID 7935815)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5588-099f-0971-fecbcab44d63	00020000-5588-099f-ba92-35dd76dcd25e
00010000-5588-099f-b42e-0f34dc8497ea	00020000-5588-099f-ba92-35dd76dcd25e
00010000-5588-09a0-8e64-0dbd288e40b9	00020000-5588-09a0-1bc5-068d49bf63f5
\.


--
-- TOC entry 2873 (class 0 OID 7936175)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7936116)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 7936066)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 7936483)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5588-099f-c862-399de8f21a26	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5588-099f-d013-4aa100a223aa	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5588-099f-b178-5aea4c318e5d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5588-099f-1a5e-8bd9cd6b3674	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5588-099f-1e41-7078fb9e9c2f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2894 (class 0 OID 7936475)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5588-099f-c2a9-cadf29b13ade	00230000-5588-099f-1a5e-8bd9cd6b3674	popa
00240000-5588-099f-e7d6-37f24d4bdb9d	00230000-5588-099f-1a5e-8bd9cd6b3674	oseba
00240000-5588-099f-6830-a0f74a5b3eb0	00230000-5588-099f-d013-4aa100a223aa	prostor
00240000-5588-099f-94fc-f5b184b838c8	00230000-5588-099f-1a5e-8bd9cd6b3674	besedilo
00240000-5588-099f-9e31-29b7ad4317dd	00230000-5588-099f-1a5e-8bd9cd6b3674	uprizoritev
00240000-5588-099f-05b1-18e3b278a93d	00230000-5588-099f-1a5e-8bd9cd6b3674	funkcija
00240000-5588-099f-c93c-889de8bd8aa1	00230000-5588-099f-1a5e-8bd9cd6b3674	tipfunkcije
00240000-5588-099f-a939-6c19cd194d82	00230000-5588-099f-1a5e-8bd9cd6b3674	alternacija
00240000-5588-099f-1c6f-eda55f0fad26	00230000-5588-099f-c862-399de8f21a26	pogodba
00240000-5588-099f-e6be-886098a2407e	00230000-5588-099f-1a5e-8bd9cd6b3674	zaposlitev
\.


--
-- TOC entry 2893 (class 0 OID 7936470)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7936229)
-- Dependencies: 219
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5588-09a0-0d3b-c22a66b80099	000e0000-5588-09a0-0ba2-b99a16ee4449	00080000-5588-09a0-efd9-0230c84b7114	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5588-09a0-8056-343273cd378f	000e0000-5588-09a0-0ba2-b99a16ee4449	00080000-5588-09a0-efd9-0230c84b7114	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5588-09a0-40ca-4095a8554ed3	000e0000-5588-09a0-0ba2-b99a16ee4449	00080000-5588-09a0-2358-4a52fc2159c0	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2844 (class 0 OID 7935893)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7936072)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5588-09a0-6e23-b6f3e8245326	00180000-5588-09a0-37e9-6dee29a30133	000c0000-5588-09a0-9858-2da72e935ec4	00090000-5588-09a0-1619-3cabfd66a13c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-09a0-edd4-49453137f625	00180000-5588-09a0-37e9-6dee29a30133	000c0000-5588-09a0-1a0f-d271d685506a	00090000-5588-09a0-384e-78f564e2cec6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-09a0-9556-3e77137536aa	00180000-5588-09a0-37e9-6dee29a30133	000c0000-5588-09a0-687a-c188cc0c8147	00090000-5588-09a0-61b6-fb0e2d4964ac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-09a0-c7d6-123136cabc97	00180000-5588-09a0-37e9-6dee29a30133	000c0000-5588-09a0-4f49-962d93104017	00090000-5588-09a0-0e13-62206238da45	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-09a0-1f05-ad495176b532	00180000-5588-09a0-37e9-6dee29a30133	000c0000-5588-09a0-f8dc-fca7ba98c0db	00090000-5588-09a0-6d21-e7aaa24ed9b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-09a0-76d9-0ba27b58a998	00180000-5588-09a0-4006-d3baee4c5e01	\N	00090000-5588-09a0-6d21-e7aaa24ed9b2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2881 (class 0 OID 7936273)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5588-099f-dfca-a86d94106002	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5588-099f-f22d-fa57058741cc	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5588-099f-149e-e5497c92bf03	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5588-099f-7fdb-26759d5a0047	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5588-099f-d319-25e3a677423b	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5588-099f-49af-d4c79ea8e933	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5588-099f-157c-713339ea58cf	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5588-099f-bd7e-e9b042678fd9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5588-099f-46a2-15aa51e479a2	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5588-099f-c57b-be84db695453	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5588-099f-7bc0-10fbdff6e353	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5588-099f-3b27-1bb0f75a8c13	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5588-099f-636f-d3c6974a43be	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5588-099f-77b0-73b69f805513	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5588-099f-27d7-48e026ccb372	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5588-099f-5ee1-b1d148ab2fb2	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2891 (class 0 OID 7936439)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5588-099f-37b3-cced917f49c6	01	Velika predstava	f	1.00	1.00
002b0000-5588-099f-63b1-bdaa9a84017a	02	Mala predstava	f	0.50	0.50
002b0000-5588-099f-caff-8085a1ab636c	03	Mala koprodukcija	t	0.40	1.00
002b0000-5588-099f-7886-7b8164191495	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5588-099f-382c-0f4db9cebaf7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2849 (class 0 OID 7935956)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7935802)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5588-099f-b42e-0f34dc8497ea	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROVlH6yvF5ryPuw7GlyB6rOJs8xeX60ca	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5588-09a0-2cef-f1e62ad25ece	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5588-09a0-0400-d6a81c946566	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5588-09a0-6f9c-6cb05a551712	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5588-09a0-89ed-136b16737a91	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5588-09a0-d439-89bef807204f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5588-09a0-6030-cd65fdfda269	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5588-09a0-6c0e-a2b4f5fb0359	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5588-09a0-8b41-c45fa6c4bf6e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5588-09a0-294e-50e278045702	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5588-09a0-8e64-0dbd288e40b9	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5588-099f-0971-fecbcab44d63	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2886 (class 0 OID 7936330)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5588-09a0-afa9-fd7d096dbb9a	00160000-5588-09a0-c68f-eab58779dadf	00150000-5588-099f-492a-698103382930	00140000-5588-099e-49bc-5f169c2317a5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5588-09a0-ee3f-3586001456af
000e0000-5588-09a0-0ba2-b99a16ee4449	00160000-5588-09a0-bc75-de08797b715f	00150000-5588-099f-2435-e7ec7df62182	00140000-5588-099e-f89a-87f1da4ffd5e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5588-09a0-944e-9f6cc37dc123
000e0000-5588-09a0-e144-1199d16160e7	\N	00150000-5588-099f-2435-e7ec7df62182	00140000-5588-099e-f89a-87f1da4ffd5e	00190000-5588-09a0-641d-1ddf8ef2c370	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5588-09a0-ee3f-3586001456af
000e0000-5588-09a0-ef56-0a905a9e1143	\N	00150000-5588-099f-2435-e7ec7df62182	00140000-5588-099e-f89a-87f1da4ffd5e	00190000-5588-09a0-641d-1ddf8ef2c370	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5588-09a0-ee3f-3586001456af
\.


--
-- TOC entry 2854 (class 0 OID 7936018)
-- Dependencies: 195
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5588-09a0-b7ab-1fae83fa1247	000e0000-5588-09a0-0ba2-b99a16ee4449	1	
00200000-5588-09a0-867f-d99b144f207b	000e0000-5588-09a0-0ba2-b99a16ee4449	2	
\.


--
-- TOC entry 2869 (class 0 OID 7936143)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 7936212)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7936050)
-- Dependencies: 197
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 7936320)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5588-099e-49bc-5f169c2317a5	01	Drama	drama (SURS 01)
00140000-5588-099e-688e-fd91277ff76e	02	Opera	opera (SURS 02)
00140000-5588-099e-30da-188b2dd4db69	03	Balet	balet (SURS 03)
00140000-5588-099e-ab8e-13d54bb33d04	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5588-099e-cdd7-616afadf1b6f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5588-099e-f89a-87f1da4ffd5e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5588-099e-0965-1d7d86ee8deb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2875 (class 0 OID 7936202)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5588-099f-5761-2050d1690e23	01	Opera	opera
00150000-5588-099f-1c15-a57b437f5805	02	Opereta	opereta
00150000-5588-099f-f4cb-0295e1c0d4ae	03	Balet	balet
00150000-5588-099f-3d0d-8e18de26d507	04	Plesne prireditve	plesne prireditve
00150000-5588-099f-e32b-9a8e251c3c78	05	Lutkovno gledališče	lutkovno gledališče
00150000-5588-099f-85aa-24fe83f3fd83	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5588-099f-57b4-db60d89ac3e0	07	Biografska drama	biografska drama
00150000-5588-099f-492a-698103382930	08	Komedija	komedija
00150000-5588-099f-ceec-cc2014a8fd00	09	Črna komedija	črna komedija
00150000-5588-099f-7f43-96cbd50da187	10	E-igra	E-igra
00150000-5588-099f-2435-e7ec7df62182	11	Kriminalka	kriminalka
00150000-5588-099f-1606-8036386c5f9a	12	Musical	musical
\.


--
-- TOC entry 2427 (class 2606 OID 7935856)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 7936377)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 7936367)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 7936272)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 7936040)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 7936065)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 7935982)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7936421)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 7936198)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7936016)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 7936059)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7935996)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7936108)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7936135)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7935954)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7935865)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2434 (class 2606 OID 7935889)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 7935845)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2418 (class 2606 OID 7935830)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 7936141)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7936174)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 7936315)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 7935918)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 7935942)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 7936114)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7935932)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7936003)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7936126)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 7936254)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 7936300)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 7936437)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7936158)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7936099)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7936090)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 7936294)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 7936226)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 7935801)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 7936165)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7935819)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2420 (class 2606 OID 7935839)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 7936183)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 7936121)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 7936071)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 7936492)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 7936480)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 7936474)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 7936239)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 7935898)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7936081)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 7936283)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 7936449)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 7935967)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 7935814)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7936346)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7936025)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 7936149)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7936217)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7936054)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 7936328)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 7936210)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 1259 OID 7936047)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 7936240)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 7936241)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 7935920)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2391 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2392 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2393 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2532 (class 1259 OID 7936142)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 7936128)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2527 (class 1259 OID 7936127)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2478 (class 1259 OID 7936026)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 7936199)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 7936201)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2556 (class 1259 OID 7936200)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2466 (class 1259 OID 7935998)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 7935997)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2585 (class 1259 OID 7936317)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 7936318)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2587 (class 1259 OID 7936319)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2405 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2406 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2594 (class 1259 OID 7936351)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2595 (class 1259 OID 7936348)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2596 (class 1259 OID 7936352)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2597 (class 1259 OID 7936350)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2598 (class 1259 OID 7936349)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2456 (class 1259 OID 7935969)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 7935968)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2396 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2397 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 7935892)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2542 (class 1259 OID 7936166)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2496 (class 1259 OID 7936060)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2422 (class 1259 OID 7935846)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 7935847)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2547 (class 1259 OID 7936186)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2548 (class 1259 OID 7936185)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2549 (class 1259 OID 7936184)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2470 (class 1259 OID 7936004)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2471 (class 1259 OID 7936006)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2472 (class 1259 OID 7936005)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 7936482)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2506 (class 1259 OID 7936094)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2507 (class 1259 OID 7936092)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2508 (class 1259 OID 7936091)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2509 (class 1259 OID 7936093)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2413 (class 1259 OID 7935820)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2414 (class 1259 OID 7935821)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2535 (class 1259 OID 7936150)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2521 (class 1259 OID 7936115)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2563 (class 1259 OID 7936227)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2564 (class 1259 OID 7936228)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 7936425)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2617 (class 1259 OID 7936422)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2618 (class 1259 OID 7936423)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2619 (class 1259 OID 7936424)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2445 (class 1259 OID 7935934)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 7935933)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2447 (class 1259 OID 7935935)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2571 (class 1259 OID 7936255)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 7936256)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2608 (class 1259 OID 7936381)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 7936383)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2610 (class 1259 OID 7936379)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2611 (class 1259 OID 7936382)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2612 (class 1259 OID 7936380)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2560 (class 1259 OID 7936218)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 7936103)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2513 (class 1259 OID 7936102)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2514 (class 1259 OID 7936100)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2515 (class 1259 OID 7936101)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2387 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2604 (class 1259 OID 7936369)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2605 (class 1259 OID 7936368)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2620 (class 1259 OID 7936438)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2477 (class 1259 OID 7936017)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2428 (class 1259 OID 7935867)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2429 (class 1259 OID 7935866)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2437 (class 1259 OID 7935899)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2438 (class 1259 OID 7935900)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 7936084)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2502 (class 1259 OID 7936083)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2503 (class 1259 OID 7936082)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2400 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2401 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2484 (class 1259 OID 7936049)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2485 (class 1259 OID 7936045)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2486 (class 1259 OID 7936042)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2487 (class 1259 OID 7936043)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2488 (class 1259 OID 7936041)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2489 (class 1259 OID 7936046)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2490 (class 1259 OID 7936044)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2444 (class 1259 OID 7935919)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 7935983)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 7935985)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2464 (class 1259 OID 7935984)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2465 (class 1259 OID 7935986)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2520 (class 1259 OID 7936109)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 7936316)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 7936347)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7935890)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2436 (class 1259 OID 7935891)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2557 (class 1259 OID 7936211)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 7936493)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 7935955)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2633 (class 1259 OID 7936481)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2540 (class 1259 OID 7936160)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2541 (class 1259 OID 7936159)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 7936378)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2390 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2452 (class 1259 OID 7935943)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 7936329)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 7936301)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 7936302)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7935840)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2491 (class 1259 OID 7936048)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2662 (class 2606 OID 7936629)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2665 (class 2606 OID 7936614)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2664 (class 2606 OID 7936619)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2660 (class 2606 OID 7936639)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2666 (class 2606 OID 7936609)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2661 (class 2606 OID 7936634)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2663 (class 2606 OID 7936624)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2696 (class 2606 OID 7936784)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2695 (class 2606 OID 7936789)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 7936544)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7936724)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2681 (class 2606 OID 7936719)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2682 (class 2606 OID 7936714)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2659 (class 2606 OID 7936604)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2691 (class 2606 OID 7936754)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2689 (class 2606 OID 7936764)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2690 (class 2606 OID 7936759)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2653 (class 2606 OID 7936579)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2654 (class 2606 OID 7936574)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2679 (class 2606 OID 7936704)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2702 (class 2606 OID 7936809)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2701 (class 2606 OID 7936814)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2700 (class 2606 OID 7936819)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2704 (class 2606 OID 7936839)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2707 (class 2606 OID 7936824)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2703 (class 2606 OID 7936844)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2705 (class 2606 OID 7936834)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2706 (class 2606 OID 7936829)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2651 (class 2606 OID 7936569)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 7936564)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2643 (class 2606 OID 7936529)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2644 (class 2606 OID 7936524)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2685 (class 2606 OID 7936734)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2667 (class 2606 OID 7936644)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2640 (class 2606 OID 7936504)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2639 (class 2606 OID 7936509)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2686 (class 2606 OID 7936749)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 7936744)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2688 (class 2606 OID 7936739)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2657 (class 2606 OID 7936584)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 7936594)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2656 (class 2606 OID 7936589)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2721 (class 2606 OID 7936914)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2671 (class 2606 OID 7936679)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2673 (class 2606 OID 7936669)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2674 (class 2606 OID 7936664)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2672 (class 2606 OID 7936674)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2638 (class 2606 OID 7936494)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2637 (class 2606 OID 7936499)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 7936729)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2680 (class 2606 OID 7936709)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2694 (class 2606 OID 7936774)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2693 (class 2606 OID 7936779)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2715 (class 2606 OID 7936899)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2718 (class 2606 OID 7936884)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2717 (class 2606 OID 7936889)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2716 (class 2606 OID 7936894)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2649 (class 2606 OID 7936554)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2650 (class 2606 OID 7936549)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2648 (class 2606 OID 7936559)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2720 (class 2606 OID 7936909)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2698 (class 2606 OID 7936794)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7936799)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 7936869)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 7936879)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2714 (class 2606 OID 7936859)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2711 (class 2606 OID 7936874)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2713 (class 2606 OID 7936864)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2692 (class 2606 OID 7936769)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2675 (class 2606 OID 7936699)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2676 (class 2606 OID 7936694)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2678 (class 2606 OID 7936684)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2677 (class 2606 OID 7936689)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 7936854)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 7936849)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2719 (class 2606 OID 7936904)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2658 (class 2606 OID 7936599)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2699 (class 2606 OID 7936804)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 7936519)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2642 (class 2606 OID 7936514)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2646 (class 2606 OID 7936534)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2645 (class 2606 OID 7936539)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2668 (class 2606 OID 7936659)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 7936654)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 7936649)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-22 15:12:01 CEST

--
-- PostgreSQL database dump complete
--

