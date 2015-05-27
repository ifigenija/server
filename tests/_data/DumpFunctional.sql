--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 11:50:34 CEST

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
-- TOC entry 180 (class 1259 OID 5251203)
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
-- TOC entry 227 (class 1259 OID 5251713)
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
-- TOC entry 226 (class 1259 OID 5251696)
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
-- TOC entry 219 (class 1259 OID 5251606)
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
-- TOC entry 194 (class 1259 OID 5251376)
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
-- TOC entry 197 (class 1259 OID 5251410)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5251323)
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
-- TOC entry 213 (class 1259 OID 5251536)
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
-- TOC entry 192 (class 1259 OID 5251360)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5251404)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5251340)
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
-- TOC entry 202 (class 1259 OID 5251453)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5251478)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5251297)
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
-- TOC entry 181 (class 1259 OID 5251212)
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
-- TOC entry 182 (class 1259 OID 5251223)
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
-- TOC entry 177 (class 1259 OID 5251177)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5251196)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5251485)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5251516)
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
-- TOC entry 223 (class 1259 OID 5251649)
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
-- TOC entry 184 (class 1259 OID 5251254)
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
-- TOC entry 186 (class 1259 OID 5251289)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5251459)
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
-- TOC entry 185 (class 1259 OID 5251274)
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
-- TOC entry 191 (class 1259 OID 5251352)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5251471)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5251591)
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
-- TOC entry 222 (class 1259 OID 5251642)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5251500)
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
-- TOC entry 201 (class 1259 OID 5251444)
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
-- TOC entry 200 (class 1259 OID 5251434)
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
-- TOC entry 221 (class 1259 OID 5251631)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5251568)
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
-- TOC entry 174 (class 1259 OID 5251148)
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
-- TOC entry 173 (class 1259 OID 5251146)
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
-- TOC entry 210 (class 1259 OID 5251510)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5251186)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5251170)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5251524)
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
-- TOC entry 204 (class 1259 OID 5251465)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5251415)
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
-- TOC entry 230 (class 1259 OID 5251739)
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
-- TOC entry 229 (class 1259 OID 5251732)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5251727)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5251578)
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
-- TOC entry 231 (class 1259 OID 5251747)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5251246)
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
-- TOC entry 199 (class 1259 OID 5251421)
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
-- TOC entry 220 (class 1259 OID 5251620)
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
-- TOC entry 188 (class 1259 OID 5251309)
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
-- TOC entry 175 (class 1259 OID 5251157)
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
-- TOC entry 225 (class 1259 OID 5251675)
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
-- TOC entry 193 (class 1259 OID 5251367)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5251492)
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
-- TOC entry 215 (class 1259 OID 5251560)
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
-- TOC entry 195 (class 1259 OID 5251399)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5251665)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5251550)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5251151)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5251203)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5251713)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5565-9369-2838-91744957903b	000d0000-5565-9369-1192-382d89311997	\N	00090000-5565-9369-44b8-1ab594eebda1	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5565-9369-c7b8-e307333cb211	000d0000-5565-9369-776c-77ed470beb75	\N	00090000-5565-9369-e523-a82995ae6245	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2746 (class 0 OID 5251696)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5251606)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-9369-6d8e-e9c5231b509d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-9369-9641-1db99b931c78	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-9369-08e5-cc16c34b6f62	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5251376)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5251410)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5251323)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-9368-76f9-a5ce1a6ac96b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-9368-5405-0676fd6094e7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-9368-48ef-80058e86ea64	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-9368-5a0f-638651a5c721	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-9368-ec89-255ec40af3db	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-9368-e2b7-2128dc4fadde	AD	AND	020	Andorra 	Andora	\N
00040000-5565-9368-0e4b-0951eac54f14	AO	AGO	024	Angola 	Angola	\N
00040000-5565-9368-022d-5c71b6651445	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-9368-2e16-2e5c65b51a8e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-9368-8eab-e390b801387a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-9368-9dd9-5a17ec4d5f5f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-9368-08ac-b13fe825cec3	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-9368-5a16-beae605ba92c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-9368-e037-789cc2a86948	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-9368-c71e-308139b304e1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-9368-84d8-66d4a429361b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-9368-3bd2-23d57a04edd1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-9368-bbc6-371c2ed0e241	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-9368-4c96-efe71e829e46	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-9368-271a-6b9df583de27	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-9368-fd74-5fc638f3c4ef	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-9368-8ea2-5a17651ebc01	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-9368-b992-9903bc0c1135	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-9368-8053-a35cf10b0e55	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-9368-02e9-9dc6e8043f23	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-9368-5db7-21d80284e0b9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-9368-d24e-23fc71dd7eaa	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-9368-86e5-c9aef6d438f7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-9368-b9a3-ed4ab1975ca4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-9368-7301-3129201cef8d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-9368-7f68-87a2aa84791d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-9368-434f-69e953387dd8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-9368-7392-df454eacc0b6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-9368-eb98-52ec3dc510c7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-9368-48e5-243313f8d804	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-9368-d65f-a8f7e6d86840	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-9368-4b39-346111259807	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-9368-c616-f1cd28065afd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-9368-2e99-e7fb38768373	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-9368-d685-60878870883d	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-9368-2724-93d079fece8a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-9368-19a2-0840f6288475	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-9368-fd86-65e392714ced	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-9368-0cdc-bfe0f22b17e4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-9368-8557-d477e4f7f553	CL	CHL	152	Chile 	Čile	\N
00040000-5565-9368-56e0-2cc2acdbbb2a	CN	CHN	156	China 	Kitajska	\N
00040000-5565-9368-4410-6a1caa6bf9b5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-9368-055a-46036669a6b7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-9368-d33c-444f6601ed27	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-9368-392f-97f28cb44bb8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-9368-e94c-d8df6d47b844	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-9368-1d1f-8b18f45d62cb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-9368-1092-c89bc7c8a8a1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-9368-49e0-f1170f15bf41	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-9368-9e50-d648217a0a6e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-9368-49b4-21365968ddb2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-9368-07d7-5bdefb3d8a55	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-9368-e7c3-02a0d22ac953	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-9368-3644-6a225dc9c2b3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-9368-7a54-c171795c94b9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-9368-db9c-261308228341	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-9368-2908-c61c333bc334	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-9368-1a20-815a77f3c448	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-9368-2c29-c4eba5e8f276	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-9368-45c0-3a3e43a4c564	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-9368-fd07-1ebca544c5e4	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-9368-790e-e1e02e7d679c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-9368-596d-9f7239ee1d6a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-9368-3d31-a8c336b7743c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-9368-2e67-0515d683bff6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-9368-acf7-ee372feb9b72	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-9368-7d21-4c79d534d8d1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-9368-4095-251ccc46092e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-9368-ed6c-8a560597e59b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-9368-c666-0a7fedfc65b3	FI	FIN	246	Finland 	Finska	\N
00040000-5565-9368-60ca-099b82954ec8	FR	FRA	250	France 	Francija	\N
00040000-5565-9368-13e0-7a8c5f1e5580	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-9368-b095-bb9af4ca038d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-9368-dc53-68c4647dc2bd	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-9368-aac7-8b18ec4453db	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-9368-a33b-7a09a6865f64	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-9368-1e21-bd4a500b734e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-9368-0b47-4e7ce3fe6eca	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-9368-ff65-ce5e1b935b53	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-9368-9241-7eb07556daaf	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-9368-2ae9-e0f31adfd609	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-9368-6f61-fda3045e0ee3	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-9368-b1be-dc25eae94917	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-9368-dc9f-a6f638ea4e80	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-9368-9512-d7fec0f3f9bd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-9368-7725-2bd29d4b05c6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-9368-1455-9ba974656dcc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-9368-cc65-6520e08d75e4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-9368-7bd5-9c7513e23e64	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-9368-eeb1-af3def6d94af	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-9368-b531-c675894569cf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-9368-8e89-d84e24d2fe37	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-9368-2afd-5a5d6a7cb4ba	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-9368-e7da-adb0f7ef073d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-9368-557b-029aa11b5727	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-9368-fa1b-b56d2d23764e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-9368-128e-1760d0c8a2ce	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-9368-496c-c1e46ac5b342	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-9368-83a5-f7a5bbabb031	IN	IND	356	India 	Indija	\N
00040000-5565-9368-caed-2319728cf098	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-9368-cd2c-1d047580d1b8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-9368-8b8a-0a7a2e5cbd55	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-9368-f102-a58e6522144a	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-9368-ecb2-73b8662cb7ca	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-9368-2c66-34505c2e3be2	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-9368-4d76-b80febbd3da7	IT	ITA	380	Italy 	Italija	\N
00040000-5565-9368-5331-045c1f0908a7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-9368-9953-824d6a5f8d60	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-9368-e897-29d517b5b7ec	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-9368-423b-17de3e57eff1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-9368-69fc-22906b227b55	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-9368-24b8-8ed230ca56e0	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-9368-4c6f-14fe665344cd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-9368-daca-a6e5e62073ed	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-9368-2341-a87fed1d15cd	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-9368-483f-d6e2a76d234d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-9368-49d3-2efb8e44db12	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-9368-b880-709d937a2292	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-9368-45c9-59bb36ac5185	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-9368-e8fe-c8e670dd7688	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-9368-6b72-96e91f7d053d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-9368-97cf-774e98fcc1fe	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-9368-6623-279fc857a243	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-9368-06e5-18eb76ebd876	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-9368-00fe-42d6b913c737	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-9368-7edd-c954f47cab00	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-9368-1205-d3204ffe3a3d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-9368-c7a5-6a8506da9af2	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-9368-1b1f-fc2e9df300e8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-9368-6652-91be4a0332aa	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-9368-4b29-70b61f6e905f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-9368-5557-8435cb92db6c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-9368-ad21-5a735e6e852e	ML	MLI	466	Mali 	Mali	\N
00040000-5565-9368-e060-9f6a9e4f53da	MT	MLT	470	Malta 	Malta	\N
00040000-5565-9368-7082-8b293fa3ea66	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-9368-1b6a-d29c9f39e870	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-9368-f796-4bedb049f6cf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-9368-cb20-8e4aa213adef	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-9368-6847-c440a4a9c47e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-9368-4849-1785888b2fbd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-9368-d386-7ac0a3d4c603	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-9368-a8ee-fde3e0a6342a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-9368-1da7-093784ceb415	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-9368-d28a-bf4e635e3287	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-9368-588b-60adb09aa8b4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-9368-e477-c2aacc0d4cc2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-9368-0126-d2ada578ade6	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-9368-5c33-c3d0ba7fceb9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-9368-ff6f-bf53bac3ed31	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-9368-63b6-31cc67ab7bc8	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-9368-8eb7-4e5c542949c6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-9368-7d91-453f37be0c2c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-9368-ea0d-d0795d9458e7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-9368-4969-d324bca791ff	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-9368-9d58-4480351f59eb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-9368-c6b3-ace69b2feb58	NE	NER	562	Niger 	Niger 	\N
00040000-5565-9368-8368-8f227667e09d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-9368-097b-a32613898269	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-9368-5969-1526adb5a30f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-9368-d35a-27f65ea2cbde	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-9368-d1f4-a384b502f812	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-9368-af29-5630059949e5	OM	OMN	512	Oman 	Oman	\N
00040000-5565-9368-66ec-a01f718fe01f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-9368-11d1-9a2140b6b93a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-9368-1dcd-8c2d9c69609e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-9368-1883-8eea464b5010	PA	PAN	591	Panama 	Panama	\N
00040000-5565-9368-8089-b538d91b8fd8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-9368-64fa-02e5fad28210	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-9368-8c1c-bf531d8b3396	PE	PER	604	Peru 	Peru	\N
00040000-5565-9368-b2fd-f560a25c6cdd	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-9368-3593-a54b8fc2e741	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-9368-c10f-ff1e23c98afe	PL	POL	616	Poland 	Poljska	\N
00040000-5565-9368-cf8e-aa508ee99e9f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-9368-0587-c5640e15d99f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-9368-8367-2f244c4c3458	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-9368-9fae-236001af8dbd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-9368-ae2d-69f8ee7795b4	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-9368-82c3-bf2d83545f74	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-9368-803c-2071a4bef400	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-9368-2609-6081f177cb0c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-9368-b71b-26e64a332fd3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-9368-5f6f-386e41928754	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-9368-fa96-30bfae07c92e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-9368-29bf-e7afb3abf735	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-9368-037b-d6d189e6f772	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-9368-0f58-d11457319127	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-9368-2881-caabccd8d329	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-9368-edd1-911af0ae9c16	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-9368-60b3-08f5449fad8d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-9368-3132-8c57ca125ed8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-9368-6ac3-bc9eb707e5aa	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-9368-2d5f-cb648ed912d9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-9368-fe6c-c4410db5e00c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-9368-ffee-ae6e94586cd4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-9368-ca8d-b3056f65c95c	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-9368-d780-508838df2955	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-9368-2d19-373d107e323b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-9368-7cbc-4ef1f4f9e46d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-9368-af66-79776a012fa0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-9368-4ea0-8eecf956987c	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-9368-ed6c-3ecdc72fdc83	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-9368-db59-dbd7e3e9e2c6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-9368-c795-0811263c69cc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-9368-449d-c93a371ad166	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-9368-c11d-1ea57b5bf470	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-9368-3460-8a56c4a3599d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-9368-0f6a-928da66d4e4a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-9368-c66f-7b100bc7e315	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-9368-a752-82d3576447a3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-9368-3a44-3e8cde4045bd	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-9368-1731-7e5339ffbe07	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-9368-346e-dda00220a0a9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-9368-661b-5f6c70a0d50e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-9368-3fba-e22da1140f74	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-9368-c075-272f39bbb9e2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-9368-9e66-0714bc6c75d6	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-9368-e221-d2a0bede9c58	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-9368-1156-8ce207f4a87a	TG	TGO	768	Togo 	Togo	\N
00040000-5565-9368-0109-92be76aaabf1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-9368-d474-6bcf4dcccfb4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-9368-48aa-d1aa492829e9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-9368-815e-05ce275839f9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-9368-b163-7c9c4c50ae99	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-9368-22f8-895839422d4f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-9368-b435-a0dfecb98da9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-9368-2bbd-3b548d6a5ed0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-9368-0406-436cb000c534	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-9368-5c1b-409260d9a990	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-9368-e8dd-33cf98792a02	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-9368-924e-b3a722ab6a65	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-9368-3ca0-f38cde1b7af0	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-9368-f423-1c61cf551d62	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-9368-3918-66c1e31e8f2c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-9368-69db-5babffbc2557	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-9368-32c2-ddeb4ac23196	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-9368-7cba-ad049a8b0b86	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-9368-1db0-9ec54aa5dcfc	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-9368-c79b-2ae0b38c953b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-9368-df6f-3dd5cef863a0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-9368-8ffd-c16a4b7516e1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-9368-f231-980ede57b613	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-9368-950d-f5989d878077	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-9368-09bb-4d5a99b575a6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-9368-63d9-0256aef6c58d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5251536)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-9369-048c-dae0e1d29bc9	000e0000-5565-9369-7d14-581ba874d853	\N	000f0000-5565-9368-a423-101264033e3a	igralec	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5565-9369-1192-382d89311997	000e0000-5565-9369-7d14-581ba874d853	\N	000f0000-5565-9368-a423-101264033e3a	igralec	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5565-9369-776c-77ed470beb75	000e0000-5565-9369-7d14-581ba874d853	\N	000f0000-5565-9368-fe0a-5ef19cde6760	umetnik	Režija		velika	t	8	t	t	\N
\.


