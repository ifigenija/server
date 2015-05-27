--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 11:15:50 CEST

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
-- TOC entry 180 (class 1259 OID 5236082)
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
-- TOC entry 227 (class 1259 OID 5236592)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean
);


--
-- TOC entry 226 (class 1259 OID 5236575)
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
-- TOC entry 219 (class 1259 OID 5236485)
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
-- TOC entry 194 (class 1259 OID 5236255)
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
-- TOC entry 197 (class 1259 OID 5236289)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5236202)
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
-- TOC entry 213 (class 1259 OID 5236415)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) NOT NULL,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer
);


--
-- TOC entry 192 (class 1259 OID 5236239)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5236283)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5236219)
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
-- TOC entry 202 (class 1259 OID 5236332)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5236357)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5236176)
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
-- TOC entry 181 (class 1259 OID 5236091)
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
-- TOC entry 182 (class 1259 OID 5236102)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
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
-- TOC entry 177 (class 1259 OID 5236056)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5236075)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5236364)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5236395)
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
-- TOC entry 223 (class 1259 OID 5236528)
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
-- TOC entry 184 (class 1259 OID 5236133)
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
-- TOC entry 186 (class 1259 OID 5236168)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5236338)
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
-- TOC entry 185 (class 1259 OID 5236153)
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
-- TOC entry 191 (class 1259 OID 5236231)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5236350)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5236470)
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
-- TOC entry 222 (class 1259 OID 5236521)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5236379)
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
-- TOC entry 201 (class 1259 OID 5236323)
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
-- TOC entry 200 (class 1259 OID 5236313)
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
-- TOC entry 221 (class 1259 OID 5236510)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5236447)
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
-- TOC entry 174 (class 1259 OID 5236027)
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
-- TOC entry 173 (class 1259 OID 5236025)
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
-- TOC entry 210 (class 1259 OID 5236389)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5236065)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5236049)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5236403)
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
-- TOC entry 204 (class 1259 OID 5236344)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5236294)
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
-- TOC entry 230 (class 1259 OID 5236618)
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
-- TOC entry 229 (class 1259 OID 5236611)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5236606)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5236457)
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
-- TOC entry 231 (class 1259 OID 5236626)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5236125)
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
-- TOC entry 199 (class 1259 OID 5236300)
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
-- TOC entry 220 (class 1259 OID 5236499)
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
-- TOC entry 188 (class 1259 OID 5236188)
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
-- TOC entry 175 (class 1259 OID 5236036)
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
-- TOC entry 225 (class 1259 OID 5236554)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    sifra character varying(255) NOT NULL,
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
-- TOC entry 193 (class 1259 OID 5236246)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5236371)
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
-- TOC entry 215 (class 1259 OID 5236439)
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
-- TOC entry 195 (class 1259 OID 5236278)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5236544)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5236429)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5236030)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5236082)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5236592)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5236575)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5236485)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-8b45-f434-115cdb5d72e4	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-8b45-f685-f3d1cf75f65a	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-8b45-aea9-24f6b81f7c8a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5236255)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5236289)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5236202)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-8b44-4151-4742fb26393b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-8b44-15c5-c1412cd65bb9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-8b44-e0fb-5b63d416c197	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-8b44-255c-3d7523a834f9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-8b44-b032-0c95721a9034	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-8b44-55b9-95f3e240a354	AD	AND	020	Andorra 	Andora	\N
00040000-5565-8b44-4f59-2b11544a1a7b	AO	AGO	024	Angola 	Angola	\N
00040000-5565-8b44-b0bd-e79775ca7847	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-8b44-5963-81f88128ddf8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-8b44-aa7e-85540d7080f9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-8b44-2d3d-2f01620782cf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-8b44-20f2-9442c0506423	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-8b44-580e-24a76441451b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-8b44-3c3b-333a237213f6	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-8b44-4bf7-fbf25832f219	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-8b44-6123-bbe046dd10dd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-8b44-62d3-f5cc6cecc0cb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-8b44-0d96-4b8c13f99ca6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-8b44-1ad7-02dacbcc1d1f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-8b44-a9b1-a639edcd3d2b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-8b44-3ba8-17ca78582c7b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-8b44-b7f1-01bf91a36461	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-8b44-7186-cd7e960a5d39	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-8b44-c577-7badc45efd0c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-8b44-17eb-399e98b89328	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-8b44-8260-d576bbe4f176	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-8b44-16d9-a3de0d6c682f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-8b44-ca0f-f9b70001bdd7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-8b44-5c7b-31d7db4e69f0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-8b44-6b01-740c47797926	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-8b44-5342-f144f953e244	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-8b44-f934-4cddf4d584c1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-8b44-414e-34fc42bf696f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-8b44-0b83-eb037dce5e0e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-8b44-216a-3f5e3666fd5c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-8b44-49f3-6a3cb48bc279	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-8b44-8ffa-807ef9b55d99	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-8b44-03f9-b49cc2cabdd9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-8b44-ff77-26f80748f86c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-8b44-d18e-923d41440b15	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-8b44-0fe2-bb481a78ae52	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-8b44-f0df-4d0019cdff49	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-8b44-dbee-83e635d69108	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-8b44-8ff8-8dd731b08d75	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-8b44-e627-0123ec030870	CL	CHL	152	Chile 	Čile	\N
00040000-5565-8b44-5337-a533023c76d5	CN	CHN	156	China 	Kitajska	\N
00040000-5565-8b44-ecef-781b8cc8f626	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-8b44-207f-a3218ee2f8b4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-8b44-754c-528bc30eecd6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-8b44-3e28-db7ad5bbe46a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-8b44-f829-ffb0e91b4881	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-8b44-f4e2-f06d6c0995df	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-8b44-099a-8f841ecaecab	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-8b44-6bf3-475271520d63	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-8b44-cc1b-d4c5f02ddfcc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-8b44-758d-87871354737a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-8b44-7031-883df344f8ac	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-8b44-56bb-cc15b2568e4b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-8b44-ccf7-9ff8101e0b2b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-8b44-b6cf-97539682b664	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-8b44-4ead-2a0b6fb138f2	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-8b44-3818-a2fed6f7b53f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-8b44-c34f-447fd08998e7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-8b44-0085-10a39c3d7c83	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-8b44-82bc-093999efd385	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-8b44-4cd4-66eabdb9181d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-8b44-b469-28507be9ad40	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-8b44-7cf0-59c608ab552d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-8b44-46cb-c1dd86021b82	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-8b44-c5f3-8ad81aad9159	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-8b44-d48c-059f0852fad3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-8b44-e2ef-f454fac54710	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-8b44-30bb-c800a39a8245	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-8b44-87bd-fd54e1a53986	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-8b44-2a59-4fe6775ecfea	FI	FIN	246	Finland 	Finska	\N
00040000-5565-8b44-75a2-b9c60c29060c	FR	FRA	250	France 	Francija	\N
00040000-5565-8b44-82f0-40996a64be7d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-8b44-dd00-3a774860820f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-8b44-452f-e6e71ebe58df	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-8b44-dc21-d9ce3a55a2de	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-8b44-1e68-2868286804ec	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-8b44-9a4d-15a8b4cf3f5d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-8b44-c960-8016e40a2924	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-8b44-b863-90340164fb21	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-8b44-713c-201b34b670ee	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-8b44-2327-ba3052af089e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-8b44-b5ff-20d2920e30c4	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-8b44-c624-1ac8850c555c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-8b44-1cae-81dcb0801ee7	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-8b44-52ab-c5a0cbf6b417	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-8b44-b1eb-7df8594d88d4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-8b44-265e-a33c949b9edb	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-8b44-ecb6-ac5b0b5bb336	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-8b44-41a7-14136199e0e9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-8b44-37cb-afd914987741	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-8b44-6aa5-1acd99376f88	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-8b44-c4e3-aa173f1e3fa1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-8b44-cd6a-3756f483c86b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-8b44-ff68-4a76e188df33	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-8b44-6103-4ca165bdbe56	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-8b44-026a-dbb7af021325	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-8b44-3bf7-74a6239bff5b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-8b44-2161-449bc93209e0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-8b44-c62c-12072207548a	IN	IND	356	India 	Indija	\N
00040000-5565-8b44-8c0e-dd99ce83c187	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-8b44-1500-560138438852	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-8b44-27e3-c73f887ffa41	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-8b44-541b-52e3e6d72b5e	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-8b44-9055-47183786169e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-8b44-6b08-f327a3d37dc9	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-8b44-69ee-344c073f9027	IT	ITA	380	Italy 	Italija	\N
00040000-5565-8b44-4836-ffa3f99e09dd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-8b44-2a72-5892a365eb0a	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-8b44-7fca-62b9fd1cb74d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-8b44-969f-39bee72256bb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-8b44-a880-41f2271ccd55	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-8b44-c30b-16074442b01c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-8b44-b69c-84631157b70b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-8b44-96b9-485187b3cca0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-8b44-ab76-700a956d0ae9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-8b44-6b00-e5be8f1ea7b1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-8b44-3fb6-33519eac190d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-8b44-3be9-910dd095dcbc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-8b44-1359-bd41f7d10d9b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-8b44-710f-02f7352fcf59	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-8b44-fad0-dafb92dca38d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-8b44-3f7f-48edc5bb73b8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-8b44-6241-06d23f290856	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-8b44-e496-4cc0e0965795	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-8b44-6f8f-2cc230ed7807	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-8b44-14df-a2ece4791ecd	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-8b44-3410-d8a42b21b987	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-8b44-12d3-b6a19c7543c1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-8b44-60f6-1274a028e24b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-8b44-e011-8b168ec15723	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-8b44-7578-45634d7da7ba	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-8b44-3efe-456a75606c3c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-8b44-b01a-c987a264e2e5	ML	MLI	466	Mali 	Mali	\N
00040000-5565-8b44-f136-1547d223ddae	MT	MLT	470	Malta 	Malta	\N
00040000-5565-8b44-418f-228ebf0a1661	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-8b44-c628-50897b0d9383	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-8b44-f081-3152a7fb46dc	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-8b44-86b9-61482bf0fd41	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-8b44-7b4a-147f7decc2e2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-8b44-4061-457ddca02cee	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-8b44-9a97-d2a52e1f40be	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-8b44-082f-a7bd5bb5265a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-8b44-707e-1ae699b60f06	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-8b44-9f1a-c701c991c4db	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-8b44-9fde-a1370cb8865c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-8b44-9dbe-8660742ad9a9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-8b44-62d3-8f67e808cd67	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-8b44-817c-79fe75928fc7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-8b44-14d8-2400e3ee1274	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-8b44-3dd7-5d2bf324e8cf	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-8b44-d782-43abb3d7ac25	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-8b44-f35d-c28b2ca9348c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-8b44-6b68-424b761f5678	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-8b44-3405-5ecce67cac0c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-8b44-af1b-8e486a85a6aa	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-8b44-3310-d7f25d7104fe	NE	NER	562	Niger 	Niger 	\N
00040000-5565-8b44-0705-26857dfc49cf	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-8b44-3ee1-653fe7feab1a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-8b44-1fe4-52110e9e9153	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-8b44-926b-6ba982f74ebc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-8b44-6fae-b480697368f5	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-8b44-584e-3de450aa2415	OM	OMN	512	Oman 	Oman	\N
00040000-5565-8b44-715d-d3592e125b2a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-8b44-7b77-17c8b6de8f60	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-8b44-b040-a227baa59f3a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-8b44-e7e6-e73d6733c1ed	PA	PAN	591	Panama 	Panama	\N
00040000-5565-8b44-60e0-4d423d83742b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-8b44-b18a-a5787adb5447	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-8b44-432b-a756b9ea4199	PE	PER	604	Peru 	Peru	\N
00040000-5565-8b44-2a40-a2bcfbeff901	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-8b44-4e56-8efa447dee71	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-8b44-e6de-a830a51866e7	PL	POL	616	Poland 	Poljska	\N
00040000-5565-8b44-b8bc-17f5115d479c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-8b44-5dab-5e1e96a0b310	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-8b44-63e5-02abee855fde	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-8b44-fde5-e22aa342ee07	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-8b44-c396-19cdde2f5c39	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-8b44-4042-86001ff40980	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-8b44-b621-15afa720f14f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-8b44-b4a5-1e35480c9019	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-8b44-6290-b482acd631fb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-8b44-b3fd-230922d3b08a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-8b44-a468-ec8f90277427	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-8b44-96e0-7515970511b9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-8b44-4651-eef19c07c92e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-8b44-2e64-0c86bfc841e9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-8b44-ec2d-1e48dc3381a2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-8b44-bf11-1c6562ce1c83	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-8b44-2c37-f133c47a2838	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-8b44-0e70-c777a4d203e7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-8b44-7e24-e5a0d61d5e64	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-8b44-1b94-ffd5150204b6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-8b44-cadd-6a531d02600d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-8b44-2869-0d719083072c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-8b44-e39f-e7f314847a1d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-8b44-93cc-16754005a14c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-8b44-61fc-c8590eff9fc3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-8b44-3772-b80c40e13ad4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-8b44-d387-31740cf3f02d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-8b44-6bf8-5e14541650e0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-8b44-c7f9-d352a065a944	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-8b44-df70-03b4b5fedc9f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-8b44-d6ea-86289a9445cc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-8b44-0312-485d1f1f1bc2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-8b44-8b8c-84b66e665210	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-8b44-6f9c-35369cfe70eb	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-8b44-6270-82914c3c51cd	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-8b44-9e28-dd4303b607b1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-8b44-1311-5f41c59eeb6f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-8b44-3fde-8d62289b59cf	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-8b44-cc2a-09477e707491	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-8b44-776d-ed1a946d2414	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-8b44-07cf-c364ef8157db	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-8b44-3967-0d52ee9f5622	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-8b44-fb16-9929a5b17cd7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-8b44-3ee7-03e3dafd4afe	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-8b44-8bb9-9dd4276003d6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-8b44-ecad-fe38ebc0d7bb	TG	TGO	768	Togo 	Togo	\N
00040000-5565-8b44-2899-648b3d7ac1ed	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-8b44-9735-79009ed334b6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-8b44-eb51-0e3823af63a6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-8b44-1c16-65553cb80561	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-8b44-9ede-b67fa772a43d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-8b44-95e5-dee9cad1efcb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-8b44-d4df-7baff8a09c14	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-8b44-555b-2fcee7a9fd85	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-8b44-ceb0-a6eee24a68f0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-8b44-bd8b-b29d2cc223ec	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-8b44-83a5-3387fbda69b5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-8b44-1320-f0b40bc52433	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-8b44-00f9-a4ac203dfe52	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-8b44-596c-b523c80d81fa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-8b44-49fb-f48730a30f2a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-8b44-52fc-7a3d8a6e4aa5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-8b44-c342-9704069d04f2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-8b44-017c-75e9b5c8c0d3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-8b44-84a1-ec0fac1a485b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-8b44-789c-f38291d0432c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-8b44-a911-8d13ac965bc5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-8b44-cda7-d7c4590c7a77	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-8b44-22ad-028a263ae4c4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-8b44-a62b-8a0b972597f3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-8b44-d530-5798a4d4ec04	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-8b44-4bdd-67b228e8be5d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5236415)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-8b45-89ad-4d092d64d877	000e0000-5565-8b45-6c3c-04f150ed5d46	\N	000f0000-5565-8b44-4e79-21d4209ce676	igralec	Hipolita	\N	velika	t	9	t	t	\N
000d0000-5565-8b45-f2e6-33f9304a10fb	000e0000-5565-8b45-6c3c-04f150ed5d46	\N	000f0000-5565-8b44-4e79-21d4209ce676	igralec	Tezej	\N	velika	t	9	t	t	\N
\.


