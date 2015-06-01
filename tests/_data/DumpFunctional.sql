--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-06-01 10:08:20 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 154437)
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
-- TOC entry 213 (class 1259 OID 154776)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
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
    aktivna boolean
);


--
-- TOC entry 214 (class 1259 OID 154790)
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
-- TOC entry 215 (class 1259 OID 154807)
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
-- TOC entry 191 (class 1259 OID 154588)
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
-- TOC entry 192 (class 1259 OID 154611)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 154446)
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
-- TOC entry 228 (class 1259 OID 154968)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    tip_programske_enote_id integer,
    program_dela_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(10,0) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(10,0) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(10,0) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    utemeljitev text NOT NULL,
    tip character varying(15) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 154821)
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
    maxprekirvanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 193 (class 1259 OID 154616)
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
-- TOC entry 194 (class 1259 OID 154627)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 182 (class 1259 OID 154463)
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
-- TOC entry 200 (class 1259 OID 154674)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 201 (class 1259 OID 154680)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 183 (class 1259 OID 154475)
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
-- TOC entry 184 (class 1259 OID 154487)
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
-- TOC entry 185 (class 1259 OID 154498)
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
-- TOC entry 172 (class 1259 OID 122613)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 173 (class 1259 OID 154380)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 154410)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 154687)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 154694)
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
-- TOC entry 217 (class 1259 OID 154836)
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
-- TOC entry 186 (class 1259 OID 154523)
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
-- TOC entry 187 (class 1259 OID 154543)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 154702)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 154551)
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
-- TOC entry 195 (class 1259 OID 154633)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 154708)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 154852)
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
-- TOC entry 219 (class 1259 OID 154867)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 154994)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    potrjenprogram boolean NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 155003)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 236 (class 1259 OID 155052)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 231 (class 1259 OID 155009)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id integer NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    transportnistroski numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 237 (class 1259 OID 155054)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 206 (class 1259 OID 154715)
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
-- TOC entry 207 (class 1259 OID 154725)
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
-- TOC entry 208 (class 1259 OID 154734)
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
-- TOC entry 220 (class 1259 OID 154875)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 154886)
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
-- TOC entry 175 (class 1259 OID 154391)
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
-- TOC entry 174 (class 1259 OID 154389)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 154744)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 154400)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 154430)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 154750)
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
-- TOC entry 211 (class 1259 OID 154762)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 154641)
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
-- TOC entry 233 (class 1259 OID 155028)
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
-- TOC entry 234 (class 1259 OID 155039)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 155047)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 222 (class 1259 OID 154896)
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
-- TOC entry 189 (class 1259 OID 154566)
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
-- TOC entry 199 (class 1259 OID 154661)
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
-- TOC entry 223 (class 1259 OID 154909)
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
-- TOC entry 232 (class 1259 OID 155017)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id integer NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(10,0) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(10,0) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 155056)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 190 (class 1259 OID 154574)
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
-- TOC entry 178 (class 1259 OID 154417)
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
-- TOC entry 224 (class 1259 OID 154920)
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
-- TOC entry 197 (class 1259 OID 154647)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 212 (class 1259 OID 154768)
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
-- TOC entry 225 (class 1259 OID 154941)
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
-- TOC entry 198 (class 1259 OID 154656)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 154948)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 154958)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2431 (class 2604 OID 154394)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3027 (class 0 OID 154437)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 154776)
-- Dependencies: 213
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556c-12ef-96f5-d24769638587	000d0000-556c-12ef-d655-38ad290697dc	\N	00090000-556c-12ef-4112-1203e2fc4d2a	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556c-12ef-76a3-7c70b0bd0e7e	000d0000-556c-12ef-c5ec-289648ba7107	\N	00090000-556c-12ef-c082-0aea04613f9e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556c-12ef-4031-cc825e632204	000d0000-556c-12ef-c80a-de2af995bf37	\N	00090000-556c-12ef-884c-db0dee638d41	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556c-12ef-48ca-41d4fba4e12f	000d0000-556c-12ef-2868-41a37da8203e	\N	00090000-556c-12ef-aeb6-fd985d7368f0	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556c-12f0-909f-dc11254e047b	000d0000-556c-12ef-842f-2ee876c58894	\N	00090000-556c-12ef-5537-f168a4960174	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3061 (class 0 OID 154790)
-- Dependencies: 214
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 154807)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556c-12ef-4ff0-a61f0eb75568	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556c-12ef-9ab4-3629023eb290	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556c-12ef-6355-692d0a4f8c8c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 3038 (class 0 OID 154588)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556c-12ef-20cd-c47f238eb4dd	\N	\N	00200000-556c-12ef-702b-97130cc9a9f6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556c-12ef-98ab-5a9f8a781cec	\N	\N	00200000-556c-12ef-610f-1118df55a15e	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
\.


