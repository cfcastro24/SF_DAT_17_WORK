--Table: tire_fact
drop table if exists tire_fact;
create table tire_fact as (
select
--count (distinct  csllacod) as tire_id,
a.csllacod as tire_id, --COMMENT 'CODIGO INTERNO LLANTA, SE RELACIONA CON LAS TABLAS DE INSPECCIONES, HISTORICOS, VIDAS'
a.csllacodflo as tire_marc_code, ----COMMENT 'CODIGO MARCAJE LLANTAS',
a.csllakstmon as tire_mnt_km, --COMMENT 'KILOMETRAJE MONTAJE',
a.csllakilact as tire_current_km, --COMMENT 'KILOMETRAJE ACTUAL LLANTA',
a.csllakilveh as vehicle_km, --COMMENT 'KILOMETRAJE VEHICULO',
a.cslladis as tire_design, --COMMENT 'DISEÑO',
a.cslladim as tire_dimension, --COMMENT 'DIMENSION',
case when a.csllafecc='0000-00-00' then null else a.csllafecc::date end as tire_create_date, --COMMENT 'FECHA CREACION LLANTA',
case when a.csllafecm='0000-00-00' then null else a.csllafecm::date end as mnt_date, --COMMENT 'FECHA MONTAJE',
a.csllapos as tire_pos, --COMMENT 'POSICION LLANTA',
a.csprsest as tire_status, --COMMENT 'ESTADO ACTUAL DE LA LLANTA, 1=AVAILABLE, 2=MOUNTED, 3=REPAIR, 4=RETHREAD, 5=DOWN, 6=DISP FINAL',
a.csllamrcree as rethread_brand, --COMMENT 'MARCA REENCAUCHE',
a.csllabanree as rethread_design, --COMMENT 'DISEÑO REENCAUCHE',
a.csllareen as rethread_num, --COMMENT 'NUMERO REENCAUCHE',
a.csllacons as tire_construction, --COMMENT 'CONSTRUCTON 1=RADIAL, 0=CONVENTIONAL',
a.csllalabext as carving_ext, --COMMENT 'LABRADO EXTERNO',
a.csllalabcen as carving_cnt, --COMMENT 'LABRADO CENTRAL',
a.csllalabint as carving_int, --COMMENT 'LABRADO INTERNO',
a.csllapsi as psi, --COMMENT 'PSI',
a.csllapsiest as psi_est, --COMMENT 'PSI ESTIMADO',
case when a.csllafecmod='0000-00-00' then null else a.csllafecmod::date end as mod_date, --COMMENT 'FECHA MODIFICACION',
a.csllakilini as init_km , --COMMENT 'KILOMETRAJE INICIAL',
a.csllahormod as mod_hr, --COMMENT 'HORA MODIFICACION',
a.csllanskini as nski, --COMMENT 'NSKI',
a.csllarenapt as rethreadable , --COMMENT 'Estado de la llanta si es Apta o no para reencauchar',
a.csinsplla as last_inspection , --COMMENT 'Ultima inspeccion',
a.csmovfec as last_movement_date --COMMENT 'fecha ultimo movimiento',
from ctm_fllla a);

/***
--Data Quality cleanup
select csllafecmod::date, * from ctm_fllla a where a.csllafecm ='2015-02-00';
UPDATE ctm_fllla SET csllafecm = '2015-10-01' WHERE csllafecm = '2015-10-00';
***/
--Table: tire_life
drop table if exists tire_life;
create table tire_life as (
select 
csllacod as tire_id , --COMMENT 'CODIGO INTERNO LLANTA',
csllacodflo tire_marc_code, --COMMENT 'CODIGO MARCAJE LLANTA',
csfloid as fleet_id, --COMMENT 'NIT FLOTA',
cslladot as life_dot, --COMMENT 'DOT VIDA',
csllamarc as life_brand, --COMMENT 'MARCA DE VIDA',
cslladis as life_design, --COMMENT 'DISEÑO DE VIDA',
cslladim as life_dimension, --COMMENT 'DIMENSION',
csllacost as life_cost, --COMMENT 'COSTO VIDA',
case when csllafecc='0000-00-00' then null else csllafecc::date end as life_create_date, --COMMENT 'FECHA CREACION VIDA',
case when csllafecm='0000-00-00' then null else csllafecm::date end as life_mnt_date, --COMMENT 'FECHA MONTAJE VIDA',
--csllafecd varchar,  
csllakil as life_km, --COMMENT 'KILOMETRAJE VIDA',
csllavida as life_rethread_num, --COMMENT 'NUMERO DE REENCAUCHE', --vida 0, 1, 2, 3
csllalabint as life_carving_int, --COMMENT 'LABRADO INTERNO',
csllalabcen as life_carving_cnt, --COMMENT 'LABRADO CENTRAL',
csllalabext as life_carving_ext, --COMMENT 'LABRADO EXTERNO',
csllanskini as life_nski, --COMMENT 'NSKI DE VIDA',
csllarenapt as life_rethreadable --COMMENT 'Estado de la llanta si es Apta o no para reencauchar',
from ctm_flllavid);

