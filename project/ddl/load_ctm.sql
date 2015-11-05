copy ctm_flflo from '/data/flotas_export/Admin/flflo.csv' USING DELIMITERS ';' WITH CSV HEADER NULL AS '';
copy ctm_flhis from '/data/flotas_export/Admin/flhis.csv' USING DELIMITERS ';' WITH CSV HEADER NULL AS '';
copy ctm_flinsp from '/data/flotas_export/Admin/flinsp.csv' USING DELIMITERS ';' WITH CSV HEADER NULL AS '';
copy ctm_fllla from '/data/flotas_export/Admin/fllla.csv' USING DELIMITERS ';' WITH CSV HEADER NULL AS '';
copy ctm_flllavid from '/data/flotas_export/Admin/flllavid.csv' USING DELIMITERS ';' WITH CSV HEADER NULL AS '';
copy ctm_flveh from '/data/flotas_export/Admin/flveh.csv' USING DELIMITERS ';' WITH CSV HEADER NULL AS '';

analyze ctm_flflo;
analyze ctm_flhis;
analyze ctm_flinsp;
analyze ctm_fllla;
analyze ctm_flllavid;
analyze ctm_flveh;