--
-- TOC entry 3039 (class 0 OID 154611)
-- Dependencies: 192
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 154446)
-- Dependencies: 181
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556c-12ed-4696-f2ca2e8ae0e6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556c-12ed-42df-e54d7ccd59cd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556c-12ed-b4a7-ae1ade9098a7	AL	ALB	008	Albania 	Albanija	\N
00040000-556c-12ed-9a2b-36c0bcb44510	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556c-12ed-2986-006e9ea6edb3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556c-12ed-314c-46abc8fcaaba	AD	AND	020	Andorra 	Andora	\N
00040000-556c-12ed-8f04-3846abaef518	AO	AGO	024	Angola 	Angola	\N
00040000-556c-12ed-5ed7-f7fee7aa0ba5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556c-12ed-efba-f3ae1c92c50d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556c-12ed-24cc-91fbba798055	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-12ed-5987-652b45612135	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556c-12ed-a2b0-7827d50f73c8	AM	ARM	051	Armenia 	Armenija	\N
00040000-556c-12ed-c8b1-a3e182f33614	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556c-12ed-61da-16bc5c2925c6	AU	AUS	036	Australia 	Avstralija	\N
00040000-556c-12ed-5ec7-7526653e12e2	AT	AUT	040	Austria 	Avstrija	\N
00040000-556c-12ed-1ece-11ae3b7db718	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556c-12ed-ee05-7ef0dfd3a5b3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556c-12ed-1c3f-4ddc366ba0f0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556c-12ed-c8cd-76146af9b8d9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556c-12ed-5723-990dabecf1be	BB	BRB	052	Barbados 	Barbados	\N
00040000-556c-12ed-efcf-dac5f6c3bb9f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556c-12ed-2689-16c4f874a014	BE	BEL	056	Belgium 	Belgija	\N
00040000-556c-12ed-38c8-c1d2b3f5bcc1	BZ	BLZ	084	Belize 	Belize	\N
00040000-556c-12ed-616f-37568f883628	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556c-12ed-bf8c-f5e8b9326ec7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556c-12ed-4bfc-13764137bac4	BT	BTN	064	Bhutan 	Butan	\N
00040000-556c-12ed-6882-774d301ce0fa	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556c-12ed-e71c-69a7712ffce1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556c-12ed-c84d-c1385f6bf0d4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556c-12ed-2483-6961d6545e44	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556c-12ed-5ba3-495d6307d9af	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556c-12ed-129c-15f61ff37db3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556c-12ed-b3e9-045b9231c7a4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556c-12ed-9598-eac224b352fb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556c-12ed-626e-fce52e98d600	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556c-12ed-b262-e03a922ed4f3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556c-12ed-fff7-fe6ea8ce1f19	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556c-12ed-2b3f-bad49b1efd0a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556c-12ed-5289-f6b5f4dcfe18	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556c-12ed-aafb-7be13a140dc1	CA	CAN	124	Canada 	Kanada	\N
00040000-556c-12ed-6d82-f5e761a30870	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556c-12ed-678d-b1089e7b7e84	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556c-12ed-26c2-3fc61cf9c1ce	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556c-12ed-de03-dc9174e1fc82	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556c-12ed-8ae0-ba492dc6e261	CL	CHL	152	Chile 	Čile	\N
00040000-556c-12ed-3dc7-a18d27307a50	CN	CHN	156	China 	Kitajska	\N
00040000-556c-12ed-e4d3-d716c30e0d52	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556c-12ed-17d0-32229977d6d5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556c-12ed-4094-64f07cecf566	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556c-12ed-3ec6-20d6d810142e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556c-12ed-8814-509a972151fa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556c-12ed-e5e3-015926f22f7a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556c-12ed-b989-a6128fc561bd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556c-12ed-8251-f8b08c9ad948	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556c-12ed-ed82-778cc1344a62	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556c-12ed-ccf7-c35201575fbc	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556c-12ed-1333-c8de283a4f27	CU	CUB	192	Cuba 	Kuba	\N
00040000-556c-12ed-d81d-c821d699f93f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556c-12ed-8356-aed729825c19	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556c-12ed-4d0f-490b4e00e3c4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556c-12ed-e1bd-90f0c368057e	DK	DNK	208	Denmark 	Danska	\N
00040000-556c-12ed-36b3-ac5e9679abd0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556c-12ed-502f-1f1d1e016d22	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-12ed-6372-1c0b8ebc17a1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556c-12ed-0010-e9feea39e20b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556c-12ed-1ca6-1e065f8fee4c	EG	EGY	818	Egypt 	Egipt	\N
00040000-556c-12ed-d994-67a05b6618d3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556c-12ed-a9f4-f959946ccde6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556c-12ed-a44f-79b0defb38da	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556c-12ed-3047-e90a36546cd3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556c-12ed-8c13-ead2cd6fdb58	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556c-12ed-1eba-8bff4922e73f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556c-12ed-bda1-498b2e8d7eca	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556c-12ed-adae-d0030ae7be24	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556c-12ed-aa02-737e33018ab8	FI	FIN	246	Finland 	Finska	\N
00040000-556c-12ed-0a93-a16e1ded16ef	FR	FRA	250	France 	Francija	\N
00040000-556c-12ed-bf7b-74f94e58633b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556c-12ed-5d7b-575540f3b887	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556c-12ed-3074-b52fda2fab6b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556c-12ed-24a3-7939bfe2feb9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556c-12ed-f44d-aa21202f650d	GA	GAB	266	Gabon 	Gabon	\N
00040000-556c-12ed-554b-e2b8f61fa70c	GM	GMB	270	Gambia 	Gambija	\N
00040000-556c-12ed-2c54-4c96f4fda71c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556c-12ed-64c0-dad5c068095d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556c-12ed-1302-3cbbf4343872	GH	GHA	288	Ghana 	Gana	\N
00040000-556c-12ed-72af-31654e4ebab1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556c-12ed-f293-0b2dcb23bc06	GR	GRC	300	Greece 	Grčija	\N
00040000-556c-12ed-20ce-cc3da4b00e85	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556c-12ed-9325-b07bb05dc941	GD	GRD	308	Grenada 	Grenada	\N
00040000-556c-12ed-7cad-b3bb2ff70eed	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556c-12ed-3421-4f555ad01a62	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556c-12ed-33b7-10f81169f432	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556c-12ed-2ea3-f4daecac3d7a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556c-12ed-5be7-dadc45f6866f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556c-12ed-b9ff-9a00feb43226	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556c-12ed-ea8b-fdce1b5e826a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556c-12ed-9c90-197d79deee5a	HT	HTI	332	Haiti 	Haiti	\N
00040000-556c-12ed-79bf-02cf2e3459c9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556c-12ed-f397-dada410668b8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556c-12ed-aeae-e126f0a4ebdb	HN	HND	340	Honduras 	Honduras	\N
00040000-556c-12ed-c206-d585aeaf9197	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556c-12ed-751c-73310f2705df	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556c-12ed-9e29-60d2bd374c28	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556c-12ed-e9d3-28b17dd35e0b	IN	IND	356	India 	Indija	\N
00040000-556c-12ed-753f-19c40bb4479e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556c-12ed-5221-634764f2d641	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556c-12ed-34d5-ca62b050c5f3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556c-12ed-5457-6d2a5086613d	IE	IRL	372	Ireland 	Irska	\N
00040000-556c-12ed-3437-642fdfd14995	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556c-12ed-f1c1-daf176af1a23	IL	ISR	376	Israel 	Izrael	\N
00040000-556c-12ed-4b90-5eaa2471fd88	IT	ITA	380	Italy 	Italija	\N
00040000-556c-12ed-d1ec-55dde851d0bc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556c-12ed-9cd7-49d1c2fd6978	JP	JPN	392	Japan 	Japonska	\N
00040000-556c-12ed-b687-aa8a639fe3ef	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556c-12ed-d3db-a8ae5855a0f2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556c-12ed-b67d-dc646c8d7e1b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556c-12ed-8284-fab00835c277	KE	KEN	404	Kenya 	Kenija	\N
00040000-556c-12ed-07e9-ef095ac446b4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556c-12ed-0651-340b4c5ca328	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556c-12ed-6c6d-0e2c234519cb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556c-12ed-9f21-ec4ac297fb33	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556c-12ed-e5bd-eddd6c3e86cf	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556c-12ed-8fb0-8110f1993f59	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556c-12ed-5d6f-cf1d578b3b40	LV	LVA	428	Latvia 	Latvija	\N
00040000-556c-12ed-0632-a0547e9e993d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556c-12ed-e706-e417ace9d942	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556c-12ed-bdf4-26712b647b59	LR	LBR	430	Liberia 	Liberija	\N
00040000-556c-12ed-3a6a-8de3de836e09	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556c-12ed-3a6f-083e99e196ba	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556c-12ed-366e-84577f07e807	LT	LTU	440	Lithuania 	Litva	\N
00040000-556c-12ed-5f00-8b69238d1b15	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556c-12ed-7a67-a4749a23bf7d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556c-12ed-e72e-3f2576866090	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556c-12ed-4b21-0aa4e0a887ad	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556c-12ed-a56d-25054d2471c6	MW	MWI	454	Malawi 	Malavi	\N
00040000-556c-12ed-9e9b-212aaa3d1afc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556c-12ed-5706-938673ee54bb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556c-12ed-78b3-871afac1b8d6	ML	MLI	466	Mali 	Mali	\N
00040000-556c-12ed-0669-bfab8ef6c340	MT	MLT	470	Malta 	Malta	\N
00040000-556c-12ed-f446-8739d4adbdf1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556c-12ed-c559-516dbb74b8ee	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556c-12ed-89df-8d6c8da51f97	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556c-12ed-0a76-726354568871	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556c-12ed-f685-2078549d93bb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556c-12ed-6f47-2cd24886145c	MX	MEX	484	Mexico 	Mehika	\N
00040000-556c-12ed-d2c3-dfd43490f5ee	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556c-12ed-0fd8-1765ecfcc8b4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556c-12ed-d8c4-4ba5d503cf82	MC	MCO	492	Monaco 	Monako	\N
00040000-556c-12ed-b7dc-905b8c38536b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556c-12ed-f741-2ee75a6d4dc4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556c-12ed-7707-f39626d3838b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556c-12ed-ca43-e8e1ab76d38c	MA	MAR	504	Morocco 	Maroko	\N
00040000-556c-12ed-f85f-90fff5b9811b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556c-12ed-d283-9bab62205edc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556c-12ed-0b1f-ef58c9ca3b3b	NA	NAM	516	Namibia 	Namibija	\N
00040000-556c-12ed-1029-e12bbc4a8e9c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556c-12ed-f8d8-427fd762a213	NP	NPL	524	Nepal 	Nepal	\N
00040000-556c-12ed-4945-f3ed79cc640f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556c-12ed-7356-0492bdcbf280	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556c-12ed-395d-aa80947e457e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556c-12ed-48dd-46106b8c080f	NE	NER	562	Niger 	Niger 	\N
00040000-556c-12ed-6809-c4a35cd79d85	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556c-12ed-71e7-cb761b384c7d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556c-12ed-1d69-3a154141ec6d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556c-12ed-4e51-cd5a25d53763	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556c-12ed-d7b9-9637676c539c	NO	NOR	578	Norway 	Norveška	\N
00040000-556c-12ed-f56f-22b9f7984dbb	OM	OMN	512	Oman 	Oman	\N
00040000-556c-12ed-fb78-7df5bf923b40	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556c-12ed-13cf-78d38c2f0183	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556c-12ed-6e3c-1683500de6bd	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556c-12ed-d1ce-c63877ea30aa	PA	PAN	591	Panama 	Panama	\N
00040000-556c-12ed-9878-46d70bde261a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556c-12ed-1df3-ab57d5c0a5ea	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556c-12ed-47a8-87d30f6728f6	PE	PER	604	Peru 	Peru	\N
00040000-556c-12ed-6074-c58788fa63bc	PH	PHL	608	Philippines 	Filipini	\N
00040000-556c-12ed-c636-c90b1b7cf8ff	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556c-12ed-5bc7-c088d2d1f42d	PL	POL	616	Poland 	Poljska	\N
00040000-556c-12ed-3474-da12bf2afbf5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556c-12ed-2eb6-2b14b1b90a37	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556c-12ed-58cd-9966cba679f6	QA	QAT	634	Qatar 	Katar	\N
00040000-556c-12ed-bc94-79ad03a870e5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556c-12ed-61b6-98a57ac85aa1	RO	ROU	642	Romania 	Romunija	\N
00040000-556c-12ed-1186-43f57cd5f16c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556c-12ed-8cd2-023df0012f49	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556c-12ed-246a-e7eacbec7dca	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556c-12ed-1553-c52e3d0f2afb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556c-12ed-40c1-8241dceae6cd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556c-12ed-fcae-4398c0f98637	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556c-12ed-a4c1-5523b1d4144e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556c-12ed-5a94-11a11018ddb6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556c-12ed-6556-a86b00dcf2da	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556c-12ed-c186-d046f87a6ace	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556c-12ed-e365-fd58245f804f	SM	SMR	674	San Marino 	San Marino	\N
00040000-556c-12ed-6a80-d3d5ca96d681	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556c-12ed-06c2-fdd90b9623dc	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556c-12ed-219c-76cb02cf1c93	SN	SEN	686	Senegal 	Senegal	\N
00040000-556c-12ed-e42c-47ed012851f6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556c-12ed-7acf-1321ae239089	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556c-12ed-1e47-79367218e23f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556c-12ed-79af-903eb164cd1e	SG	SGP	702	Singapore 	Singapur	\N
00040000-556c-12ed-92aa-0921705a30db	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556c-12ed-0167-db98c237cc06	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556c-12ed-059d-10bf62135363	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556c-12ed-0e07-592cde7417d9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556c-12ed-b4de-b8c15c080f5e	SO	SOM	706	Somalia 	Somalija	\N
00040000-556c-12ed-d26c-27f929323f67	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556c-12ed-d940-f4849760a254	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556c-12ed-ecc3-e989556785a5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556c-12ed-fbad-480d1f2fe03d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556c-12ed-2314-0b08096ddca7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556c-12ed-e011-867e316cd049	SD	SDN	729	Sudan 	Sudan	\N
00040000-556c-12ed-9552-056631eea63e	SR	SUR	740	Suriname 	Surinam	\N
00040000-556c-12ed-5cb7-da59409c502a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556c-12ed-4cfb-d6f6ac46315e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556c-12ed-b0ca-0372f486c2d9	SE	SWE	752	Sweden 	Švedska	\N
00040000-556c-12ed-b428-f19aa3a1bf6d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556c-12ed-d02a-b992dbb70482	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556c-12ed-6e98-89a5d79059ee	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556c-12ed-b37e-59296f0200f4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556c-12ed-3bb5-50f6303d2087	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556c-12ed-8093-00fe6f342ee7	TH	THA	764	Thailand 	Tajska	\N
00040000-556c-12ee-b683-f4423ab821f7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556c-12ee-019b-467e147f8b6a	TG	TGO	768	Togo 	Togo	\N
00040000-556c-12ee-334f-d1a9438fcebd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556c-12ee-f239-a81bae834b66	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556c-12ee-7b55-4bcd40b41af4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556c-12ee-2691-a319c719187f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556c-12ee-4f39-ecbc249eccc4	TR	TUR	792	Turkey 	Turčija	\N
00040000-556c-12ee-c6c0-19b7b83f0b5a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556c-12ee-60d0-94ca7266ec69	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-12ee-f8b2-c60d5fa1f60e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556c-12ee-03b2-ab3582547f73	UG	UGA	800	Uganda 	Uganda	\N
00040000-556c-12ee-6911-2efd1cd74cfb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556c-12ee-eab3-1c30618c5319	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556c-12ee-4c0e-17b57b1d6781	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556c-12ee-b31d-a27ecbafcae7	US	USA	840	United States 	Združene države Amerike	\N
00040000-556c-12ee-f95f-f8d72f2ab799	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556c-12ee-a78f-13ddf989b9a4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556c-12ee-e410-34d9910d2ac5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556c-12ee-7c5c-1b585f059a2b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556c-12ee-d67c-b47ae7622891	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556c-12ee-0be9-c138df84a319	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556c-12ee-7d12-7113185316b5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-12ee-344e-9d4ff4c75860	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556c-12ee-475b-0b197234a24d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556c-12ee-7451-e254cdab035f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556c-12ee-b480-dc9fde2b23c3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556c-12ee-78df-ebeb55735854	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556c-12ee-1b9f-8abcf337f35c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3075 (class 0 OID 154968)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 154821)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556c-12ef-71eb-ef408d95ced4	000e0000-556c-12ef-7016-10bb3bc1e0b4	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556c-12ee-3623-f1aa4f63b1e4
000d0000-556c-12ef-d655-38ad290697dc	000e0000-556c-12ef-7016-10bb3bc1e0b4	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556c-12ee-3623-f1aa4f63b1e4
000d0000-556c-12ef-c5ec-289648ba7107	000e0000-556c-12ef-7016-10bb3bc1e0b4	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556c-12ee-f5f4-dfd208fc5566
000d0000-556c-12ef-c80a-de2af995bf37	000e0000-556c-12ef-7016-10bb3bc1e0b4	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556c-12ee-8554-91e4ff6d2d4b
000d0000-556c-12ef-2868-41a37da8203e	000e0000-556c-12ef-7016-10bb3bc1e0b4	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556c-12ee-8554-91e4ff6d2d4b
000d0000-556c-12ef-842f-2ee876c58894	000e0000-556c-12ef-7016-10bb3bc1e0b4	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556c-12ee-8554-91e4ff6d2d4b
\.


