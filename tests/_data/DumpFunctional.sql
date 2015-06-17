--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-17 12:33:41 CEST

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
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 7553549)
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
-- TOC entry 227 (class 1259 OID 7554071)
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
-- TOC entry 226 (class 1259 OID 7554054)
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
-- TOC entry 219 (class 1259 OID 7553958)
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
-- TOC entry 194 (class 1259 OID 7553728)
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
-- TOC entry 197 (class 1259 OID 7553762)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7553671)
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
-- TOC entry 228 (class 1259 OID 7554085)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
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
    tip character varying(20) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 7553888)
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
-- TOC entry 192 (class 1259 OID 7553708)
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
-- TOC entry 196 (class 1259 OID 7553756)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7553688)
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
-- TOC entry 202 (class 1259 OID 7553805)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7553830)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7553645)
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
-- TOC entry 181 (class 1259 OID 7553558)
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
-- TOC entry 182 (class 1259 OID 7553569)
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
-- TOC entry 177 (class 1259 OID 7553523)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7553542)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7553837)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7553868)
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
-- TOC entry 223 (class 1259 OID 7554004)
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
-- TOC entry 184 (class 1259 OID 7553602)
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
    zamejstvo boolean
);


--
-- TOC entry 186 (class 1259 OID 7553637)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7553811)
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
-- TOC entry 185 (class 1259 OID 7553622)
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
-- TOC entry 191 (class 1259 OID 7553700)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7553823)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7553943)
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
    tantiemi numeric(15,2) DEFAULT NULL::numeric,
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 7553996)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7554115)
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
-- TOC entry 233 (class 1259 OID 7554178)
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
-- TOC entry 230 (class 1259 OID 7554128)
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
-- TOC entry 231 (class 1259 OID 7554147)
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
-- TOC entry 209 (class 1259 OID 7553852)
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
-- TOC entry 201 (class 1259 OID 7553796)
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
-- TOC entry 200 (class 1259 OID 7553786)
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
-- TOC entry 221 (class 1259 OID 7553985)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7553920)
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
-- TOC entry 174 (class 1259 OID 7553494)
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
-- TOC entry 173 (class 1259 OID 7553492)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 7553862)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7553532)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7553516)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7553876)
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
-- TOC entry 204 (class 1259 OID 7553817)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7553767)
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
-- TOC entry 236 (class 1259 OID 7554211)
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
-- TOC entry 235 (class 1259 OID 7554203)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7554198)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7553930)
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
    sort integer
);