--
-- TOC entry 2712 (class 0 OID 5251360)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5251404)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5251340)
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
-- TOC entry 2722 (class 0 OID 5251453)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5251478)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5251297)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-9369-785a-1732fb8d92de	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-9369-fdd4-7d0152bc48ed	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-9369-a794-e70a9b624842	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-9369-4599-d53251a18081	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-9369-f220-81c04832fd22	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-9369-b2d4-ec75431fd112	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-9369-5dfb-5bb6d9c7403f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-9369-9055-28f59189cab5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-9369-8e99-4d3ebb70ffe3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-9369-0c11-ef92435b9c9e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-9369-2414-534d59f5932c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-9369-5763-1b389cc0d608	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-9369-0e7d-5f39f576419c	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-9369-729e-d2bdc78f0254	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-9369-4cdb-45e3724242bd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5251212)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-9369-5a7b-0ddc80dda8f2	00000000-5565-9369-f220-81c04832fd22	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-9369-d37b-957e32b6bc0f	00000000-5565-9369-f220-81c04832fd22	00010000-5565-9369-ad1a-e55772593095	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-9369-3212-f152b44ef96a	00000000-5565-9369-b2d4-ec75431fd112	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5251223)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-9369-e457-07c3b751eb78	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-9369-74f3-ae5284533e03	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-9369-e65f-1cb2ee26ee48	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-9369-2b1e-d878d27e6c77	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-9369-2618-fb19fb371872	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-9369-370c-2ae2a71154f6	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-9369-0dd8-c66beaab1874	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-9369-31c5-3a1c0e7d52ba	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-9369-44b8-1ab594eebda1	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-9369-e523-a82995ae6245	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-9369-60fc-7cf3d6c3f4bd	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5251177)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-9369-8bd2-b3d250b07845	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-9369-5ee1-8fd37fcf5e6b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-9369-0e3f-d687ca00ef30	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-9369-740f-e1166f671a60	Abonma-read	Abonma - branje	f
00030000-5565-9369-9009-90a210276f02	Abonma-write	Abonma - spreminjanje	f
00030000-5565-9369-df36-fdcad7503920	Alternacija-read	Alternacija - branje	f
00030000-5565-9369-87a4-2a22eafa62cc	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-9369-ecb4-6881af53696a	Arhivalija-read	Arhivalija - branje	f
00030000-5565-9369-ef53-aac94d0bf3d4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-9369-f91c-fcca9fbf6dea	Besedilo-read	Besedilo - branje	f
00030000-5565-9369-a47e-2c16a90badb9	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-9369-1c4d-d9830a1cc7de	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-9369-7d45-48f4dce44bc7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-9369-0583-e772f9eb92e8	Dogodek-read	Dogodek - branje	f
00030000-5565-9369-2d74-e44c93928fbb	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-9369-6139-ccd57079ecba	Drzava-read	Drzava - branje	f
00030000-5565-9369-788b-6da9b0bb9eec	Drzava-write	Drzava - spreminjanje	f
00030000-5565-9369-5256-f65eb35afff7	Funkcija-read	Funkcija - branje	f
00030000-5565-9369-f1ed-357241634a55	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-9369-4683-a72dde100a5d	Gostovanje-read	Gostovanje - branje	f
00030000-5565-9369-1a93-cca26f0de512	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-9369-73a3-50d37b503cb4	Gostujoca-read	Gostujoca - branje	f
00030000-5565-9369-6b81-97964afcbd4a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-9369-b03b-dadc02c79f33	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-9369-02cb-12f5e2f3f1a4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-9369-f29e-deb66861d883	Kupec-read	Kupec - branje	f
00030000-5565-9369-3a3f-b32cd4fadbdf	Kupec-write	Kupec - spreminjanje	f
00030000-5565-9369-48f8-64dfd64e4427	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-9369-c845-669b2357cfd2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-9369-e52b-b26992c7cf08	Option-read	Option - branje	f
00030000-5565-9369-4c2d-0a3c866ef33f	Option-write	Option - spreminjanje	f
00030000-5565-9369-b25a-51459e9ab5c4	OptionValue-read	OptionValue - branje	f
00030000-5565-9369-63d0-0cc838c4391d	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-9369-fa5b-1dffcf8eb259	Oseba-read	Oseba - branje	f
00030000-5565-9369-d9ad-d9db1469e0aa	Oseba-write	Oseba - spreminjanje	f
00030000-5565-9369-fecb-c05a7b7f3f35	Permission-read	Permission - branje	f
00030000-5565-9369-c508-3dbf681acbfd	Permission-write	Permission - spreminjanje	f
00030000-5565-9369-13fe-a5435da4a812	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-9369-d858-cdfd69d889e6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-9369-f3d9-9828777277f1	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-9369-1d79-2c014e9f4b28	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-9369-86f8-4aebe85cbde3	Pogodba-read	Pogodba - branje	f
00030000-5565-9369-f16d-5d3ac64f9d5d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-9369-87ed-b0cfd0f174f2	Popa-read	Popa - branje	f
00030000-5565-9369-bc3b-447a15828bcc	Popa-write	Popa - spreminjanje	f
00030000-5565-9369-806b-6559052a1948	Posta-read	Posta - branje	f
00030000-5565-9369-a540-c1aaef783b53	Posta-write	Posta - spreminjanje	f
00030000-5565-9369-ab87-86be06d73dbe	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-9369-58e2-5e7431a66a2b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-9369-dac9-9653258b5941	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-9369-4bbd-d65ac7ee9172	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-9369-9095-8093492add1b	Predstava-read	Predstava - branje	f
00030000-5565-9369-39d1-312b066681ee	Predstava-write	Predstava - spreminjanje	f
00030000-5565-9369-a866-2bffd2eeaa95	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-9369-c835-54c0859da9ff	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-9369-3752-b645ab89afb6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-9369-cac7-940685127c08	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-9369-387f-5e8e920bbfe2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-9369-81b0-432d1c4bf04d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-9369-cf6f-82edd9a8d7cb	Prostor-read	Prostor - branje	f
00030000-5565-9369-cf0a-5ee4e65f01f5	Prostor-write	Prostor - spreminjanje	f
00030000-5565-9369-1eec-8ba998b20426	Racun-read	Racun - branje	f
00030000-5565-9369-f872-75fea2a8d00b	Racun-write	Racun - spreminjanje	f
00030000-5565-9369-3b0f-1c1c9155d9fa	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-9369-4857-c060c0e5db7e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-9369-6d92-1829da97fc94	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-9369-eeeb-b0ff59025497	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-9369-1050-ee66c0604ba3	Rekvizit-read	Rekvizit - branje	f
00030000-5565-9369-ea2e-4eb0ab6a9a42	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-9369-51f9-a8399436aca1	Revizija-read	Revizija - branje	f
00030000-5565-9369-c1bb-5652679505f6	Revizija-write	Revizija - spreminjanje	f
00030000-5565-9369-e219-3fd4b1356962	Rezervacija-read	Rezervacija - branje	f
00030000-5565-9369-46ad-14cec57bb425	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-9369-de73-108dc3360765	Role-read	Role - branje	f
00030000-5565-9369-9c68-d7f3b36af1f2	Role-write	Role - spreminjanje	f
00030000-5565-9369-8095-abc8d4a7a3bd	SedezniRed-read	SedezniRed - branje	f
00030000-5565-9369-a7e2-4cd1316b2458	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-9369-387d-86337ccc0dbe	Sedez-read	Sedez - branje	f
00030000-5565-9369-fbcc-f03324094e7d	Sedez-write	Sedez - spreminjanje	f
00030000-5565-9369-499b-f46e7a1d9e03	Sezona-read	Sezona - branje	f
00030000-5565-9369-184d-7180464b4040	Sezona-write	Sezona - spreminjanje	f
00030000-5565-9369-a581-f1e43f5d7103	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-9369-b2d5-23c6e7fa6cb4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-9369-fb52-00c5541bd045	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-9369-c6f1-ee942ff8f7d2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-9369-f16f-5cc9c99438eb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-9369-7989-cb305dc6a19c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-9369-8e95-e0f97184f8f6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-9369-c16f-1e650d8623c8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-9369-264b-fd2d4e473284	Telefonska-read	Telefonska - branje	f
00030000-5565-9369-c914-c4a708f2e313	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-9369-1701-7e166ba65e86	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-9369-5801-9fe12308f26a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-9369-a7e7-30ad0b26be96	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-9369-55a1-ed72a133e409	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-9369-e41b-cebb0b6d438a	Trr-read	Trr - branje	f
00030000-5565-9369-55d3-8438e42918b9	Trr-write	Trr - spreminjanje	f
00030000-5565-9369-3ee2-33ccbb55961a	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-9369-5535-35ef4a98cf25	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-9369-7ad9-9ae50c603ac6	User-read	User - branje	f
00030000-5565-9369-30dd-d58e177f14a7	User-write	User - spreminjanje	f
00030000-5565-9369-29c9-b1109e123c43	Vaja-read	Vaja - branje	f
00030000-5565-9369-f452-46d12e2101bd	Vaja-write	Vaja - spreminjanje	f
00030000-5565-9369-dd27-0da5e9dff988	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-9369-f442-ec0c7a4f434d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-9369-8dee-ecc8a14bc263	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-9369-d22f-d3629ba760bf	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-9369-5eec-56622e87f8af	Zasedenost-read	Zasedenost - branje	f
00030000-5565-9369-e039-01bf1b1b2b85	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-9369-7f2c-0a4568437fe5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-9369-a037-3e90a0cf28a3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-9369-e223-c1601b0a56ed	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-9369-8d51-a89c2b1e6737	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5251196)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-9369-ce66-700b7e9f4bea	00030000-5565-9369-6139-ccd57079ecba
00020000-5565-9369-64ce-74bd481f3014	00030000-5565-9369-788b-6da9b0bb9eec
00020000-5565-9369-64ce-74bd481f3014	00030000-5565-9369-6139-ccd57079ecba
\.