--
-- TOC entry 2712 (class 0 OID 5236239)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5236283)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5236219)
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
-- TOC entry 2722 (class 0 OID 5236332)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5236357)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5236176)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-8b45-9119-9b030934d27f	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-8b45-0084-fff70bc957e1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-8b45-00b1-a1a3aed67785	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-8b45-fbef-41ba34f4689d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-8b45-48ea-737b0ac8825d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-8b45-2de5-f5f827e23528	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-8b45-e9a4-0f72ae2e4bcd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-8b45-5d7b-6da44f8c1ea2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-8b45-8527-20aa6c06a19a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-8b45-c8b8-20471c9477a0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-8b45-19b8-bf2be2985645	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-8b45-85d1-de80b9e90fc4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-8b45-0ffd-669b6fb34c18	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-8b45-9ea9-5a1d7240cd80	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-8b45-d9ce-3ff99608f381	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5236091)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-8b45-e717-7ef4e3822078	00000000-5565-8b45-48ea-737b0ac8825d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-8b45-b21b-596863cd1dd4	00000000-5565-8b45-48ea-737b0ac8825d	00010000-5565-8b45-3404-67218dfec989	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-8b45-1595-9c808709b3b3	00000000-5565-8b45-2de5-f5f827e23528	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5236102)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-8b45-f451-e25587499460	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-8b45-64a5-29f24e2c5e8d	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-8b45-c6f2-b51a090f3fa5	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-8b45-0380-ec8b18f79747	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-8b45-0956-c24db7f65d06	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-8b45-7a17-c5cde28ffe00	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-8b45-30a0-5455250c9ed4	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-8b45-af39-3a4a0aeb51dd	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-8b45-f83b-2d2ea3292057	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-8b45-0f9d-3c9940edb621	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-8b45-7994-e73dc7c844d3	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5236056)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-8b44-5261-9c32f540d9c2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-8b44-f73b-b25d10f16df3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-8b44-7009-399077f3f162	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-8b44-e4ae-e93a300fa49b	Abonma-read	Abonma - branje	f
00030000-5565-8b44-d427-acd1127e536e	Abonma-write	Abonma - spreminjanje	f
00030000-5565-8b44-9507-62cd445c2299	Alternacija-read	Alternacija - branje	f
00030000-5565-8b44-ad14-0b29b21461a5	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-8b44-a75f-2790cf9face5	Arhivalija-read	Arhivalija - branje	f
00030000-5565-8b44-5133-9676bfd3dc81	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-8b44-71ed-4a693bcb714d	Besedilo-read	Besedilo - branje	f
00030000-5565-8b44-392c-ba3158197546	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-8b44-eaf3-4730c8c097c4	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-8b44-da47-b9c67789cf83	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-8b44-1968-4d97d6a334a4	Dogodek-read	Dogodek - branje	f
00030000-5565-8b44-84bf-43d3bf5a1cac	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-8b44-6d8b-f544132e5729	Drzava-read	Drzava - branje	f
00030000-5565-8b44-6325-1d32a03800c8	Drzava-write	Drzava - spreminjanje	f
00030000-5565-8b44-f695-cdf62297b1be	Funkcija-read	Funkcija - branje	f
00030000-5565-8b44-f007-ff2700a7affc	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-8b44-e45e-234ad2b595b1	Gostovanje-read	Gostovanje - branje	f
00030000-5565-8b44-188a-8cc3a043e9a8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-8b44-b42b-37688bb0857e	Gostujoca-read	Gostujoca - branje	f
00030000-5565-8b44-f65f-54c15aff2fea	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-8b44-3d6f-4255d7e9eb01	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-8b44-8b41-b01b6f0e6b2f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-8b44-feff-6460b38f0c74	Kupec-read	Kupec - branje	f
00030000-5565-8b44-f74a-476f62de9d15	Kupec-write	Kupec - spreminjanje	f
00030000-5565-8b44-35f9-b5d80735e2c8	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-8b44-77bc-1065a19203c0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-8b44-d0f0-d238f9ad8ae4	Option-read	Option - branje	f
00030000-5565-8b44-a58a-3fd8aecadef2	Option-write	Option - spreminjanje	f
00030000-5565-8b44-5db0-5a1943bf1f95	OptionValue-read	OptionValue - branje	f
00030000-5565-8b44-3b5f-8cf0225cb241	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-8b45-b9a6-aa4f694df46e	Oseba-read	Oseba - branje	f
00030000-5565-8b45-af29-ceb6a03aeda6	Oseba-write	Oseba - spreminjanje	f
00030000-5565-8b45-0d57-7fbf0fd19847	Permission-read	Permission - branje	f
00030000-5565-8b45-aee7-4def4e1460ec	Permission-write	Permission - spreminjanje	f
00030000-5565-8b45-9861-2e4877406d77	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-8b45-5fff-2aed85d6b92e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-8b45-9b16-b7340a97d5f4	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-8b45-78ae-63222aaf1409	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-8b45-b722-1314a2dc8b86	Pogodba-read	Pogodba - branje	f
00030000-5565-8b45-6dda-1883afceaa03	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-8b45-dc72-2780d3eb2a95	Popa-read	Popa - branje	f
00030000-5565-8b45-5ce5-555038bc7d79	Popa-write	Popa - spreminjanje	f
00030000-5565-8b45-63b1-9f08e063a60d	Posta-read	Posta - branje	f
00030000-5565-8b45-6a8f-813501dc949b	Posta-write	Posta - spreminjanje	f
00030000-5565-8b45-c4de-5ab71c4c772c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-8b45-7dd8-b176b67d7205	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-8b45-b633-c7309d90b6a2	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-8b45-27c1-080a073d83bb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-8b45-2922-93a68ab4174d	Predstava-read	Predstava - branje	f
00030000-5565-8b45-64d2-2b358efbf40d	Predstava-write	Predstava - spreminjanje	f
00030000-5565-8b45-319f-b300b792f8f5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-8b45-9dae-ac4626e18a03	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-8b45-523a-3cf1421b828b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-8b45-71e7-ae0f9ba9d976	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-8b45-bcea-8a7c97e5cedf	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-8b45-a2aa-e60e21d99134	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-8b45-e922-97658e2f6f69	Prostor-read	Prostor - branje	f
00030000-5565-8b45-f513-7845598c0e0f	Prostor-write	Prostor - spreminjanje	f
00030000-5565-8b45-ee9e-410c444cbc06	Racun-read	Racun - branje	f
00030000-5565-8b45-e441-9e2035109742	Racun-write	Racun - spreminjanje	f
00030000-5565-8b45-b333-8d002cef0437	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-8b45-0517-9877ea8d0b02	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-8b45-50af-48198381fa08	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-8b45-c8ec-56a0004c0fea	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-8b45-098b-dd5594e427bb	Rekvizit-read	Rekvizit - branje	f
00030000-5565-8b45-2d41-3f457e9cc5db	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-8b45-aa07-dc9052810970	Revizija-read	Revizija - branje	f
00030000-5565-8b45-db01-356a82aecc8c	Revizija-write	Revizija - spreminjanje	f
00030000-5565-8b45-f7f8-960ff8cd612e	Rezervacija-read	Rezervacija - branje	f
00030000-5565-8b45-ad1b-d4ce0320c114	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-8b45-1be4-579783c28aad	Role-read	Role - branje	f
00030000-5565-8b45-91b1-b0e2e81cd344	Role-write	Role - spreminjanje	f
00030000-5565-8b45-821a-9f3512e2718f	SedezniRed-read	SedezniRed - branje	f
00030000-5565-8b45-4a2e-05a3551aa504	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-8b45-b4d8-f40826a0e50c	Sedez-read	Sedez - branje	f
00030000-5565-8b45-4090-c5de2bc2c248	Sedez-write	Sedez - spreminjanje	f
00030000-5565-8b45-ec23-efaa05bff29c	Sezona-read	Sezona - branje	f
00030000-5565-8b45-37c5-4be5856984c7	Sezona-write	Sezona - spreminjanje	f
00030000-5565-8b45-8644-cb8e24d342f2	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-8b45-5223-d0a65851ab3d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-8b45-a01b-2e4a8c8d33bf	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-8b45-efa3-8b4aa1403e1c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-8b45-04a7-e7a3008b2baf	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-8b45-d3e1-4c9aa61e2b63	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-8b45-a73f-2a0347caea38	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-8b45-4fc5-d92aec096527	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-8b45-d245-be9b7cbf66b1	Telefonska-read	Telefonska - branje	f
00030000-5565-8b45-3cb3-7948a24ad8f2	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-8b45-2db9-df6101b886cf	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-8b45-dcec-3e18702d58de	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-8b45-509d-2cdd02a00c2b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-8b45-d81f-61aa0110e30f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-8b45-3eb3-f953330f3b68	Trr-read	Trr - branje	f
00030000-5565-8b45-284b-97e8adbe1efb	Trr-write	Trr - spreminjanje	f
00030000-5565-8b45-2e99-9772cfb85393	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-8b45-be0e-94c5106379cc	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-8b45-68d2-3e4c47d4e8a9	User-read	User - branje	f
00030000-5565-8b45-1866-d3faf52638c8	User-write	User - spreminjanje	f
00030000-5565-8b45-0759-11ece8bd35ac	Vaja-read	Vaja - branje	f
00030000-5565-8b45-d85d-925a009f6239	Vaja-write	Vaja - spreminjanje	f
00030000-5565-8b45-ff6a-816f91937f9e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-8b45-5bcf-0fb26591d149	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-8b45-eec9-cb2da56b15f3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-8b45-1fa9-34aa1ca853a5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-8b45-791b-75420f36b296	Zasedenost-read	Zasedenost - branje	f
00030000-5565-8b45-862d-bcb45a1ae197	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-8b45-7d4b-b5353d0788a4	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-8b45-bb2e-479dbb2741d5	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-8b45-2505-512af22831d1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-8b45-3037-d0452c6cf0e2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5236075)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-8b45-3134-f3d996f03b55	00030000-5565-8b44-6d8b-f544132e5729
00020000-5565-8b45-1394-8ae8233c25af	00030000-5565-8b44-6325-1d32a03800c8
00020000-5565-8b45-1394-8ae8233c25af	00030000-5565-8b44-6d8b-f544132e5729
\.


