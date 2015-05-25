--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-25 17:52:34 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 232 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 4967851)
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
-- TOC entry 227 (class 1259 OID 4968361)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean
);


--
-- TOC entry 226 (class 1259 OID 4968344)
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
-- TOC entry 219 (class 1259 OID 4968255)
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
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text
);


--
-- TOC entry 194 (class 1259 OID 4968025)
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
-- TOC entry 197 (class 1259 OID 4968059)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4967972)
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
-- TOC entry 213 (class 1259 OID 4968185)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer
);


--
-- TOC entry 192 (class 1259 OID 4968009)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4968053)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4967989)
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
-- TOC entry 202 (class 1259 OID 4968102)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4968127)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4967946)
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
-- TOC entry 181 (class 1259 OID 4967860)
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
-- TOC entry 182 (class 1259 OID 4967871)
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
-- TOC entry 177 (class 1259 OID 4967825)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4967844)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4968134)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4968165)
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
-- TOC entry 223 (class 1259 OID 4968298)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostdo numeric(10,0) DEFAULT NULL::numeric,
    zacetek date,
    konec date,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 184 (class 1259 OID 4967903)
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
-- TOC entry 186 (class 1259 OID 4967938)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4968108)
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
-- TOC entry 185 (class 1259 OID 4967923)
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
-- TOC entry 191 (class 1259 OID 4968001)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4968120)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4968240)
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
-- TOC entry 222 (class 1259 OID 4968291)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4968149)
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
-- TOC entry 201 (class 1259 OID 4968093)
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
-- TOC entry 200 (class 1259 OID 4968083)
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
-- TOC entry 221 (class 1259 OID 4968280)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4968217)
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
-- TOC entry 174 (class 1259 OID 4967796)
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
-- TOC entry 173 (class 1259 OID 4967794)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 4968159)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4967834)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4967818)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4968173)
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
-- TOC entry 204 (class 1259 OID 4968114)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4968064)
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
-- TOC entry 230 (class 1259 OID 4968386)
-- Name: stevilcenje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenje (
    id uuid NOT NULL,
    sifra character varying(8) NOT NULL,
    naziv character varying(100) NOT NULL,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer NOT NULL,
    dolzina integer NOT NULL,
    format character varying(20) NOT NULL,
    globalno boolean,
    poletih boolean
);


--
-- TOC entry 229 (class 1259 OID 4968379)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4968374)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4968227)
-- Name: strosekuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE strosekuprizoritve (
    id integer NOT NULL,
    uprizoritev_id uuid,
    popa_id uuid,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrednostdo numeric(10,0) DEFAULT NULL::numeric,
    vrednostna numeric(10,0) DEFAULT NULL::numeric,
    opis text,
    sort integer
);