--
-- TOC entry 2727 (class 0 OID 5251485)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5251516)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5251649)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5251254)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-9369-e7e9-6a2fca5f7935	00040000-5565-9368-76f9-a5ce1a6ac96b	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-9369-c19c-d5c838a41699	00040000-5565-9368-76f9-a5ce1a6ac96b	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5251289)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-9368-b137-9b19c288426c	8341	Adlešiči
00050000-5565-9368-8c24-841972c66e66	5270	Ajdovščina
00050000-5565-9368-06ee-35454067cb7a	6280	Ankaran/Ancarano
00050000-5565-9368-43fb-afafde7fecfb	9253	Apače
00050000-5565-9368-196d-2be00d2a4270	8253	Artiče
00050000-5565-9368-364b-67dde8643205	4275	Begunje na Gorenjskem
00050000-5565-9368-3294-8d8797e6bc2f	1382	Begunje pri Cerknici
00050000-5565-9368-8003-4fd76d0f3f48	9231	Beltinci
00050000-5565-9368-e55c-58bad8a2de98	2234	Benedikt
00050000-5565-9368-e5ea-04fcee58b52d	2345	Bistrica ob Dravi
00050000-5565-9368-5462-172bb0f02a52	3256	Bistrica ob Sotli
00050000-5565-9368-d952-ac2f53979062	8259	Bizeljsko
00050000-5565-9368-f964-a57fbb7e4310	1223	Blagovica
00050000-5565-9368-2211-5961045b81b9	8283	Blanca
00050000-5565-9368-b9bb-4587f93ed411	4260	Bled
00050000-5565-9368-2170-71ff48f386b9	4273	Blejska Dobrava
00050000-5565-9368-cc80-22c4a34cc51f	9265	Bodonci
00050000-5565-9368-bbc5-c24c89f07cbd	9222	Bogojina
00050000-5565-9368-f341-21640ff2d061	4263	Bohinjska Bela
00050000-5565-9368-2ce0-f61c316c3aeb	4264	Bohinjska Bistrica
00050000-5565-9368-8320-0367764c4a14	4265	Bohinjsko jezero
00050000-5565-9368-c072-5bd1b35dec62	1353	Borovnica
00050000-5565-9368-aba2-46f924402e2c	8294	Boštanj
00050000-5565-9368-b9ae-e799e4d34d5a	5230	Bovec
00050000-5565-9368-a875-7c94bd9f313c	5295	Branik
00050000-5565-9368-724d-0b7147a4f467	3314	Braslovče
00050000-5565-9368-099a-604251d063e0	5223	Breginj
00050000-5565-9368-511b-2d8b99605390	8280	Brestanica
00050000-5565-9368-142b-fdd3a00b5b56	2354	Bresternica
00050000-5565-9368-9c6f-aa4748f5fb10	4243	Brezje
00050000-5565-9368-d47e-a71168a6976a	1351	Brezovica pri Ljubljani
00050000-5565-9368-a009-4ab2249e69ec	8250	Brežice
00050000-5565-9368-5f02-9dd6b281ab6f	4210	Brnik - Aerodrom
00050000-5565-9368-aed7-74c6b56180dc	8321	Brusnice
00050000-5565-9368-3055-5d342cb3b900	3255	Buče
00050000-5565-9368-febb-0991f679276c	8276	Bučka 
00050000-5565-9368-fed0-f0e7ef1d4d8d	9261	Cankova
00050000-5565-9368-f5da-6178a3b4d4b9	3000	Celje 
00050000-5565-9368-b369-8e458497d5f7	3001	Celje - poštni predali
00050000-5565-9368-c839-4472dab96675	4207	Cerklje na Gorenjskem
00050000-5565-9368-aaaf-08cbd392c241	8263	Cerklje ob Krki
00050000-5565-9368-f1cf-e5d6a146df81	1380	Cerknica
00050000-5565-9368-b92e-97b73452dbe8	5282	Cerkno
00050000-5565-9368-59c8-a650362cf78d	2236	Cerkvenjak
00050000-5565-9368-82d0-90e4585ec9aa	2215	Ceršak
00050000-5565-9368-b557-1f2a26049063	2326	Cirkovce
00050000-5565-9368-02c6-92b363e6843c	2282	Cirkulane
00050000-5565-9368-63f9-7698c976bb3b	5273	Col
00050000-5565-9368-09da-50d1d1b0e3a3	8251	Čatež ob Savi
00050000-5565-9368-9121-47f3497eef06	1413	Čemšenik
00050000-5565-9368-588a-6de8847c7dbd	5253	Čepovan
00050000-5565-9368-2606-b361b6478ca0	9232	Črenšovci
00050000-5565-9368-3e0b-4f8e04070adb	2393	Črna na Koroškem
00050000-5565-9368-8082-cec06e6a6c1f	6275	Črni Kal
00050000-5565-9368-5727-8a2f01866cbf	5274	Črni Vrh nad Idrijo
00050000-5565-9368-feb1-e68dbfbeb8d1	5262	Črniče
00050000-5565-9368-03de-9889fec1e153	8340	Črnomelj
00050000-5565-9368-a193-cb259de06f08	6271	Dekani
00050000-5565-9368-a43f-496591706dcd	5210	Deskle
00050000-5565-9368-a92c-39997dde1766	2253	Destrnik
00050000-5565-9368-33a0-df9fbe1a089e	6215	Divača
00050000-5565-9368-c63d-e721e70648d1	1233	Dob
00050000-5565-9368-77a2-7fc4a9979817	3224	Dobje pri Planini
00050000-5565-9368-9c56-d00b8d88be51	8257	Dobova
00050000-5565-9368-ca68-a4141594818f	1423	Dobovec
00050000-5565-9368-6af3-ca1187b9789b	5263	Dobravlje
00050000-5565-9368-1b7a-1c5672cc9325	3204	Dobrna
00050000-5565-9368-1d94-62bc8e4d8fb9	8211	Dobrnič
00050000-5565-9368-48fe-414045157931	1356	Dobrova
00050000-5565-9368-1a50-f5f2f5327093	9223	Dobrovnik/Dobronak 
00050000-5565-9368-936b-bff1a36b1649	5212	Dobrovo v Brdih
00050000-5565-9368-79b4-0470be23c3fc	1431	Dol pri Hrastniku
00050000-5565-9368-126c-4ea5594b066e	1262	Dol pri Ljubljani
00050000-5565-9368-09fe-2360a2e13c5d	1273	Dole pri Litiji
00050000-5565-9368-58bb-1a6e135595ba	1331	Dolenja vas
00050000-5565-9368-7b4d-ef09ac0c92c5	8350	Dolenjske Toplice
00050000-5565-9368-f189-9c959a64c1cc	1230	Domžale
00050000-5565-9368-c6f5-a6753fb7a27d	2252	Dornava
00050000-5565-9368-9587-b759bd9dd9f5	5294	Dornberk
00050000-5565-9368-b22d-20207b7c59a6	1319	Draga
00050000-5565-9368-6206-a35a7e67ec69	8343	Dragatuš
00050000-5565-9368-be55-0ecad3cd4b75	3222	Dramlje
00050000-5565-9368-c709-e62c52da86c6	2370	Dravograd
00050000-5565-9368-4202-4b55e07068e8	4203	Duplje
00050000-5565-9368-8068-e64b7cca0d93	6221	Dutovlje
00050000-5565-9368-0cee-50298cffb012	8361	Dvor
00050000-5565-9368-6a8b-d5374ea80d91	2343	Fala
00050000-5565-9368-33bc-40a7ec09c4f9	9208	Fokovci
00050000-5565-9368-f084-bbcb526533e5	2313	Fram
00050000-5565-9368-c49c-bd86dfc0a927	3213	Frankolovo
00050000-5565-9368-6ca8-be6f1c6c44af	1274	Gabrovka
00050000-5565-9368-8a2f-18a51653ad27	8254	Globoko
00050000-5565-9368-6213-6594c7ac72e7	5275	Godovič
00050000-5565-9368-999f-455dfcdfb32a	4204	Golnik
00050000-5565-9368-a302-b094a5609727	3303	Gomilsko
00050000-5565-9368-b2b4-a00cd14807b6	4224	Gorenja vas
00050000-5565-9368-3f52-00ff7cc331ed	3263	Gorica pri Slivnici
00050000-5565-9368-2e5d-7864041cac4f	2272	Gorišnica
00050000-5565-9368-5c75-9e629556c895	9250	Gornja Radgona
00050000-5565-9368-bc93-902c479ebe5d	3342	Gornji Grad
00050000-5565-9368-7095-9f8bb7e31ec2	4282	Gozd Martuljek
00050000-5565-9368-242c-312308e0224b	6272	Gračišče
00050000-5565-9368-29f6-657880c5a0c1	9264	Grad
00050000-5565-9368-9ca5-7dba69258ff4	8332	Gradac
00050000-5565-9368-e9c0-36c09922c295	1384	Grahovo
00050000-5565-9368-1878-4372433a0066	5242	Grahovo ob Bači
00050000-5565-9368-55f2-b9808e1828df	5251	Grgar
00050000-5565-9368-032a-58349c54c71d	3302	Griže
00050000-5565-9368-76b9-0a6a01d9fab3	3231	Grobelno
00050000-5565-9368-1c29-5bc3d971f1b6	1290	Grosuplje
00050000-5565-9368-f4ca-75f69aaea30a	2288	Hajdina
00050000-5565-9368-6775-5295b1c37ace	8362	Hinje
00050000-5565-9368-5640-35be07851956	2311	Hoče
00050000-5565-9368-ccd6-67e284da030a	9205	Hodoš/Hodos
00050000-5565-9368-838c-3b0fa23e46aa	1354	Horjul
00050000-5565-9368-e7bd-a69aa5600abb	1372	Hotedršica
00050000-5565-9368-45b1-79b1a4b0dbeb	1430	Hrastnik
00050000-5565-9368-1266-26a1a59166f6	6225	Hruševje
00050000-5565-9368-08a6-2b46c1570d6c	4276	Hrušica
00050000-5565-9368-9c4f-6b68a0762ef0	5280	Idrija
00050000-5565-9368-d5cc-29196b4ed9de	1292	Ig
00050000-5565-9368-a0e9-7053d0d2f95e	6250	Ilirska Bistrica
00050000-5565-9368-dbb5-aacbf4263f93	6251	Ilirska Bistrica-Trnovo
00050000-5565-9368-6ed8-743bff0812e8	1295	Ivančna Gorica
00050000-5565-9368-2b60-3f725cae1736	2259	Ivanjkovci
00050000-5565-9368-3d72-d4b61bd05892	1411	Izlake
00050000-5565-9368-40b4-73fa71eb80b0	6310	Izola/Isola
00050000-5565-9368-70c4-0fa56da96f27	2222	Jakobski Dol
00050000-5565-9368-6c17-085b686b492e	2221	Jarenina
00050000-5565-9368-02e4-ac06b54d3c00	6254	Jelšane
00050000-5565-9368-9e1e-9a8c0657b8b9	4270	Jesenice
00050000-5565-9368-5bd9-22e5a9108346	8261	Jesenice na Dolenjskem
00050000-5565-9368-5ce2-c080cb4d6752	3273	Jurklošter
00050000-5565-9368-d4f3-d1fbc98af6e5	2223	Jurovski Dol
00050000-5565-9368-c5e6-159dc1964c0c	2256	Juršinci
00050000-5565-9368-bd60-149eef790052	5214	Kal nad Kanalom
00050000-5565-9368-13ed-ec59cbbe7e4e	3233	Kalobje
00050000-5565-9368-033d-ed34914ade81	4246	Kamna Gorica
00050000-5565-9368-9233-8caa6c867fdc	2351	Kamnica
00050000-5565-9368-3fe4-e41531df303f	1241	Kamnik
00050000-5565-9368-672d-4b5678647dcd	5213	Kanal
00050000-5565-9368-8433-629a0c094280	8258	Kapele
00050000-5565-9368-266d-83bd614cbee6	2362	Kapla
00050000-5565-9368-deb7-d2f88f55e671	2325	Kidričevo
00050000-5565-9368-e1dd-ce69df02f61a	1412	Kisovec
00050000-5565-9368-9a59-2888c55ecf0a	6253	Knežak
00050000-5565-9368-79db-ae325e9fa095	5222	Kobarid
00050000-5565-9368-5cde-431e0bd973a8	9227	Kobilje
00050000-5565-9368-7f22-57e4ce7d01c1	1330	Kočevje
00050000-5565-9368-c002-8f20a90d017d	1338	Kočevska Reka
00050000-5565-9368-a8f4-8e6ff944f09f	2276	Kog
00050000-5565-9368-946e-1b7779b6e67b	5211	Kojsko
00050000-5565-9368-dad1-b865811fee00	6223	Komen
00050000-5565-9368-0adb-09d171ee3f7b	1218	Komenda
00050000-5565-9368-c8a4-995ede08d79d	6000	Koper/Capodistria 
00050000-5565-9368-8c1d-340d15e55d1b	6001	Koper/Capodistria - poštni predali
00050000-5565-9368-d37c-b86f454b98c2	8282	Koprivnica
00050000-5565-9368-beb6-208f573a350d	5296	Kostanjevica na Krasu
00050000-5565-9368-7d99-641531ccd8a7	8311	Kostanjevica na Krki
00050000-5565-9368-7cf5-88ced20554c9	1336	Kostel
00050000-5565-9368-dd8f-1c719b8ab249	6256	Košana
00050000-5565-9368-31ed-48d6cd971b88	2394	Kotlje
00050000-5565-9368-fa5a-b42d23ce221c	6240	Kozina
00050000-5565-9368-7e5c-2b889f824a43	3260	Kozje
00050000-5565-9368-7261-d62fb283a943	4000	Kranj 
00050000-5565-9368-8c77-a95eb5e86620	4001	Kranj - poštni predali
00050000-5565-9368-b6f7-c2d1627e4f1b	4280	Kranjska Gora
00050000-5565-9368-2b0d-ff5883606d39	1281	Kresnice
00050000-5565-9368-2561-da641d2d0f41	4294	Križe
00050000-5565-9368-0f40-ded317565eb9	9206	Križevci
00050000-5565-9368-eecc-62c8cfd7708b	9242	Križevci pri Ljutomeru
00050000-5565-9368-823c-4b551ffc8658	1301	Krka
00050000-5565-9368-988f-ad39dbf454e3	8296	Krmelj
00050000-5565-9368-fb1d-0f8be57a3947	4245	Kropa
00050000-5565-9368-1b4e-367419132e0b	8262	Krška vas
00050000-5565-9368-76fd-3e57bcf72ac0	8270	Krško
00050000-5565-9368-c9e0-a83953a4eb3b	9263	Kuzma
00050000-5565-9368-1f79-06850a0941a7	2318	Laporje
00050000-5565-9368-cd1d-629f933df167	3270	Laško
00050000-5565-9368-faa1-5b7754051f73	1219	Laze v Tuhinju
00050000-5565-9368-dd1c-c772034132ef	2230	Lenart v Slovenskih goricah
00050000-5565-9368-3172-d6e2291fc5a4	9220	Lendava/Lendva
00050000-5565-9368-81f0-e7552b82b10b	4248	Lesce
00050000-5565-9368-040c-46790bee9f82	3261	Lesično
00050000-5565-9368-eb75-c6f8b279d6f6	8273	Leskovec pri Krškem
00050000-5565-9368-4dbd-b35523c68cd8	2372	Libeliče
00050000-5565-9368-6737-758278985883	2341	Limbuš
00050000-5565-9368-3310-d4f893771382	1270	Litija
00050000-5565-9368-7aee-b123179a6b8d	3202	Ljubečna
00050000-5565-9368-c446-0816bcea9d79	1000	Ljubljana 
00050000-5565-9368-9ee8-1ed2c2bc2e25	1001	Ljubljana - poštni predali
00050000-5565-9368-7f2b-8af2d276d10c	1231	Ljubljana - Črnuče
00050000-5565-9368-ebab-d16cf63b930d	1261	Ljubljana - Dobrunje
00050000-5565-9368-8c3b-8aa074771835	1260	Ljubljana - Polje
00050000-5565-9368-e82a-64b3dd2cec76	1210	Ljubljana - Šentvid
00050000-5565-9368-c977-faa45779234d	1211	Ljubljana - Šmartno
00050000-5565-9368-c7e9-1d1abe4dc5d5	3333	Ljubno ob Savinji
00050000-5565-9368-91ef-9578b185aa42	9240	Ljutomer
00050000-5565-9368-41d4-75955eafac5a	3215	Loče
00050000-5565-9368-2660-ae2d9061cf18	5231	Log pod Mangartom
00050000-5565-9368-9f79-703b92e1cea8	1358	Log pri Brezovici
00050000-5565-9368-c203-4dac02dccf6a	1370	Logatec
00050000-5565-9368-dbad-9993e978b56b	1371	Logatec
00050000-5565-9368-9dc8-0dd7de23fbf4	1434	Loka pri Zidanem Mostu
00050000-5565-9368-8d8d-9a74432cc42c	3223	Loka pri Žusmu
00050000-5565-9368-1bb5-ca0e2681d3b9	6219	Lokev
00050000-5565-9368-c53a-cd537121b55b	1318	Loški Potok
00050000-5565-9368-ea07-6e1b17579ddf	2324	Lovrenc na Dravskem polju
00050000-5565-9368-b7f1-0630b096dd51	2344	Lovrenc na Pohorju
00050000-5565-9368-1894-e92be4d9821f	3334	Luče
00050000-5565-9368-5dff-73868f80785e	1225	Lukovica
00050000-5565-9368-c5c7-247b2e26f966	9202	Mačkovci
00050000-5565-9368-0b5a-01627d60f97f	2322	Majšperk
00050000-5565-9368-848e-30b8a7901356	2321	Makole
00050000-5565-9368-eeb2-58536a0db47c	9243	Mala Nedelja
00050000-5565-9368-be9e-0aae30e1c084	2229	Malečnik
00050000-5565-9368-cee6-61deef5c25b9	6273	Marezige
00050000-5565-9368-b1ad-ed88e6d0b658	2000	Maribor 
00050000-5565-9368-61d4-47960132afcb	2001	Maribor - poštni predali
00050000-5565-9368-7754-4d950aa99313	2206	Marjeta na Dravskem polju
00050000-5565-9368-fe37-14bb3120b039	2281	Markovci
00050000-5565-9368-c082-f34c5ea3ed61	9221	Martjanci
00050000-5565-9368-0011-3fc5ae2abfed	6242	Materija
00050000-5565-9368-77e2-60a85fd9328f	4211	Mavčiče
00050000-5565-9368-aa16-e86611a2739e	1215	Medvode
00050000-5565-9368-cab3-38d642adbb7b	1234	Mengeš
00050000-5565-9368-d9fc-f10d9263baae	8330	Metlika
00050000-5565-9368-5e03-47208f23b34d	2392	Mežica
00050000-5565-9368-a550-7b51a8d27abf	2204	Miklavž na Dravskem polju
00050000-5565-9368-6384-293c10b9e380	2275	Miklavž pri Ormožu
00050000-5565-9368-069c-0cd99d234551	5291	Miren
00050000-5565-9368-1e25-d3638d56845a	8233	Mirna
00050000-5565-9368-bcfc-d3a3a7311b5a	8216	Mirna Peč
00050000-5565-9368-3abc-846ad438af0d	2382	Mislinja
00050000-5565-9368-f9b0-bf87f618ab8f	4281	Mojstrana
00050000-5565-9368-3613-48e84b292840	8230	Mokronog
00050000-5565-9368-9191-5d7a5f9aabd0	1251	Moravče
00050000-5565-9368-0af0-af4be5222d50	9226	Moravske Toplice
00050000-5565-9368-e6f1-b566044b0fad	5216	Most na Soči
00050000-5565-9368-feea-08cf592b0015	1221	Motnik
00050000-5565-9368-2364-5c6c8d001bb3	3330	Mozirje
00050000-5565-9368-a064-e63a12c8e660	9000	Murska Sobota 
00050000-5565-9368-20b1-baa1a0565a62	9001	Murska Sobota - poštni predali
00050000-5565-9368-d503-e520af73a3e2	2366	Muta
00050000-5565-9368-8407-1c7b0f0dac94	4202	Naklo
00050000-5565-9368-089f-9068ba58cab0	3331	Nazarje
00050000-5565-9368-52fd-c8a15f044471	1357	Notranje Gorice
00050000-5565-9368-1d11-879366b14b68	3203	Nova Cerkev
00050000-5565-9368-c867-e0421d68422d	5000	Nova Gorica 
00050000-5565-9368-7fa7-468ab18e78d1	5001	Nova Gorica - poštni predali
00050000-5565-9368-61ab-a733a2f14685	1385	Nova vas
00050000-5565-9368-2c92-8e7f0f9fe979	8000	Novo mesto
00050000-5565-9368-91fa-16d0a21d146a	8001	Novo mesto - poštni predali
00050000-5565-9368-a846-ae7aa307a23c	6243	Obrov
00050000-5565-9368-a8b2-7118697ed45c	9233	Odranci
00050000-5565-9368-8810-0fc264702e6b	2317	Oplotnica
00050000-5565-9368-20e6-f6b6eabfdd0e	2312	Orehova vas
00050000-5565-9368-3342-0c8a3a63a772	2270	Ormož
00050000-5565-9368-0204-1e7a1022e9a0	1316	Ortnek
00050000-5565-9368-f395-3c330f407b69	1337	Osilnica
00050000-5565-9368-e042-03f39c07fdd7	8222	Otočec
00050000-5565-9368-33a7-ca32d8ae69fc	2361	Ožbalt
00050000-5565-9368-612b-e131ee8c7b5d	2231	Pernica
00050000-5565-9368-4fa2-528384786c8a	2211	Pesnica pri Mariboru
00050000-5565-9368-c257-d079ce9f3189	9203	Petrovci
00050000-5565-9368-de34-30f47f3aa91e	3301	Petrovče
00050000-5565-9368-1f17-fb7836c81302	6330	Piran/Pirano
00050000-5565-9368-7d09-936f0a662263	8255	Pišece
00050000-5565-9368-64f8-ff51c239fc56	6257	Pivka
00050000-5565-9368-1f41-2fb06632a325	6232	Planina
00050000-5565-9368-1620-5c799fb05059	3225	Planina pri Sevnici
00050000-5565-9368-f96c-5ac1c89a24ed	6276	Pobegi
00050000-5565-9368-6333-aeaad9f929b5	8312	Podbočje
00050000-5565-9368-08c8-f4539d24edf9	5243	Podbrdo
00050000-5565-9368-d7d6-101013209533	3254	Podčetrtek
00050000-5565-9368-d35a-8231e64088f6	2273	Podgorci
00050000-5565-9368-5404-8280629ca990	6216	Podgorje
00050000-5565-9368-3f1e-80231a80bf3d	2381	Podgorje pri Slovenj Gradcu
00050000-5565-9368-3aa2-82e956116187	6244	Podgrad
00050000-5565-9368-8aa6-8ae43b861421	1414	Podkum
00050000-5565-9368-6c07-edfeb508552b	2286	Podlehnik
00050000-5565-9368-8a55-3f7bcb1d0c19	5272	Podnanos
00050000-5565-9368-332c-846481762475	4244	Podnart
00050000-5565-9368-5c21-a1e10a232b9c	3241	Podplat
00050000-5565-9368-4f75-869edae492e5	3257	Podsreda
00050000-5565-9368-d3ef-b36faee80148	2363	Podvelka
00050000-5565-9368-db52-600b8c0b297e	2208	Pohorje
00050000-5565-9368-b818-985bed2e02be	2257	Polenšak
00050000-5565-9368-7d8c-3432ac15570b	1355	Polhov Gradec
00050000-5565-9368-a3dc-5f9a8111948f	4223	Poljane nad Škofjo Loko
00050000-5565-9368-52b3-338de68bdf55	2319	Poljčane
00050000-5565-9368-62b3-687283ada8a8	1272	Polšnik
00050000-5565-9368-76fe-9d35bb513eb8	3313	Polzela
00050000-5565-9368-f863-c23fc0a32406	3232	Ponikva
00050000-5565-9368-54ce-aeed870f5606	6320	Portorož/Portorose
00050000-5565-9368-9806-7a4db1b78af1	6230	Postojna
00050000-5565-9368-9733-0b8a1ebcee87	2331	Pragersko
00050000-5565-9368-5a53-551fcea52a23	3312	Prebold
00050000-5565-9368-f806-5e1163344499	4205	Preddvor
00050000-5565-9368-4180-b05fd4aba2b4	6255	Prem
00050000-5565-9368-7cc4-97fb896156f5	1352	Preserje
00050000-5565-9368-0df8-d9914b5e94dd	6258	Prestranek
00050000-5565-9368-2151-b2324deaca89	2391	Prevalje
00050000-5565-9368-00b1-fcc7ab3852e8	3262	Prevorje
00050000-5565-9368-b985-975a6202fb22	1276	Primskovo 
00050000-5565-9368-de20-34be34039886	3253	Pristava pri Mestinju
00050000-5565-9368-1294-8c238d83113c	9207	Prosenjakovci/Partosfalva
00050000-5565-9368-1cf8-2d1d4680a85d	5297	Prvačina
00050000-5565-9368-a4d4-730859b01f10	2250	Ptuj
00050000-5565-9368-4207-50e5d87e4e07	2323	Ptujska Gora
00050000-5565-9368-faf1-6b2bc80f7689	9201	Puconci
00050000-5565-9368-e11c-b68d3304e2fd	2327	Rače
00050000-5565-9368-4750-7858d48e4dea	1433	Radeče
00050000-5565-9368-cf61-34ba2d15eb56	9252	Radenci
00050000-5565-9368-310e-8697a7045cb4	2360	Radlje ob Dravi
00050000-5565-9368-0a0a-3a7a61d0ae83	1235	Radomlje
00050000-5565-9368-028f-3ed20bbb6e62	4240	Radovljica
00050000-5565-9368-0d97-cd4d69bde99f	8274	Raka
00050000-5565-9368-2720-f2b1dc3576fb	1381	Rakek
00050000-5565-9368-2aec-a6838913a3a3	4283	Rateče - Planica
00050000-5565-9368-8161-a2f78a53456f	2390	Ravne na Koroškem
00050000-5565-9368-9c12-3defec277be2	9246	Razkrižje
00050000-5565-9368-48bb-eb485c12cfdb	3332	Rečica ob Savinji
00050000-5565-9368-811f-4eae8298ac42	5292	Renče
00050000-5565-9368-e930-98d3af238791	1310	Ribnica
00050000-5565-9368-c393-60b6dd4ffb92	2364	Ribnica na Pohorju
00050000-5565-9368-ba3d-cdbb8bacd12e	3272	Rimske Toplice
00050000-5565-9368-e3d8-06d36ad78f8f	1314	Rob
00050000-5565-9368-758e-ede494db1413	5215	Ročinj
00050000-5565-9368-6e74-44d14e598a7c	3250	Rogaška Slatina
00050000-5565-9368-5d72-8c4b796f5ff7	9262	Rogašovci
00050000-5565-9368-ab36-bd3ccae83d4b	3252	Rogatec
00050000-5565-9368-a8d9-865fb09a8b54	1373	Rovte
00050000-5565-9368-b5a5-d97e37f84d22	2342	Ruše
00050000-5565-9368-afc7-9c53e759ef25	1282	Sava
00050000-5565-9368-a3ec-eeaa7ed6e129	6333	Sečovlje/Sicciole
00050000-5565-9368-2edc-a6e737b334ca	4227	Selca
00050000-5565-9368-e50a-c96d62cfd7cd	2352	Selnica ob Dravi
00050000-5565-9368-740d-09f23e1c3539	8333	Semič
00050000-5565-9368-4a5d-1c3838fc4ec1	8281	Senovo
00050000-5565-9368-23b9-9d4542dcdc00	6224	Senožeče
00050000-5565-9368-2a0c-4199a27de8ec	8290	Sevnica
00050000-5565-9368-2f06-88721968e898	6210	Sežana
00050000-5565-9368-21ce-0f68bba887ec	2214	Sladki Vrh
00050000-5565-9368-3361-7b39124ce96e	5283	Slap ob Idrijci
00050000-5565-9368-686a-2963bc47c283	2380	Slovenj Gradec
00050000-5565-9368-3426-cfe0aee8cf1b	2310	Slovenska Bistrica
00050000-5565-9368-b523-fd56671828de	3210	Slovenske Konjice
00050000-5565-9368-5b30-f71112cfcdba	1216	Smlednik
00050000-5565-9368-5edb-c8a74af965c7	5232	Soča
00050000-5565-9368-0c79-23ef9e962b27	1317	Sodražica
00050000-5565-9368-e08d-cf2a6db49bd5	3335	Solčava
00050000-5565-9368-6f7b-df26a93e13c2	5250	Solkan
00050000-5565-9368-4645-bf6352d59c87	4229	Sorica
00050000-5565-9368-5520-b7ac8affb642	4225	Sovodenj
00050000-5565-9368-921c-557291537cc6	5281	Spodnja Idrija
00050000-5565-9368-d05c-7794df8ab56c	2241	Spodnji Duplek
00050000-5565-9368-1fe7-14e136e53f98	9245	Spodnji Ivanjci
00050000-5565-9368-789e-30a71be6f8ce	2277	Središče ob Dravi
00050000-5565-9368-b83c-a8edc531ae46	4267	Srednja vas v Bohinju
00050000-5565-9368-4491-652da6c4f233	8256	Sromlje 
00050000-5565-9368-559e-70a855b36a8b	5224	Srpenica
00050000-5565-9368-945d-db66056ee2d2	1242	Stahovica
00050000-5565-9368-ade3-2f55c355f656	1332	Stara Cerkev
00050000-5565-9368-4eec-26c2feb6b78e	8342	Stari trg ob Kolpi
00050000-5565-9368-cc89-613521b0e864	1386	Stari trg pri Ložu
00050000-5565-9368-20f0-d0b4b9dc1e04	2205	Starše
00050000-5565-9368-0792-ce58d93db37f	2289	Stoperce
00050000-5565-9368-bb8c-8467182555fb	8322	Stopiče
00050000-5565-9368-cdec-62a914f6ef2a	3206	Stranice
00050000-5565-9368-16ae-abf2ef44e918	8351	Straža
00050000-5565-9368-6085-551ed2186607	1313	Struge
00050000-5565-9368-32d5-157796bdb8c9	8293	Studenec
00050000-5565-9368-d002-23181e446088	8331	Suhor
00050000-5565-9368-5a9e-97e294e3c973	2233	Sv. Ana v Slovenskih goricah
00050000-5565-9368-b4b0-71b209fcb763	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-9368-6130-ea72bd1f095e	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-9368-ede9-0f9a4a2b901b	9244	Sveti Jurij ob Ščavnici
00050000-5565-9368-66d4-47e61b5e4d17	3264	Sveti Štefan
00050000-5565-9368-708e-45cd2a1a8c9f	2258	Sveti Tomaž
00050000-5565-9368-1627-55311ccf437f	9204	Šalovci
00050000-5565-9368-0d74-75de5fe2c5df	5261	Šempas
00050000-5565-9368-2129-ae735f90b047	5290	Šempeter pri Gorici
00050000-5565-9368-0242-ea5cb54f2224	3311	Šempeter v Savinjski dolini
00050000-5565-9368-1702-7a6b92b5bfda	4208	Šenčur
00050000-5565-9368-c8a4-2ec0175bfce7	2212	Šentilj v Slovenskih goricah
00050000-5565-9368-1976-c068564e38fa	8297	Šentjanž
00050000-5565-9368-7b38-ce9c8b54d9c1	2373	Šentjanž pri Dravogradu
00050000-5565-9368-c486-70b2c4f67ad6	8310	Šentjernej
00050000-5565-9368-5096-b3b060664111	3230	Šentjur
00050000-5565-9368-abf3-9a18ae807d22	3271	Šentrupert
00050000-5565-9368-ecb5-98d31852caa8	8232	Šentrupert
00050000-5565-9368-22c5-d3d004293e4d	1296	Šentvid pri Stični
00050000-5565-9368-d4d5-a9b7f4d5ed29	8275	Škocjan
00050000-5565-9368-3cdb-d54581a4b667	6281	Škofije
00050000-5565-9368-0cc6-55b6f260c983	4220	Škofja Loka
00050000-5565-9368-c76b-e3373ba721ce	3211	Škofja vas
00050000-5565-9368-b6f0-4415273c5ac5	1291	Škofljica
00050000-5565-9368-9f21-b203d7f1d5ac	6274	Šmarje
00050000-5565-9368-bc7e-e3c845585e87	1293	Šmarje - Sap
00050000-5565-9368-5199-ae607c1f0e89	3240	Šmarje pri Jelšah
00050000-5565-9368-74f5-e1061e1d7040	8220	Šmarješke Toplice
00050000-5565-9368-806c-f8f14638db53	2315	Šmartno na Pohorju
00050000-5565-9368-a37e-cee85c5f7712	3341	Šmartno ob Dreti
00050000-5565-9368-67e7-fce6545846ca	3327	Šmartno ob Paki
00050000-5565-9368-257c-07852a16937e	1275	Šmartno pri Litiji
00050000-5565-9368-239d-62e8b5223df4	2383	Šmartno pri Slovenj Gradcu
00050000-5565-9368-9585-c500a8214654	3201	Šmartno v Rožni dolini
00050000-5565-9368-30f4-c7de5afca5c8	3325	Šoštanj
00050000-5565-9368-e675-9071ce4b3a2b	6222	Štanjel
00050000-5565-9368-9628-af280557eb64	3220	Štore
00050000-5565-9368-6d2f-32847c71fe12	3304	Tabor
00050000-5565-9368-8107-ac405acbf0e0	3221	Teharje
00050000-5565-9368-9245-7b71385d0916	9251	Tišina
00050000-5565-9368-de67-ecfdf780d07d	5220	Tolmin
00050000-5565-9368-53d1-91597df88876	3326	Topolšica
00050000-5565-9368-7dad-9655511106de	2371	Trbonje
00050000-5565-9368-8bdb-4e707ea99a5b	1420	Trbovlje
00050000-5565-9368-e408-d3ce7e836cc5	8231	Trebelno 
00050000-5565-9368-83a8-ec2ec3636e03	8210	Trebnje
00050000-5565-9368-855a-dd9f904fdcff	5252	Trnovo pri Gorici
00050000-5565-9368-c649-12fb08f737f3	2254	Trnovska vas
00050000-5565-9368-44c9-b53382916994	1222	Trojane
00050000-5565-9368-1b64-39394cff3f1f	1236	Trzin
00050000-5565-9368-be83-1935f1bcf98b	4290	Tržič
00050000-5565-9368-e7a7-c0f8f4d5571e	8295	Tržišče
00050000-5565-9368-7f6c-b6f615e8256a	1311	Turjak
00050000-5565-9368-0be4-dfffa024b706	9224	Turnišče
00050000-5565-9368-067f-fc9f10f690df	8323	Uršna sela
00050000-5565-9368-d547-e66339b2d92d	1252	Vače
00050000-5565-9368-35c8-a094f0ca5f34	3320	Velenje 
00050000-5565-9368-f570-a67b09daa300	3322	Velenje - poštni predali
00050000-5565-9368-0314-584c68391178	8212	Velika Loka
00050000-5565-9368-c367-26b876e02cf7	2274	Velika Nedelja
00050000-5565-9368-b7f8-421001319b9d	9225	Velika Polana
00050000-5565-9368-b3e8-7888d412d955	1315	Velike Lašče
00050000-5565-9368-fff3-274dd3299553	8213	Veliki Gaber
00050000-5565-9368-a297-aa2147ab5b80	9241	Veržej
00050000-5565-9368-7897-465065e03e41	1312	Videm - Dobrepolje
00050000-5565-9368-7189-2dac865285ce	2284	Videm pri Ptuju
00050000-5565-9368-0d79-22a6421f16ea	8344	Vinica
00050000-5565-9368-55f5-3fda06281de4	5271	Vipava
00050000-5565-9368-175c-6979a72a20ad	4212	Visoko
00050000-5565-9368-be85-5546742f55b8	1294	Višnja Gora
00050000-5565-9368-5111-d96807e84bb0	3205	Vitanje
00050000-5565-9368-9159-24aa4165705f	2255	Vitomarci
00050000-5565-9368-29af-446e41120c5b	1217	Vodice
00050000-5565-9368-472c-a79ff4d34774	3212	Vojnik\t
00050000-5565-9368-b191-d347cef8e328	5293	Volčja Draga
00050000-5565-9368-1cdd-08f6cbd4e52a	2232	Voličina
00050000-5565-9368-c9f2-93fde399c2ce	3305	Vransko
00050000-5565-9368-e829-22d15cab168a	6217	Vremski Britof
00050000-5565-9368-107b-bf11dfb1c2fa	1360	Vrhnika
00050000-5565-9368-7995-47d54e54331f	2365	Vuhred
00050000-5565-9368-73e4-cabf8d89ace8	2367	Vuzenica
00050000-5565-9368-15dc-293f2d1997ed	8292	Zabukovje 
00050000-5565-9368-da22-34d2006cbc14	1410	Zagorje ob Savi
00050000-5565-9368-ccc5-41a1880e06d2	1303	Zagradec
00050000-5565-9368-5ef6-71e2c179ea0a	2283	Zavrč
00050000-5565-9368-9be2-45bb87933f00	8272	Zdole 
00050000-5565-9368-d80c-8b7728fdd425	4201	Zgornja Besnica
00050000-5565-9368-a145-648605745caf	2242	Zgornja Korena
00050000-5565-9368-a156-282d8dbace2b	2201	Zgornja Kungota
00050000-5565-9368-d1b8-e69153065fab	2316	Zgornja Ložnica
00050000-5565-9368-bc1f-9879a106a2ba	2314	Zgornja Polskava
00050000-5565-9368-fccf-72b2310516b3	2213	Zgornja Velka
00050000-5565-9368-4605-0bd556ad0e55	4247	Zgornje Gorje
00050000-5565-9368-37d8-cae151ace293	4206	Zgornje Jezersko
00050000-5565-9368-1ebd-dd10aa931f9c	2285	Zgornji Leskovec
00050000-5565-9368-34f9-8c55812343a9	1432	Zidani Most
00050000-5565-9368-27c6-f856bc55a54b	3214	Zreče
00050000-5565-9368-3c5d-9fbe297afe3d	4209	Žabnica
00050000-5565-9368-70bf-d3c1657b9b61	3310	Žalec
00050000-5565-9368-145e-c7356b38053a	4228	Železniki
00050000-5565-9368-ce47-5f518933ca02	2287	Žetale
00050000-5565-9368-5987-6929eabfeb6a	4226	Žiri
00050000-5565-9368-549d-ce52aac0aecd	4274	Žirovnica
00050000-5565-9368-a91e-82655a59e103	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5251459)
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
-- TOC entry 2705 (class 0 OID 5251274)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5251352)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5251471)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5251591)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5251642)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5251500)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-9369-d7fc-941d697c79f0	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-9369-f994-d9193b1b082f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-9369-9c13-c9074e13020c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-9369-6657-53c4f3276148	0004	Mali oder	t	24	Mali oder 
00220000-5565-9369-4239-31bf9108ea87	0005	Komorni oder	t	15	Komorni oder
00220000-5565-9369-5538-3868b98c6c63	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-9369-4b05-ceff76761dc3	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5251444)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5251434)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5251631)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5251568)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5251148)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-9369-ad1a-e55772593095	00010000-5565-9369-ad3f-b852149f1144	2015-05-27 11:50:34	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO3Lb3V77odOR4iR1bB95BXPyP69P.MS2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5251510)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5251186)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-9369-a9a6-d7f683026e0b	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-9369-e24b-e167573731a6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-9369-ce66-700b7e9f4bea	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-9369-0051-04dc6685b8ad	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-9369-2b50-eb8026c8d3f3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-9369-64ce-74bd481f3014	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5251170)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-9369-ad1a-e55772593095	00020000-5565-9369-0051-04dc6685b8ad
00010000-5565-9369-ad3f-b852149f1144	00020000-5565-9369-0051-04dc6685b8ad
\.