/*** TIRE HISTORY ***/
drop table if exists tire_hist;
create table tire_hist as (
select
  cshisid as tire_hist_id, --COMMENT 'ID INCREMENTAL',
  cshisveh as vehicle_id, --COMMENT 'NUMERO INTERNO VEHICULO',
  cshisflo as fleet_id, --COMMENT 'NIT FLOTA',
  cshissuc as branch_code, --COMMENT 'CODIGO SUCURSAL',
  cshislla as tire_id, --COMMENT 'CODIGO INTERNO LLANTA',
  cshisllaflo as tire_marc_code, --COMMENT 'CODIGO MARCAJE LLANTA',
  cshismov as movement_type, --COMMENT 'TIPO DE MOVIMIENTO',
  hismot as movement_reason, --COMMENT 'MOTIVO',
  histipren as rethread_type, --COMMENT 'TIPO REENCAUCHE',
  cshispos as tire_pos, --COMMENT 'POSICION LLANTA',
  case when cshisfec='0000-00-00' then null else cshisfec::date end as movement_date,  --COMMENT 'FECHA MOVIMIENTO',
  cshiskim as movement_km , --COMMENT 'KILOMETRAJE MOVIEMIENTO',
  cshislabext as carving_ext, --COMMENT 'LABRADO EXTERNO',
  cshislabcen as carving_cnt, --COMMENT 'LABRADO CENTRAL',
  cshislabint as carving_int, --COMMENT 'LABRADO INTERNO',
  cshispres as psi, --COMMENT 'PSI',
  cshisprfmin as min_depth, --COMMENT 'PROFUNDIDAD MINIMA',
  cshishor as movement_hour, --COMMENT 'HORA MOVIEMIENTO',
  cshiskimveh as vehicle_km, --COMMENT 'KILOMETRAJE VEHICULO',
  cshiscos as movement_cost, --COMMENT 'COSTO MOVIMIENTO',
  cshisnsk as nski, --COMMENT 'NSKI',
  cshismar as tire_brand, --COMMENT 'MARCA LLANTA (NUEVA O REENCAUCHE) EN EL MOVIMIENTO',
  cshisrad as tire_construction , --COMMENT 'CONSTRUCCION 1=RADIAL, 0=CONVENCIONAL',
  cshisree as tire_mvmt_rethread_num, --COMMENT 'NUMERO REENCAUCHE EN EL MOVIMIENTO',
  cshisdim as tire_dimension, --COMMENT 'DIMENSION',
  cshisdis as tire_design, --COMMENT 'DISEÑO',
  cshisban as rethread_design, --COMMENT 'DISEÑO REENCAUCHE',
  cshisdot as dot, --COMMENT 'DOT',
  cshiskimtot as total_tire_mvmt_km, --COMMENT 'KILOMETRAJE TOTAL LLANTA EN EL MOVIMIENTO',
  case when cshisfecmov='0000-00-00 00:00:00' then null else cshisfecmov::timestamp end as real_movement_date,  --COMMENT 'FECHA MOVIMIENTO',
  cshisusu as user, --COMMENT 'USUARIO',
  case when cshisfecm='0000-00-00' then null else cshisfecm::date end as mnt_date,  --COMMENT 'FECHA MOVIMIENTO',
  cshisorser as service_order --COMMENT 'Orden Servicio',
from ctm_flhis);


/***
--Data Quality cleanup
select csllafecmod::date, * from ctm_fllla a where a.csllafecm ='2015-02-00';
UPDATE ctm_flhis SET cshisfec = '2012-01-30' WHERE cshisfec = '2012-00-30';
***/

/** ANALYZE TABLES **/
analyze tire_fact;
analyze tire_life;
analyze tire_hist;

/*** EDA 
select count(*) from tire_fact;
select count(*) from tire_life;

select * from tire_fact limit 10;
select count(distinct tire_id) from tire_life;

select * from tire_life
***/