--
-- TOC entry 231 (class 1259 OID 4968394)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4967895)
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
-- TOC entry 199 (class 1259 OID 4968070)
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
-- TOC entry 220 (class 1259 OID 4968269)
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
-- TOC entry 188 (class 1259 OID 4967958)
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
-- TOC entry 175 (class 1259 OID 4967805)
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
-- TOC entry 225 (class 1259 OID 4968324)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
    stevilovaj integer,
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
-- TOC entry 193 (class 1259 OID 4968016)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4968141)
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
-- TOC entry 215 (class 1259 OID 4968209)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    status character varying(10) DEFAULT NULL::character varying,
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
-- TOC entry 195 (class 1259 OID 4968048)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4968314)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4968199)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4967799)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 4967851)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 4968361)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4968344)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4968255)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4968025)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4968059)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4967972)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5563-4540-c6cb-590212191f1b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5563-4540-5a62-802fdbd87bbf	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5563-4540-a286-0a02d3ea35b9	AL	ALB	008	Albania 	Albanija	\N
00040000-5563-4540-0845-657eca0d8745	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5563-4540-f7ef-e3a6364abf4f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5563-4540-9b9c-80347b569136	AD	AND	020	Andorra 	Andora	\N
00040000-5563-4540-78f9-9ad9c78f26ec	AO	AGO	024	Angola 	Angola	\N
00040000-5563-4540-a7c8-6a588bcf4c8a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5563-4540-2929-7ee2dc9330bf	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5563-4540-85f1-7a8600aa0506	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-4540-25d2-7868cfcd8eca	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5563-4540-9ff8-61a1b2f60d6c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5563-4540-7e9a-34115de633cb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5563-4540-6bad-3ddd0045088a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5563-4540-1a17-a41eea3dd1b9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5563-4540-67f2-8e3986227b8e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5563-4540-1757-9cdb87f63a76	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5563-4540-8a34-1d5ae8e3bc1e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5563-4540-e3be-5d03b468ada7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5563-4540-7f0b-7b7a906bac03	BB	BRB	052	Barbados 	Barbados	\N
00040000-5563-4540-f439-1dadc1936b0b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5563-4540-dd05-d1942bb744b3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5563-4540-41a2-8d68d4d5e68e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5563-4540-f3a2-7a0cde3753fe	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5563-4540-3198-cad921b74e97	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5563-4540-0757-9bee641290a4	BT	BTN	064	Bhutan 	Butan	\N
00040000-5563-4540-5768-c56dc7e28145	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5563-4540-68d5-b41d323db1d6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5563-4540-db04-cb01cbeef55f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5563-4540-13ea-a62648800766	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5563-4540-9f9d-9e2a4d4f4238	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5563-4540-1132-a1dbb0180e72	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5563-4540-2248-0d9c49731467	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5563-4540-e648-931db935b277	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5563-4540-09fb-84400c052300	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5563-4540-9520-1fed44aed16c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5563-4540-de8a-cc083dfd9ef4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5563-4540-9027-49b0227d9311	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5563-4540-ca8e-4625f302189a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5563-4540-cf2e-3706b6219f73	CA	CAN	124	Canada 	Kanada	\N
00040000-5563-4540-b3fb-ae6fccab6a18	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5563-4540-40d9-5ea370ce5c18	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5563-4540-8762-55258716c575	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5563-4540-dd2f-54229cf2cb9e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5563-4540-759f-e30a027634c8	CL	CHL	152	Chile 	Čile	\N
00040000-5563-4540-102f-eedc729827e4	CN	CHN	156	China 	Kitajska	\N
00040000-5563-4540-e6b6-5918224eaffa	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5563-4540-499c-9020705f106a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5563-4540-0a9a-ea2295f8ff80	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5563-4540-d512-498ebe81357c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5563-4540-3f58-1786a9c8cacc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5563-4540-a8de-263f649e5e58	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5563-4540-4211-6d94bec052f6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5563-4540-1d9b-35f2cced4147	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5563-4540-7f96-28f59333b49e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5563-4540-5f92-57e7aee824cd	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5563-4540-138b-1aac2ed31e71	CU	CUB	192	Cuba 	Kuba	\N
00040000-5563-4540-4134-f5f92c27402f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5563-4540-cc3f-618090b4f669	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5563-4540-0a5e-d3e31e7ca181	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5563-4540-d459-09bdea635d17	DK	DNK	208	Denmark 	Danska	\N
00040000-5563-4540-c73a-00d0ece9d3d6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5563-4540-725b-04b2e2457a5b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-4540-e325-61e7aa441ff3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5563-4540-2d08-2e4867314806	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5563-4540-800a-a873b310e68f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5563-4540-729f-e23d411533e8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5563-4540-e493-3f99452565d5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5563-4540-4151-98632ecc81f1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5563-4540-cd7b-0e211619a021	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5563-4540-7d4e-cadfeae331e8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5563-4540-d6b7-6287c4755e29	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5563-4540-8fa0-e970440a8c2b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5563-4540-f521-ce98d4a1ffb6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5563-4540-ad6c-a07e8b57573c	FI	FIN	246	Finland 	Finska	\N
00040000-5563-4540-9a2a-fc40ebda5bdf	FR	FRA	250	France 	Francija	\N
00040000-5563-4540-6d52-df8827f3fa86	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5563-4540-b040-56744e695edf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5563-4540-deb3-911edbbe8ea3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5563-4540-b0f8-a0a2a409cdcc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5563-4540-ca96-282ff2042d7c	GA	GAB	266	Gabon 	Gabon	\N
00040000-5563-4540-d9fb-e5bc27c5730c	GM	GMB	270	Gambia 	Gambija	\N
00040000-5563-4540-7174-c66b664dc406	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5563-4540-ba6b-62dc1d97815e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5563-4540-87f8-8fc3775dc116	GH	GHA	288	Ghana 	Gana	\N
00040000-5563-4540-0cc4-a4d191986ea1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5563-4540-4742-0ad5f3bcb08d	GR	GRC	300	Greece 	Grčija	\N
00040000-5563-4540-1edf-df6a77efde54	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5563-4540-1e0c-e4383f9eafba	GD	GRD	308	Grenada 	Grenada	\N
00040000-5563-4540-bd15-d95aab2ac64a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5563-4540-222b-33703da38543	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5563-4540-6e6c-54f9fcf26844	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5563-4540-bf31-4e773b777a2d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5563-4540-8b2d-ba4925b40db5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5563-4540-462c-920e591dfcc8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5563-4540-3843-48a91aeeba33	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5563-4540-d78c-b255886d4403	HT	HTI	332	Haiti 	Haiti	\N
00040000-5563-4540-a1f6-e81fee710ce6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5563-4540-becf-8723eccda2e0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5563-4540-f351-cb66ebff769a	HN	HND	340	Honduras 	Honduras	\N
00040000-5563-4540-1dd6-4f0a27f7e312	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5563-4540-a8fd-bcc5e69fe5ab	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5563-4540-f119-683bdc3cde5a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5563-4540-4602-4ad1348417b1	IN	IND	356	India 	Indija	\N
00040000-5563-4540-f241-3bd1e7d8d9d6	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5563-4540-1023-0df2ac7e1881	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5563-4540-d84f-d59fcf9e68d2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5563-4540-116e-112740a15aae	IE	IRL	372	Ireland 	Irska	\N
00040000-5563-4540-5a89-801ac665f0af	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5563-4540-0ef6-35eb1f0180fb	IL	ISR	376	Israel 	Izrael	\N
00040000-5563-4540-a221-59121c63a617	IT	ITA	380	Italy 	Italija	\N
00040000-5563-4540-5f20-983c36a5b15d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5563-4540-9867-ca5380d9bd8c	JP	JPN	392	Japan 	Japonska	\N
00040000-5563-4540-9d27-e6082bc8bdbb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5563-4540-bb31-74097bce6bc7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5563-4540-bd54-7797b96b4bc2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5563-4540-b535-b3aefac61b33	KE	KEN	404	Kenya 	Kenija	\N
00040000-5563-4540-0254-cb29327c621c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5563-4540-8388-0672989f171b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5563-4540-e1a6-ef17261f965c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5563-4540-ca1d-e3aac2798631	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5563-4540-2b8f-eb58108e11ea	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5563-4540-671c-edede2cb5ffb	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5563-4540-77fc-22092cf2f3e6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5563-4540-dd1f-cc4545f476e6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5563-4540-3e9f-54bca1328a19	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5563-4540-76c5-19e46df7b1a5	LR	LBR	430	Liberia 	Liberija	\N
00040000-5563-4540-a1ae-05daa7a8d922	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5563-4540-cd73-566b9380e5c6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5563-4540-7d8e-fb89d97bd2ad	LT	LTU	440	Lithuania 	Litva	\N
00040000-5563-4540-125a-5f3eb9a02fea	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5563-4540-a880-07184b6dbd2f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5563-4540-1d6a-e998cd7c3acc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5563-4540-2d44-afc6ed09271e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5563-4540-1d3f-e2eaca8b3347	MW	MWI	454	Malawi 	Malavi	\N
00040000-5563-4540-8cdf-edb01b6d0457	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5563-4540-5f94-ea9e3074f61e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5563-4540-d664-1eaa69ccb9f0	ML	MLI	466	Mali 	Mali	\N
00040000-5563-4540-2dda-05401f7d3140	MT	MLT	470	Malta 	Malta	\N
00040000-5563-4540-5d00-0012fdfb17d4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5563-4540-be39-603a86863566	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5563-4540-5195-92f2cd07d13a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5563-4540-13e4-e8dbb8eb7725	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5563-4540-91da-749a14ced2f9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5563-4540-d258-0925b0b6b4b7	MX	MEX	484	Mexico 	Mehika	\N
00040000-5563-4540-a57e-6ec25afe791f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5563-4540-6ef6-1cec7978cd50	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5563-4540-85de-b7ef4c74b68e	MC	MCO	492	Monaco 	Monako	\N
00040000-5563-4540-62cb-c174d557f9f5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5563-4540-319f-fa49923a950c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5563-4540-3986-b0d73042a9fd	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5563-4540-37cb-3cf63ceb76ea	MA	MAR	504	Morocco 	Maroko	\N
00040000-5563-4540-0a19-e7031cd42339	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5563-4540-3966-302c2af0f370	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5563-4540-8dda-9459dc30d9f6	NA	NAM	516	Namibia 	Namibija	\N
00040000-5563-4540-c690-08de090ca42c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5563-4540-e55c-5972486195cc	NP	NPL	524	Nepal 	Nepal	\N
00040000-5563-4540-7961-9a25aed7e5a1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5563-4540-7a4a-e6828fd60a20	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5563-4540-9a2c-c97c52942d52	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5563-4540-dac7-4f0d7ab8a0c0	NE	NER	562	Niger 	Niger 	\N
00040000-5563-4540-ef94-e1e1aaca4a99	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5563-4540-d579-8d147853de9b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5563-4540-8ae4-c3a4b480b733	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5563-4540-5d94-cb946d8e4138	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5563-4540-d1f6-e7608928b2c4	NO	NOR	578	Norway 	Norveška	\N
00040000-5563-4540-7936-1260b09e4d22	OM	OMN	512	Oman 	Oman	\N
00040000-5563-4540-7efc-f95e95e315d6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5563-4540-4482-e9894fd19765	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5563-4540-eca7-645a64b620cf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5563-4540-022e-5ffffa28b0d8	PA	PAN	591	Panama 	Panama	\N
00040000-5563-4540-c455-d1e524e0ad43	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5563-4540-c194-114c8248cb47	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5563-4540-1711-efe078235a91	PE	PER	604	Peru 	Peru	\N
00040000-5563-4540-5bb3-e8ab047f572e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5563-4540-5ee8-4fc51a62f180	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5563-4540-c4e7-b6bbc9cf6ff1	PL	POL	616	Poland 	Poljska	\N
00040000-5563-4540-b090-81f38c6bd0cc	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5563-4540-d45e-a6523b4561ba	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5563-4540-5116-0ba338686365	QA	QAT	634	Qatar 	Katar	\N
00040000-5563-4540-f12b-bbca983a61c4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5563-4540-be7c-7a641582446c	RO	ROU	642	Romania 	Romunija	\N
00040000-5563-4540-ea98-463950dfb20c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5563-4540-f70e-e64b3eed3b2a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5563-4540-bf54-1b407f6b7e24	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5563-4540-c212-9e35f5ad2390	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5563-4540-8f4e-3bdc0e51eecd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5563-4540-f638-4c0873e94798	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5563-4540-2bf3-6f4fa1c498a7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5563-4540-3730-38280be4d78c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5563-4540-5698-d26197a975a6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5563-4540-1563-fc3e3055df90	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5563-4540-e8cb-4070c088cfd9	SM	SMR	674	San Marino 	San Marino	\N
00040000-5563-4540-acb3-e17d785e7421	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5563-4540-cb24-f3e6336ed520	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5563-4540-101f-d8534459325f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5563-4540-070d-cbba4fa30d85	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5563-4540-bc3a-54bad1e70feb	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5563-4540-300d-8a7600e8b93a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5563-4540-6e90-426ba2fd0f16	SG	SGP	702	Singapore 	Singapur	\N
00040000-5563-4540-ad59-fccb739e00d3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5563-4540-6879-ac93a3bb8509	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5563-4540-33a9-5a36354d9314	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5563-4540-9910-07545feb2996	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5563-4540-63c9-849d95dc8082	SO	SOM	706	Somalia 	Somalija	\N
00040000-5563-4540-7632-100a89183c57	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5563-4540-e8ee-033c517f7cfa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5563-4540-a65a-e9a1a210d70e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5563-4540-9478-7c6db20673c3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5563-4540-5e6a-18f38a7735ad	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5563-4540-919d-78933ac211fd	SD	SDN	729	Sudan 	Sudan	\N
00040000-5563-4540-bae0-f8d92514332b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5563-4540-b69d-6ea88017bb90	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5563-4540-b11d-7d1e10ffc5c2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5563-4540-84ff-958ae09f5c52	SE	SWE	752	Sweden 	Švedska	\N
00040000-5563-4540-b20a-16db7b4a1b69	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5563-4540-fdcb-3ce76777ba1e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5563-4540-4ba9-b5a547b50d2e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5563-4540-40f3-22bdf70b1e20	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5563-4540-e15d-4cfd79f76625	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5563-4540-4c62-d2dfcd1e286c	TH	THA	764	Thailand 	Tajska	\N
00040000-5563-4540-1559-acfb0c54bc35	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5563-4540-0d9b-e224aed0eb5c	TG	TGO	768	Togo 	Togo	\N
00040000-5563-4540-97f6-8e715b675224	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5563-4540-4798-a8a3c6b25417	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5563-4540-ea4a-c90b7ec0cb07	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5563-4540-7bd3-6509f379c800	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5563-4540-8767-db0cffd6455d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5563-4540-3c7f-8ca5b00cb23d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5563-4540-9d95-a4f5d61d35b9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-4540-e10b-3f6c853b6334	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5563-4540-9c79-3e9ac0c7a649	UG	UGA	800	Uganda 	Uganda	\N
00040000-5563-4540-95ac-231f7cf96238	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5563-4540-f5cb-c877b2a93ea8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5563-4540-99f8-ee04236f34b6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5563-4540-ebf7-8a3452a3b281	US	USA	840	United States 	Združene države Amerike	\N
00040000-5563-4540-4ab8-54aa1437d1e5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5563-4540-6927-1f1ec052cb25	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5563-4540-ea29-2e91fb8978bc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5563-4540-ee94-090aeba4c357	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5563-4540-0687-ecc414f38791	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5563-4540-ef9e-5b853bae6731	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5563-4540-891c-f49176ce5c59	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-4540-4b7b-723b03926d20	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5563-4540-fe9a-d45cf7bd907b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5563-4540-2ff5-b9da190cb407	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5563-4540-edee-19c5e5650d92	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5563-4540-96b4-62f02201836a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5563-4540-37a8-b96629c9a14a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 4968185)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4968009)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4968053)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4967989)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2690 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 4968102)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 4968127)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 4967946)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5563-4541-57aa-d4eee87007f8	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5563-4541-b537-2d31d8d366a7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5563-4541-62ca-441ee74cb097	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5563-4541-3a57-478f1ae47c4c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5563-4541-bc3c-096765079591	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5563-4541-6310-5ef6f85b1a26	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5563-4541-149e-89733b462405	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5563-4541-d93a-ee59066bc2e2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5563-4541-04e5-11b657d7fc24	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5563-4541-c634-e471184065bc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5563-4541-cbdf-a3424be6f7fe	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5563-4541-0f89-6f705f0499ea	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5563-4541-ab84-e5adea3a43c6	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-4541-b31a-a191e1656f13	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-4541-8e4b-6b6a44f4367d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 4967860)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5563-4541-eb19-83dcff77b4ef	00000000-5563-4541-bc3c-096765079591	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5563-4541-539d-7b52555c58d7	00000000-5563-4541-bc3c-096765079591	00010000-5563-4541-0519-94fd8bdb045e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5563-4541-81ff-cc7d90cebc8a	00000000-5563-4541-6310-5ef6f85b1a26	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 4967871)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5563-4541-bd08-8c8e7b0b4581	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5563-4541-ab8b-7d698a686a38	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5563-4541-6d16-680607dbb673	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5563-4541-cf68-c7020c381b72	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5563-4541-49a7-c217bbd94717	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5563-4541-bba0-17d9ded68afc	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5563-4541-96a1-6204b54b8408	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5563-4541-1e1e-0e7fed84d811	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5563-4541-2330-f3beb4b8e0b0	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5563-4541-40e0-3460b8a94b6d	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4967825)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5563-4540-53b7-a6c89fd395b4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5563-4540-461b-9ecf92f2d965	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5563-4540-9d78-50843b8585d8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5563-4540-68de-d5ea5c950332	Abonma-read	Abonma - branje	f
00030000-5563-4540-9d41-b3568247549c	Abonma-write	Abonma - spreminjanje	f
00030000-5563-4540-0e72-dda514604196	Alternacija-read	Alternacija - branje	f
00030000-5563-4540-4d3c-0851f7d0becb	Alternacija-write	Alternacija - spreminjanje	f
00030000-5563-4540-2ad7-ff4beaf66de4	Arhivalija-read	Arhivalija - branje	f
00030000-5563-4540-2fd5-c798f6762151	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5563-4540-6708-120f9c20d012	Besedilo-read	Besedilo - branje	f
00030000-5563-4540-a142-47badb21883d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5563-4540-f7c0-b5d599e5ced0	DogodekIzven-read	DogodekIzven - branje	f
00030000-5563-4540-0598-df122a2ed338	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5563-4540-fbc2-496d593df409	Dogodek-read	Dogodek - branje	f
00030000-5563-4540-30f1-09a97206bb4d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5563-4540-7313-074bfe051809	Drzava-read	Drzava - branje	f
00030000-5563-4540-15f4-59d04c225b46	Drzava-write	Drzava - spreminjanje	f
00030000-5563-4540-b3b9-691cefacbb14	Funkcija-read	Funkcija - branje	f
00030000-5563-4540-c9ff-2b148cdad2e5	Funkcija-write	Funkcija - spreminjanje	f
00030000-5563-4540-0d1b-71da914c500a	Gostovanje-read	Gostovanje - branje	f
00030000-5563-4540-aaec-3995aff79c5a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5563-4540-4c09-552c4aca8285	Gostujoca-read	Gostujoca - branje	f
00030000-5563-4540-8832-c5bc6946627c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5563-4540-9ac5-fe8bee284d6a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5563-4540-491f-fc809a751c46	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5563-4540-bb78-7ae2fad44a03	Kupec-read	Kupec - branje	f
00030000-5563-4540-a18a-aa6eaf095312	Kupec-write	Kupec - spreminjanje	f
00030000-5563-4540-1f2d-4490076606a4	NacinPlacina-read	NacinPlacina - branje	f
00030000-5563-4540-bc70-39206023dd1b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5563-4540-7403-e8d4ca0a262d	Option-read	Option - branje	f
00030000-5563-4540-4862-cf5abd7d0873	Option-write	Option - spreminjanje	f
00030000-5563-4540-3162-a2358b61cdaa	OptionValue-read	OptionValue - branje	f
00030000-5563-4540-5998-0400a5672efa	OptionValue-write	OptionValue - spreminjanje	f
00030000-5563-4540-4d08-ce10e331f95f	Oseba-read	Oseba - branje	f
00030000-5563-4540-e795-fe633faa63ec	Oseba-write	Oseba - spreminjanje	f
00030000-5563-4540-b14e-b45a0219922b	Permission-read	Permission - branje	f
00030000-5563-4540-32b7-4ea26f9dcc69	Permission-write	Permission - spreminjanje	f
00030000-5563-4540-8ca9-b81d1bb9a73f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5563-4540-af8e-4351ef96edcb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5563-4540-9d47-d929e94d4069	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5563-4540-01d3-84d53c79a835	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5563-4540-74a4-dcc75e319a5a	Pogodba-read	Pogodba - branje	f
00030000-5563-4540-d15f-d86ad4cce118	Pogodba-write	Pogodba - spreminjanje	f
00030000-5563-4540-62d5-58ffad985005	Popa-read	Popa - branje	f
00030000-5563-4540-0bc0-3b7fb4448a6c	Popa-write	Popa - spreminjanje	f
00030000-5563-4540-3d51-5b88c52bc3ed	Posta-read	Posta - branje	f
00030000-5563-4540-f792-f44c04e897cb	Posta-write	Posta - spreminjanje	f
00030000-5563-4540-9b37-d900b05c5ccf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5563-4540-f119-bbf5d5b54611	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5563-4540-95cb-f8a360517e25	PostniNaslov-read	PostniNaslov - branje	f
00030000-5563-4540-c7d0-067792c7363d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5563-4540-4b7d-9b094f4515b0	Predstava-read	Predstava - branje	f
00030000-5563-4540-9445-264113b9f3ba	Predstava-write	Predstava - spreminjanje	f
00030000-5563-4540-19d1-1d6ecac584d0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5563-4540-3b49-84c74079996a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5563-4540-9584-383398ab84f1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5563-4540-930a-d7432f2b8541	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5563-4540-6fa1-acaf95bc2c12	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5563-4540-aa13-4430f5b02d77	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5563-4540-263b-a84d93efb405	Prostor-read	Prostor - branje	f
00030000-5563-4540-e68b-e9e6d45a09bb	Prostor-write	Prostor - spreminjanje	f
00030000-5563-4540-d93b-c6edfeb164d7	Racun-read	Racun - branje	f
00030000-5563-4540-d20b-d2ec2a344429	Racun-write	Racun - spreminjanje	f
00030000-5563-4540-5bbd-7bb73e99cc5d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5563-4540-ed8b-03fc9d6c9e89	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5563-4540-b378-e3047ad943bc	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5563-4540-c802-4321379931dd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5563-4540-0aad-1c500a1604fa	Rekvizit-read	Rekvizit - branje	f
00030000-5563-4540-82ca-832095f5d411	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5563-4540-7534-f2730509d579	Revizija-read	Revizija - branje	f
00030000-5563-4540-7d15-1bf6d938dfb5	Revizija-write	Revizija - spreminjanje	f
00030000-5563-4540-4a0f-61b5f01b0ad1	Rezervacija-read	Rezervacija - branje	f
00030000-5563-4540-ddc6-5a102a53c8fe	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5563-4540-8e35-232d6296d0b1	Role-read	Role - branje	f
00030000-5563-4540-6019-0a539fd89fe6	Role-write	Role - spreminjanje	f
00030000-5563-4540-a3b6-41ca2d1eb7d6	SedezniRed-read	SedezniRed - branje	f
00030000-5563-4540-efa5-4b54053473ca	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5563-4540-2976-fdbdf951478c	Sedez-read	Sedez - branje	f
00030000-5563-4540-c058-3c27688bcbbc	Sedez-write	Sedez - spreminjanje	f
00030000-5563-4540-cd4d-8a806cd9be89	Sezona-read	Sezona - branje	f
00030000-5563-4540-be74-d6ac3cd815f6	Sezona-write	Sezona - spreminjanje	f
00030000-5563-4540-e8d2-5250e5cd11b4	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5563-4540-8aa0-1b9d6b134f8e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5563-4540-fb55-b2ec27969e32	Stevilcenje-read	Stevilcenje - branje	f
00030000-5563-4540-d6f8-89da788c70fc	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5563-4540-2a79-d5c30c9252bd	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5563-4540-55a9-a4e500d3d4ab	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5563-4540-b53a-35ce54d65fbc	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5563-4540-fbd8-acd1390e255b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5563-4540-2ec3-a05b8e74a606	Telefonska-read	Telefonska - branje	f
00030000-5563-4540-2b36-8e9ec1cd7624	Telefonska-write	Telefonska - spreminjanje	f
00030000-5563-4540-d6ba-c70d760018f9	TerminStoritve-read	TerminStoritve - branje	f
00030000-5563-4540-d4c5-68a5628e503c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5563-4540-e344-1fe3a2837d93	TipFunkcije-read	TipFunkcije - branje	f
00030000-5563-4540-6e59-cba3f09d37d5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5563-4540-471e-080fb822f063	Trr-read	Trr - branje	f
00030000-5563-4540-907b-74d87c332036	Trr-write	Trr - spreminjanje	f
00030000-5563-4540-85c9-93c1daf60c57	Uprizoritev-read	Uprizoritev - branje	f
00030000-5563-4540-9852-19ee66e693fb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5563-4540-7c83-26b56602b898	User-read	User - branje	f
00030000-5563-4540-2750-ddf9576b5cb7	User-write	User - spreminjanje	f
00030000-5563-4540-be30-854e9f40d719	Vaja-read	Vaja - branje	f
00030000-5563-4541-ddd9-fb80626bf5dc	Vaja-write	Vaja - spreminjanje	f
00030000-5563-4541-0c2f-9671ff3be884	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5563-4541-59f2-b234a6046c0a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5563-4541-52d7-8920fdf12e24	Zaposlitev-read	Zaposlitev - branje	f
00030000-5563-4541-d949-99c7e8e840c0	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5563-4541-a996-d0b033a28afb	Zasedenost-read	Zasedenost - branje	f
00030000-5563-4541-e76e-a3ce5a61b4da	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5563-4541-f911-016cc4a0aeb2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5563-4541-4a96-04e3b7965005	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5563-4541-4f1e-c6b05aac9960	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5563-4541-1514-0435a736f841	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 4967844)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5563-4541-ff3f-6a24106160d7	00030000-5563-4540-7313-074bfe051809
00020000-5563-4541-231f-b8173462c57d	00030000-5563-4540-15f4-59d04c225b46
00020000-5563-4541-231f-b8173462c57d	00030000-5563-4540-7313-074bfe051809
\.