--
-- TOC entry 2732 (class 0 OID 5251524)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5251465)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5251415)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5251739)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-9368-10f4-02f09c68416d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-9368-256a-5b5d3c6f43b4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-9368-f15c-7ef4c8f7e002	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-9368-f7f0-eaf945dbb032	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-9368-5dc2-3db010213990	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5251732)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-9368-d7f3-be6702e9176e	00000000-5565-9368-f7f0-eaf945dbb032	popa
00000000-5565-9368-92b2-66b7c4fd9de6	00000000-5565-9368-f7f0-eaf945dbb032	oseba
00000000-5565-9368-6297-b81194eea200	00000000-5565-9368-256a-5b5d3c6f43b4	prostor
00000000-5565-9368-f866-0cc48c401759	00000000-5565-9368-f7f0-eaf945dbb032	besedilo
00000000-5565-9368-ad84-6eb027d6f1c6	00000000-5565-9368-f7f0-eaf945dbb032	uprizoritev
00000000-5565-9368-9af1-04926fd82fdb	00000000-5565-9368-f7f0-eaf945dbb032	funkcija
00000000-5565-9368-6c81-f8d2a63468cb	00000000-5565-9368-f7f0-eaf945dbb032	tipfunkcije
00000000-5565-9368-e5db-e805d7eb97de	00000000-5565-9368-f7f0-eaf945dbb032	alternacija
\.