--
-- TOC entry 2727 (class 0 OID 5236364)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5236395)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5236528)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5236133)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-8b45-001a-6445ea38fa2d	00040000-5565-8b44-4151-4742fb26393b	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-8b45-6852-931468d1d478	00040000-5565-8b44-4151-4742fb26393b	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5236168)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-8b44-d9bd-bf4e54dd9ce5	8341	Adlešiči
00050000-5565-8b44-2ba5-0a7efe0d951d	5270	Ajdovščina
00050000-5565-8b44-e133-f0be43a76fa1	6280	Ankaran/Ancarano
00050000-5565-8b44-968b-89efa8937742	9253	Apače
00050000-5565-8b44-b073-0dd5e91bf6e3	8253	Artiče
00050000-5565-8b44-9647-d2eb0493a758	4275	Begunje na Gorenjskem
00050000-5565-8b44-ec7a-284c168e8303	1382	Begunje pri Cerknici
00050000-5565-8b44-9201-06db95044a16	9231	Beltinci
00050000-5565-8b44-f3db-0bc6b2337d1a	2234	Benedikt
00050000-5565-8b44-dcfb-b2c3e7e6a1b2	2345	Bistrica ob Dravi
00050000-5565-8b44-655a-aae514bc8b1f	3256	Bistrica ob Sotli
00050000-5565-8b44-a643-d1d51c826080	8259	Bizeljsko
00050000-5565-8b44-f3e1-570c0c342c98	1223	Blagovica
00050000-5565-8b44-5e2f-737dc4530c8e	8283	Blanca
00050000-5565-8b44-7258-d83793a37549	4260	Bled
00050000-5565-8b44-86cd-02bac52b14a5	4273	Blejska Dobrava
00050000-5565-8b44-ef71-5fd532accc16	9265	Bodonci
00050000-5565-8b44-5405-94693f2c754b	9222	Bogojina
00050000-5565-8b44-a2a0-8a39ee28bc0e	4263	Bohinjska Bela
00050000-5565-8b44-f785-2426a0f85751	4264	Bohinjska Bistrica
00050000-5565-8b44-e429-95fc10ffab42	4265	Bohinjsko jezero
00050000-5565-8b44-1d01-f1e4b9eb4034	1353	Borovnica
00050000-5565-8b44-73f7-248ddda57cbd	8294	Boštanj
00050000-5565-8b44-a58e-d916ee755e31	5230	Bovec
00050000-5565-8b44-a877-dd02478cefde	5295	Branik
00050000-5565-8b44-d5ec-7aa5dc59f3fa	3314	Braslovče
00050000-5565-8b44-087f-8ad59709c8c8	5223	Breginj
00050000-5565-8b44-430f-f5cffaee7cfe	8280	Brestanica
00050000-5565-8b44-44c9-1bd7e2558399	2354	Bresternica
00050000-5565-8b44-7a28-7d1b34aad7bc	4243	Brezje
00050000-5565-8b44-e9aa-0bb3732819b4	1351	Brezovica pri Ljubljani
00050000-5565-8b44-d17a-ff299eef186f	8250	Brežice
00050000-5565-8b44-41e8-fe1eef9ab563	4210	Brnik - Aerodrom
00050000-5565-8b44-eb08-4a4f171ecc90	8321	Brusnice
00050000-5565-8b44-2fd0-6713498a851f	3255	Buče
00050000-5565-8b44-8a56-baf80a52c123	8276	Bučka 
00050000-5565-8b44-2f40-f4674680adb2	9261	Cankova
00050000-5565-8b44-1882-344dfbf5fb2f	3000	Celje 
00050000-5565-8b44-040b-e80335e97074	3001	Celje - poštni predali
00050000-5565-8b44-b26b-593367a70f47	4207	Cerklje na Gorenjskem
00050000-5565-8b44-3226-98b913dc7d72	8263	Cerklje ob Krki
00050000-5565-8b44-88a0-5838d45aeaf4	1380	Cerknica
00050000-5565-8b44-135d-43a939335775	5282	Cerkno
00050000-5565-8b44-0186-8214ee347964	2236	Cerkvenjak
00050000-5565-8b44-d723-b2ce85bab2df	2215	Ceršak
00050000-5565-8b44-987e-b7fbe2b2e185	2326	Cirkovce
00050000-5565-8b44-f970-1a2bbbe802dd	2282	Cirkulane
00050000-5565-8b44-dd1c-b5acf11729aa	5273	Col
00050000-5565-8b44-1f04-012ad2694e2e	8251	Čatež ob Savi
00050000-5565-8b44-a2a6-663048163004	1413	Čemšenik
00050000-5565-8b44-5310-c920b4f43742	5253	Čepovan
00050000-5565-8b44-f443-f4ef238fc253	9232	Črenšovci
00050000-5565-8b44-4da7-cb89952fff51	2393	Črna na Koroškem
00050000-5565-8b44-c3df-5ad3d9190717	6275	Črni Kal
00050000-5565-8b44-1b15-cbacead24cf2	5274	Črni Vrh nad Idrijo
00050000-5565-8b44-51f3-c521ea5f8935	5262	Črniče
00050000-5565-8b44-cf31-909a716eaedf	8340	Črnomelj
00050000-5565-8b44-2358-1185ff1f4256	6271	Dekani
00050000-5565-8b44-4ac6-439a8e16759a	5210	Deskle
00050000-5565-8b44-71d9-fb02eae0b59e	2253	Destrnik
00050000-5565-8b44-046e-1a240f04cabd	6215	Divača
00050000-5565-8b44-110a-8ed25ee12190	1233	Dob
00050000-5565-8b44-c385-953e13cd2f7d	3224	Dobje pri Planini
00050000-5565-8b44-8201-67bdb5e26e6b	8257	Dobova
00050000-5565-8b44-eb75-e40a3817b5ea	1423	Dobovec
00050000-5565-8b44-6b32-ad90aa99dbd6	5263	Dobravlje
00050000-5565-8b44-7ed3-b2eac648cb23	3204	Dobrna
00050000-5565-8b44-3321-20c79c3cb8ba	8211	Dobrnič
00050000-5565-8b44-1c52-f4b244372de8	1356	Dobrova
00050000-5565-8b44-2396-75b2a723c0c3	9223	Dobrovnik/Dobronak 
00050000-5565-8b44-60e8-6c3a1dc0c2f6	5212	Dobrovo v Brdih
00050000-5565-8b44-13d0-a9cc03e08cbe	1431	Dol pri Hrastniku
00050000-5565-8b44-7306-d3e1a2e42814	1262	Dol pri Ljubljani
00050000-5565-8b44-39db-a42ec70e3580	1273	Dole pri Litiji
00050000-5565-8b44-c90d-df45c5043ba9	1331	Dolenja vas
00050000-5565-8b44-3d99-a19fc94c4b9c	8350	Dolenjske Toplice
00050000-5565-8b44-5ae9-7eaca8c43d70	1230	Domžale
00050000-5565-8b44-f65e-a2568e6db81a	2252	Dornava
00050000-5565-8b44-7df6-93baf48de664	5294	Dornberk
00050000-5565-8b44-df35-5941b2807af2	1319	Draga
00050000-5565-8b44-3f65-03f11a049d73	8343	Dragatuš
00050000-5565-8b44-3f73-aac36334de38	3222	Dramlje
00050000-5565-8b44-b827-675b16d09db0	2370	Dravograd
00050000-5565-8b44-50ea-90d90106fa45	4203	Duplje
00050000-5565-8b44-ef91-f347f1c25825	6221	Dutovlje
00050000-5565-8b44-3cfe-a2f853d5ff3e	8361	Dvor
00050000-5565-8b44-cbad-fa3be1b8fd00	2343	Fala
00050000-5565-8b44-898d-a10777293145	9208	Fokovci
00050000-5565-8b44-8b3d-4155faa74015	2313	Fram
00050000-5565-8b44-3af6-65205e6637ce	3213	Frankolovo
00050000-5565-8b44-4993-031d8978c8fc	1274	Gabrovka
00050000-5565-8b44-6eec-707bc21e26f0	8254	Globoko
00050000-5565-8b44-4bef-04afdb7f6a61	5275	Godovič
00050000-5565-8b44-aa90-98c72aba7217	4204	Golnik
00050000-5565-8b44-8540-f43d483c5095	3303	Gomilsko
00050000-5565-8b44-189f-94da8144b8dd	4224	Gorenja vas
00050000-5565-8b44-c650-56649007b10c	3263	Gorica pri Slivnici
00050000-5565-8b44-b1f2-86c9ee280810	2272	Gorišnica
00050000-5565-8b44-aac0-e29eaf721b3a	9250	Gornja Radgona
00050000-5565-8b44-a0a9-8d3a20f48f7a	3342	Gornji Grad
00050000-5565-8b44-eca0-a66ac323cfbc	4282	Gozd Martuljek
00050000-5565-8b44-a982-c7f1e4138b3f	6272	Gračišče
00050000-5565-8b44-5b0d-abe707f9f556	9264	Grad
00050000-5565-8b44-528c-9f0b9c343be6	8332	Gradac
00050000-5565-8b44-59d0-8369654aeabb	1384	Grahovo
00050000-5565-8b44-d3fc-527bfcbd8ca9	5242	Grahovo ob Bači
00050000-5565-8b44-28fd-ad8aee86ee9d	5251	Grgar
00050000-5565-8b44-a60a-a3aec4a2d03d	3302	Griže
00050000-5565-8b44-e965-4bd153723761	3231	Grobelno
00050000-5565-8b44-9463-f65d78cee588	1290	Grosuplje
00050000-5565-8b44-cb4f-2d7ab1390f0c	2288	Hajdina
00050000-5565-8b44-56d8-6e4c1e5e4d8a	8362	Hinje
00050000-5565-8b44-10f0-287f3be9ac03	2311	Hoče
00050000-5565-8b44-f147-540559468b0a	9205	Hodoš/Hodos
00050000-5565-8b44-a05f-ce117245005f	1354	Horjul
00050000-5565-8b44-3909-8061d50001b6	1372	Hotedršica
00050000-5565-8b44-04cd-5f972e705bcc	1430	Hrastnik
00050000-5565-8b44-d1a0-a5af8f350635	6225	Hruševje
00050000-5565-8b44-7a74-d71170f0f607	4276	Hrušica
00050000-5565-8b44-d95b-169cc763a3c5	5280	Idrija
00050000-5565-8b44-8cc9-51878046d0a5	1292	Ig
00050000-5565-8b44-1daa-f4b72577466d	6250	Ilirska Bistrica
00050000-5565-8b44-4e48-529a5421f164	6251	Ilirska Bistrica-Trnovo
00050000-5565-8b44-8786-635bf3fdef52	1295	Ivančna Gorica
00050000-5565-8b44-44f7-9c6c4c6f140e	2259	Ivanjkovci
00050000-5565-8b44-e50e-861288eb2fc9	1411	Izlake
00050000-5565-8b44-fbcc-43d351f7c12d	6310	Izola/Isola
00050000-5565-8b44-4fb3-76779be7be8c	2222	Jakobski Dol
00050000-5565-8b44-0eaf-548f73d599e2	2221	Jarenina
00050000-5565-8b44-7503-ea4377a428d8	6254	Jelšane
00050000-5565-8b44-d051-a6525cd5cf4a	4270	Jesenice
00050000-5565-8b44-7ff4-a831b5859916	8261	Jesenice na Dolenjskem
00050000-5565-8b44-5d2c-6bcec2a6a1f4	3273	Jurklošter
00050000-5565-8b44-d128-c46f07952e6d	2223	Jurovski Dol
00050000-5565-8b44-d7bd-74b43d9fcee2	2256	Juršinci
00050000-5565-8b44-3911-2423e8994df4	5214	Kal nad Kanalom
00050000-5565-8b44-ca78-dee5486ac390	3233	Kalobje
00050000-5565-8b44-8e3d-bd1902c6b02e	4246	Kamna Gorica
00050000-5565-8b44-83c2-1d4c7391a16d	2351	Kamnica
00050000-5565-8b44-4cd2-8dcb1b087049	1241	Kamnik
00050000-5565-8b44-93ed-cad53980f1a2	5213	Kanal
00050000-5565-8b44-76bf-8c893e9d3851	8258	Kapele
00050000-5565-8b44-5f8a-0ee2adc4315f	2362	Kapla
00050000-5565-8b44-b40a-635f2bea7fc1	2325	Kidričevo
00050000-5565-8b44-f5ae-668d1bff345f	1412	Kisovec
00050000-5565-8b44-5ef9-146fee2fc107	6253	Knežak
00050000-5565-8b44-1096-52393a81664b	5222	Kobarid
00050000-5565-8b44-5c23-6395263e0081	9227	Kobilje
00050000-5565-8b44-5dc0-7af18ae5b7dd	1330	Kočevje
00050000-5565-8b44-a351-92aad272e092	1338	Kočevska Reka
00050000-5565-8b44-1fe5-a50134ac460a	2276	Kog
00050000-5565-8b44-d63e-fe5ba27a8260	5211	Kojsko
00050000-5565-8b44-c92a-97ace0851bc8	6223	Komen
00050000-5565-8b44-42dd-fc9923bc9ea1	1218	Komenda
00050000-5565-8b44-b872-3c15861f17e7	6000	Koper/Capodistria 
00050000-5565-8b44-7243-70f408a9496b	6001	Koper/Capodistria - poštni predali
00050000-5565-8b44-4b25-e6521bef5180	8282	Koprivnica
00050000-5565-8b44-273d-09af2f2bb38c	5296	Kostanjevica na Krasu
00050000-5565-8b44-baf9-4ab437c33542	8311	Kostanjevica na Krki
00050000-5565-8b44-fda5-b91a7e92fff1	1336	Kostel
00050000-5565-8b44-60de-4253ce3c0cdf	6256	Košana
00050000-5565-8b44-a9a7-a92585976545	2394	Kotlje
00050000-5565-8b44-cb17-b61d522780bc	6240	Kozina
00050000-5565-8b44-c390-a1806aefa352	3260	Kozje
00050000-5565-8b44-8d44-83930ac57d72	4000	Kranj 
00050000-5565-8b44-86a4-0da2601e8955	4001	Kranj - poštni predali
00050000-5565-8b44-df84-4b6428eab99a	4280	Kranjska Gora
00050000-5565-8b44-d5d5-7c6993cafecf	1281	Kresnice
00050000-5565-8b44-ee2b-ec43a88c6ef3	4294	Križe
00050000-5565-8b44-f2ec-6e928cbba0a3	9206	Križevci
00050000-5565-8b44-c6ce-c7d1c3e3092c	9242	Križevci pri Ljutomeru
00050000-5565-8b44-045d-22e02a11e9e9	1301	Krka
00050000-5565-8b44-9a5b-739f4e95696b	8296	Krmelj
00050000-5565-8b44-8f60-c6016b2dbc30	4245	Kropa
00050000-5565-8b44-7c4d-9f75910d46f9	8262	Krška vas
00050000-5565-8b44-5363-4131abfec73a	8270	Krško
00050000-5565-8b44-85bb-8c88c1dc5e16	9263	Kuzma
00050000-5565-8b44-6290-35052c385cf6	2318	Laporje
00050000-5565-8b44-07f0-7eb19211a5ea	3270	Laško
00050000-5565-8b44-f3a9-44cd7d211078	1219	Laze v Tuhinju
00050000-5565-8b44-4f44-94700199d781	2230	Lenart v Slovenskih goricah
00050000-5565-8b44-878b-da017144b5ae	9220	Lendava/Lendva
00050000-5565-8b44-3790-bc37382b1ce7	4248	Lesce
00050000-5565-8b44-5560-5609c02261e2	3261	Lesično
00050000-5565-8b44-1cde-d134826a10a6	8273	Leskovec pri Krškem
00050000-5565-8b44-4123-067845686a97	2372	Libeliče
00050000-5565-8b44-5b67-466d1ce64ed6	2341	Limbuš
00050000-5565-8b44-ba7c-9fee0c04663b	1270	Litija
00050000-5565-8b44-b931-048dfbd2a247	3202	Ljubečna
00050000-5565-8b44-9bf0-04afbdfa9f96	1000	Ljubljana 
00050000-5565-8b44-0439-2508fcd3a01d	1001	Ljubljana - poštni predali
00050000-5565-8b44-b726-97121dc90422	1231	Ljubljana - Črnuče
00050000-5565-8b44-6a42-a932b2ac30c3	1261	Ljubljana - Dobrunje
00050000-5565-8b44-3d9f-1635add3c041	1260	Ljubljana - Polje
00050000-5565-8b44-41b6-4ce86554e6c5	1210	Ljubljana - Šentvid
00050000-5565-8b44-a435-d3ee785a749f	1211	Ljubljana - Šmartno
00050000-5565-8b44-9ef7-71626ef4925a	3333	Ljubno ob Savinji
00050000-5565-8b44-8f6a-ccc57ce41abc	9240	Ljutomer
00050000-5565-8b44-0c13-794202e92644	3215	Loče
00050000-5565-8b44-c4cc-0b4dc16c06b2	5231	Log pod Mangartom
00050000-5565-8b44-164c-ae0d5dd8c705	1358	Log pri Brezovici
00050000-5565-8b44-7195-9b617364d222	1370	Logatec
00050000-5565-8b44-66a3-74dd993ab69b	1371	Logatec
00050000-5565-8b44-e8a8-e146b68f6c7b	1434	Loka pri Zidanem Mostu
00050000-5565-8b44-ccdb-71508f4f6dc2	3223	Loka pri Žusmu
00050000-5565-8b44-85ee-30fc63fa48a8	6219	Lokev
00050000-5565-8b44-e9f5-1aec42a33678	1318	Loški Potok
00050000-5565-8b44-479e-dfdd4e2ebb8c	2324	Lovrenc na Dravskem polju
00050000-5565-8b44-7ac5-00291704c98c	2344	Lovrenc na Pohorju
00050000-5565-8b44-0220-eba3797a2f5c	3334	Luče
00050000-5565-8b44-e21d-35a640ed572e	1225	Lukovica
00050000-5565-8b44-7b39-736e9cd1e921	9202	Mačkovci
00050000-5565-8b44-efaa-071b897f16f6	2322	Majšperk
00050000-5565-8b44-c90d-f836b3b8f143	2321	Makole
00050000-5565-8b44-2718-9954ad0b04be	9243	Mala Nedelja
00050000-5565-8b44-2787-89c3f1087089	2229	Malečnik
00050000-5565-8b44-0bc7-c4f8f14e2404	6273	Marezige
00050000-5565-8b44-60ef-4083c18d7f4e	2000	Maribor 
00050000-5565-8b44-740b-508e958590c6	2001	Maribor - poštni predali
00050000-5565-8b44-2df9-191e0a7a32d9	2206	Marjeta na Dravskem polju
00050000-5565-8b44-e83a-d82b723c689b	2281	Markovci
00050000-5565-8b44-d345-206b01ecf32a	9221	Martjanci
00050000-5565-8b44-550e-05defe1ede92	6242	Materija
00050000-5565-8b44-11a5-ca7ca626407d	4211	Mavčiče
00050000-5565-8b44-0543-8d81fa85c08d	1215	Medvode
00050000-5565-8b44-5951-b5670bdbc91c	1234	Mengeš
00050000-5565-8b44-3101-f99bc36d73e3	8330	Metlika
00050000-5565-8b44-a1a7-27e0a0375c83	2392	Mežica
00050000-5565-8b44-1612-56c4009d86c3	2204	Miklavž na Dravskem polju
00050000-5565-8b44-0739-e96072ba6bd6	2275	Miklavž pri Ormožu
00050000-5565-8b44-746c-a47925c5f7ec	5291	Miren
00050000-5565-8b44-8f24-06855182a76e	8233	Mirna
00050000-5565-8b44-30c4-74091a1e4279	8216	Mirna Peč
00050000-5565-8b44-ccf7-495f4bcbeb91	2382	Mislinja
00050000-5565-8b44-542a-aff0c5e861bf	4281	Mojstrana
00050000-5565-8b44-d7c9-e63d6687c2f3	8230	Mokronog
00050000-5565-8b44-bc81-80f3b81c1904	1251	Moravče
00050000-5565-8b44-86a6-e4435a1763d8	9226	Moravske Toplice
00050000-5565-8b44-f859-7f31e8b00472	5216	Most na Soči
00050000-5565-8b44-ad98-cd981337df40	1221	Motnik
00050000-5565-8b44-2f40-92a632e2cecd	3330	Mozirje
00050000-5565-8b44-c7fb-dfacd18b2031	9000	Murska Sobota 
00050000-5565-8b44-fae6-d6b7f7b9adb9	9001	Murska Sobota - poštni predali
00050000-5565-8b44-5adb-9f5e08215363	2366	Muta
00050000-5565-8b44-df26-fe7cd3de853d	4202	Naklo
00050000-5565-8b44-1df8-76baa0d8a8f8	3331	Nazarje
00050000-5565-8b44-46f6-3ca1d58a0efc	1357	Notranje Gorice
00050000-5565-8b44-00f9-c2fe96a6c76d	3203	Nova Cerkev
00050000-5565-8b44-fe49-ead9117c4ba7	5000	Nova Gorica 
00050000-5565-8b44-0db9-375224fa8e00	5001	Nova Gorica - poštni predali
00050000-5565-8b44-3f1f-d771113910f8	1385	Nova vas
00050000-5565-8b44-3de0-474c1f0955a3	8000	Novo mesto
00050000-5565-8b44-650f-64981fd3ad08	8001	Novo mesto - poštni predali
00050000-5565-8b44-4c90-5e879dd175d4	6243	Obrov
00050000-5565-8b44-aad0-cf4728560801	9233	Odranci
00050000-5565-8b44-4559-4a3bdb1add69	2317	Oplotnica
00050000-5565-8b44-28ca-d75e7eead22d	2312	Orehova vas
00050000-5565-8b44-5f1b-6a532095bb7b	2270	Ormož
00050000-5565-8b44-4202-649743656b41	1316	Ortnek
00050000-5565-8b44-9924-b43c0b76a406	1337	Osilnica
00050000-5565-8b44-8d80-66c8ebdee436	8222	Otočec
00050000-5565-8b44-7868-75f41af21a2e	2361	Ožbalt
00050000-5565-8b44-9965-8d766d8edbed	2231	Pernica
00050000-5565-8b44-0caa-c7b1b2b1b491	2211	Pesnica pri Mariboru
00050000-5565-8b44-63e0-f598bbc5a629	9203	Petrovci
00050000-5565-8b44-3f3c-afd9b9e9f3fd	3301	Petrovče
00050000-5565-8b44-3220-a8693eac3d9d	6330	Piran/Pirano
00050000-5565-8b44-3d98-667ae362aebe	8255	Pišece
00050000-5565-8b44-9890-769e4d77b6ee	6257	Pivka
00050000-5565-8b44-9ee2-b3dc05e81fad	6232	Planina
00050000-5565-8b44-fbea-5c48fcccc05a	3225	Planina pri Sevnici
00050000-5565-8b44-ac59-d9f68c3c25e9	6276	Pobegi
00050000-5565-8b44-15f4-f1fa69fafc4f	8312	Podbočje
00050000-5565-8b44-2d1e-be5a9173d0d2	5243	Podbrdo
00050000-5565-8b44-c5e9-460af44b653a	3254	Podčetrtek
00050000-5565-8b44-5812-211815ae9491	2273	Podgorci
00050000-5565-8b44-1ca2-6389cd90d5fd	6216	Podgorje
00050000-5565-8b44-4548-9c103c279568	2381	Podgorje pri Slovenj Gradcu
00050000-5565-8b44-0aa4-bfe09c1fa494	6244	Podgrad
00050000-5565-8b44-7541-213fbbd40fd8	1414	Podkum
00050000-5565-8b44-71ba-1f3b3ecd838e	2286	Podlehnik
00050000-5565-8b44-a83f-87ef17ae2b08	5272	Podnanos
00050000-5565-8b44-65af-fbb531d1533d	4244	Podnart
00050000-5565-8b44-7d59-bcb7274fb411	3241	Podplat
00050000-5565-8b44-cc61-428a7549766a	3257	Podsreda
00050000-5565-8b44-716c-a34205f4b676	2363	Podvelka
00050000-5565-8b44-c4ed-8e2761843d1f	2208	Pohorje
00050000-5565-8b44-2138-aa1d7e800845	2257	Polenšak
00050000-5565-8b44-9edc-8f675dde96f0	1355	Polhov Gradec
00050000-5565-8b44-ab8c-81657ee76c98	4223	Poljane nad Škofjo Loko
00050000-5565-8b44-1008-0fcf9465b98a	2319	Poljčane
00050000-5565-8b44-79fc-70d4a47ad64b	1272	Polšnik
00050000-5565-8b44-1ad4-8b7f48da49a0	3313	Polzela
00050000-5565-8b44-f2cb-d5760f5e1f7b	3232	Ponikva
00050000-5565-8b44-20c6-bc46c7293e96	6320	Portorož/Portorose
00050000-5565-8b44-6aa2-156a25096743	6230	Postojna
00050000-5565-8b44-1815-e26c1218fc07	2331	Pragersko
00050000-5565-8b44-cb02-3cb74d20121f	3312	Prebold
00050000-5565-8b44-6435-8cf5652d1003	4205	Preddvor
00050000-5565-8b44-d423-d5a20f5ba8bc	6255	Prem
00050000-5565-8b44-6ed9-5758cb04936c	1352	Preserje
00050000-5565-8b44-ff76-eba9ade9c100	6258	Prestranek
00050000-5565-8b44-8673-a0dba2d3b66f	2391	Prevalje
00050000-5565-8b44-4e6a-31385efbcfae	3262	Prevorje
00050000-5565-8b44-6840-f04062891231	1276	Primskovo 
00050000-5565-8b44-1b6d-775e842c5e9f	3253	Pristava pri Mestinju
00050000-5565-8b44-01e7-b189bc5526b1	9207	Prosenjakovci/Partosfalva
00050000-5565-8b44-4e69-aa1ca25586aa	5297	Prvačina
00050000-5565-8b44-c98b-97c95692018c	2250	Ptuj
00050000-5565-8b44-a7ef-22b884bb0867	2323	Ptujska Gora
00050000-5565-8b44-f79e-a4b52e1f857b	9201	Puconci
00050000-5565-8b44-d843-7b36cfddec50	2327	Rače
00050000-5565-8b44-53cb-1c130e2ddd8b	1433	Radeče
00050000-5565-8b44-0274-2d2c7f01cf36	9252	Radenci
00050000-5565-8b44-fc5e-a5527ae22e20	2360	Radlje ob Dravi
00050000-5565-8b44-2f86-14549be0aae3	1235	Radomlje
00050000-5565-8b44-033f-038520df25c1	4240	Radovljica
00050000-5565-8b44-06cb-5511d88f4bd5	8274	Raka
00050000-5565-8b44-ab6e-40342db73e4c	1381	Rakek
00050000-5565-8b44-6921-5693121d043e	4283	Rateče - Planica
00050000-5565-8b44-0ec3-9892fe6d8497	2390	Ravne na Koroškem
00050000-5565-8b44-9f7a-a8bb9b353c47	9246	Razkrižje
00050000-5565-8b44-e910-c67324f6daa0	3332	Rečica ob Savinji
00050000-5565-8b44-1c5f-5ec1b91a728f	5292	Renče
00050000-5565-8b44-d48d-423d5f56f8e9	1310	Ribnica
00050000-5565-8b44-e383-7dacc10b455a	2364	Ribnica na Pohorju
00050000-5565-8b44-0a72-8efcfbec189f	3272	Rimske Toplice
00050000-5565-8b44-7038-77645cd06e33	1314	Rob
00050000-5565-8b44-734e-df41893a1430	5215	Ročinj
00050000-5565-8b44-b5bd-0e214b527f4a	3250	Rogaška Slatina
00050000-5565-8b44-45fa-c803ece47118	9262	Rogašovci
00050000-5565-8b44-c65d-70d0f2d027a6	3252	Rogatec
00050000-5565-8b44-ec51-d2f1eb5dc430	1373	Rovte
00050000-5565-8b44-855f-698455596fdd	2342	Ruše
00050000-5565-8b44-1ac6-1b227b017af1	1282	Sava
00050000-5565-8b44-8de6-ef79f035adcb	6333	Sečovlje/Sicciole
00050000-5565-8b44-bfba-fca19a720b8c	4227	Selca
00050000-5565-8b44-cfba-b586d6e885b4	2352	Selnica ob Dravi
00050000-5565-8b44-c949-d78fbefc2f41	8333	Semič
00050000-5565-8b44-075e-2452d3cac32a	8281	Senovo
00050000-5565-8b44-f9a3-fb9d945f9636	6224	Senožeče
00050000-5565-8b44-fb73-accf24cc5db3	8290	Sevnica
00050000-5565-8b44-dd15-c58d159e7c31	6210	Sežana
00050000-5565-8b44-8278-21e486ea6649	2214	Sladki Vrh
00050000-5565-8b44-f53b-1922d6acf429	5283	Slap ob Idrijci
00050000-5565-8b44-9108-b3ecc2b22059	2380	Slovenj Gradec
00050000-5565-8b44-d429-bd8056cee074	2310	Slovenska Bistrica
00050000-5565-8b44-1827-c50db71d82b5	3210	Slovenske Konjice
00050000-5565-8b44-70a7-0c7a991f4a3c	1216	Smlednik
00050000-5565-8b44-8f29-45443da0af1b	5232	Soča
00050000-5565-8b44-6756-3db252ff7cf2	1317	Sodražica
00050000-5565-8b44-c41b-6b6d0921c521	3335	Solčava
00050000-5565-8b44-7366-ead426ec2b7f	5250	Solkan
00050000-5565-8b44-8ced-fcd3b2579dd4	4229	Sorica
00050000-5565-8b44-894f-f73bf6bfcea4	4225	Sovodenj
00050000-5565-8b44-04d7-02a097966bfa	5281	Spodnja Idrija
00050000-5565-8b44-1e08-5054672d9d82	2241	Spodnji Duplek
00050000-5565-8b44-afb8-33514f92cc77	9245	Spodnji Ivanjci
00050000-5565-8b44-dc31-fb6c826a2429	2277	Središče ob Dravi
00050000-5565-8b44-814d-da8d059c1255	4267	Srednja vas v Bohinju
00050000-5565-8b44-e580-8dd466e2a229	8256	Sromlje 
00050000-5565-8b44-0876-a036c25cadd7	5224	Srpenica
00050000-5565-8b44-1d58-7e9a97ddfe9e	1242	Stahovica
00050000-5565-8b44-03cf-4b87e0497b0b	1332	Stara Cerkev
00050000-5565-8b44-59a5-802feb088af4	8342	Stari trg ob Kolpi
00050000-5565-8b44-a35f-dcfc37002c40	1386	Stari trg pri Ložu
00050000-5565-8b44-55d2-c90955c03ccc	2205	Starše
00050000-5565-8b44-b828-4a21d7851579	2289	Stoperce
00050000-5565-8b44-1fa3-591b4a51799e	8322	Stopiče
00050000-5565-8b44-4fa3-cde419c355f4	3206	Stranice
00050000-5565-8b44-ea02-1f275d8402d8	8351	Straža
00050000-5565-8b44-2eba-fb0e7f9c63f1	1313	Struge
00050000-5565-8b44-0c9d-5fa32a6e86b2	8293	Studenec
00050000-5565-8b44-599e-ce6ed7383704	8331	Suhor
00050000-5565-8b44-b64f-38756e081e14	2233	Sv. Ana v Slovenskih goricah
00050000-5565-8b44-8dc8-a9b3af5fb3de	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-8b44-cc98-d6868720a34b	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-8b44-e480-3beed17d41a1	9244	Sveti Jurij ob Ščavnici
00050000-5565-8b44-e5d1-940f1a417514	3264	Sveti Štefan
00050000-5565-8b44-0050-bb5a9fb759d4	2258	Sveti Tomaž
00050000-5565-8b44-53fa-577ed256d78a	9204	Šalovci
00050000-5565-8b44-d4de-762255367afb	5261	Šempas
00050000-5565-8b44-2832-e9d8a3f46503	5290	Šempeter pri Gorici
00050000-5565-8b44-0d7c-d1788206d61e	3311	Šempeter v Savinjski dolini
00050000-5565-8b44-c707-d364e39b9450	4208	Šenčur
00050000-5565-8b44-3f3e-0450e9834559	2212	Šentilj v Slovenskih goricah
00050000-5565-8b44-0106-285cdd8be55e	8297	Šentjanž
00050000-5565-8b44-4c07-9dc5bd3b6f66	2373	Šentjanž pri Dravogradu
00050000-5565-8b44-b5b2-cb7f2a2a72c8	8310	Šentjernej
00050000-5565-8b44-3b5c-fadb6129a991	3230	Šentjur
00050000-5565-8b44-fd20-19df436356e8	3271	Šentrupert
00050000-5565-8b44-83ad-f0b759f70a03	8232	Šentrupert
00050000-5565-8b44-1cb1-64d6582cdc3f	1296	Šentvid pri Stični
00050000-5565-8b44-7f0b-587085e8fd42	8275	Škocjan
00050000-5565-8b44-1a2f-1ff4c10ce9bf	6281	Škofije
00050000-5565-8b44-7d11-af10c250a19e	4220	Škofja Loka
00050000-5565-8b44-e201-6f2d29a43655	3211	Škofja vas
00050000-5565-8b44-0ab0-b72c9dab023f	1291	Škofljica
00050000-5565-8b44-75d5-d80c55052ea7	6274	Šmarje
00050000-5565-8b44-bbb3-11434663547f	1293	Šmarje - Sap
00050000-5565-8b44-d79e-8af3c02886bb	3240	Šmarje pri Jelšah
00050000-5565-8b44-8133-fb7a248002d2	8220	Šmarješke Toplice
00050000-5565-8b44-d0ca-047586434807	2315	Šmartno na Pohorju
00050000-5565-8b44-5236-df48c91ab926	3341	Šmartno ob Dreti
00050000-5565-8b44-a304-50016aaab4bb	3327	Šmartno ob Paki
00050000-5565-8b44-ead1-a01fd06a9944	1275	Šmartno pri Litiji
00050000-5565-8b44-bbd6-d19e6adba3f8	2383	Šmartno pri Slovenj Gradcu
00050000-5565-8b44-5725-43d3985a3516	3201	Šmartno v Rožni dolini
00050000-5565-8b44-5d16-6ce765a46951	3325	Šoštanj
00050000-5565-8b44-515d-8b15951cba85	6222	Štanjel
00050000-5565-8b44-3329-53766c155409	3220	Štore
00050000-5565-8b44-7f99-19ee3afb4b06	3304	Tabor
00050000-5565-8b44-e9f6-bc79fa0b3d7a	3221	Teharje
00050000-5565-8b44-9032-297718121950	9251	Tišina
00050000-5565-8b44-ef8b-23dc6a777926	5220	Tolmin
00050000-5565-8b44-0359-741e3d2c8c02	3326	Topolšica
00050000-5565-8b44-95e6-5e81e6d0aaa5	2371	Trbonje
00050000-5565-8b44-b4bd-390fa74dd2de	1420	Trbovlje
00050000-5565-8b44-28a4-d1a4b349d12a	8231	Trebelno 
00050000-5565-8b44-47a5-49deaec5a895	8210	Trebnje
00050000-5565-8b44-a991-9b93a65f137b	5252	Trnovo pri Gorici
00050000-5565-8b44-b6a2-eb89b1b533df	2254	Trnovska vas
00050000-5565-8b44-1325-7742bd7e1f94	1222	Trojane
00050000-5565-8b44-0bcd-0f01d2710a35	1236	Trzin
00050000-5565-8b44-f0b5-cbf4299af877	4290	Tržič
00050000-5565-8b44-9fd5-689dd4fdee15	8295	Tržišče
00050000-5565-8b44-b001-7be2cbb5fa6a	1311	Turjak
00050000-5565-8b44-a713-374c25c2fde1	9224	Turnišče
00050000-5565-8b44-91ef-9d29737543ad	8323	Uršna sela
00050000-5565-8b44-4b05-ea26d6664641	1252	Vače
00050000-5565-8b44-f50e-7f8f334688a0	3320	Velenje 
00050000-5565-8b44-f8a9-b71c1b461353	3322	Velenje - poštni predali
00050000-5565-8b44-8dda-fa83023bc9f1	8212	Velika Loka
00050000-5565-8b44-1ede-0130df2d4261	2274	Velika Nedelja
00050000-5565-8b44-2cc6-3f9aca35be03	9225	Velika Polana
00050000-5565-8b44-fa01-6009d9fe67d0	1315	Velike Lašče
00050000-5565-8b44-dd83-3a8ca3f9da68	8213	Veliki Gaber
00050000-5565-8b44-c0a5-e886f7b7b841	9241	Veržej
00050000-5565-8b44-9482-34d557ce28b4	1312	Videm - Dobrepolje
00050000-5565-8b44-a9f3-e0e35164f22d	2284	Videm pri Ptuju
00050000-5565-8b44-b8ff-0ed71952ddc6	8344	Vinica
00050000-5565-8b44-d27b-8650b83f39b7	5271	Vipava
00050000-5565-8b44-1ffa-72ddf0a25857	4212	Visoko
00050000-5565-8b44-1010-10181f426f1e	1294	Višnja Gora
00050000-5565-8b44-b5bb-77426e02ed05	3205	Vitanje
00050000-5565-8b44-01d1-0aa3b5401621	2255	Vitomarci
00050000-5565-8b44-561b-f29c099aab3e	1217	Vodice
00050000-5565-8b44-4f53-65c137ffdae7	3212	Vojnik\t
00050000-5565-8b44-1884-ea708920cf28	5293	Volčja Draga
00050000-5565-8b44-52bb-f04c1e1347bb	2232	Voličina
00050000-5565-8b44-f860-1e98036a9503	3305	Vransko
00050000-5565-8b44-4703-68d5c2558a7a	6217	Vremski Britof
00050000-5565-8b44-bce4-d380f4232d4f	1360	Vrhnika
00050000-5565-8b44-6a87-0ecc54fb404d	2365	Vuhred
00050000-5565-8b44-6cba-064cec80d40e	2367	Vuzenica
00050000-5565-8b44-edcc-fa66de2aa0de	8292	Zabukovje 
00050000-5565-8b44-9418-17d6ac48ef59	1410	Zagorje ob Savi
00050000-5565-8b44-e79f-c1a71713b8cd	1303	Zagradec
00050000-5565-8b44-0ee2-98e940ed03f8	2283	Zavrč
00050000-5565-8b44-d009-698954aa3685	8272	Zdole 
00050000-5565-8b44-a978-3f9a8263b189	4201	Zgornja Besnica
00050000-5565-8b44-0193-fa7946eec2f5	2242	Zgornja Korena
00050000-5565-8b44-e964-176cc41f0350	2201	Zgornja Kungota
00050000-5565-8b44-a747-c4eaf292681f	2316	Zgornja Ložnica
00050000-5565-8b44-dede-4f590d40e204	2314	Zgornja Polskava
00050000-5565-8b44-20af-424676b69313	2213	Zgornja Velka
00050000-5565-8b44-956f-ae7e620401db	4247	Zgornje Gorje
00050000-5565-8b44-f35b-b70a33faac91	4206	Zgornje Jezersko
00050000-5565-8b44-dba6-a9e112408366	2285	Zgornji Leskovec
00050000-5565-8b44-8cff-bf27924dff8c	1432	Zidani Most
00050000-5565-8b44-cda9-c28b02f85c5d	3214	Zreče
00050000-5565-8b44-48c0-afe74cc55f8c	4209	Žabnica
00050000-5565-8b44-440f-f6e06b61b400	3310	Žalec
00050000-5565-8b44-e9a2-61ecd6a4537c	4228	Železniki
00050000-5565-8b44-bb75-d1e7aadd5b38	2287	Žetale
00050000-5565-8b44-060c-c71abd91fcde	4226	Žiri
00050000-5565-8b44-1fa9-cee7f50892dd	4274	Žirovnica
00050000-5565-8b44-b277-9ac7cea83a18	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5236338)
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
-- TOC entry 2705 (class 0 OID 5236153)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5236231)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5236350)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5236470)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5236521)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5236379)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-8b45-33ef-e2e35721a631	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-8b45-832f-6f2fb3d1f653	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-8b45-c4e6-4305c0b76534	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-8b45-dda5-0528429fb6f9	0004	Mali oder	t	24	Mali oder 
00220000-5565-8b45-2adb-7100e4206b09	0005	Komorni oder	t	15	Komorni oder
00220000-5565-8b45-ffb6-137609eb00c5	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-8b45-da77-a020315fea92	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5236323)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5236313)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5236510)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5236447)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5236027)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-8b45-3404-67218dfec989	00010000-5565-8b45-3a54-81ca5fa0e091	2015-05-27 11:15:50	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROdB88JRaFpL2WjJj1HFQ7xS0VSRP/V/e";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5236389)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5236065)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-8b45-f896-85814a4c84f6	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-8b45-9f6c-17d6fcc5c410	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-8b45-3134-f3d996f03b55	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-8b45-efbb-7ab831cf8dff	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-8b45-a71e-62bd063c5f79	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-8b45-1394-8ae8233c25af	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5236049)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-8b45-3404-67218dfec989	00020000-5565-8b45-efbb-7ab831cf8dff
00010000-5565-8b45-3a54-81ca5fa0e091	00020000-5565-8b45-efbb-7ab831cf8dff
\.