--
-- TOC entry 2727 (class 0 OID 4968134)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 4968165)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4968298)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 4967903)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5563-4541-2602-5109ecdb491c	00040000-5563-4540-c6cb-590212191f1b	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5563-4541-b3fd-74b48ec89409	00040000-5563-4540-c6cb-590212191f1b	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 4967938)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5563-4540-49cf-1c04bdf34d76	8341	Adlešiči
00050000-5563-4540-748e-4564410ca052	5270	Ajdovščina
00050000-5563-4540-0dc5-c145e1b714d2	6280	Ankaran/Ancarano
00050000-5563-4540-de0e-459a3581077f	9253	Apače
00050000-5563-4540-dd2f-a41f74a1304c	8253	Artiče
00050000-5563-4540-3b65-30849fcc2a2f	4275	Begunje na Gorenjskem
00050000-5563-4540-a70d-bda42e7ae442	1382	Begunje pri Cerknici
00050000-5563-4540-2fba-705934a124b6	9231	Beltinci
00050000-5563-4540-303b-04e28b9bf3f4	2234	Benedikt
00050000-5563-4540-a7a3-83362eb126ed	2345	Bistrica ob Dravi
00050000-5563-4540-9369-ce6038241ed6	3256	Bistrica ob Sotli
00050000-5563-4540-385a-302f67e11008	8259	Bizeljsko
00050000-5563-4540-8208-91f34c1efdd1	1223	Blagovica
00050000-5563-4540-14ef-69be5df2ece0	8283	Blanca
00050000-5563-4540-6a89-59553d7da2c9	4260	Bled
00050000-5563-4540-4a23-c5b00a463f3c	4273	Blejska Dobrava
00050000-5563-4540-2566-f7a835683f76	9265	Bodonci
00050000-5563-4540-edb5-261556c8a320	9222	Bogojina
00050000-5563-4540-3acf-09f304e76982	4263	Bohinjska Bela
00050000-5563-4540-131d-284bac8e80ce	4264	Bohinjska Bistrica
00050000-5563-4540-5af5-bfe424ae1143	4265	Bohinjsko jezero
00050000-5563-4540-47b8-ea5d8efe733b	1353	Borovnica
00050000-5563-4540-f3d3-3aa4e9fe944e	8294	Boštanj
00050000-5563-4540-8b7e-f729912dbc38	5230	Bovec
00050000-5563-4540-281f-9b6bdc83e9c5	5295	Branik
00050000-5563-4540-0965-c01c137bc8bc	3314	Braslovče
00050000-5563-4540-b807-a2d7c991fc6e	5223	Breginj
00050000-5563-4540-b7d9-f97e46119e82	8280	Brestanica
00050000-5563-4540-fcaf-6b37995d189b	2354	Bresternica
00050000-5563-4540-da9f-54666b1e7786	4243	Brezje
00050000-5563-4540-d087-88382a4ca52e	1351	Brezovica pri Ljubljani
00050000-5563-4540-e43f-fe4743e94b9f	8250	Brežice
00050000-5563-4540-eaf4-0944c283c19f	4210	Brnik - Aerodrom
00050000-5563-4540-f839-c3b38f996d6f	8321	Brusnice
00050000-5563-4540-b4a4-f5775f8612bf	3255	Buče
00050000-5563-4540-ef61-4bde1fffea26	8276	Bučka 
00050000-5563-4540-2b75-e355973f23a3	9261	Cankova
00050000-5563-4540-b4cb-9697ae6255ec	3000	Celje 
00050000-5563-4540-1dbb-4e3a43cd856f	3001	Celje - poštni predali
00050000-5563-4540-f999-1d876bcf7ea5	4207	Cerklje na Gorenjskem
00050000-5563-4540-866f-00bbc7d09bc1	8263	Cerklje ob Krki
00050000-5563-4540-67f7-642756fb1b4b	1380	Cerknica
00050000-5563-4540-058c-8cd3f7c96012	5282	Cerkno
00050000-5563-4540-1233-512b7cafa36d	2236	Cerkvenjak
00050000-5563-4540-5905-6283f32cf242	2215	Ceršak
00050000-5563-4540-8fdd-ee906ddb5a5c	2326	Cirkovce
00050000-5563-4540-088a-efc47fe58963	2282	Cirkulane
00050000-5563-4540-d3ae-4455ce7b5b1c	5273	Col
00050000-5563-4540-197f-5381fd364ef1	8251	Čatež ob Savi
00050000-5563-4540-ecd9-9ba97decb4e8	1413	Čemšenik
00050000-5563-4540-6148-2a59c6675cee	5253	Čepovan
00050000-5563-4540-e43a-bba852578a76	9232	Črenšovci
00050000-5563-4540-9708-c8f015e5c739	2393	Črna na Koroškem
00050000-5563-4540-f80d-82b801984ecd	6275	Črni Kal
00050000-5563-4540-53ab-0d55ed82de39	5274	Črni Vrh nad Idrijo
00050000-5563-4540-62d9-979cc47e40c2	5262	Črniče
00050000-5563-4540-bf96-fb178da52bbb	8340	Črnomelj
00050000-5563-4540-9046-09f5d572ca46	6271	Dekani
00050000-5563-4540-0e47-4d513bd7a501	5210	Deskle
00050000-5563-4540-08d8-37801c0dfb2c	2253	Destrnik
00050000-5563-4540-530b-315fe912f2b1	6215	Divača
00050000-5563-4540-e296-148b137152b2	1233	Dob
00050000-5563-4540-3882-08d8e5841a70	3224	Dobje pri Planini
00050000-5563-4540-4e7a-714527482b75	8257	Dobova
00050000-5563-4540-88da-a86203a54939	1423	Dobovec
00050000-5563-4540-270f-5274c2390773	5263	Dobravlje
00050000-5563-4540-08b7-27dda5c623d7	3204	Dobrna
00050000-5563-4540-40b6-eabea771176c	8211	Dobrnič
00050000-5563-4540-7696-56561a151829	1356	Dobrova
00050000-5563-4540-6d25-e51fa372df68	9223	Dobrovnik/Dobronak 
00050000-5563-4540-4a1d-de576d288b64	5212	Dobrovo v Brdih
00050000-5563-4540-a0d2-acb7b002df7f	1431	Dol pri Hrastniku
00050000-5563-4540-389d-b3e05ffb9cfc	1262	Dol pri Ljubljani
00050000-5563-4540-d058-90011bd42215	1273	Dole pri Litiji
00050000-5563-4540-ac6a-7bf1abb2ec07	1331	Dolenja vas
00050000-5563-4540-ab16-6a03f014d248	8350	Dolenjske Toplice
00050000-5563-4540-10a7-221bb72504a6	1230	Domžale
00050000-5563-4540-a573-7dcddcab9403	2252	Dornava
00050000-5563-4540-8209-d8a3fa98f7ee	5294	Dornberk
00050000-5563-4540-35aa-afad4bf5cbe3	1319	Draga
00050000-5563-4540-2472-af434fcdb8dd	8343	Dragatuš
00050000-5563-4540-f228-2b5ae4628847	3222	Dramlje
00050000-5563-4540-fa0e-5a2e6a3f763e	2370	Dravograd
00050000-5563-4540-bcf8-fd3e887c3d77	4203	Duplje
00050000-5563-4540-a5f6-45939974e926	6221	Dutovlje
00050000-5563-4540-8564-0a7fd44e88d8	8361	Dvor
00050000-5563-4540-90fb-63516eade973	2343	Fala
00050000-5563-4540-2e10-19cc54e42892	9208	Fokovci
00050000-5563-4540-5397-b64e86cc5b43	2313	Fram
00050000-5563-4540-c830-d800b8b982c7	3213	Frankolovo
00050000-5563-4540-54f5-6316c1c18a96	1274	Gabrovka
00050000-5563-4540-d297-2dd7e135f848	8254	Globoko
00050000-5563-4540-3545-d1dfafcdf42d	5275	Godovič
00050000-5563-4540-9438-860a7429634c	4204	Golnik
00050000-5563-4540-c03f-6ec7e91c4928	3303	Gomilsko
00050000-5563-4540-f274-d9d9b6fea0ed	4224	Gorenja vas
00050000-5563-4540-c483-ff7bf7c4d210	3263	Gorica pri Slivnici
00050000-5563-4540-bc42-d13848d90a85	2272	Gorišnica
00050000-5563-4540-9c3b-21bccae560f3	9250	Gornja Radgona
00050000-5563-4540-fded-6a078738898e	3342	Gornji Grad
00050000-5563-4540-8f51-408d4aad1de1	4282	Gozd Martuljek
00050000-5563-4540-136d-7d09fb23c1d6	6272	Gračišče
00050000-5563-4540-3025-e835cb95716d	9264	Grad
00050000-5563-4540-52f8-efe01f393665	8332	Gradac
00050000-5563-4540-ca98-bfe160cb9bdc	1384	Grahovo
00050000-5563-4540-cbf6-2afd5822c2bf	5242	Grahovo ob Bači
00050000-5563-4540-2434-a53dff1b98e1	5251	Grgar
00050000-5563-4540-56e0-4c88a8c88431	3302	Griže
00050000-5563-4540-f848-55bf39f19b2b	3231	Grobelno
00050000-5563-4540-dcb8-1422f70d95e5	1290	Grosuplje
00050000-5563-4540-4c84-626a17d330c0	2288	Hajdina
00050000-5563-4540-5afd-e9cf3cec52f1	8362	Hinje
00050000-5563-4540-04a1-08d42f84b361	2311	Hoče
00050000-5563-4540-93c4-1e722418fda0	9205	Hodoš/Hodos
00050000-5563-4540-094e-c53b355ae2e5	1354	Horjul
00050000-5563-4540-fefb-b49a1aeb66fe	1372	Hotedršica
00050000-5563-4540-b449-3ac5f8950fce	1430	Hrastnik
00050000-5563-4540-cb72-2ae511564f38	6225	Hruševje
00050000-5563-4540-7cfe-08289769b661	4276	Hrušica
00050000-5563-4540-ce94-9ac3128c911d	5280	Idrija
00050000-5563-4540-cbb8-2c92ca736ba2	1292	Ig
00050000-5563-4540-3c43-610fd09050d2	6250	Ilirska Bistrica
00050000-5563-4540-d7f6-07a05337657f	6251	Ilirska Bistrica-Trnovo
00050000-5563-4540-3114-f412d69f3e16	1295	Ivančna Gorica
00050000-5563-4540-7d18-868985b2968c	2259	Ivanjkovci
00050000-5563-4540-7726-6b19dfd3c736	1411	Izlake
00050000-5563-4540-3dcd-0ca6e2de7748	6310	Izola/Isola
00050000-5563-4540-8983-e544f027717f	2222	Jakobski Dol
00050000-5563-4540-4623-c136d81e8e41	2221	Jarenina
00050000-5563-4540-c31d-3ab9bae95230	6254	Jelšane
00050000-5563-4540-a625-9539e3441fe0	4270	Jesenice
00050000-5563-4540-63bc-b4bc8b1caffd	8261	Jesenice na Dolenjskem
00050000-5563-4540-e24d-2d3629999679	3273	Jurklošter
00050000-5563-4540-0ba0-2aac152c8473	2223	Jurovski Dol
00050000-5563-4540-7f1c-df71ff879640	2256	Juršinci
00050000-5563-4540-c1a8-22675e370f6b	5214	Kal nad Kanalom
00050000-5563-4540-48a0-d879a776ae9d	3233	Kalobje
00050000-5563-4540-aec5-ea8aaaa93d4b	4246	Kamna Gorica
00050000-5563-4540-818f-44794372c49f	2351	Kamnica
00050000-5563-4540-9afa-4b2cf078d964	1241	Kamnik
00050000-5563-4540-35a7-d48d34b77160	5213	Kanal
00050000-5563-4540-7e27-978477f3a3dd	8258	Kapele
00050000-5563-4540-a1d4-b00825e738ee	2362	Kapla
00050000-5563-4540-d0a4-31528f86d01f	2325	Kidričevo
00050000-5563-4540-7304-e9cf654d4cf6	1412	Kisovec
00050000-5563-4540-ded0-d3d89e401a4b	6253	Knežak
00050000-5563-4540-b538-4c2013c51774	5222	Kobarid
00050000-5563-4540-8425-6c0f1bf06c36	9227	Kobilje
00050000-5563-4540-3f43-33069f998c48	1330	Kočevje
00050000-5563-4540-d82f-13c7db27a48b	1338	Kočevska Reka
00050000-5563-4540-8e7e-a334f75120cc	2276	Kog
00050000-5563-4540-0b27-7459a27a5594	5211	Kojsko
00050000-5563-4540-a09e-600987dc6310	6223	Komen
00050000-5563-4540-8eab-7ab504ae0646	1218	Komenda
00050000-5563-4540-fb27-66d1b012a3c3	6000	Koper/Capodistria 
00050000-5563-4540-6d1a-e350bd89ddf7	6001	Koper/Capodistria - poštni predali
00050000-5563-4540-0a33-1f35956775d6	8282	Koprivnica
00050000-5563-4540-14a6-cf4887b6a152	5296	Kostanjevica na Krasu
00050000-5563-4540-48da-45351a95755e	8311	Kostanjevica na Krki
00050000-5563-4540-cab9-1c13ec0ed794	1336	Kostel
00050000-5563-4540-6838-4f4b6e30cb1e	6256	Košana
00050000-5563-4540-6f5d-f8e9947de9e5	2394	Kotlje
00050000-5563-4540-59e7-ac41095beca6	6240	Kozina
00050000-5563-4540-9394-67ef3bb0b5f7	3260	Kozje
00050000-5563-4540-ca9d-8d979cf3e986	4000	Kranj 
00050000-5563-4540-d789-011f6345c4f5	4001	Kranj - poštni predali
00050000-5563-4540-6a38-a5d723a46952	4280	Kranjska Gora
00050000-5563-4540-0988-14a938393e1f	1281	Kresnice
00050000-5563-4540-3c48-78007bc9c553	4294	Križe
00050000-5563-4540-e3e3-471b2f56302d	9206	Križevci
00050000-5563-4540-3e60-0cf990a18bb9	9242	Križevci pri Ljutomeru
00050000-5563-4540-e437-bf5a50b9a5d5	1301	Krka
00050000-5563-4540-d43f-7b4f0ef4c077	8296	Krmelj
00050000-5563-4540-f80b-3d25d7c4b42b	4245	Kropa
00050000-5563-4540-3d1b-961b7b077e6e	8262	Krška vas
00050000-5563-4540-ed46-d34235c3ca75	8270	Krško
00050000-5563-4540-efe9-7b9b54ebb4b2	9263	Kuzma
00050000-5563-4540-ebcf-29feffb12e2e	2318	Laporje
00050000-5563-4540-a4c8-7d7d4e230cbf	3270	Laško
00050000-5563-4540-0040-476f369c7fad	1219	Laze v Tuhinju
00050000-5563-4540-ba2c-878d17c36aeb	2230	Lenart v Slovenskih goricah
00050000-5563-4540-1725-bad74b49cbe5	9220	Lendava/Lendva
00050000-5563-4540-9bbb-14cf6c65bcb5	4248	Lesce
00050000-5563-4540-2d3b-88eec9fbf150	3261	Lesično
00050000-5563-4540-af14-0f5be3d8e5bf	8273	Leskovec pri Krškem
00050000-5563-4540-ec17-8b95c9041697	2372	Libeliče
00050000-5563-4540-b0a6-e6b5b8ce20c1	2341	Limbuš
00050000-5563-4540-1291-e500f7c910ee	1270	Litija
00050000-5563-4540-80fe-1ddccd43b261	3202	Ljubečna
00050000-5563-4540-61bd-801aa952c9de	1000	Ljubljana 
00050000-5563-4540-07a8-88637a8929d6	1001	Ljubljana - poštni predali
00050000-5563-4540-a18b-c64aaf35de83	1231	Ljubljana - Črnuče
00050000-5563-4540-9ac3-6c2683983941	1261	Ljubljana - Dobrunje
00050000-5563-4540-2526-3ac2ac62a079	1260	Ljubljana - Polje
00050000-5563-4540-2b26-bcd8b0d47765	1210	Ljubljana - Šentvid
00050000-5563-4540-e790-a4d6188bb95c	1211	Ljubljana - Šmartno
00050000-5563-4540-b97f-de755d5e0176	3333	Ljubno ob Savinji
00050000-5563-4540-ab0d-62ebae7d7712	9240	Ljutomer
00050000-5563-4540-235c-94987f2257fd	3215	Loče
00050000-5563-4540-ee56-709b1fd02ff5	5231	Log pod Mangartom
00050000-5563-4540-2d39-5f80c9a877d9	1358	Log pri Brezovici
00050000-5563-4540-6ac0-5288a8b1d82c	1370	Logatec
00050000-5563-4540-9b63-6cbbf1705931	1371	Logatec
00050000-5563-4540-dce2-792042316c6b	1434	Loka pri Zidanem Mostu
00050000-5563-4540-e0e3-c376e51cf1bb	3223	Loka pri Žusmu
00050000-5563-4540-e0b3-741c1afa0d55	6219	Lokev
00050000-5563-4540-94f2-885e07393fef	1318	Loški Potok
00050000-5563-4540-ba22-5eca3d48ef9b	2324	Lovrenc na Dravskem polju
00050000-5563-4540-034a-5e52d179f272	2344	Lovrenc na Pohorju
00050000-5563-4540-e2f2-f25540411fe8	3334	Luče
00050000-5563-4540-8283-06ddd534882d	1225	Lukovica
00050000-5563-4540-c0ff-06b6eedc3901	9202	Mačkovci
00050000-5563-4540-ab41-c878087c4df4	2322	Majšperk
00050000-5563-4540-97ec-a083da510a77	2321	Makole
00050000-5563-4540-93a3-406baffc0453	9243	Mala Nedelja
00050000-5563-4540-a5b1-3c72a9b99059	2229	Malečnik
00050000-5563-4540-2736-a4e74f373bec	6273	Marezige
00050000-5563-4540-e14d-cefd79988dfa	2000	Maribor 
00050000-5563-4540-bf5b-a41cfd7fdfe0	2001	Maribor - poštni predali
00050000-5563-4540-fbd2-22c1aa1872b0	2206	Marjeta na Dravskem polju
00050000-5563-4540-c7dd-b432cf376a21	2281	Markovci
00050000-5563-4540-cc75-e819bd986a9d	9221	Martjanci
00050000-5563-4540-2b4b-9a5d37d234d8	6242	Materija
00050000-5563-4540-3a16-09d3242027a3	4211	Mavčiče
00050000-5563-4540-7e41-2f5f04d78369	1215	Medvode
00050000-5563-4540-a0f0-9c9a60e7ffe1	1234	Mengeš
00050000-5563-4540-d55f-0b764c4b1fa0	8330	Metlika
00050000-5563-4540-0cc3-78a34ba49e92	2392	Mežica
00050000-5563-4540-d8e0-ebe9d2e34e2f	2204	Miklavž na Dravskem polju
00050000-5563-4540-d24d-b236030fd557	2275	Miklavž pri Ormožu
00050000-5563-4540-3fb8-558b33e09173	5291	Miren
00050000-5563-4540-999f-b19912984127	8233	Mirna
00050000-5563-4540-4698-45d8809b0473	8216	Mirna Peč
00050000-5563-4540-377d-3f3ebc838b62	2382	Mislinja
00050000-5563-4540-aa33-191a73a6e9dd	4281	Mojstrana
00050000-5563-4540-429f-7172677772f8	8230	Mokronog
00050000-5563-4540-7795-c25b7e4c7e10	1251	Moravče
00050000-5563-4540-0c50-d2e5c102bef8	9226	Moravske Toplice
00050000-5563-4540-7aaa-04fc776f646f	5216	Most na Soči
00050000-5563-4540-bc48-26d198f7170b	1221	Motnik
00050000-5563-4540-1154-e33f4d811048	3330	Mozirje
00050000-5563-4540-dea7-c1a0014e001f	9000	Murska Sobota 
00050000-5563-4540-353f-a9de137bdf03	9001	Murska Sobota - poštni predali
00050000-5563-4540-2863-e8b417666ca3	2366	Muta
00050000-5563-4540-520e-c56e4ce31bfc	4202	Naklo
00050000-5563-4540-3b8f-a4af2dcb6bb9	3331	Nazarje
00050000-5563-4540-315a-ff7a29fb881d	1357	Notranje Gorice
00050000-5563-4540-082a-7cef521fefa8	3203	Nova Cerkev
00050000-5563-4540-8750-74e684d4829d	5000	Nova Gorica 
00050000-5563-4540-1a7c-8862c5b443c0	5001	Nova Gorica - poštni predali
00050000-5563-4540-6b9e-d3ab660ad3d8	1385	Nova vas
00050000-5563-4540-575e-8de599915f3b	8000	Novo mesto
00050000-5563-4540-8d92-d35fe46e5815	8001	Novo mesto - poštni predali
00050000-5563-4540-7aff-f1cbefab5a64	6243	Obrov
00050000-5563-4540-42a0-539d9f8b0fae	9233	Odranci
00050000-5563-4540-e1ce-42b150c355d5	2317	Oplotnica
00050000-5563-4540-2829-35ae73dc0ba9	2312	Orehova vas
00050000-5563-4540-6d28-68b76f612198	2270	Ormož
00050000-5563-4540-bc37-dec3cf68fe80	1316	Ortnek
00050000-5563-4540-81ce-984450123e38	1337	Osilnica
00050000-5563-4540-b8e6-3ca3627bdda3	8222	Otočec
00050000-5563-4540-a6d4-788f90daa854	2361	Ožbalt
00050000-5563-4540-e6d9-79cf9c072054	2231	Pernica
00050000-5563-4540-5e47-ffe25a0409e0	2211	Pesnica pri Mariboru
00050000-5563-4540-47b1-bf528dbc6cba	9203	Petrovci
00050000-5563-4540-78a9-7788e32e7624	3301	Petrovče
00050000-5563-4540-898d-4dcf7c167abb	6330	Piran/Pirano
00050000-5563-4540-00c1-ebfcfec1a747	8255	Pišece
00050000-5563-4540-8ebb-85c4b1ac7171	6257	Pivka
00050000-5563-4540-2c70-ac4d0b2a1b92	6232	Planina
00050000-5563-4540-359c-b0e05e28a1e8	3225	Planina pri Sevnici
00050000-5563-4540-92f2-d03a4c3541e4	6276	Pobegi
00050000-5563-4540-5c1f-1e4da58a60f1	8312	Podbočje
00050000-5563-4540-ebc3-b58a8b6393f3	5243	Podbrdo
00050000-5563-4540-a938-50cef3384701	3254	Podčetrtek
00050000-5563-4540-15c4-9b6a9f1ddb91	2273	Podgorci
00050000-5563-4540-43f5-1987128fb6bc	6216	Podgorje
00050000-5563-4540-da76-5f90c7cb9f4f	2381	Podgorje pri Slovenj Gradcu
00050000-5563-4540-92bb-199f3b464107	6244	Podgrad
00050000-5563-4540-90c8-43ff5fd964fc	1414	Podkum
00050000-5563-4540-5d05-418b65761daa	2286	Podlehnik
00050000-5563-4540-ac98-a0eef43098ee	5272	Podnanos
00050000-5563-4540-e9b7-34b9c2371563	4244	Podnart
00050000-5563-4540-240f-ae8cf1180e06	3241	Podplat
00050000-5563-4540-6a8f-35224741448d	3257	Podsreda
00050000-5563-4540-da67-51bc64b8b7bb	2363	Podvelka
00050000-5563-4540-7d25-c70851d9a864	2208	Pohorje
00050000-5563-4540-4f5a-2b331314b18d	2257	Polenšak
00050000-5563-4540-cb9e-bb7ff59df1b2	1355	Polhov Gradec
00050000-5563-4540-2d2a-f0a1e67faeab	4223	Poljane nad Škofjo Loko
00050000-5563-4540-898c-94a3e0edaaac	2319	Poljčane
00050000-5563-4540-57ff-da5870fd98ba	1272	Polšnik
00050000-5563-4540-5af1-8b6229fed223	3313	Polzela
00050000-5563-4540-0ca1-07bdcd5c01b4	3232	Ponikva
00050000-5563-4540-b262-81b19552aaa2	6320	Portorož/Portorose
00050000-5563-4540-cffa-6d4864cd2d21	6230	Postojna
00050000-5563-4540-0eaa-b49f4b90b254	2331	Pragersko
00050000-5563-4540-fdb3-84c56c174426	3312	Prebold
00050000-5563-4540-bf17-9d4e3e444563	4205	Preddvor
00050000-5563-4540-f085-a29a12e74ecd	6255	Prem
00050000-5563-4540-de5a-9b5fa7f5f11d	1352	Preserje
00050000-5563-4540-db66-0e6970aec77d	6258	Prestranek
00050000-5563-4540-a791-56192d311ef9	2391	Prevalje
00050000-5563-4540-05ff-f81867377bb1	3262	Prevorje
00050000-5563-4540-1588-d1adfce29452	1276	Primskovo 
00050000-5563-4540-c2e8-93dddf18cb92	3253	Pristava pri Mestinju
00050000-5563-4540-1fa6-470370261c83	9207	Prosenjakovci/Partosfalva
00050000-5563-4540-ac14-6408b367bc70	5297	Prvačina
00050000-5563-4540-e502-7aa0ce50a921	2250	Ptuj
00050000-5563-4540-778e-7cec147b031b	2323	Ptujska Gora
00050000-5563-4540-fb47-54c8bf53ace3	9201	Puconci
00050000-5563-4540-6d06-c748a49c92be	2327	Rače
00050000-5563-4540-65af-8ec6853deba3	1433	Radeče
00050000-5563-4540-0f79-32b1d507d3bd	9252	Radenci
00050000-5563-4540-24e5-8cad2e284762	2360	Radlje ob Dravi
00050000-5563-4540-127f-e885a8ac5a0e	1235	Radomlje
00050000-5563-4540-be59-73f6578aba92	4240	Radovljica
00050000-5563-4540-f65c-091ad6f062a5	8274	Raka
00050000-5563-4540-8769-ef9192ce89f4	1381	Rakek
00050000-5563-4540-186e-48063ab452a8	4283	Rateče - Planica
00050000-5563-4540-7986-43a18e794b8e	2390	Ravne na Koroškem
00050000-5563-4540-adf6-2e2cf76689d3	9246	Razkrižje
00050000-5563-4540-6ff2-633a9edbb9d9	3332	Rečica ob Savinji
00050000-5563-4540-bfab-a6b5b5a8b9cd	5292	Renče
00050000-5563-4540-fa89-05eb627f7e9d	1310	Ribnica
00050000-5563-4540-a263-0fd302019085	2364	Ribnica na Pohorju
00050000-5563-4540-007e-7e831ab4aa79	3272	Rimske Toplice
00050000-5563-4540-2c5b-1d84b57163d7	1314	Rob
00050000-5563-4540-1a07-672f2d7adece	5215	Ročinj
00050000-5563-4540-7932-ec9da4c91722	3250	Rogaška Slatina
00050000-5563-4540-9164-044424a9327e	9262	Rogašovci
00050000-5563-4540-1de4-b64609b0eb5f	3252	Rogatec
00050000-5563-4540-7c2d-dc0b0db72a0b	1373	Rovte
00050000-5563-4540-f3c0-a12df2695f5b	2342	Ruše
00050000-5563-4540-df83-de69d368c8c1	1282	Sava
00050000-5563-4540-acf5-a05a70a2ea31	6333	Sečovlje/Sicciole
00050000-5563-4540-30f0-bb55502d3363	4227	Selca
00050000-5563-4540-86a2-676bbe1a95fa	2352	Selnica ob Dravi
00050000-5563-4540-63b6-d3bab8b8901a	8333	Semič
00050000-5563-4540-c549-3030e506bb2d	8281	Senovo
00050000-5563-4540-3e0e-3b6e1051317d	6224	Senožeče
00050000-5563-4540-9408-221aae4649a0	8290	Sevnica
00050000-5563-4540-f8e2-d7c26fce7321	6210	Sežana
00050000-5563-4540-c5e2-7c4a93966f7e	2214	Sladki Vrh
00050000-5563-4540-67cf-e923c59bcb25	5283	Slap ob Idrijci
00050000-5563-4540-f431-8f0a7624db33	2380	Slovenj Gradec
00050000-5563-4540-4a8d-abc84627a6cc	2310	Slovenska Bistrica
00050000-5563-4540-0920-a8b73a042ce4	3210	Slovenske Konjice
00050000-5563-4540-c32c-57d280e76596	1216	Smlednik
00050000-5563-4540-a1e5-9374205f6d6a	5232	Soča
00050000-5563-4540-f1f9-31a1d59e2d55	1317	Sodražica
00050000-5563-4540-abc9-58cf1d25f313	3335	Solčava
00050000-5563-4540-23c0-d420bf5ae760	5250	Solkan
00050000-5563-4540-83cf-4b3678e2a611	4229	Sorica
00050000-5563-4540-7b17-c9276a6ab976	4225	Sovodenj
00050000-5563-4540-06f0-fc5c55128922	5281	Spodnja Idrija
00050000-5563-4540-cb9f-fa7f4570f673	2241	Spodnji Duplek
00050000-5563-4540-6ee6-c47ec83cc86e	9245	Spodnji Ivanjci
00050000-5563-4540-2f7a-2764e6b2ab38	2277	Središče ob Dravi
00050000-5563-4540-ca29-830cbb091c98	4267	Srednja vas v Bohinju
00050000-5563-4540-4b83-b3a8140fc27d	8256	Sromlje 
00050000-5563-4540-a5a2-89924a38ec0c	5224	Srpenica
00050000-5563-4540-e519-68a878a3f89c	1242	Stahovica
00050000-5563-4540-2d4b-624c0c7ac957	1332	Stara Cerkev
00050000-5563-4540-21e2-44db6549ba07	8342	Stari trg ob Kolpi
00050000-5563-4540-a608-7b78262d4398	1386	Stari trg pri Ložu
00050000-5563-4540-2d65-e819cded348c	2205	Starše
00050000-5563-4540-b4bf-65b3c71bdd1f	2289	Stoperce
00050000-5563-4540-0ea3-a0207891543e	8322	Stopiče
00050000-5563-4540-b89a-801cef4c1ebb	3206	Stranice
00050000-5563-4540-58d8-11c276da24f8	8351	Straža
00050000-5563-4540-7a27-45aec7e692cb	1313	Struge
00050000-5563-4540-41ca-fc7098c789e1	8293	Studenec
00050000-5563-4540-4713-df107b34eb06	8331	Suhor
00050000-5563-4540-09d3-953333345080	2233	Sv. Ana v Slovenskih goricah
00050000-5563-4540-2cbe-f73c5e4da76e	2235	Sv. Trojica v Slovenskih goricah
00050000-5563-4540-aac2-f3bd5b156354	2353	Sveti Duh na Ostrem Vrhu
00050000-5563-4540-89a4-3194f21d782a	9244	Sveti Jurij ob Ščavnici
00050000-5563-4540-26f0-0f8c9c244cc5	3264	Sveti Štefan
00050000-5563-4540-5b25-54e4a261aec2	2258	Sveti Tomaž
00050000-5563-4540-b7a7-872365f699a3	9204	Šalovci
00050000-5563-4540-0664-620eaf3e5747	5261	Šempas
00050000-5563-4540-9578-d802007eadd2	5290	Šempeter pri Gorici
00050000-5563-4540-2500-f81283680a25	3311	Šempeter v Savinjski dolini
00050000-5563-4540-5ee4-4a728dc4d82f	4208	Šenčur
00050000-5563-4540-1263-7f46cba5836a	2212	Šentilj v Slovenskih goricah
00050000-5563-4540-1ea2-ed37e7a2ba0c	8297	Šentjanž
00050000-5563-4540-4a57-05fc354d27f6	2373	Šentjanž pri Dravogradu
00050000-5563-4540-dc35-27a59a880e17	8310	Šentjernej
00050000-5563-4540-c0c0-a2e2153aaa60	3230	Šentjur
00050000-5563-4540-7f6d-00e85bc161fc	3271	Šentrupert
00050000-5563-4540-8f50-7598599bd8ce	8232	Šentrupert
00050000-5563-4540-7a4a-6254927ea76c	1296	Šentvid pri Stični
00050000-5563-4540-5178-3ca4795223e7	8275	Škocjan
00050000-5563-4540-a323-ddb6579757fe	6281	Škofije
00050000-5563-4540-a827-f9383078d94c	4220	Škofja Loka
00050000-5563-4540-3355-e77ebe7880bf	3211	Škofja vas
00050000-5563-4540-5d0d-75d8a1ba3d4e	1291	Škofljica
00050000-5563-4540-9b4c-315d1819a356	6274	Šmarje
00050000-5563-4540-bfa5-2c7fad61a8aa	1293	Šmarje - Sap
00050000-5563-4540-4801-af69f36561e5	3240	Šmarje pri Jelšah
00050000-5563-4540-a7a8-8f109b3501bb	8220	Šmarješke Toplice
00050000-5563-4540-bb69-54feaac4f330	2315	Šmartno na Pohorju
00050000-5563-4540-e9b4-3d711c31e7ce	3341	Šmartno ob Dreti
00050000-5563-4540-447e-b9f316f6387b	3327	Šmartno ob Paki
00050000-5563-4540-00e9-88a3f85b5b52	1275	Šmartno pri Litiji
00050000-5563-4540-1075-299c89b6ffe6	2383	Šmartno pri Slovenj Gradcu
00050000-5563-4540-8797-6d9723ac5ed8	3201	Šmartno v Rožni dolini
00050000-5563-4540-f705-c2152a4bd80f	3325	Šoštanj
00050000-5563-4540-148c-c0dc1e6cf589	6222	Štanjel
00050000-5563-4540-9101-46837b690be4	3220	Štore
00050000-5563-4540-7e31-5e55ea13ea6c	3304	Tabor
00050000-5563-4540-8a40-c8ff7f5588fa	3221	Teharje
00050000-5563-4540-71df-3e0fd07efaa4	9251	Tišina
00050000-5563-4540-c33f-11cfc4175a5d	5220	Tolmin
00050000-5563-4540-e3ea-048c70b00c5f	3326	Topolšica
00050000-5563-4540-5e24-c50c279cafa6	2371	Trbonje
00050000-5563-4540-87d5-e6ef5dcc001e	1420	Trbovlje
00050000-5563-4540-3142-5cc8a0c5bd85	8231	Trebelno 
00050000-5563-4540-625e-fcd4922b6120	8210	Trebnje
00050000-5563-4540-a27e-5883ea3f836b	5252	Trnovo pri Gorici
00050000-5563-4540-db46-fe39c50a2722	2254	Trnovska vas
00050000-5563-4540-c817-fc3b9a9b5a9a	1222	Trojane
00050000-5563-4540-68f5-d80d7860a727	1236	Trzin
00050000-5563-4540-5a05-6b5507f7c0ed	4290	Tržič
00050000-5563-4540-0af6-2c76a9f8d1d9	8295	Tržišče
00050000-5563-4540-218f-2cd58926ea5e	1311	Turjak
00050000-5563-4540-eb3d-6c3305bb57cc	9224	Turnišče
00050000-5563-4540-dd3d-13ee5dcf3f17	8323	Uršna sela
00050000-5563-4540-679f-ad0e27f5d79f	1252	Vače
00050000-5563-4540-b2c9-531213f713aa	3320	Velenje 
00050000-5563-4540-36b3-760276c54598	3322	Velenje - poštni predali
00050000-5563-4540-e12b-4e4d3d3fd6eb	8212	Velika Loka
00050000-5563-4540-8bf2-0485205d14ef	2274	Velika Nedelja
00050000-5563-4540-2343-d307a01a1c50	9225	Velika Polana
00050000-5563-4540-9424-982e69897eac	1315	Velike Lašče
00050000-5563-4540-474a-18b51ebe702c	8213	Veliki Gaber
00050000-5563-4540-40af-08c63ff941ae	9241	Veržej
00050000-5563-4540-4a74-6154dfb010d4	1312	Videm - Dobrepolje
00050000-5563-4540-d960-f17d66bc0f6e	2284	Videm pri Ptuju
00050000-5563-4540-74a1-7d1e2a570722	8344	Vinica
00050000-5563-4540-8b33-c69efe144d1b	5271	Vipava
00050000-5563-4540-28c2-303967fc22f4	4212	Visoko
00050000-5563-4540-43c3-9039f4dd40f8	1294	Višnja Gora
00050000-5563-4540-6498-467343b3e1d6	3205	Vitanje
00050000-5563-4540-c147-914a2d5745f2	2255	Vitomarci
00050000-5563-4540-0ee4-2ced7b54fc46	1217	Vodice
00050000-5563-4540-a8d4-2b325e4e6590	3212	Vojnik\t
00050000-5563-4540-abcc-9342dc411542	5293	Volčja Draga
00050000-5563-4540-7dcc-91fcc2b304a6	2232	Voličina
00050000-5563-4540-6e9d-27ed9b9e9108	3305	Vransko
00050000-5563-4540-667f-5985d4ae0778	6217	Vremski Britof
00050000-5563-4540-3393-fe3914776459	1360	Vrhnika
00050000-5563-4540-a57f-5d9dc2a3850e	2365	Vuhred
00050000-5563-4540-3380-b4210fbb6c1f	2367	Vuzenica
00050000-5563-4540-8f46-ddae8bb26111	8292	Zabukovje 
00050000-5563-4540-b956-93213a1ddf08	1410	Zagorje ob Savi
00050000-5563-4540-401e-8c75ebaa198d	1303	Zagradec
00050000-5563-4540-5ded-b6ff857972e5	2283	Zavrč
00050000-5563-4540-548b-38a84580c467	8272	Zdole 
00050000-5563-4540-1cf0-80cd5ca96d5c	4201	Zgornja Besnica
00050000-5563-4540-9a09-d127ee32028f	2242	Zgornja Korena
00050000-5563-4540-3ce1-49940e77aa97	2201	Zgornja Kungota
00050000-5563-4540-9d5e-0557c7ef77df	2316	Zgornja Ložnica
00050000-5563-4540-6b07-7deb192e1893	2314	Zgornja Polskava
00050000-5563-4540-0f00-151682b23e0c	2213	Zgornja Velka
00050000-5563-4540-0530-00df7b4b7732	4247	Zgornje Gorje
00050000-5563-4540-e4e7-975cf3884fe1	4206	Zgornje Jezersko
00050000-5563-4540-d25e-e4b6b1560bdd	2285	Zgornji Leskovec
00050000-5563-4540-0ba8-c4624ff1cdb4	1432	Zidani Most
00050000-5563-4540-7258-848f28a796df	3214	Zreče
00050000-5563-4540-1fe9-de2ad2dcd2ce	4209	Žabnica
00050000-5563-4540-20a8-426107656778	3310	Žalec
00050000-5563-4540-9dc8-4ea20b20b5b8	4228	Železniki
00050000-5563-4540-e787-ab525e315f86	2287	Žetale
00050000-5563-4540-009b-8b5993726e67	4226	Žiri
00050000-5563-4540-386c-2a0a38e5e2a0	4274	Žirovnica
00050000-5563-4540-4c84-316c8a65899a	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 4968108)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2691 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 4967923)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4968001)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4968120)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4968240)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4968291)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 4968149)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 4968093)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4968083)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4968280)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4968217)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4967796)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5563-4541-0519-94fd8bdb045e	00010000-5563-4541-9303-bd4f8e313d1e	2015-05-25 17:52:34	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvbbgGFqN5GrqAq1zLYcySsVYaakFAg.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 4968159)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 4967834)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5563-4541-650c-d6e276499b6e	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5563-4541-4b42-b399bbc0effb	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5563-4541-ff3f-6a24106160d7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5563-4541-9bca-d4f9ceeea6f1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5563-4541-6a15-162d85dde118	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5563-4541-231f-b8173462c57d	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 4967818)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5563-4541-0519-94fd8bdb045e	00020000-5563-4541-9bca-d4f9ceeea6f1
00010000-5563-4541-9303-bd4f8e313d1e	00020000-5563-4541-9bca-d4f9ceeea6f1
\.