--
-- TOC entry 2748 (class 0 OID 5251727)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5251578)
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
-- TOC entry 2703 (class 0 OID 5251246)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5251421)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5251620)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-9368-a423-101264033e3a	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-9368-d94b-eb2ce9461a3a	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-9368-b97c-e6b6b7971dde	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-9368-fe0a-5ef19cde6760	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-9368-c5e2-21e6b2a74110	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-9368-931d-26fd3beddefd	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-9368-41ba-c56f8ff6f612	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-9368-a27a-6cb4b0360f7d	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-9368-cd95-33644c5d0f8d	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-9368-b969-dd05b947b2b4	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-9368-b9ff-d19c728ebc1e	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-9368-36f5-7e829d537826	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-9368-97b8-2e8024caee07	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-9368-838c-bd04bdc43b52	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-9368-7db3-31b4ad358d73	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5251309)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5251157)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-9369-ad3f-b852149f1144	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROYIOQkYaMBof8IQ33.aqSVqK3EyTi5lm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-9369-418f-729d88e0c75f	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROTWGusOThE1FqXozUkR2dZdMzpt44kuW	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-9369-3165-51fe093fd0c6	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROIa6dGcuF85/r2T.5sIRmQ82yd9NtCfO	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-9369-c443-29cc138d936e	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxRODC5ucb8ypc.BVjcl4pJT5rqQBLLSlFC	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-9369-c029-65c4f5518475	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROUzDlN4gp0YujzNjI06Q6uAqrNJvpjRW	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-9369-8b6c-69af76a1da3b	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROkHwDQHE2rtjyU/QV9mbnyqP2r80pE.K	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-9369-e7a5-134ef835846a	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROLb6oafhOxQzSf/OK51URursbtuWII82	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-9369-71dc-1143c31d3bb8	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROxpcrDZ521PaN4dOd8vB0V8Z.EeBAGXq	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-9369-14ca-24cec9569827	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROq0Kd36ju2caxyzp1T00iX1OA81aON8S	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-9369-48f6-d555ab8106be	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxRODmlGYxUDfVGoNMJKJjw/gWQJkQ4F8KK	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-9369-fe90-71d5c87b58b3	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxRODJ0bMYBM2i8yTCaYE8gNPmdnEBlLhPm	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-9369-ad1a-e55772593095	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5251675)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-9369-fb92-6f64ddb62b24	00160000-5565-9369-6d8e-e9c5231b509d	00150000-5565-9368-6e78-65d5d49bbe91	00140000-5565-9368-c9fe-eea772c4db2f	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-9369-4239-31bf9108ea87
000e0000-5565-9369-7d14-581ba874d853	00160000-5565-9369-08e5-cc16c34b6f62	00150000-5565-9368-63c0-db859c4d27dd	00140000-5565-9368-2c97-41edbbb353b1	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-9369-5538-3868b98c6c63
\.