--
-- TOC entry 183 (class 1259 OID 7553594)
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
-- TOC entry 199 (class 1259 OID 7553773)
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
-- TOC entry 220 (class 1259 OID 7553974)
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
-- TOC entry 232 (class 1259 OID 7554167)
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
-- TOC entry 188 (class 1259 OID 7553657)
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
-- TOC entry 175 (class 1259 OID 7553503)
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
-- TOC entry 225 (class 1259 OID 7554031)
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
-- TOC entry 193 (class 1259 OID 7553719)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7553844)
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
-- TOC entry 215 (class 1259 OID 7553913)
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
-- TOC entry 195 (class 1259 OID 7553751)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7554021)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7553903)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7553497)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7553549)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7554071)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5581-4d04-1c7a-60052352dd17	000d0000-5581-4d04-19cd-b509f4a89002	\N	00090000-5581-4d04-a4d6-e460dd03c0e6	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-4d04-9161-600b946b06e5	000d0000-5581-4d04-7742-5dd1508abe8c	\N	00090000-5581-4d04-d587-d16981bf40f5	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-4d04-587e-d290cda856f8	000d0000-5581-4d04-0739-29992e349237	\N	00090000-5581-4d04-7639-699f1ff45b3b	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-4d04-7274-76e123d74726	000d0000-5581-4d04-f073-a85c43dbcba5	\N	00090000-5581-4d04-470d-0eac10185f9b	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-4d04-265f-eca015a71258	000d0000-5581-4d04-13eb-8d7de6212820	\N	00090000-5581-4d04-56a3-a0ccbbbba2da	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-4d04-aec0-795667d61503	000d0000-5581-4d04-b21d-1d9c1ca30457	\N	00090000-5581-4d04-d587-d16981bf40f5	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7554054)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7553958)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5581-4d04-0370-b0c4f2be10f0	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5581-4d04-519c-6694eac7c3f2	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5581-4d04-3eaa-04f352f4c087	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7553728)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5581-4d04-7a69-e8f4346d4ae2	\N	\N	00200000-5581-4d04-efc8-577b7b4753a2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5581-4d04-c411-3d30b1f86864	\N	\N	00200000-5581-4d04-e4e1-d8274e89ea49	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5581-4d04-893e-179609c8f2a8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5581-4d04-b35f-2304e2cadd04	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5581-4d04-eada-91d060902b29	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7553762)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7553671)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5581-4d03-836a-a153f2c0218d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5581-4d03-d04d-2bf67d7fe76f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5581-4d03-0869-43f8a7b71369	AL	ALB	008	Albania 	Albanija	\N
00040000-5581-4d03-ba60-6f05114a3671	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5581-4d03-9071-23344ea69e83	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5581-4d03-5447-006c2708adb7	AD	AND	020	Andorra 	Andora	\N
00040000-5581-4d03-330d-2f83c4b7212e	AO	AGO	024	Angola 	Angola	\N
00040000-5581-4d03-b93d-aff42267db4f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5581-4d03-7167-a4f71a6bfbe1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5581-4d03-a2ef-cf198a537105	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5581-4d03-6549-e899a1086f76	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5581-4d03-bc19-6ca190963b79	AM	ARM	051	Armenia 	Armenija	\N
00040000-5581-4d03-ba5a-e2517c81ccf5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5581-4d03-5a4c-9c2a4aaa687d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5581-4d03-2f74-73ac85deb1e9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5581-4d03-dfbf-87a9190277ff	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5581-4d03-ec44-462f46e2a065	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5581-4d03-3b6c-56d9f1cd0de4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5581-4d03-8002-b4b4dd2aa4e4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5581-4d03-8ca6-bef918cec359	BB	BRB	052	Barbados 	Barbados	\N
00040000-5581-4d03-e3af-2f356b4bd28e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5581-4d03-118e-ac4905aca38e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5581-4d03-293d-2845c487fdfa	BZ	BLZ	084	Belize 	Belize	\N
00040000-5581-4d03-5f67-f168176fbdca	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5581-4d03-cdc1-363f51d5a030	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5581-4d03-a967-e0a4df71e894	BT	BTN	064	Bhutan 	Butan	\N
00040000-5581-4d03-59f7-67b011ed933b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5581-4d03-98b3-229f6cae1142	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5581-4d03-6ada-611dbab7718b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5581-4d03-1926-aaca4b8ba608	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5581-4d03-852e-3a768f6966be	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5581-4d03-0077-58e79f829ff8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5581-4d03-7a30-d2b82b522da5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5581-4d03-bd38-32d6290fde26	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5581-4d03-ccdf-a295d35ac7eb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5581-4d03-6263-505f193c28a0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5581-4d03-cd89-ca40b0f1f6fa	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5581-4d03-1a77-84a0d8d2b248	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5581-4d03-bda0-6ba21f60e2bd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5581-4d03-08b5-47d516952917	CA	CAN	124	Canada 	Kanada	\N
00040000-5581-4d03-bcf1-e2b7de236018	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5581-4d03-4f94-2b4caa40726c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5581-4d03-4524-887faa70db23	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5581-4d03-6fda-ab07144c470b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5581-4d03-5e67-91eff21e0ced	CL	CHL	152	Chile 	Čile	\N
00040000-5581-4d03-b51b-ab2ec80902d7	CN	CHN	156	China 	Kitajska	\N
00040000-5581-4d03-9a98-f0ed830a3067	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5581-4d03-e8ff-1ff4d2b0cae6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5581-4d03-8fff-c7dab908ee18	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5581-4d03-cc88-c0209e131906	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5581-4d03-e534-8374fc57602f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5581-4d03-73cb-944d9ca0ca53	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5581-4d03-1bd7-97eb97729736	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5581-4d03-8463-eb0768095510	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5581-4d03-0597-bc01fc32ee31	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5581-4d03-5fe0-0882d3e1bd93	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5581-4d03-b585-85491519b388	CU	CUB	192	Cuba 	Kuba	\N
00040000-5581-4d03-c54b-34fbefaf6b15	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5581-4d03-314f-1d485bc6eaea	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5581-4d03-25f8-4c1d81cf681b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5581-4d03-88fe-9d86bc646e02	DK	DNK	208	Denmark 	Danska	\N
00040000-5581-4d03-1a1e-1fcf3b46cffa	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5581-4d03-eca1-5a32e6adabed	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5581-4d03-396a-c61adbffc1ef	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5581-4d03-6ba1-ce5d024c066e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5581-4d03-328d-7e9b1e4f2cf7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5581-4d03-8e95-1863d328bf82	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5581-4d03-45db-6eeb390b88ed	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5581-4d03-e653-930486b9f5fb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5581-4d03-bbc7-7ee58b4ee678	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5581-4d03-f0c4-3c38ab83b467	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5581-4d03-248e-7e1339466038	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5581-4d03-4e04-b804a8ad0f80	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5581-4d03-cfbc-2897dd4f1a19	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5581-4d03-7a70-420d59ae9e51	FI	FIN	246	Finland 	Finska	\N
00040000-5581-4d03-a3e1-9df90d1f4d19	FR	FRA	250	France 	Francija	\N
00040000-5581-4d03-bdcf-bbdc337657dd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5581-4d03-f926-d5f7cb9edd3f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5581-4d03-2bd0-96783d893a10	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5581-4d03-565d-475f5bfdbfe5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5581-4d03-e913-e932e5bad176	GA	GAB	266	Gabon 	Gabon	\N
00040000-5581-4d03-9568-3527bbf3e543	GM	GMB	270	Gambia 	Gambija	\N
00040000-5581-4d03-4cd3-faed16354349	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5581-4d03-677f-b14990e2f6c9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5581-4d03-b610-64eb3538b0a2	GH	GHA	288	Ghana 	Gana	\N
00040000-5581-4d03-7292-26700a67ab4b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5581-4d03-6bde-bc469c8a1377	GR	GRC	300	Greece 	Grčija	\N
00040000-5581-4d03-dbf9-dffc3abed812	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5581-4d03-02a0-0f014c8bca8f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5581-4d03-7b1d-a35e8af6aaf8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5581-4d03-b7e3-62b300b7af20	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5581-4d03-49df-5b8b93a8a4e4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5581-4d03-49b6-81b74777eb41	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5581-4d03-16ed-07310e68e7bd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5581-4d03-7efd-11dd78bc90e7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5581-4d03-d9a2-2ee0722c2e35	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5581-4d03-9ef0-ddce0fcf559c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5581-4d03-e299-d0d37d938711	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5581-4d03-ed30-03876dd3dd8f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5581-4d03-ff59-561acc3f8a20	HN	HND	340	Honduras 	Honduras	\N
00040000-5581-4d03-fa37-daf7f553ab33	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5581-4d03-6755-08965d9b281b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5581-4d03-f2e4-d30d8f5ede4f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5581-4d03-0339-470a1bf7a153	IN	IND	356	India 	Indija	\N
00040000-5581-4d03-4bec-dc28b9605de1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5581-4d03-c24f-3b7c32de35fe	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5581-4d03-cb5c-933786ff6046	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5581-4d03-4343-a2b673549b4c	IE	IRL	372	Ireland 	Irska	\N
00040000-5581-4d03-1262-a4de10bf0e40	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5581-4d03-6dbc-3cbdaf2d9de0	IL	ISR	376	Israel 	Izrael	\N
00040000-5581-4d03-1617-e12416e65ab5	IT	ITA	380	Italy 	Italija	\N
00040000-5581-4d03-2986-fe9b0f3e2098	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5581-4d03-753a-9bae82671558	JP	JPN	392	Japan 	Japonska	\N
00040000-5581-4d03-4657-d5a10c0a4694	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5581-4d03-7ef5-fc0ba33c50ee	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5581-4d03-4d65-f86e36dff37b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5581-4d03-4ca5-0778b9c9add0	KE	KEN	404	Kenya 	Kenija	\N
00040000-5581-4d03-14e8-bbca02bc2083	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5581-4d03-9be6-cd33495a131f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5581-4d03-7db0-f2c880b31a07	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5581-4d03-9e15-2abceabf0029	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5581-4d03-e5c0-2824a5723ad0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5581-4d03-1a82-c5c492e19a40	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5581-4d03-6465-72fb2b15b09b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5581-4d03-c100-25d2ed073af2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5581-4d03-7acb-eee6f20d7398	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5581-4d03-c1f3-a16542e98fb3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5581-4d03-8ba2-337274bee975	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5581-4d03-80ee-2d0368a409e0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5581-4d03-b386-e04542335a37	LT	LTU	440	Lithuania 	Litva	\N
00040000-5581-4d03-b33e-7bd8634d9e4c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5581-4d03-cf3f-5fee8975bda2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5581-4d03-ea2b-0d3cb276020f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5581-4d03-7a7d-de524442b712	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5581-4d03-a0d1-71739faa6d9b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5581-4d03-fbcd-39f70643500f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5581-4d03-d933-a8aaf009d672	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5581-4d03-b26c-999869617212	ML	MLI	466	Mali 	Mali	\N
00040000-5581-4d03-3812-f73f12b0e130	MT	MLT	470	Malta 	Malta	\N
00040000-5581-4d03-77ad-b2c9a9854189	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5581-4d03-aba2-e38ff2e76b0c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5581-4d03-a38e-e03f2cd303ee	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5581-4d03-d0a9-bbb7308f014f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5581-4d03-6503-d3f49ab8a04b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5581-4d03-3656-c2f9fc815634	MX	MEX	484	Mexico 	Mehika	\N
00040000-5581-4d03-8f1b-637b58d72eb2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5581-4d03-c4f0-b22bf76c6566	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5581-4d03-4aa5-1472a9fb571f	MC	MCO	492	Monaco 	Monako	\N
00040000-5581-4d03-3bce-9829d2b52400	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5581-4d03-884d-a822cf9017f9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5581-4d03-9917-a333d80d142e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5581-4d03-d4a9-afcb06de4c65	MA	MAR	504	Morocco 	Maroko	\N
00040000-5581-4d03-f149-1d8870054c2a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5581-4d03-8701-910df717a8fc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5581-4d03-dcb9-904ea37cce6b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5581-4d03-8c96-eed3c28fbe68	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5581-4d03-dc43-aa968c8afe18	NP	NPL	524	Nepal 	Nepal	\N
00040000-5581-4d03-c45c-4831b2d0bf6d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5581-4d03-b24e-034e2504b859	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5581-4d03-afc4-e75b8945400f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5581-4d03-412f-2398e15edbbe	NE	NER	562	Niger 	Niger 	\N
00040000-5581-4d03-6cf0-cdf00a2b5af8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5581-4d03-323a-c1564c03f82d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5581-4d03-3ab8-15e8be55475c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5581-4d03-ceb6-f7ff3fbbd6e0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5581-4d03-f2a8-82d52fa629b9	NO	NOR	578	Norway 	Norveška	\N
00040000-5581-4d03-b90d-d9dd4d294b7b	OM	OMN	512	Oman 	Oman	\N
00040000-5581-4d03-a15e-e58cd031b2bf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5581-4d03-9c57-0d4239c21b38	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5581-4d03-ffc7-8bbee7f162ff	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5581-4d03-575f-1836166d13fc	PA	PAN	591	Panama 	Panama	\N
00040000-5581-4d03-b68e-876775922ca6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5581-4d03-7613-96cb29c2e718	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5581-4d03-d263-3035a52ed61b	PE	PER	604	Peru 	Peru	\N
00040000-5581-4d03-9b4e-460cf2b9ec07	PH	PHL	608	Philippines 	Filipini	\N
00040000-5581-4d03-1d86-cf78443b956c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5581-4d03-97d2-bc3f9182a2d8	PL	POL	616	Poland 	Poljska	\N
00040000-5581-4d03-d662-4a557a201c23	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5581-4d03-1fd6-acd61b25df76	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5581-4d03-b835-546eee090a28	QA	QAT	634	Qatar 	Katar	\N
00040000-5581-4d03-1e24-1efb1894918e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5581-4d03-c97c-18ea4880351f	RO	ROU	642	Romania 	Romunija	\N
00040000-5581-4d03-2e7d-3cce8d4b820d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5581-4d03-e2f3-f44b6ab99eac	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5581-4d03-7554-c1e0dfdddeae	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5581-4d03-499a-108998bac249	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5581-4d03-51e4-90a5c2adf07e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5581-4d03-e6c4-7bbff17b77af	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5581-4d03-18f1-49375b8c9c01	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5581-4d03-a490-f4aa5ffc6799	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5581-4d03-3ca8-445c3b8ee433	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5581-4d03-e484-e682035a01ed	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5581-4d03-3062-84565675a9b7	SM	SMR	674	San Marino 	San Marino	\N
00040000-5581-4d03-6562-75d5161a6136	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5581-4d03-a8ae-266ab2cd3d92	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5581-4d03-e621-b14a2e797852	SN	SEN	686	Senegal 	Senegal	\N
00040000-5581-4d03-558c-89159d24b9d6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5581-4d03-c643-007b2fa4b3b5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5581-4d03-c375-04853dcf64d7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5581-4d03-c385-064d8b0a3ffc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5581-4d03-d5e7-65a25be58fac	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5581-4d03-09cb-4a23f6d0f297	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5581-4d03-dd2b-22aedcd04c72	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5581-4d03-49fb-bbe019a79e2f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5581-4d03-b81f-d7d59ec2044e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5581-4d03-8ab6-f664a269458f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5581-4d03-af02-4f1a7048e6bd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5581-4d03-64b0-f8232dc8b537	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5581-4d03-941f-aec8df579bc1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5581-4d03-0406-29ed86c2b338	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5581-4d03-67cb-2d1c0b4bb73d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5581-4d03-1eec-ad5cb22d16bf	SR	SUR	740	Suriname 	Surinam	\N
00040000-5581-4d03-288e-3e95d37f00af	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5581-4d03-4b15-3f0673907e48	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5581-4d03-9a9d-1f61c8bcc5ab	SE	SWE	752	Sweden 	Švedska	\N
00040000-5581-4d03-fc5d-e499f15bf0c7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5581-4d03-e20d-c733c6b7571c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5581-4d03-63f4-a320f58d2e77	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5581-4d03-d714-181e9e9ba14f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5581-4d03-c7a3-8544dfee9f32	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5581-4d03-13cb-c37b7120d326	TH	THA	764	Thailand 	Tajska	\N
00040000-5581-4d03-57f5-8c97d2d7b400	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5581-4d03-555b-516422afdd22	TG	TGO	768	Togo 	Togo	\N
00040000-5581-4d03-ce72-57b1e58b97fd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5581-4d03-9db3-81aa1d1d6b0e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5581-4d03-8fb6-0f85e74438a6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5581-4d03-127a-c2c8e0248aac	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5581-4d03-2a51-61bcbc8bc6b7	TR	TUR	792	Turkey 	Turčija	\N
00040000-5581-4d03-f433-182574ade130	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5581-4d03-1c74-e7a08ba1b4b2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5581-4d03-7b3a-57fe6d4485eb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5581-4d03-3527-afb0c5050db7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5581-4d03-3c3b-1bdcd47eeafb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5581-4d03-8d48-b376568765fc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5581-4d03-fa7c-c7d640f0bcb5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5581-4d03-54fc-519076f45250	US	USA	840	United States 	Združene države Amerike	\N
00040000-5581-4d03-9ec8-d53eff1a666a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5581-4d03-ddb9-bad3af69656f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5581-4d03-bd1c-c8017fd15362	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5581-4d03-7351-04b124590ede	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5581-4d03-a5cb-44f264a0acad	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5581-4d03-43c9-e526486ff879	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5581-4d03-1e40-6fbece44576f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5581-4d03-cd21-705e5ab43d8b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5581-4d03-df16-97959aaa8bb3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5581-4d03-8092-9325e7ba5ca3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5581-4d03-841a-7b6a2498eab9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5581-4d03-d0e8-6ee10e16841e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5581-4d03-95fa-d60770823105	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7554085)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7553888)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5581-4d04-e42f-17be9b8c4082	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5581-4d03-51ec-2afcb10b85c7
000d0000-5581-4d04-19cd-b509f4a89002	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5581-4d03-51ec-2afcb10b85c7
000d0000-5581-4d04-7742-5dd1508abe8c	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5581-4d03-35d9-b5c98af86652
000d0000-5581-4d04-0739-29992e349237	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5581-4d03-29ac-da5a60733826
000d0000-5581-4d04-f073-a85c43dbcba5	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5581-4d03-29ac-da5a60733826
000d0000-5581-4d04-13eb-8d7de6212820	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5581-4d03-29ac-da5a60733826
000d0000-5581-4d04-b21d-1d9c1ca30457	000e0000-5581-4d04-9bf9-ea6dacaa8e99	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5581-4d03-51ec-2afcb10b85c7
\.