--
-- TOC entry 2732 (class 0 OID 5236403)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5236344)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5236294)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5236618)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-8b44-1732-663f02692ae2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-8b44-ce7c-d098c7ae385d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-8b44-b5fd-da1f25d0dc2d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-8b44-2dc1-a16019faf851	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-8b44-79b5-363e62a5edfd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5236611)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-8b44-f2d0-136382c9f4c0	00000000-5565-8b44-2dc1-a16019faf851	popa
00000000-5565-8b44-313c-48c74ba78e35	00000000-5565-8b44-2dc1-a16019faf851	oseba
00000000-5565-8b44-f40d-173f1f22d306	00000000-5565-8b44-ce7c-d098c7ae385d	prostor
00000000-5565-8b44-977b-bdcac8d4c86f	00000000-5565-8b44-2dc1-a16019faf851	besedilo
00000000-5565-8b44-502b-60a6a812ca2e	00000000-5565-8b44-2dc1-a16019faf851	uprizoritev
00000000-5565-8b44-07bd-32a7e7aea48e	00000000-5565-8b44-2dc1-a16019faf851	funkcija
00000000-5565-8b44-8ff4-9c77509d1f53	00000000-5565-8b44-2dc1-a16019faf851	tipfunkcije
00000000-5565-8b44-3794-45f1dd4d8c1d	00000000-5565-8b44-2dc1-a16019faf851	alternacija
\.


