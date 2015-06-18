--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-18 11:30:58 CEST

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
-- TOC entry 180 (class 1259 OID 7689787)
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
-- TOC entry 227 (class 1259 OID 7690309)
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
-- TOC entry 226 (class 1259 OID 7690292)
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
-- TOC entry 219 (class 1259 OID 7690196)
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
-- TOC entry 194 (class 1259 OID 7689966)
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
-- TOC entry 197 (class 1259 OID 7690000)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7689909)
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
-- TOC entry 228 (class 1259 OID 7690323)
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
-- TOC entry 213 (class 1259 OID 7690126)
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
-- TOC entry 192 (class 1259 OID 7689946)
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
-- TOC entry 196 (class 1259 OID 7689994)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7689926)
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
-- TOC entry 202 (class 1259 OID 7690043)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7690068)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7689883)
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
-- TOC entry 181 (class 1259 OID 7689796)
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
-- TOC entry 182 (class 1259 OID 7689807)
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
-- TOC entry 177 (class 1259 OID 7689761)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7689780)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7690075)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7690106)
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
-- TOC entry 223 (class 1259 OID 7690242)
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
-- TOC entry 184 (class 1259 OID 7689840)
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
-- TOC entry 186 (class 1259 OID 7689875)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7690049)
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
-- TOC entry 185 (class 1259 OID 7689860)
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
-- TOC entry 191 (class 1259 OID 7689938)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7690061)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7690181)
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
-- TOC entry 222 (class 1259 OID 7690234)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7690353)
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
-- TOC entry 233 (class 1259 OID 7690416)
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
-- TOC entry 230 (class 1259 OID 7690366)
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
-- TOC entry 231 (class 1259 OID 7690385)
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
-- TOC entry 209 (class 1259 OID 7690090)
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
-- TOC entry 201 (class 1259 OID 7690034)
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
-- TOC entry 200 (class 1259 OID 7690024)
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
-- TOC entry 221 (class 1259 OID 7690223)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7690158)
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
-- TOC entry 174 (class 1259 OID 7689732)
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
-- TOC entry 173 (class 1259 OID 7689730)
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
-- TOC entry 210 (class 1259 OID 7690100)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7689770)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7689754)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7690114)
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
-- TOC entry 204 (class 1259 OID 7690055)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7690005)
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
-- TOC entry 236 (class 1259 OID 7690449)
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
-- TOC entry 235 (class 1259 OID 7690441)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7690436)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7690168)
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
-- TOC entry 183 (class 1259 OID 7689832)
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
-- TOC entry 199 (class 1259 OID 7690011)
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
-- TOC entry 220 (class 1259 OID 7690212)
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
-- TOC entry 232 (class 1259 OID 7690405)
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
-- TOC entry 188 (class 1259 OID 7689895)
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
-- TOC entry 175 (class 1259 OID 7689741)
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
-- TOC entry 225 (class 1259 OID 7690269)
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
-- TOC entry 193 (class 1259 OID 7689957)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7690082)
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
-- TOC entry 215 (class 1259 OID 7690151)
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
-- TOC entry 195 (class 1259 OID 7689989)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7690259)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7690141)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7689735)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7689787)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7690309)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5582-8fd1-97a0-e066773d68ad	000d0000-5582-8fd1-4986-67f7549fe8fa	\N	00090000-5582-8fd1-c7ce-a9e1b0ea2d6f	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-8fd1-bad9-f11bc1733b4a	000d0000-5582-8fd1-c223-c91435e7cbdf	\N	00090000-5582-8fd1-036f-9ad9cf50336c	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-8fd1-4603-d68ac1697bc5	000d0000-5582-8fd1-3949-39738b9fcb43	\N	00090000-5582-8fd1-1b76-5a338e76b119	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-8fd1-78bc-971f1395f1b1	000d0000-5582-8fd1-0638-4d44b2aac3d7	\N	00090000-5582-8fd1-c0fd-c0792aeee552	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-8fd1-2431-817e5123c8ef	000d0000-5582-8fd1-7707-0fce9552c1be	\N	00090000-5582-8fd1-dfd4-54ef2c0a98e6	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-8fd1-bcfc-8d1f72487544	000d0000-5582-8fd1-27a6-c8fd2514abd0	\N	00090000-5582-8fd1-036f-9ad9cf50336c	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7690292)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7690196)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5582-8fd1-279c-6e4daa773036	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5582-8fd1-317a-1fccab18c51f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5582-8fd1-3d91-d0771abd77b3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7689966)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5582-8fd1-d438-1ca6e90db575	\N	\N	00200000-5582-8fd1-a2ea-48e96ba47094	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5582-8fd1-42e7-e5ab10143263	\N	\N	00200000-5582-8fd1-b67b-c8b9f3baf898	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5582-8fd1-68c7-d8da67ccdfed	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5582-8fd1-bfae-9b96c93afb90	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5582-8fd1-cbc6-1fd8fe39d6a9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7690000)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7689909)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5582-8fcf-8e85-cc8eba3cb6df	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5582-8fcf-c446-c81618974075	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5582-8fcf-2a5a-bab030776bc0	AL	ALB	008	Albania 	Albanija	\N
00040000-5582-8fcf-165f-14e554b0d05d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5582-8fcf-fb3e-6da394ef351c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5582-8fcf-4b37-fc60d699f9aa	AD	AND	020	Andorra 	Andora	\N
00040000-5582-8fcf-582f-1046a4b2c986	AO	AGO	024	Angola 	Angola	\N
00040000-5582-8fcf-96cd-67b1fb681c30	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5582-8fcf-21d8-6e17aa61479f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5582-8fcf-343a-eec86b204321	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-8fcf-ff3f-855ac386bbeb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5582-8fcf-4ad2-421194333c49	AM	ARM	051	Armenia 	Armenija	\N
00040000-5582-8fcf-0047-6f96b9a94881	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5582-8fcf-e6a6-a7f9225755f5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5582-8fcf-93e8-925c7a9ef297	AT	AUT	040	Austria 	Avstrija	\N
00040000-5582-8fcf-78bb-5956c1915adc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5582-8fcf-28f4-73a194ac2d7a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5582-8fcf-0d22-134438fa1c31	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5582-8fcf-38a7-043a5bbefbc9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5582-8fcf-d2d6-7bd3ddf13943	BB	BRB	052	Barbados 	Barbados	\N
00040000-5582-8fcf-ffa0-0b18b91bb8ee	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5582-8fcf-fa49-afcaa593994a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5582-8fcf-d617-3ff29fdf10e4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5582-8fcf-39fb-bba997cc20d1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5582-8fcf-e733-e797c731fb4c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5582-8fcf-7667-1cbe255f4706	BT	BTN	064	Bhutan 	Butan	\N
00040000-5582-8fcf-34eb-10f1d28cbd23	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5582-8fcf-bdd1-bd6c4cf2fde2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5582-8fcf-99e7-671c791dc109	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5582-8fcf-c45f-bd11e6cab2a3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5582-8fcf-fe43-4c19a950beea	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5582-8fcf-8d18-c3215a4d0ed7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5582-8fcf-26d3-e193364c0aec	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5582-8fcf-4b94-ba95e6c5ebd7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5582-8fcf-ed1a-3a77f4c68b54	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5582-8fcf-dd40-29d63094dafd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5582-8fcf-ded1-353859c65baa	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5582-8fcf-78f0-1e029e2f7269	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5582-8fcf-b56f-97f9bc3bc36f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5582-8fcf-4c0e-9aa92edd61a4	CA	CAN	124	Canada 	Kanada	\N
00040000-5582-8fcf-8213-63a4ceb57bd6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5582-8fcf-af3a-7f770fd5665e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5582-8fcf-112d-e5f47f743968	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5582-8fcf-1b84-b764a09ffe1a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5582-8fcf-c0a9-c7b40c7f118d	CL	CHL	152	Chile 	Čile	\N
00040000-5582-8fcf-fe1f-76f20706fef0	CN	CHN	156	China 	Kitajska	\N
00040000-5582-8fcf-9593-7b8b2cde03f3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5582-8fcf-c3b8-f1b8b102f942	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5582-8fcf-9770-70b9c5feff17	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5582-8fcf-5e9e-8ecdf772d21d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5582-8fcf-24a3-b994f32d869a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5582-8fcf-64b4-2e9331f469b8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5582-8fcf-a7ef-da29bfe2c8c9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5582-8fcf-caf8-1eff64dd7596	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5582-8fcf-7f46-c036aeac4314	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5582-8fcf-8c6e-db0f5599c722	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5582-8fcf-a44c-560a2e82592d	CU	CUB	192	Cuba 	Kuba	\N
00040000-5582-8fcf-8a3f-df93a83d1f25	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5582-8fcf-209d-62ec0f691643	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5582-8fcf-5259-714453014fa5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5582-8fcf-b691-797a30e1d5f2	DK	DNK	208	Denmark 	Danska	\N
00040000-5582-8fcf-a646-0081ecdcec53	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5582-8fcf-7187-00bb794acdb9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-8fcf-fb36-42c5f54ccbba	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5582-8fcf-8e33-f0f11fc7a356	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5582-8fcf-eb7f-1cb82857b33b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5582-8fcf-601d-3df93428c273	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5582-8fcf-8890-00db202ca655	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5582-8fcf-4a7c-104482429447	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5582-8fcf-d000-a264386a6057	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5582-8fcf-3444-428ad0b13bb0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5582-8fcf-e486-e63c98a000fd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5582-8fcf-fd39-6880f418a957	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5582-8fcf-44d3-d63edcee26d9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5582-8fcf-878b-94456d437b3b	FI	FIN	246	Finland 	Finska	\N
00040000-5582-8fcf-57ad-27bb9bd844c3	FR	FRA	250	France 	Francija	\N
00040000-5582-8fcf-84e1-421261ea0776	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5582-8fcf-67f5-fd5baf18e48e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5582-8fcf-2d1b-3916aa087eee	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5582-8fcf-d3d9-44198382a40e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5582-8fcf-6589-c44e9200d61b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5582-8fcf-c294-c3390085c5fb	GM	GMB	270	Gambia 	Gambija	\N
00040000-5582-8fcf-b911-724feefc2d37	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5582-8fcf-794b-9f970fcec6fd	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5582-8fcf-bafc-1e0533f942b9	GH	GHA	288	Ghana 	Gana	\N
00040000-5582-8fcf-1de4-a7450ad8081e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5582-8fcf-fc92-3aa3e61e759e	GR	GRC	300	Greece 	Grčija	\N
00040000-5582-8fcf-a07c-bddb4a74143a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5582-8fcf-9451-4bccf222db98	GD	GRD	308	Grenada 	Grenada	\N
00040000-5582-8fcf-0d05-7503e9e02735	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5582-8fcf-b524-107cf28b6464	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5582-8fcf-e8bd-f5029c632a76	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5582-8fcf-2168-1abf4f639021	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5582-8fcf-6e7f-25abd6fc6a63	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5582-8fcf-a040-ecd663c2114e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5582-8fcf-dc8d-8357d77e7203	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5582-8fcf-ee95-741d499d19bf	HT	HTI	332	Haiti 	Haiti	\N
00040000-5582-8fcf-ff73-c908562962ab	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5582-8fcf-d480-7fb19d66b38f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5582-8fcf-ef1e-eed2cdba07c6	HN	HND	340	Honduras 	Honduras	\N
00040000-5582-8fcf-abd0-9ddbc432b93d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5582-8fcf-ad22-b094f2531824	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5582-8fcf-f7ba-a52df941d1f7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5582-8fcf-894a-65790366a8f6	IN	IND	356	India 	Indija	\N
00040000-5582-8fcf-0bac-dbd47797daa3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5582-8fcf-2761-4a8df97ce65a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5582-8fcf-ac23-a75566689fde	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5582-8fcf-2826-16964594f60d	IE	IRL	372	Ireland 	Irska	\N
00040000-5582-8fcf-eb9a-6226fd73b4f5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5582-8fcf-4c27-e3409bafc647	IL	ISR	376	Israel 	Izrael	\N
00040000-5582-8fcf-8688-880ed9c28192	IT	ITA	380	Italy 	Italija	\N
00040000-5582-8fcf-d7ad-0a0a43daf8e2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5582-8fcf-56f0-9b7800f0f8e0	JP	JPN	392	Japan 	Japonska	\N
00040000-5582-8fcf-dd5d-a232be1f1cec	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5582-8fcf-518b-e369eed894b8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5582-8fcf-c1c6-c3947a04bd07	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5582-8fcf-3af1-13536bcfd95e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5582-8fcf-4132-82bc6b67fcd6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5582-8fcf-173d-273c6474c372	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5582-8fcf-821d-1e5f69adfa32	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5582-8fcf-81e8-4f6eae4013c2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5582-8fcf-b488-74de9bb279bb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5582-8fcf-c69a-e9c8eb16e65a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5582-8fcf-33b8-38b2e3bd64a1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5582-8fcf-2cf1-8f06ec108a18	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5582-8fcf-8623-91f16ab0beb4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5582-8fcf-7ab7-e9f42d9a5b09	LR	LBR	430	Liberia 	Liberija	\N
00040000-5582-8fcf-ed66-42e8402d91f8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5582-8fcf-faf2-534c1feeac63	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5582-8fcf-0945-c681fe25e1dd	LT	LTU	440	Lithuania 	Litva	\N
00040000-5582-8fcf-1e4a-c6e2844d7847	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5582-8fcf-8a76-05b9b9042be9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5582-8fcf-1cb1-56cf6bd611a1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5582-8fcf-8cbb-69cc1c2eb40d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5582-8fcf-f217-b744707e72f3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5582-8fcf-7d2a-df5080a7fd79	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5582-8fcf-341e-27c7ea78c418	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5582-8fcf-2953-b45670455c0f	ML	MLI	466	Mali 	Mali	\N
00040000-5582-8fcf-1e8f-52770c0ea0ff	MT	MLT	470	Malta 	Malta	\N
00040000-5582-8fcf-1517-1dd3d2ffd343	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5582-8fcf-df61-e76c86c16528	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5582-8fcf-8529-514788169334	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5582-8fcf-818a-0065527b444e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5582-8fcf-fff3-3a1a47109602	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5582-8fcf-d5ea-b64d59b206de	MX	MEX	484	Mexico 	Mehika	\N
00040000-5582-8fcf-7519-4f519bf1b8b5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5582-8fcf-e7f1-c4776a105fb6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5582-8fcf-4e6c-6f73b79dfe9d	MC	MCO	492	Monaco 	Monako	\N
00040000-5582-8fcf-c491-2975f612c110	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5582-8fcf-5581-717e473d26b9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5582-8fcf-ffd2-e9896015b28c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5582-8fcf-04bf-488737468583	MA	MAR	504	Morocco 	Maroko	\N
00040000-5582-8fcf-11b9-e74b2b4f3eb9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5582-8fcf-98be-ae5ba7de689b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5582-8fcf-c60d-97e7247fff81	NA	NAM	516	Namibia 	Namibija	\N
00040000-5582-8fcf-dc60-23dbca652f12	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5582-8fcf-a870-67acae47a044	NP	NPL	524	Nepal 	Nepal	\N
00040000-5582-8fcf-c634-7573b50caf50	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5582-8fcf-5e5d-796c43059bb1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5582-8fcf-ff2f-a3be62fc125b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5582-8fcf-5c4d-8e369e909e46	NE	NER	562	Niger 	Niger 	\N
00040000-5582-8fcf-e4f3-4c9fadf533fc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5582-8fcf-3e63-894f4ba68d6d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5582-8fcf-2bc5-2c424fa9f531	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5582-8fcf-a084-dbf687c5c926	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5582-8fcf-b33b-30e41270d480	NO	NOR	578	Norway 	Norveška	\N
00040000-5582-8fcf-9cfa-63738ff93cd9	OM	OMN	512	Oman 	Oman	\N
00040000-5582-8fcf-b1e9-d6b50a6b7b30	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5582-8fcf-82df-73f67c336ffc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5582-8fcf-e00f-b0a166d4f714	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5582-8fcf-e00a-da201b75307b	PA	PAN	591	Panama 	Panama	\N
00040000-5582-8fcf-bb9d-0955526ce9aa	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5582-8fcf-d868-b1f1a6bf6792	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5582-8fcf-ca43-ff959f393f11	PE	PER	604	Peru 	Peru	\N
00040000-5582-8fcf-576a-4fdbd3785142	PH	PHL	608	Philippines 	Filipini	\N
00040000-5582-8fcf-122a-bdcfae7b648b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5582-8fcf-ec44-4ccfb4f3a306	PL	POL	616	Poland 	Poljska	\N
00040000-5582-8fcf-ee32-318bd71a8a6c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5582-8fcf-2736-eed375c901f1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5582-8fcf-16a3-a1bd15b857ea	QA	QAT	634	Qatar 	Katar	\N
00040000-5582-8fcf-a98d-909e83031e68	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5582-8fcf-86c0-93a12d1ab177	RO	ROU	642	Romania 	Romunija	\N
00040000-5582-8fcf-68eb-400811d1de20	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5582-8fcf-0195-36fa2eb18e74	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5582-8fcf-2b40-768f7293f3b0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5582-8fcf-cc5a-3da27c7973e2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5582-8fcf-e29c-5af5371ddfef	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5582-8fcf-35f1-5825d75895f2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5582-8fcf-730a-55b04fff4116	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5582-8fcf-e02c-de401522766c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5582-8fcf-4111-76b44443ea43	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5582-8fcf-411f-af5187efe8c5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5582-8fcf-0d0f-d452025b23e9	SM	SMR	674	San Marino 	San Marino	\N
00040000-5582-8fcf-23c7-8cb16a7e4edc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5582-8fcf-21b6-c95b8141a70d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5582-8fcf-d070-e1bbce7b07cc	SN	SEN	686	Senegal 	Senegal	\N
00040000-5582-8fcf-d27e-c469886a2637	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5582-8fcf-482e-fbabaa87754f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5582-8fcf-59e0-62a4f94b4be7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5582-8fcf-bdf5-24b0b36beb95	SG	SGP	702	Singapore 	Singapur	\N
00040000-5582-8fcf-8e50-badcca311d02	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5582-8fcf-87ce-fd793c799c67	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5582-8fcf-81ad-c69104e37277	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5582-8fcf-91d4-c51901953726	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5582-8fcf-9816-f4fee5a5a5a3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5582-8fcf-8b78-275617e3bd12	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5582-8fcf-28a9-f54d0df56eb5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5582-8fcf-5d94-57357a3048d0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5582-8fcf-a67d-afbf19b04af7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5582-8fcf-0319-7cfc9451bd72	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5582-8fcf-a8ff-65df78bc826b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5582-8fcf-5f5a-8c807750475f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5582-8fcf-9252-45dcde9b7546	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5582-8fcf-730d-382d7ba34337	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5582-8fcf-289b-d8832c49f388	SE	SWE	752	Sweden 	Švedska	\N
00040000-5582-8fcf-086b-d8cd963a9f70	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5582-8fcf-7742-364cdfe60287	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5582-8fcf-96c7-38a1e844e354	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5582-8fcf-97f1-28631f9c9840	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5582-8fcf-0518-b85066e14be8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5582-8fcf-ff29-320c72a5ea53	TH	THA	764	Thailand 	Tajska	\N
00040000-5582-8fcf-c46c-a823dfa19a61	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5582-8fcf-2860-af8eb5c057fc	TG	TGO	768	Togo 	Togo	\N
00040000-5582-8fcf-291e-7423c18f5782	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5582-8fcf-fb3b-e7b1e8554ccb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5582-8fcf-4a74-eda999310502	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5582-8fcf-ac32-a9cb0e5713e2	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5582-8fcf-59dd-51e1b4277f91	TR	TUR	792	Turkey 	Turčija	\N
00040000-5582-8fcf-e70e-7d4743cd0dca	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5582-8fcf-431a-fcc98a76c563	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-8fcf-8dad-3925fa214c43	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5582-8fcf-087c-95de3cc0a736	UG	UGA	800	Uganda 	Uganda	\N
00040000-5582-8fcf-07f4-6a52596576ad	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5582-8fcf-4f11-bc6ea4ec486d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5582-8fcf-7ee3-1429d5f09c8b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5582-8fcf-5823-869dc7c62c1d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5582-8fcf-21d6-875cf47908e7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5582-8fcf-5586-7c6ef423414c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5582-8fcf-ac48-2dc8b0b75028	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5582-8fcf-2cd0-5038ca89abae	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5582-8fcf-9aca-afcc6d096b64	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5582-8fcf-eaba-5b6e32b9c209	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5582-8fcf-61dc-513d00b7ba4b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-8fcf-9909-e14903c520f5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5582-8fcf-7b5b-b079f765e060	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5582-8fcf-d7bd-9e44d8c4a56d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5582-8fcf-7cb3-14b32c0d96b5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5582-8fcf-3831-fe3a39506352	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5582-8fcf-2796-aee6c8959440	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7690323)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7690126)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5582-8fd1-e8f1-d4638f56c69b	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5582-8fd0-68e7-e7f8fce1a0fa
000d0000-5582-8fd1-4986-67f7549fe8fa	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-8fd0-68e7-e7f8fce1a0fa
000d0000-5582-8fd1-c223-c91435e7cbdf	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5582-8fd0-0c9c-c5a255edb554
000d0000-5582-8fd1-3949-39738b9fcb43	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5582-8fd0-2bb9-7a6257e841f0
000d0000-5582-8fd1-0638-4d44b2aac3d7	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5582-8fd0-2bb9-7a6257e841f0
000d0000-5582-8fd1-7707-0fce9552c1be	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5582-8fd0-2bb9-7a6257e841f0
000d0000-5582-8fd1-27a6-c8fd2514abd0	000e0000-5582-8fd1-3513-72cf465b0ef5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-8fd0-68e7-e7f8fce1a0fa
\.


