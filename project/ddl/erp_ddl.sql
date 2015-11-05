create table erp_csdim (
dimcod char(12),
dimtip char(1),
dimvaa decimal(16,2),
dimfec date,
dimval decimal(16,2),
dimcir decimal(5,3),
dimmt3 decimal(5,3)
);
create table erp_csdis (
disinv char(3),
discod char(6),
disnom char(30),
dismar char(3),
dispro char(1)
);
create table erp_csmar (
marcod char(2),
marnom char(30),
martip char(1),
extra varchar
);
create table erp_csmov (
movfue char(2),
movdoc integer,
movano char(4),
movmes char(2),
movfec date,
movcli char(11),
movcom char(4),
movanu char(1),
movubi char(3)
);
create table erp_csmovdet (
movdetfue char(2),
movdetdoc integer,
movdetano char(4),
movdetmes char(2),
movdettiq integer,
movdetdim char(12),
movdettip char(1),
movdetdis char(6),
movdetpro char(2),
movdetent char(1),
movdetsal char(1),
movdetcan decimal(16,2),
movdetval decimal(16,2),
movdethor char(5),
movdetanu char(1),
movdetubi char(3),
movdetude char(3),
movdetusu char(8)
);
create table erp_cssal (
salano char(4),
salmes char(2),
salcco char(1),
salubi char(3),
saltiq integer,
saldim char(12),
saltip char(1),
salant decimal(16,2),
salent decimal(16,2),
salsal decimal(16,2),
salanu char(1)
);
create table erp_cstiq (
tiqnum integer,
tiqcli char(11),
tiqcom char(4),
tiqdoc integer,
tiqano char(4),
tiqmes char(2),
tiqfec date,
tiqmar char(3),
tiqdim char(12),
tiqtip char(1),
tiqrad char(1),
tiqori char(1),
tiqser char(12),
tiqdis char(6),
tiqpro char(2),
tiqdor char(6),
tiqent date,
tiqval decimal(16,2),
tiqfen char(3),
tiqden integer,
tiqanu char(1),
tiqubi char(3),
tiqres char(8),
tiqart char(12),
tiqmat char(12),
tiqcir decimal(5,3),
tiqpes decimal(16,2),
tiqpet decimal(16,2),
tiqpla char(3),
tiqdso char(6),
tiqest char(1),
tiqfee date,
tiqvhe char(7),
tiqdre char(6),
tiqzon char(3)
);
create table erp_cardetmal (
maldetdoc integer,
maldetubi char(3),
maldettiq integer
);
create table erp_carmal (
maldoc integer,
malcli char(11),
malubi char(3),
malfec date,
malanu char(1)
);
create table erp_cauaj (
caucod char(2),
caunom char(60)
);
create table erp_cauajn (
caucodn char(2),
caunomn char(60)
);