--
-- TOC entry 2748 (class 0 OID 5236606)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5236457)
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
-- TOC entry 2703 (class 0 OID 5236125)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5236300)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5236499)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-8b44-4e79-21d4209ce676	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-8b44-3586-e2e41e2afe56	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-8b44-d65c-6aed95b5550a	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-8b44-451a-7230426f73c2	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-8b44-dbb8-2d199aa56447	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-8b44-7557-c5f1ce7c1a3c	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-8b44-6671-0e194a7d1b83	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-8b44-3df6-9d3e7a38de91	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-8b44-08e4-ddecd1917174	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-8b44-9c02-b2a16dac6d51	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-8b44-0b7b-a7a6b90c541c	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-8b44-59eb-0416e25e16b5	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-8b44-c8d5-6ec59333450e	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-8b44-d564-0d55ed70a15b	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-8b44-34f9-1ded25758a04	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5236188)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5236036)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-8b45-3a54-81ca5fa0e091	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROYF9G7XaxCozk/qKIc78K2uEcjjGolrO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-8b45-fbfe-9f677b9e5215	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROu4MMbXd3.Sp6lhPyy7rWJt8IqmMYfGy	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-8b45-868a-460377c09227	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROx5ludf85ElW6zjIeB3JsMRWITRWDrnG	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-8b45-a3eb-809329bfe059	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROnWKpTsuxi4ZCY1zOSeQB5cFio18oMOm	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-8b45-a0ee-7a47a0a44ba2	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROQ7qg1SOcTzZndECjrHpCUapmvc.ZVea	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-8b45-4c45-9ff114392985	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROKIXf.nMLV3o1zVg5fLb/EeO6xLkd3Fq	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-8b45-2cdb-1ef8b4b1d54b	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROE0PqSOsybkJ3e4OQME4dj2j4IrnYg9u	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-8b45-6ebd-2dd23e6bc162	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROuHxRylOY53p4nkUl.YLjlN4XYe9AQ8m	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-8b45-79cd-60345b1af697	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROVA3bd4NS7q7n18M0UdCUnCN66J472cC	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-8b45-3a86-3f263d627c38	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxRO4dhZoE1qGORB55XVAerEZFSzdI3XPzm	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-8b45-bdc2-6749829e8500	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROHbUun.U9ZLYVvElmVVnqmClJLpBBMeC	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-8b45-3404-67218dfec989	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5236554)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-8b45-fc5f-21b9d1985966	00160000-5565-8b45-f434-115cdb5d72e4	00150000-5565-8b44-18a2-9f1c1b899cec	00140000-5565-8b44-81b2-beb11c75735c	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-8b45-2adb-7100e4206b09
000e0000-5565-8b45-6c3c-04f150ed5d46	00160000-5565-8b45-aea9-24f6b81f7c8a	00150000-5565-8b44-101a-d28c9b5c2fe8	00140000-5565-8b44-fda2-e7cc0577a860	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-8b45-ffb6-137609eb00c5
\.