--
-- TOC entry 2843 (class 0 OID 7689946)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7689994)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7689926)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5582-8fd1-9c07-5fd691a11b77	00080000-5582-8fd1-4769-4e30d56468ff	00090000-5582-8fd1-c7ce-a9e1b0ea2d6f	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7690043)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7690068)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7689883)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5582-8fcf-de28-b17f18d9f847	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5582-8fcf-32ae-93b0d4b6ca70	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5582-8fcf-cd96-3e075a408561	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5582-8fcf-1103-50abc816a6ee	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5582-8fcf-326b-007675310404	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5582-8fcf-8345-0fb01e1de935	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5582-8fcf-59a7-b91efef8b3f2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5582-8fcf-222a-a41f8660cce3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-8fcf-e566-80b3da7ee40c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-8fcf-4721-df50334b1d0b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5582-8fcf-e979-beb608005139	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5582-8fcf-34ed-98a7acb33686	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5582-8fd1-dba1-41186ed5f0da	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5582-8fd1-b75f-11545f898307	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5582-8fd1-0ffc-6a9308cbb223	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5582-8fd1-55c2-de3b3d045fe9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5582-8fd1-ac64-7ecfa423c7bc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5582-8fd1-03da-e890ca00cbaa	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7689796)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5582-8fd1-89d6-9f6177734f6d	00000000-5582-8fd1-b75f-11545f898307	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5582-8fd1-7bed-923a031c7eca	00000000-5582-8fd1-b75f-11545f898307	00010000-5582-8fcf-23c6-58760d197ed1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5582-8fd1-b822-e5a05fdb4744	00000000-5582-8fd1-0ffc-6a9308cbb223	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7689807)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5582-8fd1-4aa7-5d5b7e766867	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5582-8fd1-c0fd-c0792aeee552	00010000-5582-8fd1-e68a-f714982cdcbd	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5582-8fd1-1b76-5a338e76b119	00010000-5582-8fd1-9ad3-28c7c4940915	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5582-8fd1-d7af-94663f81ad0c	00010000-5582-8fd1-ff88-daaa0817fff9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5582-8fd1-7172-f73eb7e4c232	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5582-8fd1-4767-3297532bbf46	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5582-8fd1-f615-8cdcfcecd6fe	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5582-8fd1-c7e6-3336c6841219	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5582-8fd1-c7ce-a9e1b0ea2d6f	00010000-5582-8fd1-4949-5932383c80a0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5582-8fd1-036f-9ad9cf50336c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5582-8fd1-7c1d-9e17a621e5ff	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5582-8fd1-dfd4-54ef2c0a98e6	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5582-8fd1-0ed1-043b4bfb0970	00010000-5582-8fd1-b1df-e73c5fa4cdc3	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7689761)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5582-8fcf-71af-b78ac822c8c8	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5582-8fcf-98b7-2e6f828c45c4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5582-8fcf-a558-84027234f265	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5582-8fcf-fefb-c95fef8ae7f8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5582-8fcf-a741-6930a6bab0eb	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5582-8fcf-1f26-1e3e20549840	Abonma-read	Abonma - branje	f
00030000-5582-8fcf-187c-d137dc8b8cba	Abonma-write	Abonma - spreminjanje	f
00030000-5582-8fcf-1d01-f1d824dd9667	Alternacija-read	Alternacija - branje	f
00030000-5582-8fcf-ae02-b604d53d1d6f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5582-8fcf-b9c0-4dc0046cef49	Arhivalija-read	Arhivalija - branje	f
00030000-5582-8fcf-64a6-6984086a1352	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5582-8fcf-a107-109f60c66846	Besedilo-read	Besedilo - branje	f
00030000-5582-8fcf-67df-e7731326757c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5582-8fcf-2064-91bae9f4712d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5582-8fcf-4090-3bb6c1f0eac0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5582-8fcf-9db7-fb79e27bbb93	Dogodek-read	Dogodek - branje	f
00030000-5582-8fcf-a279-6bad99638562	Dogodek-write	Dogodek - spreminjanje	f
00030000-5582-8fcf-bcce-1b1420904301	Drzava-read	Drzava - branje	f
00030000-5582-8fcf-ad79-cbe005a36031	Drzava-write	Drzava - spreminjanje	f
00030000-5582-8fcf-376d-faa853c37740	Funkcija-read	Funkcija - branje	f
00030000-5582-8fcf-8a10-b35ffa95f5a8	Funkcija-write	Funkcija - spreminjanje	f
00030000-5582-8fcf-6410-ad52c3b16f8d	Gostovanje-read	Gostovanje - branje	f
00030000-5582-8fcf-ad85-2efe92c3692b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5582-8fcf-a71a-4daf39f4d17e	Gostujoca-read	Gostujoca - branje	f
00030000-5582-8fcf-5fda-44423dbe5d75	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5582-8fcf-cf35-728453a7c5c9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5582-8fcf-b289-d756a6e721ec	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5582-8fcf-ce5f-f45d528ce0a6	Kupec-read	Kupec - branje	f
00030000-5582-8fcf-6bb0-90e71eb3fdc7	Kupec-write	Kupec - spreminjanje	f
00030000-5582-8fcf-99ee-02e1c40c9c38	NacinPlacina-read	NacinPlacina - branje	f
00030000-5582-8fcf-b45e-c373cd0ce5ea	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5582-8fcf-4bf7-ff3ee1ab5103	Option-read	Option - branje	f
00030000-5582-8fcf-dd4a-922b0cb430e1	Option-write	Option - spreminjanje	f
00030000-5582-8fcf-9bfe-083f3ed254f9	OptionValue-read	OptionValue - branje	f
00030000-5582-8fcf-427b-1120a82b84a7	OptionValue-write	OptionValue - spreminjanje	f
00030000-5582-8fcf-b5b0-51daac3e80a8	Oseba-read	Oseba - branje	f
00030000-5582-8fcf-e323-a55274536f7e	Oseba-write	Oseba - spreminjanje	f
00030000-5582-8fcf-3c6d-39507e43f8b5	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5582-8fcf-81ff-d247f3d8e7e4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5582-8fcf-6dd1-0779cad035b2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5582-8fcf-054e-4d162e399e23	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5582-8fcf-b9b2-f80f6bb608a1	Pogodba-read	Pogodba - branje	f
00030000-5582-8fcf-0181-8578279b5bd8	Pogodba-write	Pogodba - spreminjanje	f
00030000-5582-8fcf-b7b1-db0e7f84b1af	Popa-read	Popa - branje	f
00030000-5582-8fcf-41fc-e1a6e2d2573d	Popa-write	Popa - spreminjanje	f
00030000-5582-8fcf-29b6-634c0dc0f7b0	Posta-read	Posta - branje	f
00030000-5582-8fcf-4d22-653fbcbe5bf2	Posta-write	Posta - spreminjanje	f
00030000-5582-8fcf-8db5-993ac44c6abc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5582-8fcf-8e75-5b7301904e7e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5582-8fcf-05e2-c560ba0e6617	PostniNaslov-read	PostniNaslov - branje	f
00030000-5582-8fcf-10a6-a2ff73b5752e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5582-8fcf-e50d-a10d1e59c9e0	Predstava-read	Predstava - branje	f
00030000-5582-8fcf-c57b-a6acd0ca15d2	Predstava-write	Predstava - spreminjanje	f
00030000-5582-8fcf-9878-decd84d4779c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5582-8fcf-12c5-93362184e8ca	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5582-8fcf-4baa-91d4087f904a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5582-8fcf-818a-889ff8a86cc8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5582-8fcf-1568-174266f5a46d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5582-8fcf-4d05-d963916ed01f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5582-8fcf-ce87-b27f43f3b098	ProgramDela-read	ProgramDela - branje	f
00030000-5582-8fcf-6f38-1ad7f61792b9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5582-8fcf-4583-b66258f26a56	ProgramFestival-read	ProgramFestival - branje	f
00030000-5582-8fcf-6c32-75f005f65f9e	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5582-8fcf-362c-acb393cde231	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5582-8fcf-d97e-4bb337d1c0d1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5582-8fcf-43df-314e97ac0f76	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5582-8fcf-1746-dbedcd8033a6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5582-8fcf-7287-a4e0ca639102	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5582-8fcf-63d6-ad2440c6edee	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5582-8fcf-3576-5fff4f1e02ce	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5582-8fcf-cda7-91ac7994365f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5582-8fcf-3c28-42ea3f4e0369	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5582-8fcf-f2b8-d144f2286e7b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5582-8fcf-4309-a7f326ba9004	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5582-8fcf-2a23-4da83af5b9dc	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5582-8fcf-784d-e201fe2fcf98	ProgramRazno-read	ProgramRazno - branje	f
00030000-5582-8fcf-766c-441216d1d019	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5582-8fcf-47ba-7037abc012ba	Prostor-read	Prostor - branje	f
00030000-5582-8fcf-3535-4a4970f0b8b8	Prostor-write	Prostor - spreminjanje	f
00030000-5582-8fcf-ede9-f5b7df0e37d3	Racun-read	Racun - branje	f
00030000-5582-8fcf-8386-11affee0f1ef	Racun-write	Racun - spreminjanje	f
00030000-5582-8fcf-63d5-cd6b4f1f3588	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5582-8fcf-bb28-13ef9a5dc51c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5582-8fcf-3713-51055f173dab	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5582-8fcf-c1dd-e65ca9a636f4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5582-8fcf-f32e-0cb20fcd918a	Rekvizit-read	Rekvizit - branje	f
00030000-5582-8fcf-87dd-148caddbd40a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5582-8fcf-4727-b0cd4e4f8244	Revizija-read	Revizija - branje	f
00030000-5582-8fcf-7f00-77e73faef27f	Revizija-write	Revizija - spreminjanje	f
00030000-5582-8fcf-9ff7-8fbae88bb8be	Rezervacija-read	Rezervacija - branje	f
00030000-5582-8fcf-05c5-52bbd95cfa95	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5582-8fcf-8feb-b83bc42e0451	SedezniRed-read	SedezniRed - branje	f
00030000-5582-8fcf-0be0-ce09363b0276	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5582-8fcf-1908-5d7085169e26	Sedez-read	Sedez - branje	f
00030000-5582-8fcf-770d-a8107afa02ad	Sedez-write	Sedez - spreminjanje	f
00030000-5582-8fcf-8f98-a47bb36b354f	Sezona-read	Sezona - branje	f
00030000-5582-8fcf-0efe-84a5a5c1c19f	Sezona-write	Sezona - spreminjanje	f
00030000-5582-8fcf-84ed-ceda30a585c4	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5582-8fcf-d179-3cef631d90da	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5582-8fcf-6312-2d879e3f2555	Stevilcenje-read	Stevilcenje - branje	f
00030000-5582-8fcf-e4c9-dd66d56ce1f0	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5582-8fcf-1183-ba05c99c573b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5582-8fcf-a59f-a71361b6eb36	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5582-8fcf-5d83-c6d3cf2bb1a6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5582-8fcf-c4be-45ecac45b3c4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5582-8fcf-cb11-7b5f3df25f7e	Telefonska-read	Telefonska - branje	f
00030000-5582-8fcf-110e-1eca490e7d80	Telefonska-write	Telefonska - spreminjanje	f
00030000-5582-8fcf-49a7-5c40cdff811d	TerminStoritve-read	TerminStoritve - branje	f
00030000-5582-8fcf-4422-ae701527db14	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5582-8fcf-c73f-8bfee296bcf6	TipFunkcije-read	TipFunkcije - branje	f
00030000-5582-8fcf-c9b7-3d25581cd7ea	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5582-8fcf-ddc7-cc1c5c9b4304	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5582-8fcf-56df-f07278194891	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5582-8fcf-a944-8a9d821f5acd	Trr-read	Trr - branje	f
00030000-5582-8fcf-2424-cdff12bebc67	Trr-write	Trr - spreminjanje	f
00030000-5582-8fcf-25f2-fe1b8e80d2aa	Uprizoritev-read	Uprizoritev - branje	f
00030000-5582-8fcf-468a-2f01e8e36fd5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5582-8fcf-53aa-9ac47703f608	Vaja-read	Vaja - branje	f
00030000-5582-8fcf-2592-77878cd0a72c	Vaja-write	Vaja - spreminjanje	f
00030000-5582-8fcf-8d97-a86d2b141f41	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5582-8fcf-faf3-4a17dcdfec55	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5582-8fcf-97db-9911a8ebbb0c	Zaposlitev-read	Zaposlitev - branje	f
00030000-5582-8fcf-d774-a8c257277dbd	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5582-8fcf-9eee-f9cbf7bcdf46	Zasedenost-read	Zasedenost - branje	f
00030000-5582-8fcf-7281-3af30439001a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5582-8fcf-e039-a8016f584801	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5582-8fcf-dce4-f9871026e14e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5582-8fcf-49d4-747178126386	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5582-8fcf-14ef-2c7ec29a24b0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7689780)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5582-8fcf-e345-e1262dc1a5fa	00030000-5582-8fcf-98b7-2e6f828c45c4
00020000-5582-8fcf-b6c6-a5ff65111a30	00030000-5582-8fcf-bcce-1b1420904301
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-1f26-1e3e20549840
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-187c-d137dc8b8cba
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-1d01-f1d824dd9667
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-ae02-b604d53d1d6f
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-b9c0-4dc0046cef49
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-9db7-fb79e27bbb93
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-fefb-c95fef8ae7f8
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-a279-6bad99638562
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-bcce-1b1420904301
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-ad79-cbe005a36031
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-376d-faa853c37740
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-8a10-b35ffa95f5a8
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-6410-ad52c3b16f8d
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-ad85-2efe92c3692b
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-a71a-4daf39f4d17e
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-5fda-44423dbe5d75
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-cf35-728453a7c5c9
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-b289-d756a6e721ec
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-4bf7-ff3ee1ab5103
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-9bfe-083f3ed254f9
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-b5b0-51daac3e80a8
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-e323-a55274536f7e
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-b7b1-db0e7f84b1af
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-41fc-e1a6e2d2573d
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-29b6-634c0dc0f7b0
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-4d22-653fbcbe5bf2
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-05e2-c560ba0e6617
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-10a6-a2ff73b5752e
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-e50d-a10d1e59c9e0
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-c57b-a6acd0ca15d2
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-1568-174266f5a46d
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-4d05-d963916ed01f
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-47ba-7037abc012ba
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-3535-4a4970f0b8b8
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-3713-51055f173dab
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-c1dd-e65ca9a636f4
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-f32e-0cb20fcd918a
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-87dd-148caddbd40a
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-8f98-a47bb36b354f
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-0efe-84a5a5c1c19f
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-c73f-8bfee296bcf6
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-25f2-fe1b8e80d2aa
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-468a-2f01e8e36fd5
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-53aa-9ac47703f608
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-2592-77878cd0a72c
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-9eee-f9cbf7bcdf46
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-7281-3af30439001a
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-e039-a8016f584801
00020000-5582-8fcf-da3f-4dca53bd0225	00030000-5582-8fcf-49d4-747178126386
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-1f26-1e3e20549840
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-b9c0-4dc0046cef49
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-9db7-fb79e27bbb93
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-bcce-1b1420904301
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-6410-ad52c3b16f8d
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-a71a-4daf39f4d17e
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-cf35-728453a7c5c9
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-b289-d756a6e721ec
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-4bf7-ff3ee1ab5103
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-9bfe-083f3ed254f9
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-b5b0-51daac3e80a8
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-e323-a55274536f7e
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-b7b1-db0e7f84b1af
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-29b6-634c0dc0f7b0
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-05e2-c560ba0e6617
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-10a6-a2ff73b5752e
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-e50d-a10d1e59c9e0
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-47ba-7037abc012ba
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-3713-51055f173dab
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-f32e-0cb20fcd918a
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-8f98-a47bb36b354f
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-cb11-7b5f3df25f7e
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-110e-1eca490e7d80
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-a944-8a9d821f5acd
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-2424-cdff12bebc67
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-97db-9911a8ebbb0c
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-d774-a8c257277dbd
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-e039-a8016f584801
00020000-5582-8fcf-5b35-3bb8614b653f	00030000-5582-8fcf-49d4-747178126386
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-1f26-1e3e20549840
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-1d01-f1d824dd9667
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-b9c0-4dc0046cef49
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-64a6-6984086a1352
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-a107-109f60c66846
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-2064-91bae9f4712d
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-9db7-fb79e27bbb93
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-bcce-1b1420904301
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-376d-faa853c37740
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-6410-ad52c3b16f8d
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-a71a-4daf39f4d17e
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-cf35-728453a7c5c9
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-4bf7-ff3ee1ab5103
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-9bfe-083f3ed254f9
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-b5b0-51daac3e80a8
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-b7b1-db0e7f84b1af
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-29b6-634c0dc0f7b0
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-e50d-a10d1e59c9e0
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-1568-174266f5a46d
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-47ba-7037abc012ba
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-3713-51055f173dab
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-f32e-0cb20fcd918a
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-8f98-a47bb36b354f
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-c73f-8bfee296bcf6
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-53aa-9ac47703f608
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-9eee-f9cbf7bcdf46
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-e039-a8016f584801
00020000-5582-8fcf-89f4-260fb6b6d427	00030000-5582-8fcf-49d4-747178126386
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-1f26-1e3e20549840
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-187c-d137dc8b8cba
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-ae02-b604d53d1d6f
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-b9c0-4dc0046cef49
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-9db7-fb79e27bbb93
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-bcce-1b1420904301
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-6410-ad52c3b16f8d
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-a71a-4daf39f4d17e
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-4bf7-ff3ee1ab5103
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-9bfe-083f3ed254f9
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-b7b1-db0e7f84b1af
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-29b6-634c0dc0f7b0
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-e50d-a10d1e59c9e0
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-47ba-7037abc012ba
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-3713-51055f173dab
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-f32e-0cb20fcd918a
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-8f98-a47bb36b354f
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-c73f-8bfee296bcf6
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-e039-a8016f584801
00020000-5582-8fcf-dfd9-c407e7d248af	00030000-5582-8fcf-49d4-747178126386
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-1f26-1e3e20549840
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-b9c0-4dc0046cef49
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-9db7-fb79e27bbb93
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-bcce-1b1420904301
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-6410-ad52c3b16f8d
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-a71a-4daf39f4d17e
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-4bf7-ff3ee1ab5103
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-9bfe-083f3ed254f9
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-b7b1-db0e7f84b1af
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-29b6-634c0dc0f7b0
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-e50d-a10d1e59c9e0
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-47ba-7037abc012ba
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-3713-51055f173dab
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-f32e-0cb20fcd918a
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-8f98-a47bb36b354f
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-49a7-5c40cdff811d
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-a558-84027234f265
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-c73f-8bfee296bcf6
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-e039-a8016f584801
00020000-5582-8fcf-e513-b6216df0a1d4	00030000-5582-8fcf-49d4-747178126386
\.