--
-- TOC entry 2713 (class 0 OID 5251367)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5251492)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5251560)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5251399)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5251665)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-9368-c9fe-eea772c4db2f	Drama	drama (SURS 01)
00140000-5565-9368-b0c2-d5f1dbf7b505	Opera	opera (SURS 02)
00140000-5565-9368-ebaf-346899b636be	Balet	balet (SURS 03)
00140000-5565-9368-49fd-055b6078d06c	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-9368-8f9c-409fa272fcb0	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-9368-2c97-41edbbb353b1	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-9368-e24b-c08049c7b80c	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5251550)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-9368-f51a-fa70e2e8b8b5	Opera	opera
00150000-5565-9368-c840-fab05dda6777	Opereta	opereta
00150000-5565-9368-0c73-cb64903b8bd3	Balet	balet
00150000-5565-9368-1f9d-0fa903e9b0be	Plesne prireditve	plesne prireditve
00150000-5565-9368-11bc-e0a777f6060b	Lutkovno gledališče	lutkovno gledališče
00150000-5565-9368-025a-2c860544a079	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-9368-eca6-b58ba57ad453	Biografska drama	biografska drama
00150000-5565-9368-6e78-65d5d49bbe91	Komedija	komedija
00150000-5565-9368-439c-936a267d0309	Črna komedija	črna komedija
00150000-5565-9368-de75-72f3d4a91472	E-igra	E-igra
00150000-5565-9368-63c0-db859c4d27dd	Kriminalka	kriminalka
00150000-5565-9368-a6eb-09968ec26e6b	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5251211)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5251720)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5251710)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5251619)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 5251389)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5251414)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 5251335)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 5251546)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 5251365)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 5251408)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 5251349)
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
-- TOC entry 2406 (class 2606 OID 5251457)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 5251484)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 5251307)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5251220)
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
-- TOC entry 2321 (class 2606 OID 5251243)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5251200)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5251185)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 5251490)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 5251523)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5251660)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 5251271)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 5251295)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5251463)
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
-- TOC entry 2336 (class 2606 OID 5251285)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5251356)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5251475)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5251603)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5251647)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 5251507)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5251448)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5251439)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5251641)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 5251575)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5251156)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5251514)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5251174)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5251194)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5251532)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 5251470)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 5251420)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 5251745)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 5251736)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5251731)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 5251588)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 5251251)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 5251430)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5251630)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5251320)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5251169)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5251690)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5251374)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5251498)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5251566)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5251403)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 5251674)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 5251559)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 5251396)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 5251589)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 5251590)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 5251273)
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
-- TOC entry 2419 (class 1259 OID 5251491)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 5251477)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 5251476)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 5251375)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5251549)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 5251547)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 5251548)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 5251351)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 5251350)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5251662)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 5251663)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 5251664)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 5251695)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 5251692)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 5251694)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 5251693)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 5251322)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 5251321)
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
-- TOC entry 2429 (class 1259 OID 5251515)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 5251409)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5251201)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5251202)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 5251535)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 5251534)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 5251533)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 5251357)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 5251359)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 5251358)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2499 (class 1259 OID 5251738)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 5251443)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 5251441)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 5251440)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 5251442)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5251175)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5251176)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 5251499)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 5251464)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 5251576)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 5251577)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 5251287)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 5251286)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 5251288)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 5251604)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 5251605)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5251724)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5251723)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5251726)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5251722)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5251725)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 5251567)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 5251452)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 5251451)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 5251449)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 5251450)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5251712)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5251711)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 5251366)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5251222)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5251221)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 5251252)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 5251253)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 5251433)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 5251432)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 5251431)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 5251398)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 5251394)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 5251391)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 5251392)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 5251390)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 5251395)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 5251393)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 5251272)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5251336)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5251338)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 5251337)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 5251339)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 5251458)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 5251661)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 5251691)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5251244)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5251245)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2505 (class 1259 OID 5251746)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 5251308)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2502 (class 1259 OID 5251737)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 5251509)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 5251508)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 5251721)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 5251296)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 5251648)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5251195)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 5251397)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5251879)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5251864)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5251869)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5251889)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5251859)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5251884)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5251874)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5252034)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5252039)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5251794)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5251974)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5251969)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5251964)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5251854)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5252014)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5252004)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5252009)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5251829)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5251824)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5251954)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5252059)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5252064)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5252069)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5252089)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5252074)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5252084)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5252079)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5251819)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5251814)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 5251779)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5251984)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5251894)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2509 (class 2606 OID 5251759)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 5251764)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5251999)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5251994)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5251989)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5251834)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5251844)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5251839)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5252129)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5251929)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5251919)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5251914)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5251924)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2507 (class 2606 OID 5251749)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 5251754)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5251979)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5251959)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5252024)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5252029)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5251804)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5251799)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5251809)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5252044)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5252049)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5252114)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5252109)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5252124)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5252104)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5252119)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5252019)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5251949)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5251944)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5251934)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5251939)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5252099)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5252094)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5251849)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5252054)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5251774)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2511 (class 2606 OID 5251769)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5251784)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5251789)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5251909)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5251904)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5251899)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 11:50:34 CEST

--
-- PostgreSQL database dump complete
--