--
-- TOC entry 3040 (class 0 OID 154616)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 154627)
-- Dependencies: 194
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 154463)
-- Dependencies: 182
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 154674)
-- Dependencies: 200
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 154680)
-- Dependencies: 201
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 154475)
-- Dependencies: 183
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556c-12ee-9b54-ba2941a2aa44	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556c-12ee-8093-96b20da959f4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556c-12ee-349e-9346ce09dac4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556c-12ee-caa5-e05a8b9c684d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556c-12ee-710f-d275203bf75c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556c-12ee-603f-7bc1fe8f05b2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556c-12ee-12c0-76a116aa5bb9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556c-12ee-631a-a1a9291ef5e9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556c-12ee-2793-151522891140	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556c-12ee-4ce5-43e74a8ea60d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556c-12ee-5223-655dee11bd49	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556c-12ee-0eec-bba967869f89	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556c-12ee-109a-b9656525cd09	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-12ee-9124-0451cf0665bf	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-12ee-c611-8d988ba62ffb	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556c-12ee-325d-69f263bbac59	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 3031 (class 0 OID 154487)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556c-12ee-6d35-30e2c4a09ab7	00000000-556c-12ee-710f-d275203bf75c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556c-12ee-8de6-6692c38f0279	00000000-556c-12ee-710f-d275203bf75c	00010000-556c-12ee-6bd4-f4d1201e9e01	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556c-12ee-5bd4-09a0a5d7be35	00000000-556c-12ee-603f-7bc1fe8f05b2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3032 (class 0 OID 154498)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556c-12ef-f98e-839863293871	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556c-12ef-aeb6-fd985d7368f0	00010000-556c-12ef-cad2-ee312a2e1977	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556c-12ef-884c-db0dee638d41	00010000-556c-12ef-5505-dba509eeb1ec	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556c-12ef-ddc2-63af467e58f3	\N	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556c-12ef-c8bb-a6a600845ae3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556c-12ef-0eed-bc501d2915bb	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556c-12ef-fe66-6e2b942e5751	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556c-12ef-a6ac-340cd6bb15fe	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556c-12ef-4112-1203e2fc4d2a	00010000-556c-12ef-c2fe-9b2f53b8f13d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556c-12ef-c082-0aea04613f9e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556c-12ef-d70c-cc685ac106c0	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556c-12ef-5537-f168a4960174	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3019 (class 0 OID 122613)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 154380)
-- Dependencies: 173
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556c-12ee-34b6-c66e5df39fe2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556c-12ee-f57f-de4d66e8e565	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556c-12ee-4f67-904051666609	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556c-12ee-9aac-e42ce094f911	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556c-12ee-6ae2-90c01ff269cd	Abonma-read	Abonma - branje	f
00030000-556c-12ee-fe6b-1a34c6fdd93b	Abonma-write	Abonma - spreminjanje	f
00030000-556c-12ee-f46b-ed1991cb0e3e	Alternacija-read	Alternacija - branje	f
00030000-556c-12ee-7853-ccb3a56d3966	Alternacija-write	Alternacija - spreminjanje	f
00030000-556c-12ee-6f56-c6d14969d779	Arhivalija-read	Arhivalija - branje	f
00030000-556c-12ee-6165-58cbca346f58	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556c-12ee-02e7-dd569885bfb2	Besedilo-read	Besedilo - branje	f
00030000-556c-12ee-5185-2c867a2eed71	Besedilo-write	Besedilo - spreminjanje	f
00030000-556c-12ee-1b67-23c3c92135dd	DogodekIzven-read	DogodekIzven - branje	f
00030000-556c-12ee-2f15-b150bd0de7e8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556c-12ee-5828-072a90ec3033	Dogodek-read	Dogodek - branje	f
00030000-556c-12ee-1b0b-82fd90dccaa0	Dogodek-write	Dogodek - spreminjanje	f
00030000-556c-12ee-e129-7f97b8c92d36	Drzava-read	Drzava - branje	f
00030000-556c-12ee-5670-6a1ec05fd04d	Drzava-write	Drzava - spreminjanje	f
00030000-556c-12ee-4e6c-446e13f5391a	Funkcija-read	Funkcija - branje	f
00030000-556c-12ee-447c-9bfd15e7ead8	Funkcija-write	Funkcija - spreminjanje	f
00030000-556c-12ee-83b4-8a141f59f3b0	Gostovanje-read	Gostovanje - branje	f
00030000-556c-12ee-f61d-dc72f3fcc6b1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556c-12ee-992a-a551ac581233	Gostujoca-read	Gostujoca - branje	f
00030000-556c-12ee-9f2b-c03a2ed13a7b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556c-12ee-2460-2115c86f0930	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556c-12ee-e2f3-bf1686b992ac	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556c-12ee-e3cf-8c13349ab492	Kupec-read	Kupec - branje	f
00030000-556c-12ee-edc0-69cdb35c0f69	Kupec-write	Kupec - spreminjanje	f
00030000-556c-12ee-52f9-76b0754d6f5a	NacinPlacina-read	NacinPlacina - branje	f
00030000-556c-12ee-195a-fca324734558	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556c-12ee-91d9-63968ad3c765	Option-read	Option - branje	f
00030000-556c-12ee-1f0d-8f05a3766faf	Option-write	Option - spreminjanje	f
00030000-556c-12ee-53ef-82decbf2ae1f	OptionValue-read	OptionValue - branje	f
00030000-556c-12ee-add8-618218160709	OptionValue-write	OptionValue - spreminjanje	f
00030000-556c-12ee-4eab-af1f562ef151	Oseba-read	Oseba - branje	f
00030000-556c-12ee-79f2-3ec8b66c328b	Oseba-write	Oseba - spreminjanje	f
00030000-556c-12ee-3b13-c0b7cf675be4	Permission-read	Permission - branje	f
00030000-556c-12ee-d156-c8670d35b3cd	Permission-write	Permission - spreminjanje	f
00030000-556c-12ee-7f33-c10f0b486925	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556c-12ee-5c61-19cffbd081b1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556c-12ee-e999-3feb875e68e7	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556c-12ee-2ff7-0145e926543f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556c-12ee-3af2-e7dc197499b3	Pogodba-read	Pogodba - branje	f
00030000-556c-12ee-8d2f-869504ef70d6	Pogodba-write	Pogodba - spreminjanje	f
00030000-556c-12ee-55c4-dbdbcde41c58	Popa-read	Popa - branje	f
00030000-556c-12ee-b5be-4b759f8aa1cd	Popa-write	Popa - spreminjanje	f
00030000-556c-12ee-155b-5d26e4fde2a5	Posta-read	Posta - branje	f
00030000-556c-12ee-d9e3-8c3f54066357	Posta-write	Posta - spreminjanje	f
00030000-556c-12ee-e912-a64463cf56e8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556c-12ee-047d-56775d900e8c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556c-12ee-7e98-bed0cface851	PostniNaslov-read	PostniNaslov - branje	f
00030000-556c-12ee-42e6-2199d0c04c97	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556c-12ee-c289-d36b0392f2cd	Predstava-read	Predstava - branje	f
00030000-556c-12ee-8fd0-7694be3420d5	Predstava-write	Predstava - spreminjanje	f
00030000-556c-12ee-8220-d7148badb18e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556c-12ee-5cfc-3cc421cfbc44	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556c-12ee-f73e-472e7955477e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556c-12ee-2d63-0a916d8933a9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556c-12ee-b0d8-c0e4a9e0ad2a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556c-12ee-5ff2-8b718920cd25	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556c-12ee-53e7-ebf23ebd3550	Prostor-read	Prostor - branje	f
00030000-556c-12ee-ec52-5f4e8566a9a3	Prostor-write	Prostor - spreminjanje	f
00030000-556c-12ee-d3a8-eae138c074a4	Racun-read	Racun - branje	f
00030000-556c-12ee-e1af-86471a2787f8	Racun-write	Racun - spreminjanje	f
00030000-556c-12ee-34fa-ae5c81622033	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556c-12ee-351f-2cfe89ae549a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556c-12ee-3a2f-b5725bb8ebe7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556c-12ee-c0f8-45005f52d8ad	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556c-12ee-7ba8-1b9f13880bf9	Rekvizit-read	Rekvizit - branje	f
00030000-556c-12ee-e315-fa315cfc43ec	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556c-12ee-7c28-7513c276b8ea	Revizija-read	Revizija - branje	f
00030000-556c-12ee-a1ab-534f73f2d14e	Revizija-write	Revizija - spreminjanje	f
00030000-556c-12ee-94e5-c7ee86df111c	Rezervacija-read	Rezervacija - branje	f
00030000-556c-12ee-c583-f70c3491d32f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556c-12ee-31cb-b6c03488ea30	Role-read	Role - branje	f
00030000-556c-12ee-29cc-72a47a642c85	Role-write	Role - spreminjanje	f
00030000-556c-12ee-0daf-c460e39571ed	SedezniRed-read	SedezniRed - branje	f
00030000-556c-12ee-0b78-51163c95e0ab	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556c-12ee-8776-bb8d0404bfb5	Sedez-read	Sedez - branje	f
00030000-556c-12ee-8c13-4ad1a34c04a3	Sedez-write	Sedez - spreminjanje	f
00030000-556c-12ee-f4c4-5bfc3afa9452	Sezona-read	Sezona - branje	f
00030000-556c-12ee-3339-030600a9663f	Sezona-write	Sezona - spreminjanje	f
00030000-556c-12ee-f57d-9ec24fb51cb0	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556c-12ee-c283-f685c99f39a2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556c-12ee-1ee7-35276bbf2a70	Stevilcenje-read	Stevilcenje - branje	f
00030000-556c-12ee-2156-d6721d733918	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556c-12ee-a158-24971acd0c67	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556c-12ee-d601-5af9735677d1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556c-12ee-8867-1186c6248c2f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556c-12ee-8f2c-5bafd30a8c44	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556c-12ee-b311-b67f508b3a6a	Telefonska-read	Telefonska - branje	f
00030000-556c-12ee-7519-716186eb9586	Telefonska-write	Telefonska - spreminjanje	f
00030000-556c-12ee-c9b5-6fe0fdeb9c64	TerminStoritve-read	TerminStoritve - branje	f
00030000-556c-12ee-59da-f42630118281	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556c-12ee-b0a0-23d23476ece3	TipFunkcije-read	TipFunkcije - branje	f
00030000-556c-12ee-3b7d-e107cbe9ee9a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556c-12ee-6189-9c5c45f31494	Trr-read	Trr - branje	f
00030000-556c-12ee-20ae-c8de15e272fe	Trr-write	Trr - spreminjanje	f
00030000-556c-12ee-ea8e-f2e652c9bbef	Uprizoritev-read	Uprizoritev - branje	f
00030000-556c-12ee-2570-582a9914e2fd	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556c-12ee-f9f0-383ac416835d	User-read	User - branje	f
00030000-556c-12ee-db79-7e1849a757b6	User-write	User - spreminjanje	f
00030000-556c-12ee-5ee4-f433c0ff0e66	Vaja-read	Vaja - branje	f
00030000-556c-12ee-f690-3d4559eca1ff	Vaja-write	Vaja - spreminjanje	f
00030000-556c-12ee-dc4f-94e673ed41df	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556c-12ee-308c-fb7614b6ed38	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556c-12ee-bff9-fb29d3dd8e72	Zaposlitev-read	Zaposlitev - branje	f
00030000-556c-12ee-e14a-4d27de11a1c6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556c-12ee-07f4-50d9ab1db76f	Zasedenost-read	Zasedenost - branje	f
00030000-556c-12ee-2ab7-a42fde7833fa	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556c-12ee-86c8-2ccfaa94e8c7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556c-12ee-c9b4-5ad4e8c30bb9	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556c-12ee-6358-eed51883a664	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556c-12ee-2bb9-61768fd9588e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 3024 (class 0 OID 154410)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556c-12ee-238a-1812d94d03af	00030000-556c-12ee-e129-7f97b8c92d36
00020000-556c-12ee-59bd-9a5d2139a951	00030000-556c-12ee-5670-6a1ec05fd04d
00020000-556c-12ee-59bd-9a5d2139a951	00030000-556c-12ee-e129-7f97b8c92d36
\.