--
-- TOC entry 2858 (class 0 OID 7690075)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7690106)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7690242)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7689840)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5582-8fd1-4769-4e30d56468ff	00040000-5582-8fcf-8e85-cc8eba3cb6df	0988	koproducent	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-8fd1-f100-0f119c3b1d57	00040000-5582-8fcf-8e85-cc8eba3cb6df	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-8fd1-4c25-aca238dd7885	00040000-5582-8fcf-8e85-cc8eba3cb6df	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-8fd1-7c35-899273f743aa	00040000-5582-8fcf-8e85-cc8eba3cb6df	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-8fd1-0ddb-18d76466be94	00040000-5582-8fcf-81ad-c69104e37277	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7689875)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5582-8fcf-86a8-a4590ea37afc	8341	Adlešiči
00050000-5582-8fcf-93a4-036b5d8d9959	5270	Ajdovščina
00050000-5582-8fd0-4d14-9ccfae497588	6280	Ankaran/Ancarano
00050000-5582-8fd0-b7c7-440e565b618b	9253	Apače
00050000-5582-8fd0-a5a9-20654a6b027c	8253	Artiče
00050000-5582-8fd0-7b2c-31bbb8773b40	4275	Begunje na Gorenjskem
00050000-5582-8fd0-6171-f2bcc98b0e3d	1382	Begunje pri Cerknici
00050000-5582-8fd0-22d3-d72cbd0894ea	9231	Beltinci
00050000-5582-8fd0-6fd9-cd657e2c73d2	2234	Benedikt
00050000-5582-8fd0-2467-9d1164167706	2345	Bistrica ob Dravi
00050000-5582-8fd0-f397-601b7d4293b0	3256	Bistrica ob Sotli
00050000-5582-8fd0-fe56-c09c47394992	8259	Bizeljsko
00050000-5582-8fd0-6e13-0c19ba1af988	1223	Blagovica
00050000-5582-8fd0-f6e4-23822b285b1a	8283	Blanca
00050000-5582-8fd0-6ac0-380bd09d82db	4260	Bled
00050000-5582-8fd0-7f3f-d3a73dca4208	4273	Blejska Dobrava
00050000-5582-8fd0-e430-9f458089807a	9265	Bodonci
00050000-5582-8fd0-2f72-5dc4f1538d4b	9222	Bogojina
00050000-5582-8fd0-9910-c4a6f547c3b9	4263	Bohinjska Bela
00050000-5582-8fd0-157d-1f1fc436c5f9	4264	Bohinjska Bistrica
00050000-5582-8fd0-d648-77f95a234de7	4265	Bohinjsko jezero
00050000-5582-8fd0-c96d-be91d5057206	1353	Borovnica
00050000-5582-8fd0-b71b-8427332c7b07	8294	Boštanj
00050000-5582-8fd0-4454-cd79ad7ff93a	5230	Bovec
00050000-5582-8fd0-1c55-9f7959b4dd38	5295	Branik
00050000-5582-8fd0-19a3-e64d1c6c58f7	3314	Braslovče
00050000-5582-8fd0-4977-175f0f850586	5223	Breginj
00050000-5582-8fd0-343b-3dc97a99a08f	8280	Brestanica
00050000-5582-8fd0-19bf-a9308f330bfb	2354	Bresternica
00050000-5582-8fd0-5509-2758ac2ead43	4243	Brezje
00050000-5582-8fd0-075c-f47486eed806	1351	Brezovica pri Ljubljani
00050000-5582-8fd0-40ef-f23f44741f6d	8250	Brežice
00050000-5582-8fd0-5d43-044c4324f5b0	4210	Brnik - Aerodrom
00050000-5582-8fd0-f224-371d05012006	8321	Brusnice
00050000-5582-8fd0-1176-b365332ac29b	3255	Buče
00050000-5582-8fd0-56c0-cfc660aa1389	8276	Bučka 
00050000-5582-8fd0-3b25-01cb14cf8061	9261	Cankova
00050000-5582-8fd0-a0b1-6857dc022353	3000	Celje 
00050000-5582-8fd0-0b6a-97c0c5de0feb	3001	Celje - poštni predali
00050000-5582-8fd0-ed3f-de16f492c251	4207	Cerklje na Gorenjskem
00050000-5582-8fd0-13be-a2555cc14c66	8263	Cerklje ob Krki
00050000-5582-8fd0-6468-beb77e350d3c	1380	Cerknica
00050000-5582-8fd0-c701-35c0fb684d59	5282	Cerkno
00050000-5582-8fd0-ab7d-4a0974860591	2236	Cerkvenjak
00050000-5582-8fd0-11b8-86299568d5e3	2215	Ceršak
00050000-5582-8fd0-3bdf-bb1115eb3f93	2326	Cirkovce
00050000-5582-8fd0-3205-22fa1f0cf21c	2282	Cirkulane
00050000-5582-8fd0-3547-b7438b0cfa9b	5273	Col
00050000-5582-8fd0-7688-58e6060d4d13	8251	Čatež ob Savi
00050000-5582-8fd0-e03c-d30c8cc47b28	1413	Čemšenik
00050000-5582-8fd0-0239-e93e97afe4a1	5253	Čepovan
00050000-5582-8fd0-f8c4-dc576f96f8e4	9232	Črenšovci
00050000-5582-8fd0-7069-bb9993a12ea3	2393	Črna na Koroškem
00050000-5582-8fd0-0bba-1a24c9635666	6275	Črni Kal
00050000-5582-8fd0-34da-39403838093a	5274	Črni Vrh nad Idrijo
00050000-5582-8fd0-f961-f18e0e0f132e	5262	Črniče
00050000-5582-8fd0-bc84-db5b62eefeb5	8340	Črnomelj
00050000-5582-8fd0-fd6f-3984f2008d4e	6271	Dekani
00050000-5582-8fd0-401b-ef01fbd0a395	5210	Deskle
00050000-5582-8fd0-67c2-623cc99c7625	2253	Destrnik
00050000-5582-8fd0-d306-c749ec44259e	6215	Divača
00050000-5582-8fd0-83fb-b7f2e7255506	1233	Dob
00050000-5582-8fd0-fdcc-e3e1634069fb	3224	Dobje pri Planini
00050000-5582-8fd0-4dac-5f3a8fc94bae	8257	Dobova
00050000-5582-8fd0-ecff-e51cca0d4d7b	1423	Dobovec
00050000-5582-8fd0-67bc-2c8d4c13e094	5263	Dobravlje
00050000-5582-8fd0-306c-a6d0c6f21f6a	3204	Dobrna
00050000-5582-8fd0-1980-4236b0090425	8211	Dobrnič
00050000-5582-8fd0-1462-f76d6fc49dd2	1356	Dobrova
00050000-5582-8fd0-c3c8-d7197bce2211	9223	Dobrovnik/Dobronak 
00050000-5582-8fd0-bae0-544f1b2da020	5212	Dobrovo v Brdih
00050000-5582-8fd0-af08-3f3d896335fd	1431	Dol pri Hrastniku
00050000-5582-8fd0-77d8-64b35428ea32	1262	Dol pri Ljubljani
00050000-5582-8fd0-0283-31c110202a35	1273	Dole pri Litiji
00050000-5582-8fd0-0a5f-7793f087d7ca	1331	Dolenja vas
00050000-5582-8fd0-bdc1-29ade2d60798	8350	Dolenjske Toplice
00050000-5582-8fd0-6f4f-33b279457fec	1230	Domžale
00050000-5582-8fd0-8c62-949d0b6add4b	2252	Dornava
00050000-5582-8fd0-5f6a-7c8615ef8ffc	5294	Dornberk
00050000-5582-8fd0-be26-fbc4b1eafe8a	1319	Draga
00050000-5582-8fd0-8719-1ca22e63a73d	8343	Dragatuš
00050000-5582-8fd0-47e3-f2ed3b0c8bb2	3222	Dramlje
00050000-5582-8fd0-a56a-c6d25922ca0f	2370	Dravograd
00050000-5582-8fd0-df5e-fbb2f7b251e6	4203	Duplje
00050000-5582-8fd0-0d32-4772dbe3765d	6221	Dutovlje
00050000-5582-8fd0-bb2e-f3b4ec79e7b2	8361	Dvor
00050000-5582-8fd0-7c1b-7db7b6e9ddc9	2343	Fala
00050000-5582-8fd0-4eea-10a356e3c063	9208	Fokovci
00050000-5582-8fd0-90eb-9eda631e5b36	2313	Fram
00050000-5582-8fd0-d6b4-cff67cf9b039	3213	Frankolovo
00050000-5582-8fd0-d27f-9e08253cd998	1274	Gabrovka
00050000-5582-8fd0-1158-121f1bb98ea8	8254	Globoko
00050000-5582-8fd0-6ade-c13b20e9cf59	5275	Godovič
00050000-5582-8fd0-6d9e-72e95c4433f2	4204	Golnik
00050000-5582-8fd0-c876-53b615d277a8	3303	Gomilsko
00050000-5582-8fd0-dd9d-42b3c5610c44	4224	Gorenja vas
00050000-5582-8fd0-0ca3-5f12c59b9e96	3263	Gorica pri Slivnici
00050000-5582-8fd0-b226-a26646f74341	2272	Gorišnica
00050000-5582-8fd0-ad62-e21b5465a6ad	9250	Gornja Radgona
00050000-5582-8fd0-05c9-d0fe7f63720d	3342	Gornji Grad
00050000-5582-8fd0-c78e-3a2abca3ca6e	4282	Gozd Martuljek
00050000-5582-8fd0-e5d9-f33ce4d8b52c	6272	Gračišče
00050000-5582-8fd0-8c5d-31460c918435	9264	Grad
00050000-5582-8fd0-441b-7e64d4d0f0f4	8332	Gradac
00050000-5582-8fd0-4d50-d1874657348f	1384	Grahovo
00050000-5582-8fd0-5325-dacf6930b3c5	5242	Grahovo ob Bači
00050000-5582-8fd0-8353-db739fd47e93	5251	Grgar
00050000-5582-8fd0-a87e-c656a27ad3fb	3302	Griže
00050000-5582-8fd0-2864-47e3908b0892	3231	Grobelno
00050000-5582-8fd0-ecc7-dda71922489a	1290	Grosuplje
00050000-5582-8fd0-90b1-2214d99cb051	2288	Hajdina
00050000-5582-8fd0-9c37-f8a7f3a1fb8c	8362	Hinje
00050000-5582-8fd0-a446-97d33af1d57f	2311	Hoče
00050000-5582-8fd0-a6a0-03b6bbf78219	9205	Hodoš/Hodos
00050000-5582-8fd0-3c0a-4b01506f4fac	1354	Horjul
00050000-5582-8fd0-7442-2ae49f5e8d5c	1372	Hotedršica
00050000-5582-8fd0-d272-4eadb21d1c29	1430	Hrastnik
00050000-5582-8fd0-aa62-f94fa5240a18	6225	Hruševje
00050000-5582-8fd0-366d-9418ad3a0f16	4276	Hrušica
00050000-5582-8fd0-05e1-96b765d2a548	5280	Idrija
00050000-5582-8fd0-c097-4928ce9f849b	1292	Ig
00050000-5582-8fd0-64e5-17694d5bbacd	6250	Ilirska Bistrica
00050000-5582-8fd0-a622-0c2e11eb82aa	6251	Ilirska Bistrica-Trnovo
00050000-5582-8fd0-a6db-9846a9b9972d	1295	Ivančna Gorica
00050000-5582-8fd0-cb3b-445691bd5436	2259	Ivanjkovci
00050000-5582-8fd0-0934-847a41c7038b	1411	Izlake
00050000-5582-8fd0-6fb4-921d5778715f	6310	Izola/Isola
00050000-5582-8fd0-1214-ff9ecf2a08d6	2222	Jakobski Dol
00050000-5582-8fd0-4688-b0e2ff584ac8	2221	Jarenina
00050000-5582-8fd0-7ec2-d99fd71a2f1e	6254	Jelšane
00050000-5582-8fd0-2352-5f2d9bcaf8d5	4270	Jesenice
00050000-5582-8fd0-6e39-ca92c420e7d5	8261	Jesenice na Dolenjskem
00050000-5582-8fd0-1ab2-875f05e8af89	3273	Jurklošter
00050000-5582-8fd0-2ad1-7d2e75789dbc	2223	Jurovski Dol
00050000-5582-8fd0-080f-894114c40c6a	2256	Juršinci
00050000-5582-8fd0-fe0b-a8550de0f1fd	5214	Kal nad Kanalom
00050000-5582-8fd0-295b-81bd2855dde8	3233	Kalobje
00050000-5582-8fd0-440a-94c9b4683327	4246	Kamna Gorica
00050000-5582-8fd0-6a00-5ca0d3c390dd	2351	Kamnica
00050000-5582-8fd0-24d7-73072db168d7	1241	Kamnik
00050000-5582-8fd0-635e-fa175ea37689	5213	Kanal
00050000-5582-8fd0-a0d5-ae50426a28b2	8258	Kapele
00050000-5582-8fd0-a4da-9a42d6afde1e	2362	Kapla
00050000-5582-8fd0-d477-2a75479427ac	2325	Kidričevo
00050000-5582-8fd0-8079-c33f0d620803	1412	Kisovec
00050000-5582-8fd0-8a81-0f47a277c3c2	6253	Knežak
00050000-5582-8fd0-7647-318cefcc2807	5222	Kobarid
00050000-5582-8fd0-2fae-1f1ffa4b6cc5	9227	Kobilje
00050000-5582-8fd0-c673-b492cfeac910	1330	Kočevje
00050000-5582-8fd0-c317-6e19e42383a9	1338	Kočevska Reka
00050000-5582-8fd0-90a9-e69280f018cf	2276	Kog
00050000-5582-8fd0-3624-b0463ef11164	5211	Kojsko
00050000-5582-8fd0-d101-65b38d4fa34d	6223	Komen
00050000-5582-8fd0-9071-dc9c18030f7c	1218	Komenda
00050000-5582-8fd0-303b-43e8480fecce	6000	Koper/Capodistria 
00050000-5582-8fd0-5611-f4beec5e2a3c	6001	Koper/Capodistria - poštni predali
00050000-5582-8fd0-a577-c094c861935e	8282	Koprivnica
00050000-5582-8fd0-0a0b-2885fe93159a	5296	Kostanjevica na Krasu
00050000-5582-8fd0-cf0e-da6828c50633	8311	Kostanjevica na Krki
00050000-5582-8fd0-11a4-2c55a7367301	1336	Kostel
00050000-5582-8fd0-0197-3c27e42dff4c	6256	Košana
00050000-5582-8fd0-1bc0-140356bfc072	2394	Kotlje
00050000-5582-8fd0-509f-239a002c42cc	6240	Kozina
00050000-5582-8fd0-d228-80e80b929d6a	3260	Kozje
00050000-5582-8fd0-7c0b-b9a2b8abeabe	4000	Kranj 
00050000-5582-8fd0-f037-a8657c9915c0	4001	Kranj - poštni predali
00050000-5582-8fd0-b14a-4929fd52ced3	4280	Kranjska Gora
00050000-5582-8fd0-1df6-2db4bc1b18b9	1281	Kresnice
00050000-5582-8fd0-9767-6223c720bd5f	4294	Križe
00050000-5582-8fd0-a1f1-c840a4c372b4	9206	Križevci
00050000-5582-8fd0-3e3b-9c10fc9cc494	9242	Križevci pri Ljutomeru
00050000-5582-8fd0-24d8-af5d15a55bf5	1301	Krka
00050000-5582-8fd0-d68f-cab38a8db1df	8296	Krmelj
00050000-5582-8fd0-c2b2-77584a75ec61	4245	Kropa
00050000-5582-8fd0-6a46-03ad69c84623	8262	Krška vas
00050000-5582-8fd0-fa6a-5ba41e1166fe	8270	Krško
00050000-5582-8fd0-0742-1cf010c30a54	9263	Kuzma
00050000-5582-8fd0-c567-7bcd59205ca7	2318	Laporje
00050000-5582-8fd0-5ae4-52f6b6853561	3270	Laško
00050000-5582-8fd0-40aa-83ab21005589	1219	Laze v Tuhinju
00050000-5582-8fd0-dd30-d2660857687d	2230	Lenart v Slovenskih goricah
00050000-5582-8fd0-944d-14b49439cc4c	9220	Lendava/Lendva
00050000-5582-8fd0-e4f9-b47ca90407b9	4248	Lesce
00050000-5582-8fd0-c08f-88ee8c461adf	3261	Lesično
00050000-5582-8fd0-88df-62a4c67bcf06	8273	Leskovec pri Krškem
00050000-5582-8fd0-a5f5-2cae02c06ca4	2372	Libeliče
00050000-5582-8fd0-eca5-a417f08761f1	2341	Limbuš
00050000-5582-8fd0-4957-588e1a4ccfab	1270	Litija
00050000-5582-8fd0-dab6-8015d94343b1	3202	Ljubečna
00050000-5582-8fd0-3f80-177ee9133f44	1000	Ljubljana 
00050000-5582-8fd0-a8a6-73a135734581	1001	Ljubljana - poštni predali
00050000-5582-8fd0-a976-67379254c4bb	1231	Ljubljana - Črnuče
00050000-5582-8fd0-8d55-0f0c08c4f3fb	1261	Ljubljana - Dobrunje
00050000-5582-8fd0-e25e-801cf1b8ece4	1260	Ljubljana - Polje
00050000-5582-8fd0-ba99-8278839a72ed	1210	Ljubljana - Šentvid
00050000-5582-8fd0-506b-c5c5767a9bff	1211	Ljubljana - Šmartno
00050000-5582-8fd0-fefc-8566ec2e2498	3333	Ljubno ob Savinji
00050000-5582-8fd0-9ffa-b175f915efc3	9240	Ljutomer
00050000-5582-8fd0-b8bb-e48b6fbef73a	3215	Loče
00050000-5582-8fd0-c660-010eacbd4d98	5231	Log pod Mangartom
00050000-5582-8fd0-541c-1d08a2c4d3bd	1358	Log pri Brezovici
00050000-5582-8fd0-561c-bfd7a167fbfe	1370	Logatec
00050000-5582-8fd0-8ef8-b56447479687	1371	Logatec
00050000-5582-8fd0-d94d-7abc2b039831	1434	Loka pri Zidanem Mostu
00050000-5582-8fd0-71ae-a323ad93e54c	3223	Loka pri Žusmu
00050000-5582-8fd0-fb33-75ef6e57fd32	6219	Lokev
00050000-5582-8fd0-b4bd-f93cc36f412e	1318	Loški Potok
00050000-5582-8fd0-131a-9d74a2499e67	2324	Lovrenc na Dravskem polju
00050000-5582-8fd0-01d4-5b957d3d7717	2344	Lovrenc na Pohorju
00050000-5582-8fd0-647a-70a8ef441034	3334	Luče
00050000-5582-8fd0-b321-b295a012925d	1225	Lukovica
00050000-5582-8fd0-0173-f28071d5044f	9202	Mačkovci
00050000-5582-8fd0-c5c6-a1cf55a5efc8	2322	Majšperk
00050000-5582-8fd0-77b1-5d4aeb1c70fc	2321	Makole
00050000-5582-8fd0-2df1-478fd0702235	9243	Mala Nedelja
00050000-5582-8fd0-ba2a-c9116121924b	2229	Malečnik
00050000-5582-8fd0-2d07-2df0e59ca21d	6273	Marezige
00050000-5582-8fd0-7703-b6a01c36fa17	2000	Maribor 
00050000-5582-8fd0-a88a-7b92420d5144	2001	Maribor - poštni predali
00050000-5582-8fd0-5f16-696d9ad0818a	2206	Marjeta na Dravskem polju
00050000-5582-8fd0-fb45-0ad21324ff37	2281	Markovci
00050000-5582-8fd0-7e20-8b3dcd9ef3de	9221	Martjanci
00050000-5582-8fd0-08fd-f16d1726d0c4	6242	Materija
00050000-5582-8fd0-1dc1-d27d53b097f8	4211	Mavčiče
00050000-5582-8fd0-6571-53df8933e12d	1215	Medvode
00050000-5582-8fd0-63a2-23596044a235	1234	Mengeš
00050000-5582-8fd0-00c9-e0caf4141c5c	8330	Metlika
00050000-5582-8fd0-0549-6058ac571321	2392	Mežica
00050000-5582-8fd0-78b7-b9fc01192b8b	2204	Miklavž na Dravskem polju
00050000-5582-8fd0-f780-a8fc02d6a392	2275	Miklavž pri Ormožu
00050000-5582-8fd0-74c8-452c30eba3bd	5291	Miren
00050000-5582-8fd0-f3fe-860dcaa85455	8233	Mirna
00050000-5582-8fd0-9f2a-fa213d110b19	8216	Mirna Peč
00050000-5582-8fd0-48f0-b28813272198	2382	Mislinja
00050000-5582-8fd0-b2f2-4787e0970f06	4281	Mojstrana
00050000-5582-8fd0-15d3-1d4b6d29ef03	8230	Mokronog
00050000-5582-8fd0-8300-21614aa07449	1251	Moravče
00050000-5582-8fd0-b5bd-0fb80a894a08	9226	Moravske Toplice
00050000-5582-8fd0-d4a5-3a55cbc0074c	5216	Most na Soči
00050000-5582-8fd0-8240-81fa1a31d53f	1221	Motnik
00050000-5582-8fd0-dc1f-958876c1d856	3330	Mozirje
00050000-5582-8fd0-0a8c-449feba4c1ec	9000	Murska Sobota 
00050000-5582-8fd0-b6a9-b8a15a7152e6	9001	Murska Sobota - poštni predali
00050000-5582-8fd0-af0b-3290c92af029	2366	Muta
00050000-5582-8fd0-c429-5b06488573aa	4202	Naklo
00050000-5582-8fd0-2c70-aa64272529c7	3331	Nazarje
00050000-5582-8fd0-03fe-2faf6a137d54	1357	Notranje Gorice
00050000-5582-8fd0-5c08-d5a09f7dba14	3203	Nova Cerkev
00050000-5582-8fd0-90dc-d3cd3278554e	5000	Nova Gorica 
00050000-5582-8fd0-2363-6d98f2c0586e	5001	Nova Gorica - poštni predali
00050000-5582-8fd0-fcbe-e72d4c7bea29	1385	Nova vas
00050000-5582-8fd0-cb1b-be1dec0163f8	8000	Novo mesto
00050000-5582-8fd0-8947-f0540717eab0	8001	Novo mesto - poštni predali
00050000-5582-8fd0-e18f-eb92bfff5bcd	6243	Obrov
00050000-5582-8fd0-fcb0-434973949a8c	9233	Odranci
00050000-5582-8fd0-0e29-a6fd76f6be00	2317	Oplotnica
00050000-5582-8fd0-bae3-0fd8ed6b5edd	2312	Orehova vas
00050000-5582-8fd0-0839-e2ae2beba204	2270	Ormož
00050000-5582-8fd0-c5cc-c196e4cabaf5	1316	Ortnek
00050000-5582-8fd0-eae0-c31d68a28208	1337	Osilnica
00050000-5582-8fd0-9374-5df8fa2cc578	8222	Otočec
00050000-5582-8fd0-3393-b67a7e70fcba	2361	Ožbalt
00050000-5582-8fd0-ee77-eec304dccb31	2231	Pernica
00050000-5582-8fd0-8427-ed8db3cd80b2	2211	Pesnica pri Mariboru
00050000-5582-8fd0-6c3d-495fd40ae693	9203	Petrovci
00050000-5582-8fd0-be09-376ebcdec845	3301	Petrovče
00050000-5582-8fd0-0dcb-f69fd6d88444	6330	Piran/Pirano
00050000-5582-8fd0-a33f-e665445784f4	8255	Pišece
00050000-5582-8fd0-84fd-a755803e51bf	6257	Pivka
00050000-5582-8fd0-2ae7-198d68203068	6232	Planina
00050000-5582-8fd0-3da0-53d4e43facec	3225	Planina pri Sevnici
00050000-5582-8fd0-7325-43942a082b76	6276	Pobegi
00050000-5582-8fd0-910a-061738218129	8312	Podbočje
00050000-5582-8fd0-92d4-00a956428111	5243	Podbrdo
00050000-5582-8fd0-1c7d-7bd89e92e43b	3254	Podčetrtek
00050000-5582-8fd0-4ce4-d5365b2387ad	2273	Podgorci
00050000-5582-8fd0-34d1-7de802495609	6216	Podgorje
00050000-5582-8fd0-2dcb-9d5d97a84506	2381	Podgorje pri Slovenj Gradcu
00050000-5582-8fd0-20d5-b795a4dae502	6244	Podgrad
00050000-5582-8fd0-41da-e2415821fa6f	1414	Podkum
00050000-5582-8fd0-d08d-4dced6a92b34	2286	Podlehnik
00050000-5582-8fd0-98af-b82ae64623f8	5272	Podnanos
00050000-5582-8fd0-820f-0dcd1a85e975	4244	Podnart
00050000-5582-8fd0-18eb-1b63a73cdf63	3241	Podplat
00050000-5582-8fd0-8646-76de1b75692f	3257	Podsreda
00050000-5582-8fd0-cc83-23c700617808	2363	Podvelka
00050000-5582-8fd0-9b4f-11c71a4cbad1	2208	Pohorje
00050000-5582-8fd0-7f2e-342aedc4d05e	2257	Polenšak
00050000-5582-8fd0-ca24-d11b0d3c5d1a	1355	Polhov Gradec
00050000-5582-8fd0-dd86-b18f3deb54bc	4223	Poljane nad Škofjo Loko
00050000-5582-8fd0-c1dd-d99255616045	2319	Poljčane
00050000-5582-8fd0-e413-92620d8830c9	1272	Polšnik
00050000-5582-8fd0-7f89-06f0b36ad76f	3313	Polzela
00050000-5582-8fd0-d2c7-4ef08ade1a4b	3232	Ponikva
00050000-5582-8fd0-28a5-6a6f03c7fdf0	6320	Portorož/Portorose
00050000-5582-8fd0-be79-2c695eeab86a	6230	Postojna
00050000-5582-8fd0-7383-7bcc7fa730af	2331	Pragersko
00050000-5582-8fd0-ad75-2bc97d20bf92	3312	Prebold
00050000-5582-8fd0-72f2-9d5fdf992175	4205	Preddvor
00050000-5582-8fd0-e36b-a24c23b7fd79	6255	Prem
00050000-5582-8fd0-f28c-5f3966f1c4b1	1352	Preserje
00050000-5582-8fd0-53b8-c37b24666fd3	6258	Prestranek
00050000-5582-8fd0-2aa7-6d8b9bc2dde0	2391	Prevalje
00050000-5582-8fd0-e743-cd93d06e50ac	3262	Prevorje
00050000-5582-8fd0-aa53-808abc30cf4b	1276	Primskovo 
00050000-5582-8fd0-0ceb-664abad3ae7a	3253	Pristava pri Mestinju
00050000-5582-8fd0-73ef-a1adbb17a20f	9207	Prosenjakovci/Partosfalva
00050000-5582-8fd0-4903-ad81c92d9ae8	5297	Prvačina
00050000-5582-8fd0-7490-dc09c817b8f4	2250	Ptuj
00050000-5582-8fd0-c246-aa5de90f5791	2323	Ptujska Gora
00050000-5582-8fd0-7773-4841e67cdbc0	9201	Puconci
00050000-5582-8fd0-8a60-64a5a7e534d2	2327	Rače
00050000-5582-8fd0-fdda-a9922c9a9a94	1433	Radeče
00050000-5582-8fd0-41c9-9707d718c7b7	9252	Radenci
00050000-5582-8fd0-44d8-25a5244a3b51	2360	Radlje ob Dravi
00050000-5582-8fd0-0a54-707e501773b5	1235	Radomlje
00050000-5582-8fd0-a321-5ddbed98403a	4240	Radovljica
00050000-5582-8fd0-68bb-04dc52b8e034	8274	Raka
00050000-5582-8fd0-d8f7-7189f86b5b53	1381	Rakek
00050000-5582-8fd0-e31c-0b77cd72470d	4283	Rateče - Planica
00050000-5582-8fd0-1dca-b3d09ab2d726	2390	Ravne na Koroškem
00050000-5582-8fd0-d25c-9d771443f376	9246	Razkrižje
00050000-5582-8fd0-929b-69cf51ca8b92	3332	Rečica ob Savinji
00050000-5582-8fd0-a536-067b03b6f492	5292	Renče
00050000-5582-8fd0-f50e-8839062a5653	1310	Ribnica
00050000-5582-8fd0-a6ee-2c9e6458671e	2364	Ribnica na Pohorju
00050000-5582-8fd0-2ff7-2f2404c869cd	3272	Rimske Toplice
00050000-5582-8fd0-a945-4b0c53b92e92	1314	Rob
00050000-5582-8fd0-ba2f-a1f2de93538e	5215	Ročinj
00050000-5582-8fd0-b03b-cbb841946eb3	3250	Rogaška Slatina
00050000-5582-8fd0-3626-ddcb74cc4e7d	9262	Rogašovci
00050000-5582-8fd0-2aba-7fba7b41eeaf	3252	Rogatec
00050000-5582-8fd0-c830-c24682035729	1373	Rovte
00050000-5582-8fd0-dd31-a5f2830530ae	2342	Ruše
00050000-5582-8fd0-4faa-d1763941aa73	1282	Sava
00050000-5582-8fd0-9f65-140387636812	6333	Sečovlje/Sicciole
00050000-5582-8fd0-4892-322b7aa2beba	4227	Selca
00050000-5582-8fd0-b57b-b0960da0355d	2352	Selnica ob Dravi
00050000-5582-8fd0-8609-b5ac74f50306	8333	Semič
00050000-5582-8fd0-6863-e14a67cb0eeb	8281	Senovo
00050000-5582-8fd0-4ac4-eed9600661cc	6224	Senožeče
00050000-5582-8fd0-d756-00579df052ff	8290	Sevnica
00050000-5582-8fd0-9653-91708e7a1b66	6210	Sežana
00050000-5582-8fd0-82f4-371c8d3d6eb1	2214	Sladki Vrh
00050000-5582-8fd0-d1c3-514d79119f0d	5283	Slap ob Idrijci
00050000-5582-8fd0-7258-1e509631ec52	2380	Slovenj Gradec
00050000-5582-8fd0-e41f-29d050e75eb4	2310	Slovenska Bistrica
00050000-5582-8fd0-4e48-b55a40a55e72	3210	Slovenske Konjice
00050000-5582-8fd0-1b00-d7df714ff7a7	1216	Smlednik
00050000-5582-8fd0-367e-354e8dfcb2aa	5232	Soča
00050000-5582-8fd0-b0dc-b367fe3db243	1317	Sodražica
00050000-5582-8fd0-668f-45f607674820	3335	Solčava
00050000-5582-8fd0-279c-52adfdef438f	5250	Solkan
00050000-5582-8fd0-3618-14fe8eddb820	4229	Sorica
00050000-5582-8fd0-6359-cd92cb7af31a	4225	Sovodenj
00050000-5582-8fd0-c4e2-48db360378ec	5281	Spodnja Idrija
00050000-5582-8fd0-db3d-158a7d5b583a	2241	Spodnji Duplek
00050000-5582-8fd0-741b-10d3157d6bf9	9245	Spodnji Ivanjci
00050000-5582-8fd0-c017-4dc2fd2ffdfd	2277	Središče ob Dravi
00050000-5582-8fd0-a26b-27eff814c75e	4267	Srednja vas v Bohinju
00050000-5582-8fd0-8022-f9130a533c12	8256	Sromlje 
00050000-5582-8fd0-593d-d41b50183d25	5224	Srpenica
00050000-5582-8fd0-f9ed-41f5082b1833	1242	Stahovica
00050000-5582-8fd0-1880-c54ae55e08ce	1332	Stara Cerkev
00050000-5582-8fd0-2f15-8bd8d14b9247	8342	Stari trg ob Kolpi
00050000-5582-8fd0-81b6-6a8abe38a16c	1386	Stari trg pri Ložu
00050000-5582-8fd0-cd3f-c8507e64049a	2205	Starše
00050000-5582-8fd0-b022-a6d1de00feb9	2289	Stoperce
00050000-5582-8fd0-f4cf-01c2a1aca977	8322	Stopiče
00050000-5582-8fd0-081d-d67522965f8c	3206	Stranice
00050000-5582-8fd0-0892-d2162b8c03b0	8351	Straža
00050000-5582-8fd0-f59d-1b2c80eba9cd	1313	Struge
00050000-5582-8fd0-64f4-6f4bc71091e9	8293	Studenec
00050000-5582-8fd0-fe3c-9b5dbad47776	8331	Suhor
00050000-5582-8fd0-1fb9-0b595d88e9a3	2233	Sv. Ana v Slovenskih goricah
00050000-5582-8fd0-e8db-7468465ec3c1	2235	Sv. Trojica v Slovenskih goricah
00050000-5582-8fd0-c1df-cafd41792381	2353	Sveti Duh na Ostrem Vrhu
00050000-5582-8fd0-fff4-fc96db609251	9244	Sveti Jurij ob Ščavnici
00050000-5582-8fd0-3288-615b41501d57	3264	Sveti Štefan
00050000-5582-8fd0-549d-ffad9946250f	2258	Sveti Tomaž
00050000-5582-8fd0-7c38-9d36284260ef	9204	Šalovci
00050000-5582-8fd0-bb76-8c178f524198	5261	Šempas
00050000-5582-8fd0-7316-bdbc6fdcc7ad	5290	Šempeter pri Gorici
00050000-5582-8fd0-9f45-86dabd97066a	3311	Šempeter v Savinjski dolini
00050000-5582-8fd0-1071-35c7fe906bbc	4208	Šenčur
00050000-5582-8fd0-70f9-953b808f376d	2212	Šentilj v Slovenskih goricah
00050000-5582-8fd0-5248-9b70a1cbe310	8297	Šentjanž
00050000-5582-8fd0-e1b8-b131894b36b7	2373	Šentjanž pri Dravogradu
00050000-5582-8fd0-8278-532b59aca338	8310	Šentjernej
00050000-5582-8fd0-ce0b-b32999ccbd31	3230	Šentjur
00050000-5582-8fd0-514b-68d852cd7ece	3271	Šentrupert
00050000-5582-8fd0-b179-371cfcceb2f8	8232	Šentrupert
00050000-5582-8fd0-a937-57b3505ca71a	1296	Šentvid pri Stični
00050000-5582-8fd0-e62f-9da6419d9298	8275	Škocjan
00050000-5582-8fd0-adfb-f72117b983ce	6281	Škofije
00050000-5582-8fd0-48ac-99ab814a7078	4220	Škofja Loka
00050000-5582-8fd0-9b67-cc49e3e74913	3211	Škofja vas
00050000-5582-8fd0-7229-5206c8aa8cfd	1291	Škofljica
00050000-5582-8fd0-e71c-ae2f9a6b1cd6	6274	Šmarje
00050000-5582-8fd0-3895-d4f865f0d6af	1293	Šmarje - Sap
00050000-5582-8fd0-ad3c-b7afbf07d811	3240	Šmarje pri Jelšah
00050000-5582-8fd0-ee1a-38d4e0f2a315	8220	Šmarješke Toplice
00050000-5582-8fd0-b0ff-c78dd45c94ce	2315	Šmartno na Pohorju
00050000-5582-8fd0-dc46-5f84a0c60833	3341	Šmartno ob Dreti
00050000-5582-8fd0-60b5-4cf8da16caab	3327	Šmartno ob Paki
00050000-5582-8fd0-a31b-247657961a83	1275	Šmartno pri Litiji
00050000-5582-8fd0-9147-045ff6a5a08d	2383	Šmartno pri Slovenj Gradcu
00050000-5582-8fd0-06e9-9c4ab3d4a11a	3201	Šmartno v Rožni dolini
00050000-5582-8fd0-583b-c4c33f652408	3325	Šoštanj
00050000-5582-8fd0-c056-7d697115091c	6222	Štanjel
00050000-5582-8fd0-090c-f5741643586f	3220	Štore
00050000-5582-8fd0-54a9-e5905c0a77b5	3304	Tabor
00050000-5582-8fd0-0961-e4335bcce9e5	3221	Teharje
00050000-5582-8fd0-97aa-1611a2869f8f	9251	Tišina
00050000-5582-8fd0-2392-7497d65819de	5220	Tolmin
00050000-5582-8fd0-ebf8-4e2efa03c3d0	3326	Topolšica
00050000-5582-8fd0-66b8-5a168eb66eb2	2371	Trbonje
00050000-5582-8fd0-5652-2fe804ec96ca	1420	Trbovlje
00050000-5582-8fd0-704f-cf5d4ed7db9a	8231	Trebelno 
00050000-5582-8fd0-33f7-33639d6d7ab8	8210	Trebnje
00050000-5582-8fd0-0b35-4df329d85b43	5252	Trnovo pri Gorici
00050000-5582-8fd0-d3bb-6b2be5ffb669	2254	Trnovska vas
00050000-5582-8fd0-a102-b3d70c119aeb	1222	Trojane
00050000-5582-8fd0-6e36-804b7b3c9a64	1236	Trzin
00050000-5582-8fd0-08f5-3755999c664b	4290	Tržič
00050000-5582-8fd0-6d2f-2b6177134df0	8295	Tržišče
00050000-5582-8fd0-c725-2a9cdfaca310	1311	Turjak
00050000-5582-8fd0-5456-5aa8ab6dd1c1	9224	Turnišče
00050000-5582-8fd0-aa48-5f5e8deca681	8323	Uršna sela
00050000-5582-8fd0-b4a9-a5dbe53f7839	1252	Vače
00050000-5582-8fd0-f67f-3e83b32af862	3320	Velenje 
00050000-5582-8fd0-0722-7322fa1f39f3	3322	Velenje - poštni predali
00050000-5582-8fd0-60fa-510aad14b169	8212	Velika Loka
00050000-5582-8fd0-3ff9-a5f9fdfbd171	2274	Velika Nedelja
00050000-5582-8fd0-430c-4f9d4d367e97	9225	Velika Polana
00050000-5582-8fd0-407f-04d260731ae7	1315	Velike Lašče
00050000-5582-8fd0-df15-5af3eaa61e6c	8213	Veliki Gaber
00050000-5582-8fd0-fdac-159478c418b6	9241	Veržej
00050000-5582-8fd0-3223-abb1c95388a1	1312	Videm - Dobrepolje
00050000-5582-8fd0-f9c7-c39cadf96c38	2284	Videm pri Ptuju
00050000-5582-8fd0-4e62-055f6c50831d	8344	Vinica
00050000-5582-8fd0-f479-6aef7cf04155	5271	Vipava
00050000-5582-8fd0-a935-880d187aa18d	4212	Visoko
00050000-5582-8fd0-9270-331cdab02fe8	1294	Višnja Gora
00050000-5582-8fd0-ce76-acee46b1e235	3205	Vitanje
00050000-5582-8fd0-7624-00f05a1579d8	2255	Vitomarci
00050000-5582-8fd0-366a-2fdce473b464	1217	Vodice
00050000-5582-8fd0-4b96-48c70c7c0c0f	3212	Vojnik\t
00050000-5582-8fd0-2b14-daf7e419d12b	5293	Volčja Draga
00050000-5582-8fd0-5371-a5984d0e764d	2232	Voličina
00050000-5582-8fd0-21f1-20e6338149db	3305	Vransko
00050000-5582-8fd0-740d-feff29caab49	6217	Vremski Britof
00050000-5582-8fd0-da27-4195824a07b7	1360	Vrhnika
00050000-5582-8fd0-aa7a-1978f34dbb30	2365	Vuhred
00050000-5582-8fd0-d0c3-5e3f6b4042eb	2367	Vuzenica
00050000-5582-8fd0-23ca-6e788376ab2d	8292	Zabukovje 
00050000-5582-8fd0-f1e6-81543ce049e6	1410	Zagorje ob Savi
00050000-5582-8fd0-ee0f-adf1688b6e6e	1303	Zagradec
00050000-5582-8fd0-b453-504acf3ae5a1	2283	Zavrč
00050000-5582-8fd0-330c-95d20c871412	8272	Zdole 
00050000-5582-8fd0-3bfa-e14cbfc036c1	4201	Zgornja Besnica
00050000-5582-8fd0-ed2a-fad48c4e910f	2242	Zgornja Korena
00050000-5582-8fd0-283f-56c27dbd68e1	2201	Zgornja Kungota
00050000-5582-8fd0-a25c-09df7a46e15e	2316	Zgornja Ložnica
00050000-5582-8fd0-9467-425114c3c7dd	2314	Zgornja Polskava
00050000-5582-8fd0-2567-fd20f784912f	2213	Zgornja Velka
00050000-5582-8fd0-dbc8-a5786f2f08b7	4247	Zgornje Gorje
00050000-5582-8fd0-a235-5343bcd452cd	4206	Zgornje Jezersko
00050000-5582-8fd0-a262-78cc14ad8c02	2285	Zgornji Leskovec
00050000-5582-8fd0-4490-db46ced3d30d	1432	Zidani Most
00050000-5582-8fd0-a05e-a815c909f364	3214	Zreče
00050000-5582-8fd0-25ac-a71617966fdd	4209	Žabnica
00050000-5582-8fd0-b34b-5f29191ce022	3310	Žalec
00050000-5582-8fd0-7086-27761cd66196	4228	Železniki
00050000-5582-8fd0-ed12-9d5e05ad4ee0	2287	Žetale
00050000-5582-8fd0-6037-4536356ea8f2	4226	Žiri
00050000-5582-8fd0-80e5-8ba22ef631be	4274	Žirovnica
00050000-5582-8fd0-f22e-b59e57146971	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7690049)
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
-- TOC entry 2836 (class 0 OID 7689860)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7689938)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7690061)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7690181)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7690234)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5582-8fd1-b201-dda160da2b68	00080000-5582-8fd1-0ddb-18d76466be94	0900	AK
00190000-5582-8fd1-c951-d13ac03144e7	00080000-5582-8fd1-4c25-aca238dd7885	0987	A
00190000-5582-8fd1-2bd6-d4aff4325106	00080000-5582-8fd1-f100-0f119c3b1d57	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7690353)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7690416)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7690366)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7690385)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7690090)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5582-8fd1-3c70-9ef370a45ada	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5582-8fd1-5fcb-252ff31361f5	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5582-8fd1-f4b0-a926f83821dd	0003	Kazinska	t	84	Kazinska dvorana
00220000-5582-8fd1-394a-4941d8ec1b11	0004	Mali oder	t	24	Mali oder 
00220000-5582-8fd1-527a-66575b43ebb6	0005	Komorni oder	t	15	Komorni oder
00220000-5582-8fd1-7b34-5b89ad5d32f2	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5582-8fd1-b761-4d98576fe20a	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7690034)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7690024)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7690223)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7690158)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7689732)
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
-- TOC entry 2861 (class 0 OID 7690100)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7689770)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5582-8fcf-e345-e1262dc1a5fa	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5582-8fcf-b6c6-a5ff65111a30	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5582-8fcf-d4bc-23e1cc57214e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5582-8fcf-1435-bf572d0dedea	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5582-8fcf-da3f-4dca53bd0225	planer	Planer dogodkov v koledarju	t
00020000-5582-8fcf-5b35-3bb8614b653f	kadrovska	Kadrovska služba	t
00020000-5582-8fcf-89f4-260fb6b6d427	arhivar	Ažuriranje arhivalij	t
00020000-5582-8fcf-dfd9-c407e7d248af	igralec	Igralec	t
00020000-5582-8fcf-e513-b6216df0a1d4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7689754)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5582-8fcf-23c6-58760d197ed1	00020000-5582-8fcf-d4bc-23e1cc57214e
00010000-5582-8fcf-2430-95259aa0f08f	00020000-5582-8fcf-d4bc-23e1cc57214e
\.