--
-- TOC entry 2843 (class 0 OID 7553708)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7553756)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7553688)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5581-4d04-ab67-4a483b40122c	00080000-5581-4d04-a716-65a8f961f978	00090000-5581-4d04-a4d6-e460dd03c0e6	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7553805)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7553830)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7553645)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5581-4d04-d221-48215072d3c7	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5581-4d04-2c6e-6bfd955ebfe8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5581-4d04-297c-b7dd128fe7af	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5581-4d04-5640-b674b5183271	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5581-4d04-c2e4-3b28c2b84b51	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5581-4d04-f866-2eec4733e9af	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5581-4d04-2a31-edc7d3b48e13	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5581-4d04-5244-999a92a51864	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5581-4d04-0649-0eb587421529	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5581-4d04-566e-0e1202659095	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5581-4d04-6761-1ce1d5e1cb67	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5581-4d04-fd96-0cbec9d16bc8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5581-4d04-7c45-e1fc16d8cf71	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5581-4d04-9f10-c91c644d5655	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5581-4d04-4d03-e50bcf22d456	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5581-4d04-64dc-4d0f3f77182d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2832 (class 0 OID 7553558)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5581-4d04-6059-591f3d377654	00000000-5581-4d04-c2e4-3b28c2b84b51	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5581-4d04-f990-0b23a855147a	00000000-5581-4d04-c2e4-3b28c2b84b51	00010000-5581-4d04-c68b-a72d15b72b24	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5581-4d04-d22f-e01101802eed	00000000-5581-4d04-f866-2eec4733e9af	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7553569)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5581-4d04-8218-ee2a64de0015	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5581-4d04-470d-0eac10185f9b	00010000-5581-4d04-5977-b824c216bb9e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5581-4d04-7639-699f1ff45b3b	00010000-5581-4d04-1dfd-96c074aa32cf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5581-4d04-1f9c-099987cb6ef4	00010000-5581-4d04-ae19-de77ef04e838	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5581-4d04-f2d8-377cafa92f3c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5581-4d04-7ef9-407ed13d764c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5581-4d04-a4e2-48e7ec045798	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5581-4d04-bb0e-d6550bea31a1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5581-4d04-a4d6-e460dd03c0e6	00010000-5581-4d04-bf77-b73bf80f0f2d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5581-4d04-d587-d16981bf40f5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5581-4d04-dceb-88fb44c67097	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5581-4d04-56a3-a0ccbbbba2da	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5581-4d04-2d32-3da5eaa889bf	00010000-5581-4d04-044c-c7348c6a904c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7553523)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5581-4d03-b73e-0e0b9350fe27	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5581-4d03-9bca-0d835cdf5f4a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5581-4d03-e970-847349f74fd8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5581-4d03-7b7e-6a194695b27c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5581-4d03-673d-88554692b7d7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5581-4d03-bf3c-49327820792c	Abonma-read	Abonma - branje	f
00030000-5581-4d03-fcc3-612c7176abca	Abonma-write	Abonma - spreminjanje	f
00030000-5581-4d03-59cc-3d12b3c90386	Alternacija-read	Alternacija - branje	f
00030000-5581-4d03-a5ef-57b6a5be562c	Alternacija-write	Alternacija - spreminjanje	f
00030000-5581-4d03-efdb-65d851cf8efa	Arhivalija-read	Arhivalija - branje	f
00030000-5581-4d03-49db-0accf6c01035	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5581-4d03-e38a-9c980cfc08bf	Besedilo-read	Besedilo - branje	f
00030000-5581-4d03-fe24-15844f1ec83a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5581-4d03-f0cb-df238741093e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5581-4d03-ede1-f002c8deb136	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5581-4d03-8583-5b8eddbc8574	Dogodek-read	Dogodek - branje	f
00030000-5581-4d03-93f2-b885f9d3fe53	Dogodek-write	Dogodek - spreminjanje	f
00030000-5581-4d03-9be7-63ea79f7f2e2	Drzava-read	Drzava - branje	f
00030000-5581-4d03-bc14-908fbed57a57	Drzava-write	Drzava - spreminjanje	f
00030000-5581-4d03-77d8-55c4a2ab7fd1	Funkcija-read	Funkcija - branje	f
00030000-5581-4d03-3db0-f29fd6049014	Funkcija-write	Funkcija - spreminjanje	f
00030000-5581-4d03-fa39-cc4fe5868f02	Gostovanje-read	Gostovanje - branje	f
00030000-5581-4d03-55f0-221e273c28df	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5581-4d03-27d8-6e53b0c9f58a	Gostujoca-read	Gostujoca - branje	f
00030000-5581-4d03-db51-1051a4a3d9dc	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5581-4d03-e52a-94a014bae2b6	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5581-4d03-8388-5b036d455747	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5581-4d03-0dc0-b36fc6b58862	Kupec-read	Kupec - branje	f
00030000-5581-4d03-7979-2b34ea65759d	Kupec-write	Kupec - spreminjanje	f
00030000-5581-4d03-a7ae-49cd31f54580	NacinPlacina-read	NacinPlacina - branje	f
00030000-5581-4d03-5f0c-8bd4f6aa3d08	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5581-4d03-6280-9d87f6b2f0bf	Option-read	Option - branje	f
00030000-5581-4d03-ddce-6dba7bcb2a3c	Option-write	Option - spreminjanje	f
00030000-5581-4d03-9b29-b16a3c23aa30	OptionValue-read	OptionValue - branje	f
00030000-5581-4d03-dc35-c2e644e70e2f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5581-4d03-3080-847736ba8239	Oseba-read	Oseba - branje	f
00030000-5581-4d03-6f46-aa7ab890f89e	Oseba-write	Oseba - spreminjanje	f
00030000-5581-4d03-6ea2-a7482d597a6d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5581-4d03-861e-045690267d2e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5581-4d03-0d72-abc11bb0e508	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5581-4d03-bdff-e43eb107d79c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5581-4d03-8563-9c0967935460	Pogodba-read	Pogodba - branje	f
00030000-5581-4d03-c12d-cc9729075e75	Pogodba-write	Pogodba - spreminjanje	f
00030000-5581-4d03-b7c6-1898a8fc78c8	Popa-read	Popa - branje	f
00030000-5581-4d03-7134-e09885bbea24	Popa-write	Popa - spreminjanje	f
00030000-5581-4d03-4a2d-8d813c30ccd4	Posta-read	Posta - branje	f
00030000-5581-4d03-6223-441717efe705	Posta-write	Posta - spreminjanje	f
00030000-5581-4d03-3b02-cff21a5e87d0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5581-4d03-7346-aea7308e1f43	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5581-4d03-046b-cf6d65e8e525	PostniNaslov-read	PostniNaslov - branje	f
00030000-5581-4d03-ecaf-ace8aeab3efb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5581-4d03-70b5-807d230b2cec	Predstava-read	Predstava - branje	f
00030000-5581-4d03-042d-5c52310c69da	Predstava-write	Predstava - spreminjanje	f
00030000-5581-4d03-e1ad-ed0106560355	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5581-4d03-c06b-dc8584375428	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5581-4d03-dd81-0c62e63e4825	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5581-4d03-c943-d9b050914314	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5581-4d03-f98e-0482118bcd88	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5581-4d03-ec92-cfc1028f5aae	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5581-4d03-eb8e-f69bb837b44c	ProgramDela-read	ProgramDela - branje	f
00030000-5581-4d03-ee32-7d750dd6a938	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5581-4d03-0847-ce31e69afa79	ProgramFestival-read	ProgramFestival - branje	f
00030000-5581-4d03-4bb9-2480496ba880	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5581-4d03-9660-0668de3796b5	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5581-4d03-3ddf-a378e2037283	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5581-4d03-c625-ac241dfa8a57	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5581-4d03-2436-0810fdc6bdab	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5581-4d03-e542-8685febbd1f9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5581-4d03-78da-828fa670dbf4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5581-4d03-a3bc-22f5547b8696	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5581-4d03-f77e-f4a8924f4433	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5581-4d03-0bdf-ba3ea288e92f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5581-4d03-5550-a4c4a7e5a12f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5581-4d03-50d2-b9b7bd4b599e	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5581-4d03-92cb-fa356d8ae3df	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5581-4d03-5b31-a2b2ee077876	ProgramRazno-read	ProgramRazno - branje	f
00030000-5581-4d03-8e3c-bcd5914484f1	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5581-4d03-cba5-1fa2edbe21d0	Prostor-read	Prostor - branje	f
00030000-5581-4d03-3be7-a6efbd43159d	Prostor-write	Prostor - spreminjanje	f
00030000-5581-4d03-bd9d-a90f4ba3dccd	Racun-read	Racun - branje	f
00030000-5581-4d03-a6c6-d4ebafdc154f	Racun-write	Racun - spreminjanje	f
00030000-5581-4d03-61de-81858314aa08	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5581-4d03-f87d-2c31bc3162d6	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5581-4d03-65d1-18170cd35843	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5581-4d03-5861-465a686aaf5a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5581-4d03-d766-bc2280d9a07d	Rekvizit-read	Rekvizit - branje	f
00030000-5581-4d03-8acf-26f106b764f7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5581-4d03-ebff-940f89e94f9b	Revizija-read	Revizija - branje	f
00030000-5581-4d03-07a9-034a666d767f	Revizija-write	Revizija - spreminjanje	f
00030000-5581-4d03-7f3d-4aef2af396c2	Rezervacija-read	Rezervacija - branje	f
00030000-5581-4d03-301e-b17485633ac6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5581-4d03-4312-c405f22f6d7f	SedezniRed-read	SedezniRed - branje	f
00030000-5581-4d03-69ee-dbfbaf87010f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5581-4d03-f4ee-336b0429e723	Sedez-read	Sedez - branje	f
00030000-5581-4d03-4079-a495fa876d2b	Sedez-write	Sedez - spreminjanje	f
00030000-5581-4d03-3769-807372dd1ba8	Sezona-read	Sezona - branje	f
00030000-5581-4d03-00d3-4b34c20c1195	Sezona-write	Sezona - spreminjanje	f
00030000-5581-4d03-5496-fbda2852d036	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5581-4d03-63a3-9a17b70d4de6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5581-4d03-5704-11fc361dec0f	Stevilcenje-read	Stevilcenje - branje	f
00030000-5581-4d03-717f-576566a543a9	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5581-4d03-acf9-c612d87b99b0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5581-4d03-2b28-5b26021f2c54	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5581-4d03-e666-bee73492fedb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5581-4d03-e265-adc87f9473f1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5581-4d03-5c0d-d0520a02c31b	Telefonska-read	Telefonska - branje	f
00030000-5581-4d03-6bab-1246d3dd47e5	Telefonska-write	Telefonska - spreminjanje	f
00030000-5581-4d03-2125-2f3e7a9e0f3c	TerminStoritve-read	TerminStoritve - branje	f
00030000-5581-4d03-98bb-f313954aa20a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5581-4d03-6968-04355c78428f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5581-4d03-cbe6-e6b8e0b5d212	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5581-4d03-334c-58a23cb157fe	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5581-4d03-d288-82faa40fb40b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5581-4d03-c8ca-55b4db71e67e	Trr-read	Trr - branje	f
00030000-5581-4d03-0f8e-9d487888e88c	Trr-write	Trr - spreminjanje	f
00030000-5581-4d03-eedb-c9caf04ef267	Uprizoritev-read	Uprizoritev - branje	f
00030000-5581-4d03-38e3-43820e513e42	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5581-4d03-b7a4-cbfe0c05ef90	Vaja-read	Vaja - branje	f
00030000-5581-4d03-6290-73c1c9ef5d53	Vaja-write	Vaja - spreminjanje	f
00030000-5581-4d03-67bd-f1253aee713f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5581-4d03-31ab-e0e25d9e68d5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5581-4d03-8bfb-1474fe664154	Zaposlitev-read	Zaposlitev - branje	f
00030000-5581-4d03-d92e-75b7902ad530	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5581-4d03-b5d4-8dcb6a9e9714	Zasedenost-read	Zasedenost - branje	f
00030000-5581-4d03-af80-a61f2d674dbb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5581-4d03-e595-77370224a466	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5581-4d03-d9b5-fbb3029f33f2	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5581-4d03-65e6-80065aff088c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5581-4d03-59d4-2df5548f18ad	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7553542)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5581-4d03-f467-23009ae3f3ed	00030000-5581-4d03-9bca-0d835cdf5f4a
00020000-5581-4d03-faa4-dbf7d289164e	00030000-5581-4d03-9be7-63ea79f7f2e2
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-bf3c-49327820792c
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-fcc3-612c7176abca
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-59cc-3d12b3c90386
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-a5ef-57b6a5be562c
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-efdb-65d851cf8efa
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-8583-5b8eddbc8574
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-7b7e-6a194695b27c
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-93f2-b885f9d3fe53
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-9be7-63ea79f7f2e2
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-bc14-908fbed57a57
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-77d8-55c4a2ab7fd1
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-3db0-f29fd6049014
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-fa39-cc4fe5868f02
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-55f0-221e273c28df
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-27d8-6e53b0c9f58a
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-db51-1051a4a3d9dc
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-e52a-94a014bae2b6
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-8388-5b036d455747
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-6280-9d87f6b2f0bf
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-9b29-b16a3c23aa30
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-3080-847736ba8239
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-6f46-aa7ab890f89e
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-b7c6-1898a8fc78c8
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-7134-e09885bbea24
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-4a2d-8d813c30ccd4
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-6223-441717efe705
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-046b-cf6d65e8e525
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-ecaf-ace8aeab3efb
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-70b5-807d230b2cec
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-042d-5c52310c69da
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-f98e-0482118bcd88
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-ec92-cfc1028f5aae
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-cba5-1fa2edbe21d0
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-3be7-a6efbd43159d
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-65d1-18170cd35843
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-5861-465a686aaf5a
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-d766-bc2280d9a07d
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-8acf-26f106b764f7
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-3769-807372dd1ba8
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-00d3-4b34c20c1195
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-6968-04355c78428f
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-eedb-c9caf04ef267
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-38e3-43820e513e42
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-b7a4-cbfe0c05ef90
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-6290-73c1c9ef5d53
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-b5d4-8dcb6a9e9714
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-af80-a61f2d674dbb
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-e595-77370224a466
00020000-5581-4d03-6690-48aa8f44926f	00030000-5581-4d03-65e6-80065aff088c
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-bf3c-49327820792c
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-efdb-65d851cf8efa
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-8583-5b8eddbc8574
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-9be7-63ea79f7f2e2
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-fa39-cc4fe5868f02
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-27d8-6e53b0c9f58a
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-e52a-94a014bae2b6
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-8388-5b036d455747
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-6280-9d87f6b2f0bf
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-9b29-b16a3c23aa30
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-3080-847736ba8239
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-6f46-aa7ab890f89e
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-b7c6-1898a8fc78c8
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-4a2d-8d813c30ccd4
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-046b-cf6d65e8e525
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-ecaf-ace8aeab3efb
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-70b5-807d230b2cec
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-cba5-1fa2edbe21d0
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-65d1-18170cd35843
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-d766-bc2280d9a07d
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-3769-807372dd1ba8
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-5c0d-d0520a02c31b
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-6bab-1246d3dd47e5
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-c8ca-55b4db71e67e
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-0f8e-9d487888e88c
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-8bfb-1474fe664154
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-d92e-75b7902ad530
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-e595-77370224a466
00020000-5581-4d03-5caa-c0c05bfd156f	00030000-5581-4d03-65e6-80065aff088c
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-bf3c-49327820792c
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-59cc-3d12b3c90386
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-efdb-65d851cf8efa
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-49db-0accf6c01035
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-e38a-9c980cfc08bf
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-f0cb-df238741093e
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-8583-5b8eddbc8574
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-9be7-63ea79f7f2e2
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-77d8-55c4a2ab7fd1
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-fa39-cc4fe5868f02
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-27d8-6e53b0c9f58a
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-e52a-94a014bae2b6
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-6280-9d87f6b2f0bf
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-9b29-b16a3c23aa30
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-3080-847736ba8239
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-b7c6-1898a8fc78c8
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-4a2d-8d813c30ccd4
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-70b5-807d230b2cec
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-f98e-0482118bcd88
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-cba5-1fa2edbe21d0
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-65d1-18170cd35843
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-d766-bc2280d9a07d
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-3769-807372dd1ba8
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-6968-04355c78428f
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-b7a4-cbfe0c05ef90
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-b5d4-8dcb6a9e9714
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-e595-77370224a466
00020000-5581-4d03-33fe-88a8a372d547	00030000-5581-4d03-65e6-80065aff088c
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-bf3c-49327820792c
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-fcc3-612c7176abca
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-a5ef-57b6a5be562c
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-efdb-65d851cf8efa
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-8583-5b8eddbc8574
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-9be7-63ea79f7f2e2
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-fa39-cc4fe5868f02
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-27d8-6e53b0c9f58a
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-6280-9d87f6b2f0bf
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-9b29-b16a3c23aa30
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-b7c6-1898a8fc78c8
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-4a2d-8d813c30ccd4
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-70b5-807d230b2cec
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-cba5-1fa2edbe21d0
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-65d1-18170cd35843
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-d766-bc2280d9a07d
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-3769-807372dd1ba8
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-6968-04355c78428f
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-e595-77370224a466
00020000-5581-4d03-35f8-418bcd19f60d	00030000-5581-4d03-65e6-80065aff088c
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-bf3c-49327820792c
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-efdb-65d851cf8efa
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-8583-5b8eddbc8574
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-9be7-63ea79f7f2e2
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-fa39-cc4fe5868f02
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-27d8-6e53b0c9f58a
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-6280-9d87f6b2f0bf
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-9b29-b16a3c23aa30
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-b7c6-1898a8fc78c8
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-4a2d-8d813c30ccd4
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-70b5-807d230b2cec
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-cba5-1fa2edbe21d0
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-65d1-18170cd35843
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-d766-bc2280d9a07d
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-3769-807372dd1ba8
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-2125-2f3e7a9e0f3c
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-e970-847349f74fd8
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-6968-04355c78428f
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-e595-77370224a466
00020000-5581-4d03-e521-45c2f4d96869	00030000-5581-4d03-65e6-80065aff088c
\.