--
-- TOC entry 3049 (class 0 OID 154687)
-- Dependencies: 202
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 154694)
-- Dependencies: 203
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 154836)
-- Dependencies: 217
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 154523)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556c-12ef-0afe-541262f3c2b0	00040000-556c-12ed-4696-f2ca2e8ae0e6	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-12ef-3798-9524b60ed85e	00040000-556c-12ed-4696-f2ca2e8ae0e6	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 3034 (class 0 OID 154543)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
\.


--
00050000-556c-12ee-b597-4f2075f7cf7c	8341	Adlešiči
00050000-556c-12ee-4074-e7a1df7c33ce	5270	Ajdovščina
00050000-556c-12ee-52c3-5ba798c3d535	6280	Ankaran/Ancarano
00050000-556c-12ee-5392-66e1f57e584e	9253	Apače
00050000-556c-12ee-1625-9ceb28db3c99	8253	Artiče
00050000-556c-12ee-4a8b-f7a2299a47e9	4275	Begunje na Gorenjskem
00050000-556c-12ee-370f-818f336b3d60	1382	Begunje pri Cerknici
00050000-556c-12ee-b81f-e8b9a43181ef	9231	Beltinci
00050000-556c-12ee-04cc-e522f252ff81	2234	Benedikt
00050000-556c-12ee-c633-98327b00799c	2345	Bistrica ob Dravi
00050000-556c-12ee-78f0-f71d504d193e	3256	Bistrica ob Sotli
00050000-556c-12ee-b524-bf6ec20fc9cf	8259	Bizeljsko
00050000-556c-12ee-eaf4-cb8d69096e89	1223	Blagovica
00050000-556c-12ee-8184-6fea4a95b783	8283	Blanca
00050000-556c-12ee-e71e-c6fd8675f887	4260	Bled
00050000-556c-12ee-353f-8fb25f45d4ac	4273	Blejska Dobrava
00050000-556c-12ee-d887-7d48582a9071	9265	Bodonci
00050000-556c-12ee-2418-8e9e4495a282	9222	Bogojina
00050000-556c-12ee-a1e3-01329ce8e281	4263	Bohinjska Bela
00050000-556c-12ee-f921-92fa98f82363	4264	Bohinjska Bistrica
00050000-556c-12ee-d623-1aaa3e4c7a66	4265	Bohinjsko jezero
00050000-556c-12ee-7c53-1a5c3f7f68f6	1353	Borovnica
00050000-556c-12ee-55e1-890d7868e84b	8294	Boštanj
00050000-556c-12ee-c2ab-4119bc69f08e	5230	Bovec
00050000-556c-12ee-905e-15fc7408cad3	5295	Branik
00050000-556c-12ee-6834-24dfb4a1a624	3314	Braslovče
00050000-556c-12ee-d4cd-4f931f5b57d0	5223	Breginj
00050000-556c-12ee-fa16-4601b8724eb9	8280	Brestanica
00050000-556c-12ee-6df8-6d34a7b55ae3	2354	Bresternica
00050000-556c-12ee-c25b-f2567233a2d8	4243	Brezje
00050000-556c-12ee-5261-fa6a57bf0899	1351	Brezovica pri Ljubljani
00050000-556c-12ee-cf8e-f1baabbfe5b5	8250	Brežice
00050000-556c-12ee-b41f-223d421cf40f	4210	Brnik - Aerodrom
00050000-556c-12ee-f504-2a9dfd020a22	8321	Brusnice
00050000-556c-12ee-9421-6d5be934eb0f	3255	Buče
00050000-556c-12ee-f416-6dfae6eb5a29	8276	Bučka 
00050000-556c-12ee-c6d4-191ec0686ed6	9261	Cankova
00050000-556c-12ee-78b6-f427b74177ac	3000	Celje 
00050000-556c-12ee-331c-74be3957179c	3001	Celje - poštni predali
00050000-556c-12ee-459b-2db6ca403f4a	4207	Cerklje na Gorenjskem
00050000-556c-12ee-048c-ebe0a4d42a38	8263	Cerklje ob Krki
00050000-556c-12ee-8095-f390ff8cc627	1380	Cerknica
00050000-556c-12ee-595b-5781c053d2b6	5282	Cerkno
00050000-556c-12ee-4f24-2f338114b6cc	2236	Cerkvenjak
00050000-556c-12ee-4d6b-ff12efe767ec	2215	Ceršak
00050000-556c-12ee-1458-3abc6b30ce14	2326	Cirkovce
00050000-556c-12ee-2b68-40f8710cf8dd	2282	Cirkulane
00050000-556c-12ee-aff0-21cf3214d453	5273	Col
00050000-556c-12ee-8563-498a21bd7cb4	8251	Čatež ob Savi
00050000-556c-12ee-4151-f54655c7fb6f	1413	Čemšenik
00050000-556c-12ee-d4ac-5eb5893dee04	5253	Čepovan
00050000-556c-12ee-cfa5-1c3cddce6dba	9232	Črenšovci
00050000-556c-12ee-ecd3-dd35ab99b1fc	2393	Črna na Koroškem
00050000-556c-12ee-ce61-356508ca013f	6275	Črni Kal
00050000-556c-12ee-20f3-46e30fda53df	5274	Črni Vrh nad Idrijo
00050000-556c-12ee-d28c-5cbc63088137	5262	Črniče
00050000-556c-12ee-ba69-9a339d22a8b8	8340	Črnomelj
00050000-556c-12ee-07b5-ed74ec35fb01	6271	Dekani
00050000-556c-12ee-ec68-d082fffeedb5	5210	Deskle
00050000-556c-12ee-ec5c-e45d0386e5ca	2253	Destrnik
00050000-556c-12ee-d46c-5a237de1d0e0	6215	Divača
00050000-556c-12ee-d355-6c0f9b9cc536	1233	Dob
00050000-556c-12ee-520b-74b04aae11bf	3224	Dobje pri Planini
00050000-556c-12ee-8e99-852428404bd8	8257	Dobova
00050000-556c-12ee-77ff-6683fe0bfcb9	1423	Dobovec
00050000-556c-12ee-4a2a-baaef2080733	5263	Dobravlje
00050000-556c-12ee-3dd5-54b47506c173	3204	Dobrna
00050000-556c-12ee-20b1-c2bd4043201d	8211	Dobrnič
00050000-556c-12ee-0187-49f50b2959bd	1356	Dobrova
00050000-556c-12ee-00c1-1b6d5bde354e	9223	Dobrovnik/Dobronak 
00050000-556c-12ee-519e-f807e7002aec	5212	Dobrovo v Brdih
00050000-556c-12ee-2003-9e238c7e8258	1431	Dol pri Hrastniku
00050000-556c-12ee-bae8-687f2a4e3db5	1262	Dol pri Ljubljani
00050000-556c-12ee-c27b-c6425a72c066	1273	Dole pri Litiji
00050000-556c-12ee-2caf-564fed43ebb8	1331	Dolenja vas
00050000-556c-12ee-4ada-94b49bb58edc	8350	Dolenjske Toplice
00050000-556c-12ee-c24d-936e82ac4909	1230	Domžale
00050000-556c-12ee-03a4-1602a581629a	2252	Dornava
00050000-556c-12ee-c30b-ec73a27c0e12	5294	Dornberk
00050000-556c-12ee-0741-5a566e7e0337	1319	Draga
00050000-556c-12ee-8459-8d19ac76877d	8343	Dragatuš
00050000-556c-12ee-8aca-79a8258a625c	3222	Dramlje
00050000-556c-12ee-b142-ff798ab4f6f2	2370	Dravograd
00050000-556c-12ee-63ea-f58def2a3b8a	4203	Duplje
00050000-556c-12ee-03a8-df63744ce51f	6221	Dutovlje
00050000-556c-12ee-7433-89f23dc31114	8361	Dvor
00050000-556c-12ee-fb16-004d764724a7	2343	Fala
00050000-556c-12ee-36e7-338c7241edb7	9208	Fokovci
00050000-556c-12ee-14ef-50be71c3c3b4	2313	Fram
00050000-556c-12ee-e5e6-eb723ea35d78	3213	Frankolovo
00050000-556c-12ee-aefe-e5d072179944	1274	Gabrovka
00050000-556c-12ee-f5b8-077e192f31f3	8254	Globoko
00050000-556c-12ee-bbc7-4f6238dd8afb	5275	Godovič
00050000-556c-12ee-91da-3d780f68f32d	4204	Golnik
00050000-556c-12ee-fb71-d62a83947727	3303	Gomilsko
00050000-556c-12ee-347e-544e909e5139	4224	Gorenja vas
00050000-556c-12ee-c321-d995d65f8b80	3263	Gorica pri Slivnici
00050000-556c-12ee-2b06-d9f9fc486e20	2272	Gorišnica
00050000-556c-12ee-4ef1-6b0e2b563976	9250	Gornja Radgona
00050000-556c-12ee-e9af-e2c2974524e0	3342	Gornji Grad
00050000-556c-12ee-e5d0-ecb316e84311	4282	Gozd Martuljek
00050000-556c-12ee-744b-70ac5e8d2e55	6272	Gračišče
00050000-556c-12ee-702e-9fc48b5ae3c9	9264	Grad
00050000-556c-12ee-cd00-ebe53ae10a67	8332	Gradac
00050000-556c-12ee-5e2c-560bc2853229	1384	Grahovo
00050000-556c-12ee-095e-3b30186e394a	5242	Grahovo ob Bači
00050000-556c-12ee-7a73-35e1274d1897	5251	Grgar
00050000-556c-12ee-a4f6-eb10c1b92a5e	3302	Griže
00050000-556c-12ee-85b9-1228256252ee	3231	Grobelno
00050000-556c-12ee-47b9-b46ff67db8df	1290	Grosuplje
00050000-556c-12ee-0413-4fef93ece473	2288	Hajdina
00050000-556c-12ee-ec5c-1ae63e0d1fb0	8362	Hinje
00050000-556c-12ee-b674-c765938f6a9d	2311	Hoče
00050000-556c-12ee-590c-dccd991554d5	9205	Hodoš/Hodos
00050000-556c-12ee-5b12-bbe0799ecc80	1354	Horjul
00050000-556c-12ee-b582-eb22ffdab0c1	1372	Hotedršica
00050000-556c-12ee-1ece-629a50462ceb	1430	Hrastnik
00050000-556c-12ee-a699-d533c706dc65	6225	Hruševje
00050000-556c-12ee-5589-04e4d7faf83f	4276	Hrušica
00050000-556c-12ee-3e45-c54d50458285	5280	Idrija
00050000-556c-12ee-de95-78790eb26e6b	1292	Ig
00050000-556c-12ee-9169-f7279ff292cb	6250	Ilirska Bistrica
00050000-556c-12ee-513d-d993e3c7e2a1	6251	Ilirska Bistrica-Trnovo
00050000-556c-12ee-07d4-ab9110b54db0	1295	Ivančna Gorica
00050000-556c-12ee-9204-269f7549caea	2259	Ivanjkovci
00050000-556c-12ee-3ebb-85cdaa67a55b	1411	Izlake
00050000-556c-12ee-0aa7-9feba83f699e	6310	Izola/Isola
00050000-556c-12ee-c2d4-925ceb0f4b8a	2222	Jakobski Dol
00050000-556c-12ee-c156-806f9a4301f5	2221	Jarenina
00050000-556c-12ee-5119-2cff218ce386	6254	Jelšane
00050000-556c-12ee-42d1-e8aa59db1755	4270	Jesenice
00050000-556c-12ee-2c6d-a5749b049f54	8261	Jesenice na Dolenjskem
00050000-556c-12ee-8972-986876bc54c9	3273	Jurklošter
00050000-556c-12ee-770d-e124c85aada5	2223	Jurovski Dol
00050000-556c-12ee-1927-793d2c8ec8f8	2256	Juršinci
00050000-556c-12ee-713e-f135d3d4ac42	5214	Kal nad Kanalom
00050000-556c-12ee-84f6-0eda9ec67400	3233	Kalobje
00050000-556c-12ee-0c18-124f04d831ea	4246	Kamna Gorica
00050000-556c-12ee-3325-38feef2d2a51	2351	Kamnica
00050000-556c-12ee-b2e5-17d2ef421b0b	1241	Kamnik
00050000-556c-12ee-ae97-66ee76f664d1	5213	Kanal
00050000-556c-12ee-c477-d018163065da	8258	Kapele
00050000-556c-12ee-f3ca-34a74a8f53a8	2362	Kapla
00050000-556c-12ee-94c2-b1021aa0957c	2325	Kidričevo
00050000-556c-12ee-1e5a-9b4aec9308ee	1412	Kisovec
00050000-556c-12ee-4c5a-5556c4390443	6253	Knežak
00050000-556c-12ee-ee53-b2fb26f01437	5222	Kobarid
00050000-556c-12ee-396f-e060dac032c3	9227	Kobilje
00050000-556c-12ee-c4e5-bdb2730e764f	1330	Kočevje
00050000-556c-12ee-78c5-f9095d25d15a	1338	Kočevska Reka
00050000-556c-12ee-2c07-da9e27359924	2276	Kog
00050000-556c-12ee-2c03-8fd82b31fb42	5211	Kojsko
00050000-556c-12ee-c1c8-a4582f96c4e4	6223	Komen
00050000-556c-12ee-c86b-1720c2d11e75	1218	Komenda
00050000-556c-12ee-212e-34133c634a4f	6000	Koper/Capodistria 
00050000-556c-12ee-77fa-ced108478041	6001	Koper/Capodistria - poštni predali
00050000-556c-12ee-e023-620eb7276da7	8282	Koprivnica
00050000-556c-12ee-7bab-fa1069ec80cb	5296	Kostanjevica na Krasu
00050000-556c-12ee-e2eb-c82ec7ca2f55	8311	Kostanjevica na Krki
00050000-556c-12ee-0393-fe1691ad33ff	1336	Kostel
00050000-556c-12ee-a12c-403842dbd1bf	6256	Košana
00050000-556c-12ee-d853-1bd8104724bb	2394	Kotlje
00050000-556c-12ee-504e-f3610af72b6e	6240	Kozina
00050000-556c-12ee-7b74-aec3e9d31170	3260	Kozje
00050000-556c-12ee-6e41-847dfcf9e6fb	4000	Kranj 
00050000-556c-12ee-c1e2-528f1472ec33	4001	Kranj - poštni predali
00050000-556c-12ee-8c7b-ac2322bf2904	4280	Kranjska Gora
00050000-556c-12ee-0ff4-b3b72f1ca18d	1281	Kresnice
00050000-556c-12ee-6a83-d55f8cfe5133	4294	Križe
00050000-556c-12ee-770e-50cd9b36123a	9206	Križevci
00050000-556c-12ee-b717-aa3af2c8c243	9242	Križevci pri Ljutomeru
00050000-556c-12ee-4d44-0fad24dbc086	1301	Krka
00050000-556c-12ee-0d22-cc8148fe7412	8296	Krmelj
00050000-556c-12ee-b3d8-e4cddf3bbba4	4245	Kropa
00050000-556c-12ee-df6c-11dce0a612cf	8262	Krška vas
00050000-556c-12ee-0bc5-d9f842477582	8270	Krško
00050000-556c-12ee-e1b7-60a301d93765	9263	Kuzma
00050000-556c-12ee-b85f-87984c414cce	2318	Laporje
00050000-556c-12ee-625b-804d6033bc17	3270	Laško
00050000-556c-12ee-3426-33340fd74fbc	1219	Laze v Tuhinju
00050000-556c-12ee-2df2-5c9e24ccbc42	2230	Lenart v Slovenskih goricah
00050000-556c-12ee-4d4c-3e20746bb25a	9220	Lendava/Lendva
00050000-556c-12ee-717c-90b2755519b2	4248	Lesce
00050000-556c-12ee-b844-f2863ee1237f	3261	Lesično
00050000-556c-12ee-b07f-4e976261e217	8273	Leskovec pri Krškem
00050000-556c-12ee-d994-e9961f06dfa7	2372	Libeliče
00050000-556c-12ee-2dbd-7b16d62af09f	2341	Limbuš
00050000-556c-12ee-fd06-d2230c5682f3	1270	Litija
00050000-556c-12ee-ca9e-1c6e89cd1b81	3202	Ljubečna
00050000-556c-12ee-9cf9-d1f1f19c7857	1000	Ljubljana 
00050000-556c-12ee-c85f-99c91c819b3f	1001	Ljubljana - poštni predali
00050000-556c-12ee-5dc0-3d7d5020f5cf	1231	Ljubljana - Črnuče
00050000-556c-12ee-abd5-28fa2654eee7	1261	Ljubljana - Dobrunje
00050000-556c-12ee-0404-efd6493d7a86	1260	Ljubljana - Polje
00050000-556c-12ee-880f-5b35cb85863e	1210	Ljubljana - Šentvid
00050000-556c-12ee-8a2b-da6b95f324f3	1211	Ljubljana - Šmartno
00050000-556c-12ee-18b4-b1cd6dba4313	3333	Ljubno ob Savinji
00050000-556c-12ee-fd9e-57d29685b416	9240	Ljutomer
00050000-556c-12ee-d6bf-4199caf9a380	3215	Loče
00050000-556c-12ee-f854-e3ec0f7b6fae	5231	Log pod Mangartom
00050000-556c-12ee-c5e6-1bd8fd8b72ab	1358	Log pri Brezovici
00050000-556c-12ee-712f-f5fb491987be	1370	Logatec
00050000-556c-12ee-284f-bc5b98f3a914	1371	Logatec
00050000-556c-12ee-9d4b-09db95a3c931	1434	Loka pri Zidanem Mostu
00050000-556c-12ee-351b-727ee3efdc32	3223	Loka pri Žusmu
00050000-556c-12ee-d139-259285ce6db6	6219	Lokev
00050000-556c-12ee-fdd8-846f5570be32	1318	Loški Potok
00050000-556c-12ee-fcbf-d4f8adfb6762	2324	Lovrenc na Dravskem polju
00050000-556c-12ee-d369-eebb7d21cf5e	2344	Lovrenc na Pohorju
00050000-556c-12ee-0ae2-ad23e43f3107	3334	Luče
00050000-556c-12ee-c4df-baa5a6e3779a	1225	Lukovica
00050000-556c-12ee-ce09-c65fbfad2ab5	9202	Mačkovci
00050000-556c-12ee-eded-2f1a92fa4da3	2322	Majšperk
00050000-556c-12ee-2fc5-8d5f5d3e19f3	2321	Makole
00050000-556c-12ee-bd85-0ae2e9582918	9243	Mala Nedelja
00050000-556c-12ee-718e-600ae7e22042	2229	Malečnik
00050000-556c-12ee-0b7a-fd434573e524	6273	Marezige
00050000-556c-12ee-b368-b53422ee976c	2000	Maribor 
00050000-556c-12ee-4ffb-6d48452b4d79	2001	Maribor - poštni predali
00050000-556c-12ee-afa9-9d51d54c7b09	2206	Marjeta na Dravskem polju
00050000-556c-12ee-7097-8d266ff7d894	2281	Markovci
00050000-556c-12ee-5871-e0149ed60171	9221	Martjanci
00050000-556c-12ee-2044-fc1556f1f2c2	6242	Materija
00050000-556c-12ee-a526-20ac07ce6430	4211	Mavčiče
00050000-556c-12ee-6c5e-c6b33cc39f08	1215	Medvode
00050000-556c-12ee-3273-8ed37a2d30f1	1234	Mengeš
00050000-556c-12ee-bb7d-6ec1a4174f83	8330	Metlika
00050000-556c-12ee-57de-0b50ba94c4f3	2392	Mežica
00050000-556c-12ee-ff4c-077bbde9cadb	2204	Miklavž na Dravskem polju
00050000-556c-12ee-5d8a-3875e481738f	2275	Miklavž pri Ormožu
00050000-556c-12ee-a1ba-5cf2771ee180	5291	Miren
00050000-556c-12ee-aebe-6f0b0c40a42f	8233	Mirna
00050000-556c-12ee-dbec-21fb25997e73	8216	Mirna Peč
00050000-556c-12ee-8339-886d4d59da16	2382	Mislinja
00050000-556c-12ee-4248-5cfe406164df	4281	Mojstrana
00050000-556c-12ee-c580-e57cbe602cd6	8230	Mokronog
00050000-556c-12ee-7819-901e83282ff0	1251	Moravče
00050000-556c-12ee-0d0c-921b7120a803	9226	Moravske Toplice
00050000-556c-12ee-948b-dbf2c93c54a9	5216	Most na Soči
00050000-556c-12ee-5b62-a76ff4218f07	1221	Motnik
00050000-556c-12ee-3010-ea026cb8b5ce	3330	Mozirje
00050000-556c-12ee-372f-0719d73d9ab6	9000	Murska Sobota 
00050000-556c-12ee-f73b-2afb35846c4c	9001	Murska Sobota - poštni predali
00050000-556c-12ee-fc10-7d065cf7cdc0	2366	Muta
00050000-556c-12ee-f0ba-527f92fc2f42	4202	Naklo
00050000-556c-12ee-7990-61bdeff2af89	3331	Nazarje
00050000-556c-12ee-10aa-ebc33c489f21	1357	Notranje Gorice
00050000-556c-12ee-d93b-f7c95b858a9e	3203	Nova Cerkev
00050000-556c-12ee-fe18-b0df2cced801	5000	Nova Gorica 
00050000-556c-12ee-a576-1fda3eb3ea1a	5001	Nova Gorica - poštni predali
00050000-556c-12ee-0d87-a58d99c6c583	1385	Nova vas
00050000-556c-12ee-c4c7-2765c3ad43cb	8000	Novo mesto
00050000-556c-12ee-5b6c-4c75a014a97a	8001	Novo mesto - poštni predali
00050000-556c-12ee-9987-8009d12f5222	6243	Obrov
00050000-556c-12ee-c5c1-d5a7a3c06f56	9233	Odranci
00050000-556c-12ee-76eb-d23816fef08f	2317	Oplotnica
00050000-556c-12ee-6178-812c1d72c739	2312	Orehova vas
00050000-556c-12ee-aa8a-faf904551d74	2270	Ormož
00050000-556c-12ee-1e35-6e6fbaae11b0	1316	Ortnek
00050000-556c-12ee-6ba4-830d42900c66	1337	Osilnica
00050000-556c-12ee-32a9-923b20f19905	8222	Otočec
00050000-556c-12ee-0229-8be5cdee436c	2361	Ožbalt
00050000-556c-12ee-8eef-a2a1953de39e	2231	Pernica
00050000-556c-12ee-25ed-ebb12298d602	2211	Pesnica pri Mariboru
00050000-556c-12ee-0c2f-221295b5e5ce	9203	Petrovci
00050000-556c-12ee-8c27-13dd1f511210	3301	Petrovče
00050000-556c-12ee-8366-b66508de1a40	6330	Piran/Pirano
00050000-556c-12ee-f3f9-58910f1d866e	8255	Pišece
00050000-556c-12ee-ed5f-03a0bc86d803	6257	Pivka
00050000-556c-12ee-5849-0537839f10d5	6232	Planina
00050000-556c-12ee-5930-83b422619726	3225	Planina pri Sevnici
00050000-556c-12ee-4692-d88a09ea451e	6276	Pobegi
00050000-556c-12ee-f916-e9d26c766226	8312	Podbočje
00050000-556c-12ee-3455-97fdeaf56452	5243	Podbrdo
00050000-556c-12ee-f1af-42a2444ec105	3254	Podčetrtek
00050000-556c-12ee-9b1d-0b0d55612e32	2273	Podgorci
00050000-556c-12ee-1f23-aab40152663f	6216	Podgorje
00050000-556c-12ee-f7da-50b99a1e9f57	2381	Podgorje pri Slovenj Gradcu
00050000-556c-12ee-2e4c-e9b0e14c2670	6244	Podgrad
00050000-556c-12ee-f5dc-e68f821ab0b8	1414	Podkum
00050000-556c-12ee-bcce-27dd97fdf75a	2286	Podlehnik
00050000-556c-12ee-23f3-350cc06485d5	5272	Podnanos
00050000-556c-12ee-4e82-d764dbb49588	4244	Podnart
00050000-556c-12ee-4d6a-dbfb7ef3805d	3241	Podplat
00050000-556c-12ee-2d2a-80df17f3c635	3257	Podsreda
00050000-556c-12ee-482c-af9be9b707b6	2363	Podvelka
00050000-556c-12ee-bb3b-c1f58a782556	2208	Pohorje
00050000-556c-12ee-7de5-68e0f4a33bac	2257	Polenšak
00050000-556c-12ee-5dfb-7adea1c180f3	1355	Polhov Gradec
00050000-556c-12ee-0cbb-1cfabf04f576	4223	Poljane nad Škofjo Loko
00050000-556c-12ee-aafb-8565c91a161d	2319	Poljčane
00050000-556c-12ee-35ab-9c83d4247afe	1272	Polšnik
00050000-556c-12ee-f12e-305eeec0cd6d	3313	Polzela
00050000-556c-12ee-6cdf-5654bb380da5	3232	Ponikva
00050000-556c-12ee-374c-d9dc6bddcfb7	6320	Portorož/Portorose
00050000-556c-12ee-3c71-086e9125cf28	6230	Postojna
00050000-556c-12ee-7180-fdf4741bead4	2331	Pragersko
00050000-556c-12ee-900e-8b767140973e	3312	Prebold
00050000-556c-12ee-a081-d2fac17596fd	4205	Preddvor
00050000-556c-12ee-e89a-1c172980fbfd	6255	Prem
00050000-556c-12ee-f3b9-0f7b30efed24	1352	Preserje
00050000-556c-12ee-5ed9-5520eb4085f7	6258	Prestranek
00050000-556c-12ee-e697-8e80e2a190a0	2391	Prevalje
00050000-556c-12ee-b521-1352634ca2fa	3262	Prevorje
00050000-556c-12ee-dea6-d90826a52257	1276	Primskovo 
00050000-556c-12ee-0999-f3c2dbcf195a	3253	Pristava pri Mestinju
00050000-556c-12ee-f0e0-c8cf91a63ad4	9207	Prosenjakovci/Partosfalva
00050000-556c-12ee-9a0c-2cb4cc1dd800	5297	Prvačina
00050000-556c-12ee-0056-6e27dc540350	2250	Ptuj
00050000-556c-12ee-72b8-387bab634dce	2323	Ptujska Gora
00050000-556c-12ee-ca38-4176abddd961	9201	Puconci
00050000-556c-12ee-39a4-4d1c98d16eac	2327	Rače
00050000-556c-12ee-05f2-7ebcd12bac82	1433	Radeče
00050000-556c-12ee-29bb-9bb801efcc77	9252	Radenci
00050000-556c-12ee-875d-fe172f3dd383	2360	Radlje ob Dravi
00050000-556c-12ee-52d6-733e6618548c	1235	Radomlje
00050000-556c-12ee-3312-52940e250c86	4240	Radovljica
00050000-556c-12ee-6906-74e9b4801a01	8274	Raka
00050000-556c-12ee-bbe1-ec088ddd4f76	1381	Rakek
00050000-556c-12ee-857b-3543ae59eb4b	4283	Rateče - Planica
00050000-556c-12ee-0447-2a00e382f27c	2390	Ravne na Koroškem
00050000-556c-12ee-c67d-a5b395d44752	9246	Razkrižje
00050000-556c-12ee-a1bf-7a1446c84123	3332	Rečica ob Savinji
00050000-556c-12ee-5f48-edbb1406bcad	5292	Renče
00050000-556c-12ee-c989-08b6f98c44ec	1310	Ribnica
00050000-556c-12ee-179f-3d010e951d13	2364	Ribnica na Pohorju
00050000-556c-12ee-6e2d-b2e485620d17	3272	Rimske Toplice
00050000-556c-12ee-6e92-a5050e05ba3c	1314	Rob
00050000-556c-12ee-f20a-0adcfaaf46a6	5215	Ročinj
00050000-556c-12ee-d429-0a4fa470c05a	3250	Rogaška Slatina
00050000-556c-12ee-015d-1b6f0ea99ec3	9262	Rogašovci
00050000-556c-12ee-15cf-59a075240456	3252	Rogatec
00050000-556c-12ee-c299-96da7e1215c4	1373	Rovte
00050000-556c-12ee-b7b1-093536374945	2342	Ruše
00050000-556c-12ee-dd81-513d616866bd	1282	Sava
00050000-556c-12ee-2aae-c95947492c33	6333	Sečovlje/Sicciole
00050000-556c-12ee-ac9c-4f53fca4284a	4227	Selca
00050000-556c-12ee-5217-57cb86a69d2e	2352	Selnica ob Dravi
00050000-556c-12ee-df4c-bf41750bc42d	8333	Semič
00050000-556c-12ee-20ec-ab0ea5d175cf	8281	Senovo
00050000-556c-12ee-6bf5-99cfcaaa3538	6224	Senožeče
00050000-556c-12ee-fd6a-79929ecea2cd	8290	Sevnica
00050000-556c-12ee-431d-f0e41a67baad	6210	Sežana
00050000-556c-12ee-1946-5caf9cb57be9	2214	Sladki Vrh
00050000-556c-12ee-faa7-f3538d89a24f	5283	Slap ob Idrijci
00050000-556c-12ee-96c9-5fd2d84a174f	2380	Slovenj Gradec
00050000-556c-12ee-e9b4-2a007a9f63c9	2310	Slovenska Bistrica
00050000-556c-12ee-83b8-0b994d165b36	3210	Slovenske Konjice
00050000-556c-12ee-b876-f44bc5f7576f	1216	Smlednik
00050000-556c-12ee-4d30-817102f2c484	5232	Soča
00050000-556c-12ee-ae86-d6eb75909481	1317	Sodražica
00050000-556c-12ee-dcbb-0a7283a49a2e	3335	Solčava
00050000-556c-12ee-ffc1-175cb0da61b0	5250	Solkan
00050000-556c-12ee-c15d-f73791384c24	4229	Sorica
00050000-556c-12ee-026f-4bb11e5af028	4225	Sovodenj
00050000-556c-12ee-6115-aa4cb4da2ea9	5281	Spodnja Idrija
00050000-556c-12ee-38e1-5764ecf01fd6	2241	Spodnji Duplek
00050000-556c-12ee-480e-49af166cd315	9245	Spodnji Ivanjci
00050000-556c-12ee-2f39-b4e80f223447	2277	Središče ob Dravi
00050000-556c-12ee-598c-890ee6e734d6	4267	Srednja vas v Bohinju
00050000-556c-12ee-1eb4-13aa7c3844dd	8256	Sromlje 
00050000-556c-12ee-617f-053920c83332	5224	Srpenica
00050000-556c-12ee-bb29-dd39ef4e83aa	1242	Stahovica
00050000-556c-12ee-0f94-6fa9d6ec308f	1332	Stara Cerkev
00050000-556c-12ee-bc96-a23c8e57eea1	8342	Stari trg ob Kolpi
00050000-556c-12ee-c74c-a44608d82e92	1386	Stari trg pri Ložu
00050000-556c-12ee-efc0-23aeb31e1a3a	2205	Starše
00050000-556c-12ee-d179-9c766ba5d838	2289	Stoperce
00050000-556c-12ee-d7e6-682e6b9a0307	8322	Stopiče
00050000-556c-12ee-d951-cc295f70b26c	3206	Stranice
00050000-556c-12ee-7299-f4a1a06d2453	8351	Straža
00050000-556c-12ee-921d-7a68c0665b4d	1313	Struge
00050000-556c-12ee-dc78-e21c39e80b22	8293	Studenec
00050000-556c-12ee-3419-e3ffb469df7e	8331	Suhor
00050000-556c-12ee-729c-b07645e40eaf	2233	Sv. Ana v Slovenskih goricah
00050000-556c-12ee-e2ec-06867b5f2e85	2235	Sv. Trojica v Slovenskih goricah
00050000-556c-12ee-dcd5-58d0ed393b0a	2353	Sveti Duh na Ostrem Vrhu
00050000-556c-12ee-4c77-2e928b3e3778	9244	Sveti Jurij ob Ščavnici
00050000-556c-12ee-c7ac-19b21a509d29	3264	Sveti Štefan
00050000-556c-12ee-7786-618b0c1b12c2	2258	Sveti Tomaž
00050000-556c-12ee-0851-9a2c0512f4c1	9204	Šalovci
00050000-556c-12ee-7181-619cbb59f51b	5261	Šempas
00050000-556c-12ee-2e13-e0cb07cea7b9	5290	Šempeter pri Gorici
00050000-556c-12ee-3730-523539c24c57	3311	Šempeter v Savinjski dolini
00050000-556c-12ee-5354-df087554f37e	4208	Šenčur
00050000-556c-12ee-1d2f-39e2745a120a	2212	Šentilj v Slovenskih goricah
00050000-556c-12ee-6bee-8be7fae57e63	8297	Šentjanž
00050000-556c-12ee-376b-21b67e17baf1	2373	Šentjanž pri Dravogradu
00050000-556c-12ee-5cd1-281bac78c4be	8310	Šentjernej
00050000-556c-12ee-9f21-0410ae0c1b2b	3230	Šentjur
00050000-556c-12ee-3109-10734fafd3da	3271	Šentrupert
00050000-556c-12ee-1de2-30e04ae8d008	8232	Šentrupert
00050000-556c-12ee-8a0e-e39cee6ee35d	1296	Šentvid pri Stični
00050000-556c-12ee-3d1c-95035dff8df3	8275	Škocjan
00050000-556c-12ee-db22-056b034651f1	6281	Škofije
00050000-556c-12ee-da89-18531d067f37	4220	Škofja Loka
00050000-556c-12ee-6f4b-5017283e6327	3211	Škofja vas
00050000-556c-12ee-7b8f-c8ae0bd7e0bc	1291	Škofljica
00050000-556c-12ee-3b19-ed5b3b7d03f8	6274	Šmarje
00050000-556c-12ee-a419-a6e8a2853e8b	1293	Šmarje - Sap
00050000-556c-12ee-98c9-42da9d13d722	3240	Šmarje pri Jelšah
00050000-556c-12ee-2395-cda8b17e75d4	8220	Šmarješke Toplice
00050000-556c-12ee-fc8c-177a3178a0ab	2315	Šmartno na Pohorju
00050000-556c-12ee-d4d3-b12cf1b1314e	3341	Šmartno ob Dreti
00050000-556c-12ee-6378-555f43656d54	3327	Šmartno ob Paki
00050000-556c-12ee-5f5a-80357a4f8c0e	1275	Šmartno pri Litiji
00050000-556c-12ee-661e-120699c7de65	2383	Šmartno pri Slovenj Gradcu
00050000-556c-12ee-9428-f6b8d91380ec	3201	Šmartno v Rožni dolini
00050000-556c-12ee-2cd7-d6859710bf2c	3325	Šoštanj
00050000-556c-12ee-cdec-f38e7109b0d8	6222	Štanjel
00050000-556c-12ee-f04d-b119e11939ca	3220	Štore
00050000-556c-12ee-4c7f-0b355f030c55	3304	Tabor
00050000-556c-12ee-1498-019e5bcdcbad	3221	Teharje
00050000-556c-12ee-d137-477984ef8bb0	9251	Tišina
00050000-556c-12ee-ea1a-6cf5c4c2e499	5220	Tolmin
00050000-556c-12ee-685f-94f6cbeadc22	3326	Topolšica
00050000-556c-12ee-589d-6531f9dde2ea	2371	Trbonje
00050000-556c-12ee-5e7a-a6a57bf475a8	1420	Trbovlje
00050000-556c-12ee-792f-d82cc5b30f8a	8231	Trebelno 
00050000-556c-12ee-b8c5-1ccb1fd8b807	8210	Trebnje
00050000-556c-12ee-9822-e4a0af02ef2b	5252	Trnovo pri Gorici
00050000-556c-12ee-6b21-d0cd157b892a	2254	Trnovska vas
00050000-556c-12ee-61aa-b8b38b5947ce	1222	Trojane
00050000-556c-12ee-5dfe-b5516a609a08	1236	Trzin
00050000-556c-12ee-8ff4-289683f19749	4290	Tržič
00050000-556c-12ee-07e5-0e0b8d204393	8295	Tržišče
00050000-556c-12ee-bce4-43ba18269b4e	1311	Turjak
00050000-556c-12ee-0598-3cca5942cc86	9224	Turnišče
00050000-556c-12ee-5706-90903d78d175	8323	Uršna sela
00050000-556c-12ee-347f-c34c7b6a89e0	1252	Vače
00050000-556c-12ee-0bc5-470f9bba4dd4	3320	Velenje 
00050000-556c-12ee-d91a-f497fa82299e	3322	Velenje - poštni predali
00050000-556c-12ee-c2c6-398a2e8ed7b8	8212	Velika Loka
00050000-556c-12ee-4e1d-384ffc9e3ce9	2274	Velika Nedelja
00050000-556c-12ee-3c43-55a20e8a5fbc	9225	Velika Polana
00050000-556c-12ee-e4ff-98af34befe09	1315	Velike Lašče
00050000-556c-12ee-5273-19523442dfd6	8213	Veliki Gaber
00050000-556c-12ee-5de5-bb58dea7802e	9241	Veržej
00050000-556c-12ee-1440-d453967ae8ed	1312	Videm - Dobrepolje
00050000-556c-12ee-507a-2c78e698fb73	2284	Videm pri Ptuju
00050000-556c-12ee-c12f-354287a972d6	8344	Vinica
00050000-556c-12ee-57ee-43d2abbe7a45	5271	Vipava
00050000-556c-12ee-0a62-a4a47f06c2ea	4212	Visoko
00050000-556c-12ee-31bd-43debb8f0840	1294	Višnja Gora
00050000-556c-12ee-ab9a-117eb0d60d70	3205	Vitanje
00050000-556c-12ee-02eb-c0c70f8c0a30	2255	Vitomarci
00050000-556c-12ee-c135-5d53830a241e	1217	Vodice
00050000-556c-12ee-d4fe-a2a3a11a4f04	3212	Vojnik\t
00050000-556c-12ee-afd0-6c96af0d0008	5293	Volčja Draga
00050000-556c-12ee-c4ea-43d96e2eaf0f	2232	Voličina
00050000-556c-12ee-5140-73ee591638de	3305	Vransko
00050000-556c-12ee-8f4f-555cd045b284	6217	Vremski Britof
00050000-556c-12ee-e946-4ea87c77c79b	1360	Vrhnika
00050000-556c-12ee-23fc-4497805f3066	2365	Vuhred
00050000-556c-12ee-465d-26b587fe8590	2367	Vuzenica
00050000-556c-12ee-4887-238d6c4a3662	8292	Zabukovje 
00050000-556c-12ee-dede-5ce5407d38cb	1410	Zagorje ob Savi
00050000-556c-12ee-15a6-70d5b8daead7	1303	Zagradec
00050000-556c-12ee-a81c-636683ba7779	2283	Zavrč
00050000-556c-12ee-64f7-98ac9ef34890	8272	Zdole 
00050000-556c-12ee-86b9-a1b0e2c3c77a	4201	Zgornja Besnica
00050000-556c-12ee-23c6-8d58da6d77e3	2242	Zgornja Korena
00050000-556c-12ee-4524-d20f40f399e9	2201	Zgornja Kungota
00050000-556c-12ee-7c3c-87fd221a7a0d	2316	Zgornja Ložnica
00050000-556c-12ee-8a54-34c5a2aa9a57	2314	Zgornja Polskava
00050000-556c-12ee-86c6-a1d0aad926aa	2213	Zgornja Velka
00050000-556c-12ee-8fbd-67dce703d6fc	4247	Zgornje Gorje
00050000-556c-12ee-fcad-1172dd29f808	4206	Zgornje Jezersko
00050000-556c-12ee-4516-b8613e742380	2285	Zgornji Leskovec
00050000-556c-12ee-299b-d8a8be39b36a	1432	Zidani Most
00050000-556c-12ee-1682-2c412753be77	3214	Zreče
00050000-556c-12ee-5936-44ea4acb3a3c	4209	Žabnica
00050000-556c-12ee-6b85-27e16ae81595	3310	Žalec
00050000-556c-12ee-f44d-8721fd16984d	4228	Železniki
00050000-556c-12ee-4f9f-d5402f58f48a	2287	Žetale
00050000-556c-12ee-1908-d03fa9bd922d	4226	Žiri
00050000-556c-12ee-c5ea-492c91ad8f6d	4274	Žirovnica
00050000-556c-12ee-b04b-1baf7ff5d9b9	8360	Žužemberk
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
\.