--
-- TOC entry 2863 (class 0 OID 7690114)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7690055)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7690005)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7690449)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5582-8fd0-38e8-fe310e0959b0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5582-8fd0-e6de-72e14d9e1e84	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5582-8fd0-4015-fd775be0c0b5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5582-8fd0-65a9-11d454391872	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5582-8fd0-003d-1644c5f474e7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7690441)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5582-8fd0-9d2d-3098f76be4d9	00230000-5582-8fd0-65a9-11d454391872	popa
00240000-5582-8fd0-209f-3508d809c2ef	00230000-5582-8fd0-65a9-11d454391872	oseba
00240000-5582-8fd0-628b-d91981ab6bec	00230000-5582-8fd0-e6de-72e14d9e1e84	prostor
00240000-5582-8fd0-c604-65039f81f10c	00230000-5582-8fd0-65a9-11d454391872	besedilo
00240000-5582-8fd0-c74a-697f8e148362	00230000-5582-8fd0-65a9-11d454391872	uprizoritev
00240000-5582-8fd0-0c48-34baffbc01f2	00230000-5582-8fd0-65a9-11d454391872	funkcija
00240000-5582-8fd0-7ec2-bbf8188ccfb1	00230000-5582-8fd0-65a9-11d454391872	tipfunkcije
00240000-5582-8fd0-e9fd-2f0683663b7d	00230000-5582-8fd0-65a9-11d454391872	alternacija
00240000-5582-8fd0-c748-ca4005cc1194	00230000-5582-8fd0-38e8-fe310e0959b0	pogodba
00240000-5582-8fd0-ddc3-990213d6a5f2	00230000-5582-8fd0-65a9-11d454391872	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7690436)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7690168)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7689832)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7690011)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5582-8fd1-bfce-106a21cb23f2	00180000-5582-8fd1-d438-1ca6e90db575	000c0000-5582-8fd1-97a0-e066773d68ad	00090000-5582-8fd1-c7ce-a9e1b0ea2d6f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-8fd1-82d8-b2b7a162b90f	00180000-5582-8fd1-d438-1ca6e90db575	000c0000-5582-8fd1-bad9-f11bc1733b4a	00090000-5582-8fd1-036f-9ad9cf50336c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-8fd1-80ae-86f23c19060d	00180000-5582-8fd1-d438-1ca6e90db575	000c0000-5582-8fd1-4603-d68ac1697bc5	00090000-5582-8fd1-1b76-5a338e76b119	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-8fd1-57f0-7d5fd130c3df	00180000-5582-8fd1-d438-1ca6e90db575	000c0000-5582-8fd1-78bc-971f1395f1b1	00090000-5582-8fd1-c0fd-c0792aeee552	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-8fd1-c204-da85bbeeb175	00180000-5582-8fd1-d438-1ca6e90db575	000c0000-5582-8fd1-2431-817e5123c8ef	00090000-5582-8fd1-dfd4-54ef2c0a98e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-8fd1-300f-7bec1c1d7d6c	00180000-5582-8fd1-68c7-d8da67ccdfed	\N	00090000-5582-8fd1-dfd4-54ef2c0a98e6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7690212)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5582-8fd0-68e7-e7f8fce1a0fa	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5582-8fd0-d327-88b4e70cd5a0	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5582-8fd0-87e2-d411c6037d82	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5582-8fd0-0c9c-c5a255edb554	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5582-8fd0-4485-a0188c1b1470	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5582-8fd0-3b21-f1a8385e9683	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5582-8fd0-4523-2a347fd149a5	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5582-8fd0-0689-e3aed3dd8b0f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5582-8fd0-715e-a50cd2a520d4	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5582-8fd0-7166-40bd6319693a	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5582-8fd0-2c5a-0824b1ffc8d5	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5582-8fd0-4dec-abb5b52c2c77	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5582-8fd0-cb09-f1d6378e881d	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5582-8fd0-ce3c-df3e32f38495	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5582-8fd0-5db7-cdb9918ef307	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5582-8fd0-2bb9-7a6257e841f0	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7690405)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5582-8fd0-6015-3a1e68ad97d6	01	Velika predstava	f	1.00	1.00
002b0000-5582-8fd0-d086-a766e00da085	02	Mala predstava	f	0.50	0.50
002b0000-5582-8fd0-5933-a79cee01de6e	03	Mala koprodukcija	t	0.40	1.00
002b0000-5582-8fd0-7c1e-252d8c3cced6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5582-8fd0-bdb5-1a021cd269c3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7689895)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7689741)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5582-8fcf-2430-95259aa0f08f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROozyxnFL3UWakItDN2ZucvCr8.eM/2Ui	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-9ad3-28c7c4940915	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-e68a-f714982cdcbd	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-4949-5932383c80a0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-b1df-e73c5fa4cdc3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-ff88-daaa0817fff9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-0abc-407fc1e7b68d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-3312-129522726c3a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-d177-f6735fe130f8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5582-8fd1-8a5f-1de8c7828487	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N			aaron@ifigenija.si	\N	\N	\N
00010000-5582-8fcf-23c6-58760d197ed1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7690269)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5582-8fd1-c74c-c5d9f3cec117	00160000-5582-8fd1-279c-6e4daa773036	00150000-5582-8fd0-95c9-c882deeb1ee9	00140000-5582-8fcf-e59b-db8eda597f67	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5582-8fd1-527a-66575b43ebb6
000e0000-5582-8fd1-3513-72cf465b0ef5	00160000-5582-8fd1-3d91-d0771abd77b3	00150000-5582-8fd0-b049-59b75a8e4011	00140000-5582-8fcf-0ae1-7c4c68436bd3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5582-8fd1-7b34-5b89ad5d32f2
000e0000-5582-8fd1-19c3-b09df3f2921c	\N	00150000-5582-8fd0-b049-59b75a8e4011	00140000-5582-8fcf-0ae1-7c4c68436bd3	00190000-5582-8fd1-c951-d13ac03144e7	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5582-8fd1-527a-66575b43ebb6
000e0000-5582-8fd1-8ab7-9a4a559f3d76	\N	00150000-5582-8fd0-b049-59b75a8e4011	00140000-5582-8fcf-0ae1-7c4c68436bd3	00190000-5582-8fd1-c951-d13ac03144e7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5582-8fd1-527a-66575b43ebb6
\.