--
-- TOC entry 2713 (class 0 OID 5236246)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5236371)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5236439)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5236278)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5236544)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-8b44-81b2-beb11c75735c	Drama	drama (SURS 01)
00140000-5565-8b44-be7a-74a4a5d6e2d3	Opera	opera (SURS 02)
00140000-5565-8b44-1f33-f491a66f0688	Balet	balet (SURS 03)
00140000-5565-8b44-3e2f-94639351cf31	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-8b44-4898-b2e1528955b2	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-8b44-fda2-e7cc0577a860	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-8b44-5e71-21cabb3123ce	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5236429)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-8b44-3a90-cbc7fa8eadc1	Opera	opera
00150000-5565-8b44-df15-1524e8187bf1	Opereta	opereta
00150000-5565-8b44-bb81-dfd541455c75	Balet	balet
00150000-5565-8b44-09f4-0e159b27adda	Plesne prireditve	plesne prireditve
00150000-5565-8b44-5fbf-fc34d47ab36e	Lutkovno gledališče	lutkovno gledališče
00150000-5565-8b44-b560-f0873537546d	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-8b44-27fb-b7e216ebfd4e	Biografska drama	biografska drama
00150000-5565-8b44-18a2-9f1c1b899cec	Komedija	komedija
00150000-5565-8b44-511d-0fa68db63f68	Črna komedija	črna komedija
00150000-5565-8b44-040f-c971d5af368e	E-igra	E-igra
00150000-5565-8b44-101a-d28c9b5c2fe8	Kriminalka	kriminalka
00150000-5565-8b44-54f2-7557d406e23e	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5236090)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5236599)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5236589)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5236498)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 5236268)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5236293)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 5236214)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 5236425)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 5236244)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 5236287)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 5236228)
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
-- TOC entry 2406 (class 2606 OID 5236336)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 5236363)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 5236186)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5236099)
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
-- TOC entry 2321 (class 2606 OID 5236122)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5236079)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5236064)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 5236369)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 5236402)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5236539)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 5236150)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 5236174)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5236342)
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
-- TOC entry 2336 (class 2606 OID 5236164)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5236235)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5236354)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5236482)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5236526)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 5236386)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5236327)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5236318)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5236520)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 5236454)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5236035)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5236393)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5236053)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5236073)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5236411)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 5236349)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 5236299)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 5236624)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 5236615)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5236610)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 5236467)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 5236130)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 5236309)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5236509)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5236199)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5236048)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5236569)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5236253)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5236377)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5236445)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5236282)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 5236553)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 5236438)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 5236275)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 5236468)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 5236469)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 5236152)
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
-- TOC entry 2419 (class 1259 OID 5236370)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 5236356)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 5236355)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 5236254)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5236428)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 5236426)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 5236427)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 5236230)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 5236229)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5236541)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 5236542)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 5236543)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 5236574)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 5236571)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 5236573)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 5236572)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 5236201)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 5236200)
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
-- TOC entry 2429 (class 1259 OID 5236394)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 5236288)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5236080)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5236081)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 5236414)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 5236413)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 5236412)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 5236236)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 5236238)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 5236237)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2499 (class 1259 OID 5236617)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 5236322)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 5236320)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 5236319)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 5236321)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5236054)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5236055)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 5236378)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 5236343)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 5236455)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 5236456)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 5236166)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 5236165)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 5236167)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 5236483)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 5236484)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5236603)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5236602)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5236605)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5236601)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5236604)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 5236446)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 5236331)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 5236330)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 5236328)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 5236329)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5236591)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5236590)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 5236245)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5236101)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5236100)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 5236131)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 5236132)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 5236312)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 5236311)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 5236310)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 5236277)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 5236273)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 5236270)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 5236271)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 5236269)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 5236274)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 5236272)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 5236151)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5236215)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5236217)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 5236216)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 5236218)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 5236337)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 5236540)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 5236570)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5236123)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5236124)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2505 (class 1259 OID 5236625)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 5236187)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2502 (class 1259 OID 5236616)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 5236388)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 5236387)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 5236600)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 5236175)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 5236527)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5236074)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 5236276)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5236758)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5236743)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5236748)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5236768)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5236738)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5236763)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5236753)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5236913)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5236918)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5236673)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5236853)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5236848)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5236843)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5236733)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5236893)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5236883)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5236888)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5236708)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5236703)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5236833)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5236938)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5236943)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5236948)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5236968)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5236953)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5236963)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5236958)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5236698)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5236693)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 5236658)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5236863)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5236773)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2509 (class 2606 OID 5236638)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 5236643)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5236878)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5236873)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5236868)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5236713)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5236723)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5236718)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5237008)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5236808)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5236798)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5236793)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5236803)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2507 (class 2606 OID 5236628)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 5236633)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5236858)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5236838)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5236903)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5236908)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5236683)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5236678)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5236688)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5236923)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5236928)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5236993)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5236988)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5237003)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5236983)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5236998)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5236898)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5236828)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5236823)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5236813)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5236818)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5236978)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5236973)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5236728)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5236933)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5236653)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2511 (class 2606 OID 5236648)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5236663)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5236668)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5236788)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5236783)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5236778)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 11:15:50 CEST

--
-- PostgreSQL database dump complete
--