--
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
\.


--
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
\.


--
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
\.


--
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
\.


--
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
\.


--
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 122617)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 3051 (class 0 OID 154702)
-- Dependencies: 204
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 3035 (class 0 OID 154551)
-- Dependencies: 188
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 0 OID 154633)
-- Dependencies: 195
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 0 OID 154708)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 3065 (class 0 OID 154852)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 3066 (class 0 OID 154867)
-- Dependencies: 219
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 3076 (class 0 OID 154994)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 155003)
-- Dependencies: 230
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 236
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 3078 (class 0 OID 155009)
-- Dependencies: 231
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 237
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 3053 (class 0 OID 154715)
-- Dependencies: 206
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
00220000-556c-12ef-d07e-e0e230138868	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556c-12ef-9803-4b21175655b1	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556c-12ef-181e-7abd4bf0ffdc	0003	Kazinska	t	84	Kazinska dvorana
00220000-556c-12ef-9502-762f529457bd	0004	Mali oder	t	24	Mali oder 
00220000-556c-12ef-c5b9-ab7ccfa95c5f	0005	Komorni oder	t	15	Komorni oder
00220000-556c-12ef-5fa9-992906e22c97	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556c-12ef-469f-d17940c27c23	0007	Velika dvorana	t	160	Velika, glavna dvorana
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 3054 (class 0 OID 154725)
-- Dependencies: 207
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 0 OID 154734)
-- Dependencies: 208
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 3067 (class 0 OID 154875)
-- Dependencies: 220
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 3068 (class 0 OID 154886)
-- Dependencies: 221
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3022 (class 0 OID 154391)
-- Dependencies: 175
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
1	Aaa\\Entity\\User	00010000-556c-12ee-6bd4-f4d1201e9e01	00010000-556c-12ee-c823-3105234b62c7	2015-06-01 10:08:16	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROWmTSZw19Ra2vhzIVUdAXxWXckIn8D52";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 3056 (class 0 OID 154744)
-- Dependencies: 209
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 0 OID 154400)
-- Dependencies: 176
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
00020000-556c-12ee-3f78-71aa7e7cd6c0	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556c-12ee-2cf5-c784839aa48e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556c-12ee-238a-1812d94d03af	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556c-12ee-2084-d463046c0bd2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556c-12ee-0223-f15b7be863fe	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556c-12ee-59bd-9a5d2139a951	admin	Polni dostop do vsega v aplikaciji.	t
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 3026 (class 0 OID 154430)
-- Dependencies: 179
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
00010000-556c-12ee-6bd4-f4d1201e9e01	00020000-556c-12ee-2084-d463046c0bd2
00010000-556c-12ee-c823-3105234b62c7	00020000-556c-12ee-2084-d463046c0bd2
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 3057 (class 0 OID 154750)
-- Dependencies: 210
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 0 OID 154762)
-- Dependencies: 211
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 3043 (class 0 OID 154641)
-- Dependencies: 196
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 3080 (class 0 OID 155028)
-- Dependencies: 233
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
00000000-556c-12ee-7d4f-b63ebd8a7a10	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556c-12ee-8fd8-f223de6803c1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556c-12ee-90a6-b451e1dfdb8d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556c-12ee-6ac4-e3edbb949ee2	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556c-12ee-a901-3d517d7d6e13	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 3081 (class 0 OID 155039)
-- Dependencies: 234
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
00000000-556c-12ee-2c1e-7d4e86b8b18a	00000000-556c-12ee-6ac4-e3edbb949ee2	popa
00000000-556c-12ee-a081-4931a9af74d6	00000000-556c-12ee-6ac4-e3edbb949ee2	oseba
00000000-556c-12ee-3d66-7356083d6b5a	00000000-556c-12ee-8fd8-f223de6803c1	prostor
00000000-556c-12ee-0ec4-0a3b071736d5	00000000-556c-12ee-6ac4-e3edbb949ee2	besedilo
00000000-556c-12ee-00b8-c074dfb39b5b	00000000-556c-12ee-6ac4-e3edbb949ee2	uprizoritev
00000000-556c-12ee-3d20-2ef59a223314	00000000-556c-12ee-6ac4-e3edbb949ee2	funkcija
00000000-556c-12ee-c4bb-f45de7d35934	00000000-556c-12ee-6ac4-e3edbb949ee2	tipfunkcije
00000000-556c-12ee-e677-2f1acc9d593b	00000000-556c-12ee-6ac4-e3edbb949ee2	alternacija
00000000-556c-12ee-0208-93e688b73849	00000000-556c-12ee-7d4f-b63ebd8a7a10	pogodba
00000000-556c-12ee-df28-1c4ee1956f11	00000000-556c-12ee-6ac4-e3edbb949ee2	zaposlitev
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 3082 (class 0 OID 155047)
-- Dependencies: 235
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 0 OID 154896)
-- Dependencies: 222
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 3036 (class 0 OID 154566)
-- Dependencies: 189
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 3046 (class 0 OID 154661)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
001a0000-556c-12f0-b4f2-78f189145c6e	00180000-556c-12ef-20cd-c47f238eb4dd	000c0000-556c-12ef-96f5-d24769638587	00090000-556c-12ef-4112-1203e2fc4d2a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-12f0-0a20-b50e9fab0b8b	00180000-556c-12ef-20cd-c47f238eb4dd	000c0000-556c-12ef-76a3-7c70b0bd0e7e	00090000-556c-12ef-c082-0aea04613f9e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-12f0-1c1d-a81596cff0fa	00180000-556c-12ef-20cd-c47f238eb4dd	000c0000-556c-12ef-4031-cc825e632204	00090000-556c-12ef-884c-db0dee638d41	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-12f0-b7dc-6df3f6b3617e	00180000-556c-12ef-20cd-c47f238eb4dd	000c0000-556c-12ef-48ca-41d4fba4e12f	00090000-556c-12ef-aeb6-fd985d7368f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-12f0-69d7-16d9375d7c0a	00180000-556c-12ef-20cd-c47f238eb4dd	000c0000-556c-12f0-909f-dc11254e047b	00090000-556c-12ef-5537-f168a4960174	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 3070 (class 0 OID 154909)
-- Dependencies: 223
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
000f0000-556c-12ee-3623-f1aa4f63b1e4	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556c-12ee-d061-8bf1c8d7e640	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556c-12ee-dc1c-bbdaa88e10bc	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556c-12ee-f5f4-dfd208fc5566	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556c-12ee-253b-6b9f9c3491b0	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556c-12ee-8d30-b60e54fb8db3	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556c-12ee-7c0f-88b868ea25b2	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556c-12ee-2eea-2f06ed30cd11	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556c-12ee-6f40-5b1e2d36637e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556c-12ee-6174-9b1e278d516b	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556c-12ee-430e-1bdf4133ef05	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556c-12ee-6110-6ba8fe73a4f6	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556c-12ee-7188-d31d3ecca2f1	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556c-12ee-b1ab-b78f48d86d3b	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556c-12ee-fd62-0f938f45bab8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556c-12ee-8554-91e4ff6d2d4b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 3079 (class 0 OID 155017)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 3037 (class 0 OID 154574)
-- Dependencies: 190
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 3025 (class 0 OID 154417)
-- Dependencies: 178
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
00010000-556c-12ee-c823-3105234b62c7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROCHFWUgXEj.mj3spB0oBkuLETX4Upnq6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556c-12ef-5505-dba509eeb1ec	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556c-12ef-cad2-ee312a2e1977	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556c-12ef-c2fe-9b2f53b8f13d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556c-12ee-6bd4-f4d1201e9e01	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 3071 (class 0 OID 154920)
-- Dependencies: 224
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
000e0000-556c-12ef-dd3b-c3c58471ef57	00160000-556c-12ef-4ff0-a61f0eb75568	00150000-556c-12ee-e998-ac32ea3c0318	00140000-556c-12ee-2388-3a426574aa65	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556c-12ef-c5b9-ab7ccfa95c5f
000e0000-556c-12ef-7016-10bb3bc1e0b4	00160000-556c-12ef-6355-692d0a4f8c8c	00150000-556c-12ee-13e6-391166a90837	00140000-556c-12ee-f019-e32215ee5902	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556c-12ef-5fa9-992906e22c97
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 3044 (class 0 OID 154647)
-- Dependencies: 197
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
00200000-556c-12ef-702b-97130cc9a9f6	000e0000-556c-12ef-7016-10bb3bc1e0b4	1	
00200000-556c-12ef-610f-1118df55a15e	000e0000-556c-12ef-7016-10bb3bc1e0b4	2	
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 3059 (class 0 OID 154768)
-- Dependencies: 212
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 3072 (class 0 OID 154941)
-- Dependencies: 225
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 3045 (class 0 OID 154656)
-- Dependencies: 198
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 3073 (class 0 OID 154948)
-- Dependencies: 226
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
00140000-556c-12ee-2388-3a426574aa65	Drama	drama (SURS 01)
00140000-556c-12ee-c5c0-1dfa8cc0918c	Opera	opera (SURS 02)
00140000-556c-12ee-6e91-683d65dbda3f	Balet	balet (SURS 03)
00140000-556c-12ee-40c3-f2cad9dde5e6	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556c-12ee-c05b-388f67cf0423	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556c-12ee-f019-e32215ee5902	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556c-12ee-f6aa-ad3777739cf3	Drugo	drugo (SURS 07)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 3074 (class 0 OID 154958)
-- Dependencies: 227
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
00150000-556c-12ee-492d-980f0cdc5282	Opera	opera
00150000-556c-12ee-72f7-ddd666d8f669	Opereta	opereta
00150000-556c-12ee-6b10-3533832bce05	Balet	balet
00150000-556c-12ee-340b-7407d0f61541	Plesne prireditve	plesne prireditve
00150000-556c-12ee-0adf-5f598348e1bc	Lutkovno gledališče	lutkovno gledališče
00150000-556c-12ee-b8b8-6bedf7a18e7c	Raziskovalno gledališče	raziskovalno gledališče
00150000-556c-12ee-c4f9-a7073cc2c4e5	Biografska drama	biografska drama
00150000-556c-12ee-e998-ac32ea3c0318	Komedija	komedija
00150000-556c-12ee-9d60-1bffc6a8bcb4	Črna komedija	črna komedija
00150000-556c-12ee-6e52-e2ba6725b6f9	E-igra	E-igra
00150000-556c-12ee-13e6-391166a90837	Kriminalka	kriminalka
00150000-556c-12ee-5b50-2f3d593baf0b	Musical	musical
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2615 (class 2606 OID 154445)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2741 (class 2606 OID 154783)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2749 (class 2606 OID 154804)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2753 (class 2606 OID 154820)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2659 (class 2606 OID 154601)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 122619)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 122618)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2670 (class 2606 OID 154615)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2617 (class 2606 OID 154458)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2800 (class 2606 OID 154990)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 154832)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2672 (class 2606 OID 154625)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2675 (class 2606 OID 154631)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2625 (class 2606 OID 154472)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 2606 OID 154678)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2698 (class 2606 OID 154686)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 2606 OID 154485)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2632 (class 2606 OID 154495)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2635 (class 2606 OID 154519)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2607 (class 2606 OID 154414)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2598 (class 2606 OID 154388)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2701 (class 2606 OID 154692)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2703 (class 2606 OID 154701)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2763 (class 2606 OID 154847)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2640 (class 2606 OID 154540)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2643 (class 2606 OID 154549)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2706 (class 2606 OID 154706)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2649 (class 2606 OID 154562)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2681 (class 2606 OID 154637)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2710 (class 2606 OID 154712)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2768 (class 2606 OID 154864)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2770 (class 2606 OID 154872)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2806 (class 2606 OID 155001)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 155007)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 155014)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 154722)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2720 (class 2606 OID 154729)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2726 (class 2606 OID 154739)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2774 (class 2606 OID 154885)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2778 (class 2606 OID 154893)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2600 (class 2606 OID 154399)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2729 (class 2606 OID 154748)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2613 (class 2606 OID 154434)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2602 (class 2606 OID 154408)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2750 (class 1259 OID 154806)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2734 (class 2606 OID 154758)
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2736 (class 2606 OID 154767)
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2683 (class 2606 OID 154646)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2817 (class 2606 OID 155037)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2821 (class 2606 OID 155044)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2824 (class 2606 OID 155051)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2782 (class 2606 OID 154906)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2653 (class 2606 OID 154571)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2693 (class 2606 OID 154670)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2784 (class 2606 OID 154919)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2815 (class 2606 OID 155027)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 154585)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2609 (class 2606 OID 154429)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2791 (class 2606 OID 154935)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2686 (class 2606 OID 154654)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2739 (class 2606 OID 154774)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2794 (class 2606 OID 154946)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2688 (class 2606 OID 154660)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2796 (class 2606 OID 154957)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2798 (class 2606 OID 154967)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2660 (class 1259 OID 154608)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2779 (class 1259 OID 154907)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 154908)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 154542)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 154693)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2707 (class 1259 OID 154714)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2708 (class 1259 OID 154713)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2684 (class 1259 OID 154655)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2756 (class 1259 OID 154833)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2757 (class 1259 OID 154835)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2758 (class 1259 OID 154834)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 154474)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 154550)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 154473)
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2759 (class 1259 OID 154849)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2760 (class 1259 OID 154850)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2761 (class 1259 OID 154851)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2785 (class 1259 OID 154940)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2786 (class 1259 OID 154937)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2787 (class 1259 OID 154939)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2788 (class 1259 OID 154938)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 1259 OID 154587)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2655 (class 1259 OID 154586)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 1259 OID 154522)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2727 (class 1259 OID 154749)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2676 (class 1259 OID 154632)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2604 (class 1259 OID 154415)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2605 (class 1259 OID 154416)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2730 (class 1259 OID 154761)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 1259 OID 154760)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2732 (class 1259 OID 154759)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 1259 OID 154638)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 1259 OID 154640)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2679 (class 1259 OID 154639)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2819 (class 1259 OID 155046)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2721 (class 1259 OID 154743)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2722 (class 1259 OID 154741)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2723 (class 1259 OID 154740)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 1259 OID 154742)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2610 (class 1259 OID 154435)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2611 (class 1259 OID 154436)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2737 (class 1259 OID 154775)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 1259 OID 154707)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2775 (class 1259 OID 154894)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2776 (class 1259 OID 154895)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 1259 OID 154991)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2802 (class 1259 OID 154993)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2803 (class 1259 OID 154992)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2645 (class 1259 OID 154564)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2646 (class 1259 OID 154563)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 1259 OID 154565)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2807 (class 1259 OID 155008)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2765 (class 1259 OID 154865)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 1259 OID 154866)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 1259 OID 154787)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2743 (class 1259 OID 154786)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2744 (class 1259 OID 154789)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2745 (class 1259 OID 154785)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2746 (class 1259 OID 154788)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2792 (class 1259 OID 154947)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2715 (class 1259 OID 154733)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2716 (class 1259 OID 154732)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2717 (class 1259 OID 154730)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2718 (class 1259 OID 154731)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2751 (class 1259 OID 154805)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2804 (class 1259 OID 155002)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2673 (class 1259 OID 154626)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2629 (class 1259 OID 154497)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2630 (class 1259 OID 154496)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2650 (class 1259 OID 154572)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2651 (class 1259 OID 154573)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2689 (class 1259 OID 154673)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2690 (class 1259 OID 154672)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 1259 OID 154671)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 1259 OID 155016)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2811 (class 1259 OID 155015)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2661 (class 1259 OID 154610)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2662 (class 1259 OID 154606)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 1259 OID 154603)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2664 (class 1259 OID 154604)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 1259 OID 154602)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2666 (class 1259 OID 154607)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2667 (class 1259 OID 154605)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2641 (class 1259 OID 154541)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2618 (class 1259 OID 154459)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2619 (class 1259 OID 154461)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2620 (class 1259 OID 154460)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2621 (class 1259 OID 154462)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2696 (class 1259 OID 154679)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 1259 OID 154848)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2789 (class 1259 OID 154936)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2636 (class 1259 OID 154520)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2637 (class 1259 OID 154521)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 1259 OID 155038)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2628 (class 1259 OID 154486)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2822 (class 1259 OID 155045)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 1259 OID 154724)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 1259 OID 154723)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2747 (class 1259 OID 154784)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 1259 OID 154873)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- TOC entry 2772 (class 1259 OID 154874)

--
-- PostgreSQL database dump complete
--

-- TOC entry 2603 (class 1259 OID 154409)