--
-- TOC entry 2844 (class 0 OID 7689957)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5582-8fd1-a2ea-48e96ba47094	000e0000-5582-8fd1-3513-72cf465b0ef5	1	
00200000-5582-8fd1-b67b-c8b9f3baf898	000e0000-5582-8fd1-3513-72cf465b0ef5	2	
\.


--
-- TOC entry 2859 (class 0 OID 7690082)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7690151)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7689989)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7690259)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5582-8fcf-e59b-db8eda597f67	01	Drama	drama (SURS 01)
00140000-5582-8fcf-dccf-5376250cd69a	02	Opera	opera (SURS 02)
00140000-5582-8fcf-a6ec-8ff3f69c26be	03	Balet	balet (SURS 03)
00140000-5582-8fcf-ef82-7ec76f5e7879	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5582-8fcf-5acc-5fabc50d8a36	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5582-8fcf-0ae1-7c4c68436bd3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5582-8fcf-bf46-b5673ca36549	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7690141)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5582-8fd0-f3f8-9c1c414c3fc0	01	Opera	opera
00150000-5582-8fd0-297c-8a89fe5851b3	02	Opereta	opereta
00150000-5582-8fd0-e8f7-496a4ada642d	03	Balet	balet
00150000-5582-8fd0-dfab-5b85df9f48cb	04	Plesne prireditve	plesne prireditve
00150000-5582-8fd0-9cfb-1ba519ec88c4	05	Lutkovno gledališče	lutkovno gledališče
00150000-5582-8fd0-ad5e-557ed87d113c	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5582-8fd0-4d2a-951fe7bec406	07	Biografska drama	biografska drama
00150000-5582-8fd0-95c9-c882deeb1ee9	08	Komedija	komedija
00150000-5582-8fd0-3686-504628438703	09	Črna komedija	črna komedija
00150000-5582-8fd0-dcb2-95afc03f38bc	10	E-igra	E-igra
00150000-5582-8fd0-b049-59b75a8e4011	11	Kriminalka	kriminalka
00150000-5582-8fd0-7485-1a9a656ce19a	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7689795)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7690316)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7690306)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7690211)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7689979)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7690004)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7689921)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7690349)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7690137)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7689955)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7689998)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7689935)
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
-- TOC entry 2499 (class 2606 OID 7690047)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7690074)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7689893)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7689804)
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
-- TOC entry 2414 (class 2606 OID 7689828)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7689784)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7689769)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7690080)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7690113)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7690254)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7689857)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7689881)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7690053)
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
-- TOC entry 2429 (class 2606 OID 7689871)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7689942)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7690065)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7690193)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7690239)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7690364)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7690434)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7690381)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7690402)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7690097)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7690038)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7690029)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7690233)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7690165)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7689740)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7690104)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7689758)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7689778)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7690122)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7690060)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7690010)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7690458)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7690446)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7690440)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7690178)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7689837)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7690020)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7690222)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7690415)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7689906)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7689753)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7690285)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7689964)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7690088)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7690156)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7689993)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7690267)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7690149)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7689986)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7690179)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7690180)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7689859)
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
-- TOC entry 2512 (class 1259 OID 7690081)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7690067)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7690066)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7689965)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7690138)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7690140)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7690139)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7689937)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7689936)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7690256)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7690257)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7690258)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7690404)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7690403)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7690290)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7690287)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7690291)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7690289)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7690288)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7689908)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7689907)
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
-- TOC entry 2412 (class 1259 OID 7689831)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7690105)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7689999)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7689785)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7689786)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7690125)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7690124)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7690123)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7689943)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7689945)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7689944)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7690448)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7690033)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7690031)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7690030)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7690032)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7689759)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7689760)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7690089)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7690054)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7690166)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7690167)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7690350)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7690351)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7690352)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7689873)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7689872)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7689874)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7690435)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7690194)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7690195)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7690320)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7690322)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7690318)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7690321)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7690319)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7690157)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7690042)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7690041)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7690039)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7690040)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7690308)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7690307)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7690365)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7689956)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7689806)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7689805)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7689838)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7689839)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7690023)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7690022)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7690021)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7690384)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7690382)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7690383)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7689988)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7689984)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7689981)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7689982)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7689980)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7689985)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7689983)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7689858)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7689922)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7689924)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7689923)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7689925)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7690048)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7690255)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7690286)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7689829)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7689830)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7690150)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7690459)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7689894)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7690447)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7690099)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7690098)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7690317)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7689882)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7690268)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7690240)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7690241)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7689779)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7689987)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2652 (class 2606 OID 7690595)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7690580)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2650 (class 2606 OID 7690585)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2654 (class 2606 OID 7690605)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2648 (class 2606 OID 7690575)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2653 (class 2606 OID 7690600)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7690590)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2683 (class 2606 OID 7690750)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2684 (class 2606 OID 7690755)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7690510)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7690690)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2670 (class 2606 OID 7690685)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2669 (class 2606 OID 7690680)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7690570)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7690720)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7690730)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7690725)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2642 (class 2606 OID 7690545)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2641 (class 2606 OID 7690540)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7690670)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7690775)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7690780)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7690785)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 7690890)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 7690885)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 7690805)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7690790)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2695 (class 2606 OID 7690810)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7690800)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2692 (class 2606 OID 7690795)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2640 (class 2606 OID 7690535)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2639 (class 2606 OID 7690530)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7690495)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2631 (class 2606 OID 7690490)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7690700)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7690610)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2627 (class 2606 OID 7690470)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2628 (class 2606 OID 7690475)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2676 (class 2606 OID 7690715)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7690710)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2674 (class 2606 OID 7690705)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2643 (class 2606 OID 7690550)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 7690560)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7690555)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7690900)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2662 (class 2606 OID 7690645)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2660 (class 2606 OID 7690635)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2659 (class 2606 OID 7690630)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2661 (class 2606 OID 7690640)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2625 (class 2606 OID 7690460)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7690465)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7690695)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7690675)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2681 (class 2606 OID 7690740)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2682 (class 2606 OID 7690745)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 7690850)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7690855)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2705 (class 2606 OID 7690860)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7690520)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7690515)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2638 (class 2606 OID 7690525)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7690895)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2685 (class 2606 OID 7690760)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2686 (class 2606 OID 7690765)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7690835)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 7690845)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7690825)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2701 (class 2606 OID 7690840)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2699 (class 2606 OID 7690830)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7690735)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 7690665)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2665 (class 2606 OID 7690660)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2663 (class 2606 OID 7690650)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2664 (class 2606 OID 7690655)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2697 (class 2606 OID 7690820)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 7690815)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7690865)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7690565)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7690770)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 7690485)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2629 (class 2606 OID 7690480)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2633 (class 2606 OID 7690500)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7690505)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 7690625)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7690620)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2656 (class 2606 OID 7690615)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2709 (class 2606 OID 7690880)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7690870)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7690875)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-18 11:30:58 CEST

--
-- PostgreSQL database dump complete
--