--
-- TOC entry 2858 (class 0 OID 7553837)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7553868)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7554004)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7553602)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5581-4d04-a716-65a8f961f978	00040000-5581-4d03-836a-a153f2c0218d	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5581-4d04-0067-869595dc95ad	00040000-5581-4d03-836a-a153f2c0218d	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5581-4d04-2ae2-838ac419bcd2	00040000-5581-4d03-836a-a153f2c0218d	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5581-4d04-4091-13c5bf318312	00040000-5581-4d03-836a-a153f2c0218d	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7553637)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5581-4d03-1b8a-6ff47d7fd134	8341	Adlešiči
00050000-5581-4d03-67e7-d3b9159ac12b	5270	Ajdovščina
00050000-5581-4d03-dfa6-73209729b7cd	6280	Ankaran/Ancarano
00050000-5581-4d03-6311-aef5303fa847	9253	Apače
00050000-5581-4d03-ff52-ec00c17bb349	8253	Artiče
00050000-5581-4d03-a6bd-a1381b63d827	4275	Begunje na Gorenjskem
00050000-5581-4d03-9244-9a9b69462c08	1382	Begunje pri Cerknici
00050000-5581-4d03-504c-8b7dd9acc55d	9231	Beltinci
00050000-5581-4d03-a570-2bb765055385	2234	Benedikt
00050000-5581-4d03-67d4-e778965bde66	2345	Bistrica ob Dravi
00050000-5581-4d03-67bd-cd76824ee6f1	3256	Bistrica ob Sotli
00050000-5581-4d03-0a0c-eee4259d3bd4	8259	Bizeljsko
00050000-5581-4d03-aedf-bf418f247f1e	1223	Blagovica
00050000-5581-4d03-4b57-3d9bd52055b1	8283	Blanca
00050000-5581-4d03-5ea1-6304c8e9db3f	4260	Bled
00050000-5581-4d03-eafb-0b37f9ab39ed	4273	Blejska Dobrava
00050000-5581-4d03-9239-98498f418ad0	9265	Bodonci
00050000-5581-4d03-478d-ec76598d57ac	9222	Bogojina
00050000-5581-4d03-d647-8ce9ca383158	4263	Bohinjska Bela
00050000-5581-4d03-3657-0ee3d9c647ce	4264	Bohinjska Bistrica
00050000-5581-4d03-ba03-35616b31b616	4265	Bohinjsko jezero
00050000-5581-4d03-0248-77bea5705938	1353	Borovnica
00050000-5581-4d03-48a2-bc30e63158cb	8294	Boštanj
00050000-5581-4d03-1eab-a06f0f24e669	5230	Bovec
00050000-5581-4d03-5d9f-4025010795c5	5295	Branik
00050000-5581-4d03-e393-70c6d152ac1b	3314	Braslovče
00050000-5581-4d03-de24-2be38fbc1376	5223	Breginj
00050000-5581-4d03-46f6-69fd76ffeddd	8280	Brestanica
00050000-5581-4d03-bf9c-08773d33c210	2354	Bresternica
00050000-5581-4d03-74e0-b4d89dec5000	4243	Brezje
00050000-5581-4d03-2a69-02ec95f25f1c	1351	Brezovica pri Ljubljani
00050000-5581-4d03-79eb-fe023f45e76f	8250	Brežice
00050000-5581-4d03-1e5c-8aed2010ebb5	4210	Brnik - Aerodrom
00050000-5581-4d03-378b-5ffb2f70b893	8321	Brusnice
00050000-5581-4d03-54d2-607eb61b22c3	3255	Buče
00050000-5581-4d03-b276-0f6c0bd3cf24	8276	Bučka 
00050000-5581-4d03-9e58-cb26482193e1	9261	Cankova
00050000-5581-4d03-bd34-3095bdb9d688	3000	Celje 
00050000-5581-4d03-1645-3f0c50b25e89	3001	Celje - poštni predali
00050000-5581-4d03-5d63-3b054287c642	4207	Cerklje na Gorenjskem
00050000-5581-4d03-3d37-ef1e73b86d21	8263	Cerklje ob Krki
00050000-5581-4d03-0650-ddf807c7c3be	1380	Cerknica
00050000-5581-4d03-31bb-c7b0fb29126b	5282	Cerkno
00050000-5581-4d03-9f8e-273de267a162	2236	Cerkvenjak
00050000-5581-4d03-4f56-a060257da9de	2215	Ceršak
00050000-5581-4d03-882b-455ae2e6e926	2326	Cirkovce
00050000-5581-4d03-e4a1-008f350a6f05	2282	Cirkulane
00050000-5581-4d03-8b90-3cbc7da440d5	5273	Col
00050000-5581-4d03-b7f6-4d34cf6d0a6e	8251	Čatež ob Savi
00050000-5581-4d03-fca7-bd37f610c3af	1413	Čemšenik
00050000-5581-4d03-26e9-ea74998f324c	5253	Čepovan
00050000-5581-4d03-7653-66a559e0591e	9232	Črenšovci
00050000-5581-4d03-1cf1-71a1cdd39846	2393	Črna na Koroškem
00050000-5581-4d03-393e-99d75e88494d	6275	Črni Kal
00050000-5581-4d03-47b9-1a4831705cf9	5274	Črni Vrh nad Idrijo
00050000-5581-4d03-25cb-8f4e7e73c113	5262	Črniče
00050000-5581-4d03-56b2-e84ab8772848	8340	Črnomelj
00050000-5581-4d03-6e45-964764cbff24	6271	Dekani
00050000-5581-4d03-5849-98ab405ce2a5	5210	Deskle
00050000-5581-4d03-73f1-6de88646ec88	2253	Destrnik
00050000-5581-4d03-bdcf-cf09ac495831	6215	Divača
00050000-5581-4d03-21df-8b95c4218279	1233	Dob
00050000-5581-4d03-47e0-126983b6d62e	3224	Dobje pri Planini
00050000-5581-4d03-ec79-96b45e886c55	8257	Dobova
00050000-5581-4d03-a2a3-41609564b1ad	1423	Dobovec
00050000-5581-4d03-59e9-81ceef03150d	5263	Dobravlje
00050000-5581-4d03-8078-a81bba9ce8e8	3204	Dobrna
00050000-5581-4d03-c62d-e290bd45178c	8211	Dobrnič
00050000-5581-4d03-167e-6d38a8251ac8	1356	Dobrova
00050000-5581-4d03-a3d4-9462bd99e689	9223	Dobrovnik/Dobronak 
00050000-5581-4d03-8987-79e6155d9e1c	5212	Dobrovo v Brdih
00050000-5581-4d03-fdfd-ebc487367367	1431	Dol pri Hrastniku
00050000-5581-4d03-23e9-2cf69e4cce6a	1262	Dol pri Ljubljani
00050000-5581-4d03-88f2-2de9e3de6eec	1273	Dole pri Litiji
00050000-5581-4d03-1a78-4154a692412d	1331	Dolenja vas
00050000-5581-4d03-c6ef-3d179fc44fbe	8350	Dolenjske Toplice
00050000-5581-4d03-5f2a-8333b4b02333	1230	Domžale
00050000-5581-4d03-95ed-12433fde1c19	2252	Dornava
00050000-5581-4d03-d371-e81b2e196e59	5294	Dornberk
00050000-5581-4d03-9471-053af4f020de	1319	Draga
00050000-5581-4d03-a6d0-c2b7b2d2b603	8343	Dragatuš
00050000-5581-4d03-7681-aaa9b55fb4af	3222	Dramlje
00050000-5581-4d03-615c-56be5da208c9	2370	Dravograd
00050000-5581-4d03-5db4-d0d35b663ea1	4203	Duplje
00050000-5581-4d03-05a5-682674363ee8	6221	Dutovlje
00050000-5581-4d03-ca57-dd6ee7e26379	8361	Dvor
00050000-5581-4d03-8af7-9bc5eb05db0e	2343	Fala
00050000-5581-4d03-56a8-5b49fec9cc92	9208	Fokovci
00050000-5581-4d03-fd9b-351c28141f7c	2313	Fram
00050000-5581-4d03-5d21-5b1f3e5a837d	3213	Frankolovo
00050000-5581-4d03-fd1d-16af64089673	1274	Gabrovka
00050000-5581-4d03-0d3e-c41c4550cb36	8254	Globoko
00050000-5581-4d03-0242-0945bb5d7ba9	5275	Godovič
00050000-5581-4d03-e2c5-0d9155e759f2	4204	Golnik
00050000-5581-4d03-0268-31758578bf13	3303	Gomilsko
00050000-5581-4d03-b15f-d404021188bf	4224	Gorenja vas
00050000-5581-4d03-d58e-064cc36d350c	3263	Gorica pri Slivnici
00050000-5581-4d03-89a3-10ac6076e3ad	2272	Gorišnica
00050000-5581-4d03-05d4-8c634c1d06ca	9250	Gornja Radgona
00050000-5581-4d03-5954-6c9365c62639	3342	Gornji Grad
00050000-5581-4d03-48e8-5af7d5680e4a	4282	Gozd Martuljek
00050000-5581-4d03-1a69-7015d7e89191	6272	Gračišče
00050000-5581-4d03-ddb8-9c5e05e74a16	9264	Grad
00050000-5581-4d03-6c7d-d75867725dc1	8332	Gradac
00050000-5581-4d03-944c-d2edb6d9550f	1384	Grahovo
00050000-5581-4d03-3cfc-79e13da4366b	5242	Grahovo ob Bači
00050000-5581-4d03-f777-79e280f3c8b8	5251	Grgar
00050000-5581-4d03-da3b-f6f517b0294f	3302	Griže
00050000-5581-4d03-530d-71c5970facc8	3231	Grobelno
00050000-5581-4d03-7854-e89471d33585	1290	Grosuplje
00050000-5581-4d03-2bb3-105b4bd0e25f	2288	Hajdina
00050000-5581-4d03-4cf5-c396b9c58afe	8362	Hinje
00050000-5581-4d03-5d2e-01c5b8f7761a	2311	Hoče
00050000-5581-4d03-f9e3-9d9d1cdbd929	9205	Hodoš/Hodos
00050000-5581-4d03-ec03-164e1a018c53	1354	Horjul
00050000-5581-4d03-0041-6708a9acceda	1372	Hotedršica
00050000-5581-4d03-1f5b-cedafd7485ad	1430	Hrastnik
00050000-5581-4d03-e385-0300b7a3f422	6225	Hruševje
00050000-5581-4d03-4a38-a93c416e51dd	4276	Hrušica
00050000-5581-4d03-5612-babc344becb9	5280	Idrija
00050000-5581-4d03-234c-59b2e4cdeec8	1292	Ig
00050000-5581-4d03-c55e-913f7e44d7a3	6250	Ilirska Bistrica
00050000-5581-4d03-0572-67bcdb79c671	6251	Ilirska Bistrica-Trnovo
00050000-5581-4d03-c2ec-370d6a38e915	1295	Ivančna Gorica
00050000-5581-4d03-4233-960d8ea9026c	2259	Ivanjkovci
00050000-5581-4d03-4316-db9df536bfce	1411	Izlake
00050000-5581-4d03-0105-022e1d4b994b	6310	Izola/Isola
00050000-5581-4d03-6c40-563d54c78e90	2222	Jakobski Dol
00050000-5581-4d03-c54c-65112e4f3779	2221	Jarenina
00050000-5581-4d03-9daf-fb79f432bc0f	6254	Jelšane
00050000-5581-4d03-2057-eb3d44d8e42f	4270	Jesenice
00050000-5581-4d03-352d-87408fba70dd	8261	Jesenice na Dolenjskem
00050000-5581-4d03-ee21-3f272c70c0c4	3273	Jurklošter
00050000-5581-4d03-a8af-774df2096ee9	2223	Jurovski Dol
00050000-5581-4d03-fad1-71e666631264	2256	Juršinci
00050000-5581-4d03-054e-05995acd8cc4	5214	Kal nad Kanalom
00050000-5581-4d03-b3be-d3976ead474b	3233	Kalobje
00050000-5581-4d03-981d-6b2dd571aff7	4246	Kamna Gorica
00050000-5581-4d03-7487-24fe1a0819a5	2351	Kamnica
00050000-5581-4d03-5c16-319eaab5335b	1241	Kamnik
00050000-5581-4d03-7d02-da8f52be6c9c	5213	Kanal
00050000-5581-4d03-aae8-c1ae08487fa0	8258	Kapele
00050000-5581-4d03-db0f-bcdce64f44e6	2362	Kapla
00050000-5581-4d03-6337-c2cfd9c9fc19	2325	Kidričevo
00050000-5581-4d03-f31b-bb5361e16293	1412	Kisovec
00050000-5581-4d03-89e0-e7e5c784f0a0	6253	Knežak
00050000-5581-4d03-fcc7-7dd42c03dbf2	5222	Kobarid
00050000-5581-4d03-1945-c4d8758d7b06	9227	Kobilje
00050000-5581-4d03-6f28-b6b59f23f80c	1330	Kočevje
00050000-5581-4d03-bc07-9bfc185b24ee	1338	Kočevska Reka
00050000-5581-4d03-4be3-fcf3b8ef9ebc	2276	Kog
00050000-5581-4d03-350b-7919f5cb9cd2	5211	Kojsko
00050000-5581-4d03-ccd3-948581373dd1	6223	Komen
00050000-5581-4d03-e948-6ee0cbb99624	1218	Komenda
00050000-5581-4d03-dcd6-f4592507a7b3	6000	Koper/Capodistria 
00050000-5581-4d03-15e3-6d8f1849f919	6001	Koper/Capodistria - poštni predali
00050000-5581-4d03-14ea-aa9aeb2c5cc8	8282	Koprivnica
00050000-5581-4d03-8079-219759735091	5296	Kostanjevica na Krasu
00050000-5581-4d03-25b7-d3a2fd4d9f2c	8311	Kostanjevica na Krki
00050000-5581-4d03-c9f7-68882efa4efd	1336	Kostel
00050000-5581-4d03-1359-79040a9fb448	6256	Košana
00050000-5581-4d03-12ca-9e8288b7f2ae	2394	Kotlje
00050000-5581-4d03-b349-1e1004fb055e	6240	Kozina
00050000-5581-4d03-e574-559a2380139f	3260	Kozje
00050000-5581-4d03-5129-c67f27717645	4000	Kranj 
00050000-5581-4d03-55d3-77f4b6dca2af	4001	Kranj - poštni predali
00050000-5581-4d03-8288-03f29a09c166	4280	Kranjska Gora
00050000-5581-4d03-33dc-17234679a2d8	1281	Kresnice
00050000-5581-4d03-bd76-aec4a90cc196	4294	Križe
00050000-5581-4d03-12c2-5d36a02ece35	9206	Križevci
00050000-5581-4d03-0387-14bf559bdcef	9242	Križevci pri Ljutomeru
00050000-5581-4d03-851d-6c3cdc6ef6d4	1301	Krka
00050000-5581-4d03-6c67-fed06a3cf800	8296	Krmelj
00050000-5581-4d03-fece-61ce925486ae	4245	Kropa
00050000-5581-4d03-1c5b-6b9da5c28ba3	8262	Krška vas
00050000-5581-4d03-1cbb-08a28dc8b57f	8270	Krško
00050000-5581-4d03-6656-3f7c287e6814	9263	Kuzma
00050000-5581-4d03-90ca-3f8ce37f1500	2318	Laporje
00050000-5581-4d03-0390-2ddb40245507	3270	Laško
00050000-5581-4d03-1561-2ed0e5a05fce	1219	Laze v Tuhinju
00050000-5581-4d03-46f6-fd79d9202841	2230	Lenart v Slovenskih goricah
00050000-5581-4d03-e2af-cb756a363b99	9220	Lendava/Lendva
00050000-5581-4d03-bac2-d4665c935e31	4248	Lesce
00050000-5581-4d03-2578-2384f6deba28	3261	Lesično
00050000-5581-4d03-ed10-42183b0b6754	8273	Leskovec pri Krškem
00050000-5581-4d03-d6c8-5511ead21144	2372	Libeliče
00050000-5581-4d03-3a2f-a2eafb8c0e31	2341	Limbuš
00050000-5581-4d03-2265-75de4023b6e7	1270	Litija
00050000-5581-4d03-e5f2-8c20ac3bc5dd	3202	Ljubečna
00050000-5581-4d03-e3ed-fa837c1b8f05	1000	Ljubljana 
00050000-5581-4d03-8d84-46053a074b7b	1001	Ljubljana - poštni predali
00050000-5581-4d03-eec6-7683418b1b19	1231	Ljubljana - Črnuče
00050000-5581-4d03-8aa9-f28e9112f579	1261	Ljubljana - Dobrunje
00050000-5581-4d03-ebd8-2c2ba0e46c5e	1260	Ljubljana - Polje
00050000-5581-4d03-e0e2-0e81abbe45a3	1210	Ljubljana - Šentvid
00050000-5581-4d03-be54-126af59068e1	1211	Ljubljana - Šmartno
00050000-5581-4d03-ea0d-8057908c2d86	3333	Ljubno ob Savinji
00050000-5581-4d03-6fca-6cae1c4a586d	9240	Ljutomer
00050000-5581-4d03-6e6d-7c8e75c80929	3215	Loče
00050000-5581-4d03-ca6c-0e0d33362c23	5231	Log pod Mangartom
00050000-5581-4d03-9341-d0e8413e92c7	1358	Log pri Brezovici
00050000-5581-4d03-f3a5-2204d677c37d	1370	Logatec
00050000-5581-4d03-202c-be54cdcfcefa	1371	Logatec
00050000-5581-4d03-d80d-b646f1e8518d	1434	Loka pri Zidanem Mostu
00050000-5581-4d03-8b8c-5c3c80184755	3223	Loka pri Žusmu
00050000-5581-4d03-4384-b4ce141442fe	6219	Lokev
00050000-5581-4d03-5d5b-c2b9ace32623	1318	Loški Potok
00050000-5581-4d03-5a5e-4912fefd206b	2324	Lovrenc na Dravskem polju
00050000-5581-4d03-ec5e-b4bd2ab20f11	2344	Lovrenc na Pohorju
00050000-5581-4d03-27e9-3f4848d31a99	3334	Luče
00050000-5581-4d03-45a8-6081bbafefd6	1225	Lukovica
00050000-5581-4d03-e6f6-b3623009a23f	9202	Mačkovci
00050000-5581-4d03-9076-50d46b095c51	2322	Majšperk
00050000-5581-4d03-1e86-3ef40ae4e7ee	2321	Makole
00050000-5581-4d03-c33c-ab14b2346fe5	9243	Mala Nedelja
00050000-5581-4d03-2b37-a8a670afd44e	2229	Malečnik
00050000-5581-4d03-d8ef-45f846aadfce	6273	Marezige
00050000-5581-4d03-7d3a-e323b3c9209a	2000	Maribor 
00050000-5581-4d03-0088-763d6780b330	2001	Maribor - poštni predali
00050000-5581-4d03-3cf2-0d53e1e7daf8	2206	Marjeta na Dravskem polju
00050000-5581-4d03-997e-a1a624013d34	2281	Markovci
00050000-5581-4d03-b8cc-a03078477670	9221	Martjanci
00050000-5581-4d03-d2fb-b871ede4a66a	6242	Materija
00050000-5581-4d03-5fd5-f8fc8434fa65	4211	Mavčiče
00050000-5581-4d03-a77a-0ccfa1556c54	1215	Medvode
00050000-5581-4d03-0232-fc969f80138d	1234	Mengeš
00050000-5581-4d03-0e34-224ca56a6c83	8330	Metlika
00050000-5581-4d03-ac95-84d98e2907fc	2392	Mežica
00050000-5581-4d03-7ff9-bffba23b88bb	2204	Miklavž na Dravskem polju
00050000-5581-4d03-70bd-d958eac0d3e6	2275	Miklavž pri Ormožu
00050000-5581-4d03-f4ef-5ebca1b38337	5291	Miren
00050000-5581-4d03-5527-9704263ec773	8233	Mirna
00050000-5581-4d03-da46-6c16059f1989	8216	Mirna Peč
00050000-5581-4d03-bfbb-3942b46270af	2382	Mislinja
00050000-5581-4d03-d5c0-7620841010bb	4281	Mojstrana
00050000-5581-4d03-6e65-14f65ba7a944	8230	Mokronog
00050000-5581-4d03-051f-682317326dda	1251	Moravče
00050000-5581-4d03-ad65-612263c6f482	9226	Moravske Toplice
00050000-5581-4d03-1388-4af792228477	5216	Most na Soči
00050000-5581-4d03-d5ee-6aebe5928091	1221	Motnik
00050000-5581-4d03-cdf0-2db54437f827	3330	Mozirje
00050000-5581-4d03-0956-e3b77cbeba8c	9000	Murska Sobota 
00050000-5581-4d03-8094-29cf087a2b98	9001	Murska Sobota - poštni predali
00050000-5581-4d03-9a1f-e9aa8880ae2b	2366	Muta
00050000-5581-4d03-03e8-a6e90b1e9b13	4202	Naklo
00050000-5581-4d03-fd7d-3bb81ad04184	3331	Nazarje
00050000-5581-4d03-7e6f-f9b0c60149ba	1357	Notranje Gorice
00050000-5581-4d03-c424-64cc11eb97da	3203	Nova Cerkev
00050000-5581-4d03-6435-99e9ab4ff243	5000	Nova Gorica 
00050000-5581-4d03-2a78-70e34e4a2844	5001	Nova Gorica - poštni predali
00050000-5581-4d03-cc03-1798d8b691a6	1385	Nova vas
00050000-5581-4d03-dd11-30c2459d794e	8000	Novo mesto
00050000-5581-4d03-9965-08b883ba9b28	8001	Novo mesto - poštni predali
00050000-5581-4d03-f143-736749ed70ee	6243	Obrov
00050000-5581-4d03-317b-74d2f9cb4faa	9233	Odranci
00050000-5581-4d03-1df2-8661b33fa4a3	2317	Oplotnica
00050000-5581-4d03-7fd4-4ca09185db34	2312	Orehova vas
00050000-5581-4d03-ade0-cf483d5fc3a6	2270	Ormož
00050000-5581-4d03-89c5-e5b5d85c1734	1316	Ortnek
00050000-5581-4d03-8bf5-b8b782b9cd3e	1337	Osilnica
00050000-5581-4d03-221b-aedd9ea1b2da	8222	Otočec
00050000-5581-4d03-3a11-549ef5ad8e81	2361	Ožbalt
00050000-5581-4d03-0c01-ff27f0aaec28	2231	Pernica
00050000-5581-4d03-ba60-fc24251052ca	2211	Pesnica pri Mariboru
00050000-5581-4d03-3966-ed58ac44bb9b	9203	Petrovci
00050000-5581-4d03-5e6b-8281400b17ac	3301	Petrovče
00050000-5581-4d03-dea0-ee5e51a0c266	6330	Piran/Pirano
00050000-5581-4d03-40c3-1747a3d4a036	8255	Pišece
00050000-5581-4d03-7ba4-09f862964a36	6257	Pivka
00050000-5581-4d03-d5d4-5958567a77aa	6232	Planina
00050000-5581-4d03-157f-cab1978272ec	3225	Planina pri Sevnici
00050000-5581-4d03-f6c0-f3dbb06fd96f	6276	Pobegi
00050000-5581-4d03-7792-2b6fc300fc21	8312	Podbočje
00050000-5581-4d03-377a-830260909a9c	5243	Podbrdo
00050000-5581-4d03-69b6-ad45fa183fe2	3254	Podčetrtek
00050000-5581-4d03-b8a5-d133193fe489	2273	Podgorci
00050000-5581-4d03-e766-ebd52e085efd	6216	Podgorje
00050000-5581-4d03-b710-4379f504e733	2381	Podgorje pri Slovenj Gradcu
00050000-5581-4d03-bc51-ce4ba36b6787	6244	Podgrad
00050000-5581-4d03-b75b-f37d0712a277	1414	Podkum
00050000-5581-4d03-d920-76b93c77bd69	2286	Podlehnik
00050000-5581-4d03-f350-6610aa4bbad4	5272	Podnanos
00050000-5581-4d03-21dd-6ba1d7997440	4244	Podnart
00050000-5581-4d03-6227-4edca6c1144c	3241	Podplat
00050000-5581-4d03-aab5-6a7f78e7fba9	3257	Podsreda
00050000-5581-4d03-c004-95b196d95cc4	2363	Podvelka
00050000-5581-4d03-b049-f21f66e016a4	2208	Pohorje
00050000-5581-4d03-71bc-66a230e466f6	2257	Polenšak
00050000-5581-4d03-d89e-670f445fb446	1355	Polhov Gradec
00050000-5581-4d03-01bc-5cc4ff4b070b	4223	Poljane nad Škofjo Loko
00050000-5581-4d03-fd5d-e9a4295ac44c	2319	Poljčane
00050000-5581-4d03-8918-c174cc592ce5	1272	Polšnik
00050000-5581-4d03-891f-2c60c2ddfa0d	3313	Polzela
00050000-5581-4d03-e08d-825735447f7b	3232	Ponikva
00050000-5581-4d03-93b7-bc97432804a4	6320	Portorož/Portorose
00050000-5581-4d03-e93f-506dd42f5eee	6230	Postojna
00050000-5581-4d03-0244-8e6badc83cc4	2331	Pragersko
00050000-5581-4d03-49cf-877df3490907	3312	Prebold
00050000-5581-4d03-8f8e-2c4da38094ba	4205	Preddvor
00050000-5581-4d03-5385-e219c5e38cba	6255	Prem
00050000-5581-4d03-f355-e8d65285e9fc	1352	Preserje
00050000-5581-4d03-83e3-78a7882e2179	6258	Prestranek
00050000-5581-4d03-4618-3d8714628a82	2391	Prevalje
00050000-5581-4d03-c0dc-2aa617f0d174	3262	Prevorje
00050000-5581-4d03-c3e3-6d1bf0f0f2a9	1276	Primskovo 
00050000-5581-4d03-3ce2-a75a6ead2adf	3253	Pristava pri Mestinju
00050000-5581-4d03-1f6c-b5b746cfd7e2	9207	Prosenjakovci/Partosfalva
00050000-5581-4d03-69bd-f28e06516f59	5297	Prvačina
00050000-5581-4d03-3ddb-d4a66cdfa53b	2250	Ptuj
00050000-5581-4d03-06ea-68d3fd40506d	2323	Ptujska Gora
00050000-5581-4d03-ba0e-d6f4c7e9fcad	9201	Puconci
00050000-5581-4d03-95c2-7455f074f327	2327	Rače
00050000-5581-4d03-bc0d-0012bb1f98e2	1433	Radeče
00050000-5581-4d03-0a26-9da004091498	9252	Radenci
00050000-5581-4d03-3757-dfac60f23d48	2360	Radlje ob Dravi
00050000-5581-4d03-aeb0-52e2efeb892e	1235	Radomlje
00050000-5581-4d03-fb01-d69d69bda258	4240	Radovljica
00050000-5581-4d03-3dfa-67047598e52b	8274	Raka
00050000-5581-4d03-654d-097c204df2a4	1381	Rakek
00050000-5581-4d03-051f-1416239c4342	4283	Rateče - Planica
00050000-5581-4d03-9cfc-abd1433626d4	2390	Ravne na Koroškem
00050000-5581-4d03-5836-ecd066ff38e1	9246	Razkrižje
00050000-5581-4d03-9d53-69847b10252d	3332	Rečica ob Savinji
00050000-5581-4d03-38ce-335decc40fcc	5292	Renče
00050000-5581-4d03-f032-979b603dc8e8	1310	Ribnica
00050000-5581-4d03-1b11-ac426677283a	2364	Ribnica na Pohorju
00050000-5581-4d03-3139-bf1e3c10c6ce	3272	Rimske Toplice
00050000-5581-4d03-ccfe-1de31be9fbf8	1314	Rob
00050000-5581-4d03-5252-8e69fdbd0622	5215	Ročinj
00050000-5581-4d03-b347-f6458988913a	3250	Rogaška Slatina
00050000-5581-4d03-8890-d81bd0df43ca	9262	Rogašovci
00050000-5581-4d03-d28e-d31281dc8bdf	3252	Rogatec
00050000-5581-4d03-b69f-5b78c7e33f89	1373	Rovte
00050000-5581-4d03-58ec-104e9af7f7f4	2342	Ruše
00050000-5581-4d03-64d7-8f5f951562e5	1282	Sava
00050000-5581-4d03-bbed-228968076c19	6333	Sečovlje/Sicciole
00050000-5581-4d03-abc8-fa5d679de05c	4227	Selca
00050000-5581-4d03-97d4-7469673b23eb	2352	Selnica ob Dravi
00050000-5581-4d03-4b09-3d71acabb8c4	8333	Semič
00050000-5581-4d03-6ed2-c61cf4d3e91d	8281	Senovo
00050000-5581-4d03-ff48-eeca5da55e1d	6224	Senožeče
00050000-5581-4d03-d96d-fd07369a3148	8290	Sevnica
00050000-5581-4d03-3942-5204acf43c68	6210	Sežana
00050000-5581-4d03-da18-4c02f8fa5f99	2214	Sladki Vrh
00050000-5581-4d03-5bbd-34410655b161	5283	Slap ob Idrijci
00050000-5581-4d03-6128-5004b7f4b35c	2380	Slovenj Gradec
00050000-5581-4d03-9289-0e978d83411c	2310	Slovenska Bistrica
00050000-5581-4d03-583e-b81cca9678de	3210	Slovenske Konjice
00050000-5581-4d03-56fc-e37026edff16	1216	Smlednik
00050000-5581-4d03-bcfc-36b66a4741a0	5232	Soča
00050000-5581-4d03-2da9-c12a4d0d67d5	1317	Sodražica
00050000-5581-4d03-2df5-e0c88f0f72de	3335	Solčava
00050000-5581-4d03-2f42-c24ee7ecff4d	5250	Solkan
00050000-5581-4d03-e27c-f4fe77d3d006	4229	Sorica
00050000-5581-4d03-bc59-651956af1769	4225	Sovodenj
00050000-5581-4d03-3691-0cfd9aef8cd7	5281	Spodnja Idrija
00050000-5581-4d03-445b-75161486b4de	2241	Spodnji Duplek
00050000-5581-4d03-1d52-95660f8d9722	9245	Spodnji Ivanjci
00050000-5581-4d03-1fe8-fbab86e45ded	2277	Središče ob Dravi
00050000-5581-4d03-5656-4589af92ad50	4267	Srednja vas v Bohinju
00050000-5581-4d03-0224-11022ce493dc	8256	Sromlje 
00050000-5581-4d03-4b2e-529f944d0c1b	5224	Srpenica
00050000-5581-4d03-0217-e61ef75918ab	1242	Stahovica
00050000-5581-4d03-877c-6150971be2a0	1332	Stara Cerkev
00050000-5581-4d03-e24a-bb95c2d07d3d	8342	Stari trg ob Kolpi
00050000-5581-4d03-b27c-663ea3f5c189	1386	Stari trg pri Ložu
00050000-5581-4d03-67c3-2f6ec33dce70	2205	Starše
00050000-5581-4d03-1b3e-68376fcf1f13	2289	Stoperce
00050000-5581-4d03-5224-862f10b75a7f	8322	Stopiče
00050000-5581-4d03-2d13-7458d9beff46	3206	Stranice
00050000-5581-4d03-4f57-54fd430606e9	8351	Straža
00050000-5581-4d03-5409-b9c22f5f1498	1313	Struge
00050000-5581-4d03-64d2-a86f07f72ffc	8293	Studenec
00050000-5581-4d03-2888-dad9b1f829fd	8331	Suhor
00050000-5581-4d03-76fc-efed60d49195	2233	Sv. Ana v Slovenskih goricah
00050000-5581-4d03-2322-0bfaa324a8cc	2235	Sv. Trojica v Slovenskih goricah
00050000-5581-4d03-12e0-46cc0aea033c	2353	Sveti Duh na Ostrem Vrhu
00050000-5581-4d03-ae9c-422f3614c514	9244	Sveti Jurij ob Ščavnici
00050000-5581-4d03-0c3e-bcc8b4521558	3264	Sveti Štefan
00050000-5581-4d03-961f-695cf476f8c6	2258	Sveti Tomaž
00050000-5581-4d03-2613-789d1aae57e1	9204	Šalovci
00050000-5581-4d03-3f93-c3000ca52ba3	5261	Šempas
00050000-5581-4d03-6477-05c9b28f6d23	5290	Šempeter pri Gorici
00050000-5581-4d03-2d28-f2748468b65c	3311	Šempeter v Savinjski dolini
00050000-5581-4d03-d467-610b53c8f245	4208	Šenčur
00050000-5581-4d03-f691-09f48a22b358	2212	Šentilj v Slovenskih goricah
00050000-5581-4d03-d6b8-009f66dfa45c	8297	Šentjanž
00050000-5581-4d03-60de-89b41b576a27	2373	Šentjanž pri Dravogradu
00050000-5581-4d03-fe8d-e5a69980ee41	8310	Šentjernej
00050000-5581-4d03-8ccd-512f4add27fa	3230	Šentjur
00050000-5581-4d03-5df1-2cec7c69d821	3271	Šentrupert
00050000-5581-4d03-fc00-ea9a00954f86	8232	Šentrupert
00050000-5581-4d03-9f88-5ba46d5c97e7	1296	Šentvid pri Stični
00050000-5581-4d03-7f53-c32a5580b379	8275	Škocjan
00050000-5581-4d03-5748-3e059de33236	6281	Škofije
00050000-5581-4d03-d693-c9a9d2fd2e39	4220	Škofja Loka
00050000-5581-4d03-266a-c791836615a9	3211	Škofja vas
00050000-5581-4d03-4018-159de50aa364	1291	Škofljica
00050000-5581-4d03-7df3-4f420d5bd11b	6274	Šmarje
00050000-5581-4d03-1d78-a590cf2c51ee	1293	Šmarje - Sap
00050000-5581-4d03-aa4b-d08568035485	3240	Šmarje pri Jelšah
00050000-5581-4d03-e4b0-105d7ca7e48b	8220	Šmarješke Toplice
00050000-5581-4d03-76ae-7af1707e96b0	2315	Šmartno na Pohorju
00050000-5581-4d03-4678-b36138f09e4a	3341	Šmartno ob Dreti
00050000-5581-4d03-1cae-7c0f45947b29	3327	Šmartno ob Paki
00050000-5581-4d03-4b54-b8c2df17d621	1275	Šmartno pri Litiji
00050000-5581-4d03-4faa-e5c078c3ed60	2383	Šmartno pri Slovenj Gradcu
00050000-5581-4d03-a069-ad75a57da340	3201	Šmartno v Rožni dolini
00050000-5581-4d03-8c56-b09cfa9e54e4	3325	Šoštanj
00050000-5581-4d03-be60-1362aa3f4a0b	6222	Štanjel
00050000-5581-4d03-6f6c-3759e2598bff	3220	Štore
00050000-5581-4d03-b862-f682d9654e0e	3304	Tabor
00050000-5581-4d03-f44e-d11f636fd8bc	3221	Teharje
00050000-5581-4d03-483b-30c687fa1abc	9251	Tišina
00050000-5581-4d03-7ffd-d107fb429e25	5220	Tolmin
00050000-5581-4d03-7d73-facab4d48f6d	3326	Topolšica
00050000-5581-4d03-0131-fdc46dd741ad	2371	Trbonje
00050000-5581-4d03-f502-456d9579d031	1420	Trbovlje
00050000-5581-4d03-4e82-128fb7187a9f	8231	Trebelno 
00050000-5581-4d03-c01e-177fddaaa4e6	8210	Trebnje
00050000-5581-4d03-7f72-829b305bb731	5252	Trnovo pri Gorici
00050000-5581-4d03-7e5e-5e0d08ea15a4	2254	Trnovska vas
00050000-5581-4d03-a9fc-4afcdada50a9	1222	Trojane
00050000-5581-4d03-bdb7-55c1707b1f28	1236	Trzin
00050000-5581-4d03-9f04-bede33bc1214	4290	Tržič
00050000-5581-4d03-229a-50a4c2a72c6e	8295	Tržišče
00050000-5581-4d03-26e9-2ce1eaaee85e	1311	Turjak
00050000-5581-4d03-ca20-b8885d816e2d	9224	Turnišče
00050000-5581-4d03-8913-0410ff69fa11	8323	Uršna sela
00050000-5581-4d03-d624-07a9b316e28f	1252	Vače
00050000-5581-4d03-41c6-17312efbcca5	3320	Velenje 
00050000-5581-4d03-3bd3-5670ca4ee2cd	3322	Velenje - poštni predali
00050000-5581-4d03-2ce9-2615af272866	8212	Velika Loka
00050000-5581-4d03-4814-00aee2e435d7	2274	Velika Nedelja
00050000-5581-4d03-fdc3-9986ec9ef8a1	9225	Velika Polana
00050000-5581-4d03-df99-640d81e0ec03	1315	Velike Lašče
00050000-5581-4d03-5064-dcbe80fad35f	8213	Veliki Gaber
00050000-5581-4d03-9e79-92ee8b618451	9241	Veržej
00050000-5581-4d03-1ca0-ca8ccb86e29d	1312	Videm - Dobrepolje
00050000-5581-4d03-08e5-5f1c83b8b96f	2284	Videm pri Ptuju
00050000-5581-4d03-cb8e-74db7c3f51cd	8344	Vinica
00050000-5581-4d03-6267-f55d368c87c8	5271	Vipava
00050000-5581-4d03-5e72-f7149fc633ac	4212	Visoko
00050000-5581-4d03-7bab-4a7c0375f9ed	1294	Višnja Gora
00050000-5581-4d03-6d1c-a4ce93323f78	3205	Vitanje
00050000-5581-4d03-2a1b-b5579814e2fc	2255	Vitomarci
00050000-5581-4d03-efed-46501136cab6	1217	Vodice
00050000-5581-4d03-bed8-3ac413a1e761	3212	Vojnik\t
00050000-5581-4d03-1240-5e586ae2a054	5293	Volčja Draga
00050000-5581-4d03-1699-18cfc761d11d	2232	Voličina
00050000-5581-4d03-205f-ca23b37413b7	3305	Vransko
00050000-5581-4d03-246f-d219a26b3523	6217	Vremski Britof
00050000-5581-4d03-99c6-4c374c4e73f4	1360	Vrhnika
00050000-5581-4d03-1557-5350a2d2b688	2365	Vuhred
00050000-5581-4d03-3972-1c10783b6885	2367	Vuzenica
00050000-5581-4d03-8905-99a4add7b929	8292	Zabukovje 
00050000-5581-4d03-0ba2-c3e12fd4cfd6	1410	Zagorje ob Savi
00050000-5581-4d03-2bd5-8a42b31d8b29	1303	Zagradec
00050000-5581-4d03-8a96-22a3a0a31d34	2283	Zavrč
00050000-5581-4d03-08f1-a1abcee1d270	8272	Zdole 
00050000-5581-4d03-3acd-4894349db786	4201	Zgornja Besnica
00050000-5581-4d03-187c-f7fb7bc3eb35	2242	Zgornja Korena
00050000-5581-4d03-1a81-13ceeec36c1e	2201	Zgornja Kungota
00050000-5581-4d03-2a1f-19d180b80a76	2316	Zgornja Ložnica
00050000-5581-4d03-59a7-864679a71b4d	2314	Zgornja Polskava
00050000-5581-4d03-ce80-8fef0f60dc85	2213	Zgornja Velka
00050000-5581-4d03-d4da-09715a22c4a6	4247	Zgornje Gorje
00050000-5581-4d03-bf60-f6fea7829388	4206	Zgornje Jezersko
00050000-5581-4d03-4c28-64e5e882fda9	2285	Zgornji Leskovec
00050000-5581-4d03-2beb-6f30b9334e28	1432	Zidani Most
00050000-5581-4d03-80b1-71b4ead0492a	3214	Zreče
00050000-5581-4d03-7cb7-a06bdac05cdc	4209	Žabnica
00050000-5581-4d03-4c77-9381f7ba1563	3310	Žalec
00050000-5581-4d03-c0e0-845f29cc4efa	4228	Železniki
00050000-5581-4d03-4c01-763e27adba6c	2287	Žetale
00050000-5581-4d03-b11c-1ed8d777143d	4226	Žiri
00050000-5581-4d03-bc70-f6af741051a4	4274	Žirovnica
00050000-5581-4d03-22a6-1a25afd0c5e2	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7553811)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7553622)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7553700)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7553823)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7553943)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7553996)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5581-4d04-0198-838854d86120	00080000-5581-4d04-2ae2-838ac419bcd2	0987	A
00190000-5581-4d04-a4fa-bbdfd7b00ad6	00080000-5581-4d04-0067-869595dc95ad	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7554115)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7554178)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7554128)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7554147)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7553852)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5581-4d04-d95b-d430b14c285f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5581-4d04-e1d1-3fe92c1896cb	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5581-4d04-da28-015245b89da5	0003	Kazinska	t	84	Kazinska dvorana
00220000-5581-4d04-f5f8-058fb10a8e23	0004	Mali oder	t	24	Mali oder 
00220000-5581-4d04-de95-c710adade6e6	0005	Komorni oder	t	15	Komorni oder
00220000-5581-4d04-1287-6c11c029e184	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5581-4d04-fa42-d0d80e2a5533	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7553796)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7553786)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7553985)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7553920)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7553494)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2861 (class 0 OID 7553862)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7553532)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5581-4d03-f467-23009ae3f3ed	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5581-4d03-faa4-dbf7d289164e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5581-4d03-7bb0-7a2592ba7030	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5581-4d03-52ed-c94c658832d9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5581-4d03-6690-48aa8f44926f	planer	Planer dogodkov v koledarju	t
00020000-5581-4d03-5caa-c0c05bfd156f	kadrovska	Kadrovska služba	t
00020000-5581-4d03-33fe-88a8a372d547	arhivar	Ažuriranje arhivalij	t
00020000-5581-4d03-35f8-418bcd19f60d	igralec	Igralec	t
00020000-5581-4d03-e521-45c2f4d96869	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7553516)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5581-4d04-c68b-a72d15b72b24	00020000-5581-4d03-7bb0-7a2592ba7030
00010000-5581-4d04-c12a-de4aaf013ee2	00020000-5581-4d03-7bb0-7a2592ba7030
\.