--
-- TOC entry 2732 (class 0 OID 4968173)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4968114)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4968064)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 4968386)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5563-4540-3fb8-b43dcb714fb9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5563-4540-d78f-85531ca934a6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5563-4540-1c0b-3fef3767d8a3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5563-4540-c1ca-b3a46c1b2be9	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5563-4540-f5ba-f570d461a3e3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 4968379)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5563-4540-7a49-1c5caa5b057d	00000000-5563-4540-c1ca-b3a46c1b2be9	popa
00000000-5563-4540-db79-70e679d4c99e	00000000-5563-4540-c1ca-b3a46c1b2be9	oseba
00000000-5563-4540-3503-377bceef91a0	00000000-5563-4540-d78f-85531ca934a6	prostor
00000000-5563-4540-df81-4e5fd8f2b96d	00000000-5563-4540-c1ca-b3a46c1b2be9	besedilo
00000000-5563-4540-e2c1-17045e11147a	00000000-5563-4540-c1ca-b3a46c1b2be9	uprizoritev
00000000-5563-4540-5bf9-9ffd46575ea7	00000000-5563-4540-c1ca-b3a46c1b2be9	funkcija
00000000-5563-4540-99b8-3e33c8e94b56	00000000-5563-4540-c1ca-b3a46c1b2be9	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 4968374)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4968227)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 231
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2703 (class 0 OID 4967895)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4968070)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4968269)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5563-4540-ac13-169bd92a89ea	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-4540-c9bd-4527618a7822	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-4540-c84a-9d13096a8eac	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5563-4540-52ec-0693785c9bb7	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5563-4540-f445-7505dfea7708	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5563-4540-d3a0-b056783110f8	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5563-4540-1833-3272c692f877	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5563-4540-fff7-d75fbf9b1eeb	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5563-4540-c441-8ff4a56046a6	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5563-4540-a3a7-f4e26638304d	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5563-4540-fb91-dd1285ff717d	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5563-4540-5e65-9d2b8ab6b621	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5563-4540-c266-775e113b3817	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5563-4540-8cd4-6d4b2d0af65a	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5563-4540-61da-38561b65fcd8	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5563-4540-a0b4-8c570873ab58	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 4967958)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 4967805)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5563-4541-9303-bd4f8e313d1e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5mhA2QS91EeYHMwN7M8nRI.BAqqn95a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5563-4541-0519-94fd8bdb045e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 4968324)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4968016)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4968141)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4968209)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4968048)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 4968314)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5563-4540-282a-2454e455429b	Drama	drama (SURS 01)
00140000-5563-4540-cc05-bdeffbceb8be	Opera	opera (SURS 02)
00140000-5563-4540-69da-a91f56c7e11c	Balet	balet (SURS 03)
00140000-5563-4540-0582-d935e02ef8ca	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5563-4540-a71b-02bc65685885	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5563-4540-7e74-8352a1922164	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5563-4540-9b6c-c9c680246776	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 4968199)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5563-4540-e821-7d19ec5568db	Opera	opera
00150000-5563-4540-1151-bd76eade6d6f	Opereta	opereta
00150000-5563-4540-a429-3dd00d76cc05	Balet	balet
00150000-5563-4540-b521-0a07ae5aa8d2	Plesne prireditve	plesne prireditve
00150000-5563-4540-bc79-46fc44d88a19	Lutkovno gledališče	lutkovno gledališče
00150000-5563-4540-4379-7f26d1a58fc9	Raziskovalno gledališče	raziskovalno gledališče
00150000-5563-4540-1155-75d3d3e67d25	Biografska drama	biografska drama
00150000-5563-4540-9d7a-b86b3b42597c	Komedija	komedija
00150000-5563-4540-c7c5-797b6bfdb5e3	Črna komedija	črna komedija
00150000-5563-4540-31f4-cdcb0356e125	E-igra	E-igra
00150000-5563-4540-4c8b-aa25b86467aa	Kriminalka	kriminalka
00150000-5563-4540-4701-e821a1a63722	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 4967859)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 4968368)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 4968358)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 4968268)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4968038)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4968063)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4967984)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4968195)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4968014)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 4968057)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 4967998)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 4968106)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4968133)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 4967956)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4967868)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2322 (class 2606 OID 4967891)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4967848)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4967833)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 4968139)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4968172)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 4968309)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 4967920)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4967944)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4968112)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 4967934)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4968005)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4968124)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 4968252)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 4968296)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4968156)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4968097)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 4968088)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 4968290)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 4968224)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4967804)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4968163)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4967822)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4967842)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 4968181)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4968119)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4968069)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 4968392)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 4968383)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 4968378)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 4968237)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 4967900)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4968079)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 4968279)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 4967969)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4967817)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 4968339)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4968023)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 4968147)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 4968215)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 4968052)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 4968323)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 4968208)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 4968045)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 4968238)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 4968239)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 4967922)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2288 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2289 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2290 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 4968140)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 4968126)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 4968125)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 4968024)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 4968198)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 4968196)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 4968197)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 4968000)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 4967999)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 4968311)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 4968312)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 4968313)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 4968343)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 4968340)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 4968342)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 4968341)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 4967971)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4967970)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2293 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2294 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2320 (class 1259 OID 4967894)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 4968164)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 4968058)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4967849)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4967850)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 4968184)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 4968183)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 4968182)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 4968006)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 4968008)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 4968007)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 4968385)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 4968092)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 4968090)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 4968089)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 4968091)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4967823)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4967824)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 4968148)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 4968113)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 4968225)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 4968226)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 4967936)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 4967935)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 4967937)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 4968253)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 4968254)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 4968371)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 4968370)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 4968373)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 4968369)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 4968372)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 4968216)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 4968101)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 4968100)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 4968098)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 4968099)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 4968360)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 4968359)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 4968015)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4967870)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4967869)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 4967901)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 4967902)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 4968082)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 4968081)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 4968080)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4968047)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 4968043)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 4968040)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 4968041)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 4968039)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 4968044)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 4968042)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 4967921)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4967985)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 4967987)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 4967986)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 4967988)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 4968107)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 4968310)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4967892)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 4967893)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 4968393)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 4967957)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 4968384)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 4968158)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 4968157)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 4967945)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 4968297)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4967843)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 4968046)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 4968531)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 4968516)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 4968521)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 4968541)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 4968511)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 4968536)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 4968526)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 4968686)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 4968691)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4968446)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 4968626)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 4968621)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 4968616)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 4968506)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 4968666)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 4968656)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 4968661)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 4968481)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 4968476)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 4968606)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 4968711)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 4968716)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 4968721)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 4968741)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 4968726)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 4968736)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 4968731)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 4968471)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 4968466)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 4968431)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 4968426)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 4968636)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 4968546)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 4968406)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 4968411)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 4968651)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 4968646)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 4968641)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 4968486)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 4968496)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 4968491)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 4968781)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 4968581)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 4968571)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 4968566)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 4968576)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 4968396)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 4968401)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 4968631)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 4968611)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 4968676)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 4968681)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 4968456)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 4968451)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 4968461)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 4968696)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 4968701)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 4968766)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 4968761)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 4968776)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 4968756)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 4968771)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 4968671)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 4968601)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 4968596)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 4968586)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 4968591)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 4968751)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 4968746)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 4968501)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 4968706)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 4968421)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 4968416)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 4968436)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 4968441)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 4968561)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 4968556)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 4968551)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-25 17:52:34 CEST

--
-- PostgreSQL database dump complete
--

