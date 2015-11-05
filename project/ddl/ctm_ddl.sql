--
-- Estructura de tabla para la tabla flflo
-- info sobre la flota
--

DROP TABLE IF EXISTS ctm_flflo;
CREATE TABLE IF NOT EXISTS ctm_flflo (  
  csfloid bigint  DEFAULT '0', --COMMENT 'NIT FLOTA',
  csflocli bigint , --COMMENT 'NIT2 FLOTA',
  csflonom varchar , --COMMENT 'NOMBRE FLOTA',
  csflofec date , --COMMENT 'FECHA CREACION',
  csflocon varchar , --COMMENT 'CONTACTO FLOTA',
  csflotel varchar , --COMMENT 'TELEFONO FLOTA',
  csflodir varchar , --COMMENT 'DIRECCION FLOTA',
  csflonit varchar , --COMMENT 'NIT SICE FLOTA',
  csfloobs text , --COMMENT 'OBSERVACION FLOTA',
  csflonumveh int , --COMMENT 'NUMERO VEHICULOS FLOTA',
  csflopromkim bigint , --COMMENT 'KILOMETRAJE PROMEDIO FLOTA',
  csflopromllan bigint ,
  csfloobjpar int ,
  csfloporree int ,
  csfloporrad int ,
  csflomanok int ,
  csflopreok int ,
  csflocosnue numeric  DEFAULT '0.0000',
  csflocosree numeric ,
  csflocosflo numeric ,
  csfloobjaho int ,
  csfloindree numeric ,
  csflogru bigint ,
  csflolimree numeric  DEFAULT '1.0',
  csfloimg varchar ,
  csflotip int  DEFAULT '1', --COMMENT 'Tipo de operacion por flota(predeterminado se deja el valor 1 que es de oper com)',
  csflopromopt bigint , --COMMENT 'Promedio Opcional si son Toneladas/Horas',
  csbodatm char(1)  DEFAULT '0', --COMMENT '1 = llanta utiliza bod las servitecas de ATM',
  csflosimdec char(1) DEFAULT ',', --COMMENT 'Simbolo decimal - por defecto es .',
  csflosimmil char(1) DEFAULT '.', --COMMENT 'simbolo miles - por defecto es ,',
  csflonube int  DEFAULT '0', --COMMENT 'Manuejo de hermes,1=activo, 0=inactivo',
  CONSTRAINT flflo_pkey PRIMARY KEY (csfloid)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla flhis
-- movimiento historico de la llanta
--

DROP TABLE IF EXISTS ctm_flhis;
CREATE TABLE IF NOT EXISTS ctm_flhis (
  cshisid bigint , --COMMENT 'ID INCREMENTAL',
  cshisveh1 varchar , --COMMENT 'VEHICULO MIGRACION FLOTAS',
  cshisveh varchar , --COMMENT 'NUMERO INTERNO VEHICULO',
  cshisflo bigint , --COMMENT 'NIT FLOTA',
  cshissuc1 varchar , --COMMENT 'CODIGO SUCURSAL - MIGRACION FLOTAS',
  cshissuc char(2) , --COMMENT 'CODIGO SUCURSAL',
  cshislla bigint , --COMMENT 'CODIGO INTERNO LLANTA',
  cshisllaflo varchar , --COMMENT 'CODIGO MARCAJE LLANTA',
  cshismov varchar , --COMMENT 'TIPO DE MOVIMIENTO',
  hismot varchar , --COMMENT 'MOTIVO',
  histipren varchar , --COMMENT 'TIPO REENCAUCHE',
  cshispos varchar , --COMMENT 'POSICION LLANTA',
  cshisfalla text , --COMMENT 'FALLA O CONDICION MOVIMIENTO',
  cshisfec varchar, --COMMENT 'FECHA MOVIMIENTO',
  --cshisfec date , --COMMENT 'FECHA MOVIMIENTO',
  cshiskim bigint , --COMMENT 'KILOMETRAJE MOVIEMIENTO',
  cshislabext numeric DEFAULT NULL, --COMMENT 'LABRADO EXTERNO',
  cshislabcen numeric DEFAULT NULL, --COMMENT 'LABRADO CENTRAL',
  cshislabint numeric DEFAULT NULL, --COMMENT 'LABRADO INTERNO',
  cshispres bigint , --COMMENT 'PSI',
  cshisprfmin numeric , --COMMENT 'PROFUNDIDAD MINIMA',
  cshishor time , --COMMENT 'HORA MOVIEMIENTO',
  cshiskimveh bigint , --COMMENT 'KILOMETRAJE VEHICULO',
  cshiscos numeric, --COMMENT 'COSTO MOVIMIENTO',
  --cshiscos numeric , --COMMENT 'COSTO MOVIMIENTO',
  cshisnsk numeric , --COMMENT 'NSKI',
  cshisprov varchar ,
  cshismar varchar , --COMMENT 'MARCA LLANTA (NUEVA O REENCAUCHE) EN EL MOVIMIENTO',
  mrcnsice varchar ,
  cshisrad int , --COMMENT 'CONSTRUCCION 1=RADIAL, 0=CONVENCIONAL',
  cshisree int , --COMMENT 'NUMERO REENCAUCHE EN EL MOVIMIENTO',
  cshisdim varchar , --COMMENT 'DIMENSION',
  cshisdis varchar , --COMMENT 'DISEÑO',
  cshisban varchar , --COMMENT 'DISEÑO REENCAUCHE',
  cshisdot varchar , --COMMENT 'DOT',
  cshiskimtot bigint , --COMMENT 'KILOMETRAJE TOTAL LLANTA EN EL MOVIMIENTO',
  cshisfecmov varchar, --COMMENT 'FECHA REAL MOVIMIENTO',
  --cshisfecmov timestamp, --COMMENT 'FECHA REAL MOVIMIENTO',
  cshisusu varchar , --COMMENT 'USUARIO',
  cshisloc bigint  DEFAULT '0', --COMMENT 'LOCALIZACION DE FLOTA EN EL MOVIMIENTO',
  cshisreg decimal(8,1) , --COMMENT 'REGRABADO',
  cshisopclla bigint , --COMMENT 'Opcional si es Tonelada/horas',
  cshisopcveh bigint , --COMMENT 'Opcional si es Tonelada/horas',
  cshisopctot bigint , --COMMENT 'Opcional si es Tonelada/horas',
  cshisfecm varchar, --COMMENT 'Fecha de montaje',
  --cshisfecm date , --COMMENT 'Fecha de montaje',
  cshisorser varchar , --COMMENT 'Orden Servicio',
  cshistip char(1)  DEFAULT 'A',
  --CONSTRAINT UNIQUE KEY idhis (cshisid)
  CONSTRAINT flhis_pkey PRIMARY KEY (cshisid)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla flinsp
-- inspecciones que se le hacen a la llanta (todos los meses) snapshot 
--

DROP TABLE IF EXISTS ctm_flinsp;
CREATE TABLE IF NOT EXISTS ctm_flinsp (
  flinspcod bigint , --COMMENT 'ID INCREMENTAL',,
  flllancod varchar , --COMMENT 'CODIGO INTERNO LLANTA',
  flllancodflo varchar , --COMMENT 'CODIGO MARCAJE LLANTA',
  flvehcod varchar , --COMMENT 'CODIGO INTERNO VEHICULO',
  flfloid bigint , --COMMENT 'NIT FLOTA',
  flsucid1 varchar , --COMMENT 'CODIGO SUCURSAL - MIGRACION FLOTAS',
  flsucid char(2) , --COMMENT 'CODIGO SUCURSAL',
  flvehpos int , --COMMENT 'POSICION LLANTA',
  flfecinsp varchar, --COMMENT 'FECHA INSPECCION',
  --flfecinsp date , --COMMENT 'FECHA INSPECCION',
  flllaprovnue varchar ,
  flmarcsc int , --COMMENT 'CODIGO MARCA LLANTA',
  mrcnsice varchar ,
  flllandim varchar , --COMMENT 'DIMENSION',
  flllanree int , --COMMENT 'NUMERO DE REENCAUCHE',
  flllanban varchar , --COMMENT 'DISEÑO',
  flllaprovree varchar ,
  flllanmarree varchar , --COMMENT 'MARCA REENCUACHE',
  mrcrsice varchar ,
  flllanbanree varchar , --COMMENT 'DISEÑO REENCAUCHE',
  flfecmon varchar, --COMMENT 'FECHA MONTAJE',
  --flfecmon date , --COMMENT 'FECHA MONTAJE',
  flnskini numeric , --COMMENT 'NSKI',
  flvehkimmon bigint , --COMMENT 'KILOMETRAJE MONTAJE',
  flvehkiminsp bigint , --COMMENT 'KILOMETRAJE VEHICULO INSPECCION',
  flllakiminsp bigint , --COMMENT 'KILOMETRAJE LLANTA EN LA INSPECCION',
  flllainspsi int , --COMMENT 'PSI',
  flllainspsie varchar , --COMMENT 'PSI ESTIMADO',
  flllainsplb01 numeric DEFAULT NULL, --COMMENT 'LABRADO INTERNO',
  flllainsplb02 numeric DEFAULT '99.0', --COMMENT 'LABRADO CENTRAL',
  flllainsplb03 numeric DEFAULT NULL, --COMMENT 'LABRADO EXTERNO',
  flinspdesh int , --COMMENT '',
  flinspdest int ,
  flinspdanc int ,
  flinspbanr int ,
  flinspdese int ,
  flinspdesi int ,
  flinspusoe int ,
  flinspprom int ,
  flinspstip int ,
  flinspring int ,
  flinspvald int ,
  flinspduam int ,
  flinspdumse int ,
  flinspduprf int ,
  flinspsacs int ,
  flhorinsp time , --COMMENT 'HORA REAL',
  flfecreal date , --COMMENT 'FECHA REAL',
  finspcond varchar , --COMMENT 'NOMBRE CONDUCTOR',
  flcosnu numeric , --COMMENT 'COSTO NUEVA',
  flcosre numeric , --COMMENT 'COSTO REENCAUCHE',
  flinsprinav int ,
  flinspversu int ,
  flinspveram int ,
  flinspverfr int ,
  flinspvetd int ,
  flinsppresc int ,
  flinsppequ int ,
  flinsppede int ,
  flinspdesgh int ,
  flinspcofr int ,
  flinspciex int ,
  flinspfaco int ,
  flinspvain int ,
  flinspvedius int ,
  flinsprtll int ,
  flinspremo int ,
  flinspvecon int ,
  flinspveali int ,
  flinspusu varchar , --COMMENT 'USUARIO',
  flinspgru int , --COMMENT 'GRUPO O REGIONAL',
  flinspest char(1) , --COMMENT 'ESTADO INSPECCION',
  flinspregp int ,
  flinsprajs int ,
  flvehkimini bigint , --COMMENT 'Kilometraje del vehículo en la ultima inspección',
  flinspreeint int ,
  flinspreelat int ,
  flinspcostinfr int ,
  flinspbanpiq int ,
  flinspdespban int ,
  flprfreg numeric ,
  flllarenapt int , --COMMENT 'Estado de la llanta si es Apta o no para reencauchar',
  flinspseplon int , --COMMENT 'Separacion de Lonas',
  flvehopcmon bigint , --COMMENT 'Opcional si es Tonelada/horas -- Montaje',
  flvehopcinsp bigint , --COMMENT 'Opcional si es Tonelada/horas -- Vehiculo',
  flllaopcinsp bigint , --COMMENT 'Opcional si es Tonelada/horas -- Llanta',
  flvehopcini bigint , --COMMENT 'Opcional si es Tonelada/horas -- inicial',
  flinspbajaya int , --COMMENT 'Recomendacion Bajar ya',
  flinsprep int , --COMMENT 'Enviar a reparar',
  CONSTRAINT flinsp_pkey PRIMARY KEY (flinspcod)
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla fllla
-- fact table (tabla madre llantas)
--

DROP TABLE IF EXISTS ctm_fllla;
CREATE TABLE IF NOT EXISTS ctm_fllla (
  csllacod bigint , --COMMENT 'CODIGO INTERNO LLANTA, SE RELACIONA CON LAS TABLAS DE INSPECCIONES, HISTORICOS, VIDAS',
  csllacodflo varchar , --COMMENT 'CODIGO MARCAJE LLANTAS',
  csllaart varchar ,
  csllarfid varchar ,
  csvehid1 varchar ,
  csvehid varchar , --COMMENT 'CODIGO INTERNO VEHICULO',
  csfloid bigint , --COMMENT 'NIT FLOTA',
  cslladot varchar , --COMMENT 'DOT LLANTA',
  csllacost numeric , --COMMENT 'COSTO LLANTA NUEVA',
  --csllacost numeric , --COMMENT 'COSTO LLANTA NUEVA',
  csllakstmon bigint , --COMMENT 'KILOMETRAJE MONTAJE',
  csllakilact bigint , --COMMENT 'KILOMETRAJE ACTUAL LLANTA',
  csllakilveh bigint , --COMMENT 'KILOMETRAJE VEHICULO',
  csllaprovnue varchar ,
  csllamarcsc int , --COMMENT 'CODIGO MARCA LLANTA NUEVA',
  mrcnsice varchar ,
  cslladis varchar , --COMMENT 'DISEÑO',
  cslladim varchar , --COMMENT 'DIMENSION',
  csllafecc varchar, --COMMENT 'FECHA CREACION LLANTA',
  --csllafecc date , --COMMENT 'FECHA CREACION LLANTA',
  csllafecm varchar, --COMMENT 'FECHA MONTAJE',
  --csllafecm date , --COMMENT 'FECHA MONTAJE',
  csllapos int , --COMMENT 'POSICION LLANTA',
  csprsest int , --COMMENT 'ESTADO ACTUAL DE LA LLANTA, 1=DISPONIBLE, 2=MONTADA, 3=REPARACION, 4=REENCAUCHE, 5=BAJA, 6=DISP FINAL',
  csllaprovree varchar ,
  csllamrcree varchar , --COMMENT 'MARCA REENCAUCHE',
  marrsice varchar ,
  csllabanree varchar , --COMMENT 'DISEÑO REENCAUCHE',
  csllareen int , --COMMENT 'NUMERO REENCAUCHE',
  csllacons int , --COMMENT 'CONSTRUCCION 1=RADIAL, 0=CONVENCIONAL',
  csllamed bigint ,
  csllalabext numeric DEFAULT NULL, --COMMENT 'LABRADO EXTERNO',
  csllalabcen numeric DEFAULT '99.0', --COMMENT 'LABRADO CENTRAL',
  csllalabint numeric DEFAULT NULL, --COMMENT 'LABRADO INTERNO',
  csllapsi bigint , --COMMENT 'PSI',
  csllapsiest bigint , --COMMENT 'PSI ESTIMADO',
  csllarecom varchar ,
  csllafecmod varchar, --COMMENT 'FECHA MODIFICACION',
  --csllafecmod date , --COMMENT 'FECHA MODIFICACION',
  csllakilini bigint , --COMMENT 'KILOMETRAJE INICIAL',
  csllahormod time , --COMMENT 'HORA MODIFICACION',
  csllanskini numeric , --COMMENT 'NSKI',
  csllahorc varchar,
  --csllahorc time ,
  csllacosree numeric , --COMMENT 'COSTO REENCAUCHE',
  csllakiltot bigint , --COMMENT 'KILOMETRAJE TOTAL LLANTA',
  csllaloc bigint , --COMMENT 'Código de Bodega (0 si no está disponible)',
  csllainv bigint , --COMMENT 'Codigo de Inventario de Compra (0 si se creó directamente con código)',
  csllaprfreg numeric ,
  csllarenapt int , --COMMENT 'Estado de la llanta si es Apta o no para reencauchar',
  csllaopcmon bigint , --COMMENT 'Opcional si es Tonelada/horas',
  csllaopcact bigint , --COMMENT 'Opcional si es Tonelada/horas',
  csllaopcveh bigint , --COMMENT 'Opcional si es Tonelada/horas',
  csllaopcini bigint , --COMMENT 'Opcional si es Tonelada/horas',
  csllaopctot bigint , --COMMENT 'Opcional si es Tonelada/horas',
  csinsplla bigint , --COMMENT 'Ultima inspeccion',
  csmovfec varchar, --COMMENT 'fecha ultimo movimiento',
  --csmovfec date , --COMMENT 'fecha ultimo movimiento',
  CONSTRAINT fllla_pkey PRIMARY KEY (csllacod,csfloid)
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla flllavid
-- vida la llanta - estado en el que 
--

DROP TABLE IF EXISTS ctm_flllavid;
CREATE TABLE IF NOT EXISTS ctm_flllavid (
  csllacod bigint , --COMMENT 'CODIGO INTERNO LLANTA',
  csllacodflo varchar , --COMMENT 'CODIGO MARCAJE LLANTA',
  csfloid bigint , --COMMENT 'NIT FLOTA',
  cslladot varchar  , --COMMENT 'DOT VIDA',
  csllaprov varchar  ,  csllamarc varchar  , --COMMENT 'MARCA DE VIDA',
  csmrsice varchar  ,  cslladis varchar  , --COMMENT 'DISEÑO DE VIDA',
  cslladim varchar  , --COMMENT 'DIMENSION',
  csllacost numeric , --COMMENT 'COSTO VIDA',
  csllafecc varchar, --COMMENT 'FECHA CREACION VIDA',
  --csllafecc date , --COMMENT 'FECHA CREACION VIDA',
  csllafecm varchar, --COMMENT 'FECHA MONTAJE VIDA',
  --csllafecm date , --COMMENT 'FECHA MONTAJE VIDA',
  csllafecd varchar,  csllakil bigint , --COMMENT 'KILOMETRAJE VIDA',
  --csllafecd date ,  csllakil bigint , --COMMENT 'KILOMETRAJE VIDA',
  csllavida int , --COMMENT 'NUMERO DE REENCAUCHE', --vida 0, 1, 2, 3
  csllalabint numeric DEFAULT NULL, --COMMENT 'LABRADO INTERNO',
  csllalabcen numeric DEFAULT NULL, --COMMENT 'LABRADO CENTRAL',
  csllalabext numeric DEFAULT NULL, --COMMENT 'LABRADO EXTERNO',
  csllanskini numeric , --COMMENT 'NSKI DE VIDA',
  cslladiarod bigint ,
  csllaprfreg numeric ,
  csllaopc bigint , --COMMENT 'Opcional si es Tonelada/horas',
  csllarenapt int , --COMMENT 'Estado de la llanta si es Apta o no para reencauchar',
  CONSTRAINT flllavid_uniq PRIMARY KEY (csllacod,csllavida)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla flsuc
-- tabla de sucursales de la flota del cliente
--

DROP TABLE IF EXISTS ctm_flsuc;
CREATE TABLE IF NOT EXISTS ctm_flsuc (
  flsuccod char(2) , --COMMENT 'CODIGO DE SUCURSAL',
  flsucflo bigint , --COMMENT 'NIT FLOTA',
  flsucnom varchar , --COMMENT 'NOMBRE SUCURSAL',
  flsuctel varchar , --COMMENT 'TELEFONO SUCURSAL',
  flsucdir varchar , --COMMENT 'DIRECCION SUCURSAL',
  flsuccor varchar , --COMMENT 'CORREO SUCURSAL',
  flsucciu varchar , --COMMENT 'CIUDAD',
  flsucgru int , --COMMENT 'GRUPO/REGIONAL',
  flsucfec date , --COMMENT 'FECHA CREACION/MODIFICACION',
  flsuchor time , --COMMENT 'HORA CREACION/MODIFICACION',
  flsucrep varchar ,
  flsuclimree numeric  DEFAULT '2.00', --COMMENT 'LIMITE DE BAJA SUCURSAL',
  flsuctip int  DEFAULT '1', --COMMENT 'Tipo de operacion por Sucursal(predeterminado se deja el valor 1 que es de oper com)',
  flsucpromopt bigint , --COMMENT 'Promedio si es comercial,agricola,OTR',
  CONSTRAINT flsuc_pkey PRIMARY KEY (flsuccod,flsucflo)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla flveh
-- vehiculos de la flota (1:M relacion con llantas)
--

DROP TABLE IF EXISTS ctm_flveh;
CREATE TABLE IF NOT EXISTS ctm_flveh (
  csvehpla varchar , --COMMENT 'PLACA VEHICULO',
  csvehid varchar , --COMMENT 'CODIGO INTERNO VEHICULO',
  csvehflo bigint  DEFAULT '0', --COMMENT 'NIT FLOTA',
  csvehmar int , --COMMENT 'CODIGO DE MARCA VEHICULO',
  csvehcat int  DEFAULT '0', --COMMENT 'CODIGO CATEGORIA VEHICULO',
  csvehtip int  DEFAULT '0', --COMMENT 'TIPO DE VEHICULO',
  csvehmod varchar  DEFAULT '0', --COMMENT 'MODELO - AÑO DE VEHICULO',
  csvehlin int  DEFAULT '0', --COMMENT 'CODIGO LINEA DE VEHICULO',
  csveheje int , --COMMENT 'CODIGO MAPEO VEHICULO',
  csvehsin int ,
  csvehkilini bigint , --COMMENT 'KILOMETRAJE ACTUAL VEHICULO',
  csvehrecmen bigint , --COMMENT 'KILOMETRAJE PROMEDIO MENSUAL VEHICULO',
  csvehfecact varchar, --COMMENT 'FECHA ACTUALIZACION',
  --csvehfecact date , --COMMENT 'FECHA ACTUALIZACION',
  csvehhoract time , --COMMENT 'HORA ACTUALIZACION',
  csvehsuc1 varchar , --COMMENT 'CODIGO SUCURSAL - MIGRACION',
  csvehsuc char(2) , --COMMENT 'CODIGO SUCURSAL',
  csvehrel varchar , --COMMENT 'VEHICULO RELACIONADO',
  csvehrel1 varchar , --COMMENT 'VEHICULO RELAACIONADO - MIGRACION',
  csvehrelact int , --COMMENT 'ESTADO VEHICULO RELACIONADO',
  csvehcond bigint , --COMMENT 'CONDUCTOR',
  csvehest int  DEFAULT '1', --COMMENT 'Estado 1-Activo, 2-Inactivo, 3-Buffer',
  csvehopcini bigint , --COMMENT 'Opcional si es Tonelada/Horas',
  csvehopcmen bigint --COMMENT 'Opcional si es Tonelada/Horas',
  --CONSTRAINT pkey_flveh PRIMARY KEY (csvehid,csvehflo)
);