--
-- TOC entry 2863 (class 0 OID 7553876)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7553817)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7553767)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7554211)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5581-4d03-76b8-e51d118c8ae0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5581-4d03-ff52-1c0367ddac31	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5581-4d03-647c-06c4af1a0e6e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5581-4d03-4110-2ff6d8e109b5	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5581-4d03-91ae-6d5fb462e26a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7554203)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5581-4d03-5176-7d4ee96b863c	00230000-5581-4d03-4110-2ff6d8e109b5	popa
00240000-5581-4d03-1e18-f2f6121a42df	00230000-5581-4d03-4110-2ff6d8e109b5	oseba
00240000-5581-4d03-b24e-ad908f32dc41	00230000-5581-4d03-ff52-1c0367ddac31	prostor
00240000-5581-4d03-7e46-adc64cdd12d7	00230000-5581-4d03-4110-2ff6d8e109b5	besedilo
00240000-5581-4d03-53c0-4675ada66907	00230000-5581-4d03-4110-2ff6d8e109b5	uprizoritev
00240000-5581-4d03-651f-c1457ad5c837	00230000-5581-4d03-4110-2ff6d8e109b5	funkcija
00240000-5581-4d03-c845-6920acde11b0	00230000-5581-4d03-4110-2ff6d8e109b5	tipfunkcije
00240000-5581-4d03-80b6-012c692e413b	00230000-5581-4d03-4110-2ff6d8e109b5	alternacija
00240000-5581-4d03-8dfb-ea53dbee5f44	00230000-5581-4d03-76b8-e51d118c8ae0	pogodba
00240000-5581-4d03-8a0f-2953c7839203	00230000-5581-4d03-4110-2ff6d8e109b5	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7554198)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7553930)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7553594)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7553773)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5581-4d04-57f1-4503ff807860	00180000-5581-4d04-7a69-e8f4346d4ae2	000c0000-5581-4d04-1c7a-60052352dd17	00090000-5581-4d04-a4d6-e460dd03c0e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-4d04-984c-bd74626f0595	00180000-5581-4d04-7a69-e8f4346d4ae2	000c0000-5581-4d04-9161-600b946b06e5	00090000-5581-4d04-d587-d16981bf40f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-4d04-1f0f-dfe790d86ba2	00180000-5581-4d04-7a69-e8f4346d4ae2	000c0000-5581-4d04-587e-d290cda856f8	00090000-5581-4d04-7639-699f1ff45b3b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-4d04-bded-5d7a20b53be1	00180000-5581-4d04-7a69-e8f4346d4ae2	000c0000-5581-4d04-7274-76e123d74726	00090000-5581-4d04-470d-0eac10185f9b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-4d04-cfb6-2e639f40438c	00180000-5581-4d04-7a69-e8f4346d4ae2	000c0000-5581-4d04-265f-eca015a71258	00090000-5581-4d04-56a3-a0ccbbbba2da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-4d04-5918-3d3dc587e292	00180000-5581-4d04-893e-179609c8f2a8	\N	00090000-5581-4d04-56a3-a0ccbbbba2da	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7553974)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5581-4d03-51ec-2afcb10b85c7	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5581-4d03-e7b5-b281f399eb8f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5581-4d03-d4f0-765806f63e4d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5581-4d03-35d9-b5c98af86652	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5581-4d03-b298-17e00a1b2c63	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5581-4d03-e126-6aceda55d652	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5581-4d03-e11f-7fc8edc9b9f7	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5581-4d03-4487-a59c8bb3bc21	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5581-4d03-a42b-e49acbdc17e1	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5581-4d03-02da-de78bbb97f2f	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5581-4d03-644d-ef3154eb5b0e	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5581-4d03-771e-f9b8d6f024a4	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5581-4d03-f4fe-9380c4976bc8	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5581-4d03-c21a-9d753c3154c1	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5581-4d03-a9e7-2c7eba26cabe	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5581-4d03-29ac-da5a60733826	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7554167)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5581-4d03-a638-1fcc7c77a8af	01	Velika predstava	f	1.00	1.00
002b0000-5581-4d03-a1c4-994211aca1ce	02	Mala predstava	f	0.50	0.50
002b0000-5581-4d03-b5d9-63649c1d40ed	03	Mala koprodukcija	t	0.40	1.00
002b0000-5581-4d03-b5c6-8d1c28fa1d57	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5581-4d03-3115-a1a3a39e3daa	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7553657)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7553503)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5581-4d04-c12a-de4aaf013ee2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBb1bYOiJzM4/WDuonPOS.nPZYF/gF.m	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5581-4d04-1dfd-96c074aa32cf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5581-4d04-5977-b824c216bb9e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5581-4d04-bf77-b73bf80f0f2d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5581-4d04-044c-c7348c6a904c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5581-4d04-ae19-de77ef04e838	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5581-4d04-1870-0d27ca6f2021	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5581-4d04-56da-7b9ae3ea5f54	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5581-4d04-be5c-54a7382d676b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5581-4d04-a225-8e9a44966ed1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N			aaron@ifigenija.si	\N	\N	\N
00010000-5581-4d04-c68b-a72d15b72b24	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7554031)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5581-4d04-58b9-a4f9333355f1	00160000-5581-4d04-0370-b0c4f2be10f0	00150000-5581-4d03-9e38-9ac160d3c911	00140000-5581-4d03-36f4-a2d8c9661b25	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5581-4d04-de95-c710adade6e6
000e0000-5581-4d04-9bf9-ea6dacaa8e99	00160000-5581-4d04-3eaa-04f352f4c087	00150000-5581-4d03-9c1f-1f1de3c6f96f	00140000-5581-4d03-82e0-09a48d214b68	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5581-4d04-1287-6c11c029e184
000e0000-5581-4d04-0349-3369555548f6	\N	00150000-5581-4d03-9c1f-1f1de3c6f96f	00140000-5581-4d03-82e0-09a48d214b68	00190000-5581-4d04-0198-838854d86120	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5581-4d04-de95-c710adade6e6
000e0000-5581-4d04-4bfb-5d630b234a89	\N	00150000-5581-4d03-9c1f-1f1de3c6f96f	00140000-5581-4d03-82e0-09a48d214b68	00190000-5581-4d04-0198-838854d86120	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5581-4d04-de95-c710adade6e6
\.


--
-- TOC entry 2844 (class 0 OID 7553719)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5581-4d04-efc8-577b7b4753a2	000e0000-5581-4d04-9bf9-ea6dacaa8e99	1	
00200000-5581-4d04-e4e1-d8274e89ea49	000e0000-5581-4d04-9bf9-ea6dacaa8e99	2	
\.


--
-- TOC entry 2859 (class 0 OID 7553844)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7553913)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7553751)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7554021)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5581-4d03-36f4-a2d8c9661b25	01	Drama	drama (SURS 01)
00140000-5581-4d03-2246-49d29cfe55e1	02	Opera	opera (SURS 02)
00140000-5581-4d03-0ec6-c0316c405ffd	03	Balet	balet (SURS 03)
00140000-5581-4d03-3833-64c6375231cc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5581-4d03-0b48-803ec01c0f3e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5581-4d03-82e0-09a48d214b68	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5581-4d03-b004-b9c32d3b20ae	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7553903)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5581-4d03-7c8d-306c7e7595d1	01	Opera	opera
00150000-5581-4d03-ac85-aa03d7d63329	02	Opereta	opereta
00150000-5581-4d03-6b1b-1e7bd42a6912	03	Balet	balet
00150000-5581-4d03-23c9-8cffcf5162cb	04	Plesne prireditve	plesne prireditve
00150000-5581-4d03-39eb-3ed19d3581a0	05	Lutkovno gledališče	lutkovno gledališče
00150000-5581-4d03-e140-f5a85cc95106	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5581-4d03-c116-a86ccc244a11	07	Biografska drama	biografska drama
00150000-5581-4d03-9e38-9ac160d3c911	08	Komedija	komedija
00150000-5581-4d03-c660-816bb1b18609	09	Črna komedija	črna komedija
00150000-5581-4d03-c139-c23dd5ed448a	10	E-igra	E-igra
00150000-5581-4d03-9c1f-1f1de3c6f96f	11	Kriminalka	kriminalka
00150000-5581-4d03-1b40-c398b30aeba8	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7553557)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7554078)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7554068)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7553973)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7553741)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7553766)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7553683)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7554111)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7553899)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7553717)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7553760)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7553697)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7553809)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7553836)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7553655)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7553566)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2414 (class 2606 OID 7553590)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7553546)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7553531)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7553842)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7553875)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7554016)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7553619)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7553643)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7553815)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 7553633)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7553704)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7553827)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7553955)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7554001)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7554126)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7554196)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7554143)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7554164)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7553859)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7553800)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7553791)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7553995)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7553927)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7553502)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7553866)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7553520)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7553540)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7553884)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7553822)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7553772)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7554220)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7554208)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7554202)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7553940)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7553599)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7553782)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7553984)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7554177)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7553668)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7553515)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7554047)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7553726)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7553850)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7553918)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7553755)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7554029)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7553911)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7553748)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7553941)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7553942)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7553621)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2380 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2381 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2382 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2512 (class 1259 OID 7553843)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7553829)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7553828)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7553727)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7553900)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7553902)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7553901)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7553699)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7553698)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7554018)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7554019)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7554020)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7554166)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7554165)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7554052)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7554049)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7554053)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7554051)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7554050)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7553670)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7553669)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2385 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2412 (class 1259 OID 7553593)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7553867)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7553761)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7553547)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7553548)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7553887)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7553886)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7553885)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7553705)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7553707)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7553706)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7554210)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7553795)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7553793)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7553792)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7553794)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7553521)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7553522)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7553851)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7553816)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7553928)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7553929)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7554112)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7554113)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7554114)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7553635)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7553634)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7553636)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7554197)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7553956)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7553957)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7554082)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7554084)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7554080)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7554083)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7554081)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7553919)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7553804)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7553803)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7553801)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7553802)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7554070)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7554069)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7554127)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7553718)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7553568)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7553567)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7553600)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7553601)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7553785)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7553784)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7553783)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7554146)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7554144)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7554145)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7553750)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7553746)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7553743)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7553744)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7553742)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7553747)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7553745)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7553620)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7553684)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7553686)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7553685)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7553687)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7553810)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7554017)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7554048)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7553591)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7553592)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7553912)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7554221)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7553656)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7554209)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7553861)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7553860)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7554079)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7553644)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7554030)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7554002)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7554003)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7553541)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7553749)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7554357)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7554342)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7554347)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7554367)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7554337)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7554362)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7554352)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7554512)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7554517)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7554272)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7554452)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7554447)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7554442)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7554332)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7554482)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7554492)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7554487)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7554307)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7554302)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7554432)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7554537)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7554542)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7554547)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7554652)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7554647)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7554567)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7554552)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7554572)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7554562)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7554557)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7554297)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7554292)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7554257)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7554252)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7554462)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7554372)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7554232)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7554237)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7554477)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7554472)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7554467)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7554312)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7554322)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7554317)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7554662)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7554407)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7554397)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7554392)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7554402)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7554222)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7554227)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7554457)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7554437)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7554502)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7554507)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7554612)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7554617)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7554622)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7554282)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7554277)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7554287)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7554657)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7554522)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7554527)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7554597)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7554607)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7554587)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7554602)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7554592)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7554497)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7554427)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7554422)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7554412)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7554417)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7554582)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7554577)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7554627)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7554327)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7554532)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7554247)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7554242)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7554262)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7554267)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7554387)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7554382)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7554377)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7554642)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7554632)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7554637)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-17 12:33:41 CEST

--
-- PostgreSQL database dump complete
--

