
-- 20260909 Gerardo Gamboa
-- Cambio de número de grupo entre docentes en la encuesta docente.
-- Estado previo
	-- TC20-2.0		2	150868
    -- TC20-2.0		1	164944
-- Estado esperado
	-- TC20-2.0		1	150868
    -- TC20-2.0		2	164944
    
-- Se verifica el estado previo de la operación
SELECT entidad_profesor, grupo, COUNT(*) FROM mdl_edocente_respuesta
WHERE annio = 2026
AND periodo = 2
AND curso = 'TC20-2.0'
GROUP BY entidad_profesor, grupo;

-- 1 220
-- 2 154
    
-- Se respalda la tabla con los datos completos
CREATE TABLE mdl_edocente_respuesta_GG20260909_0817_TMP AS
SELECT * FROM mdl_edocente_respuesta;

START TRANSACTION;

-- Se pasa el grupo 1 a 100, utilizo el 100 porque no hay un grupo 100 para este curso
UPDATE mdl_edocente_respuesta SET grupo = 100
WHERE annio = 2026
AND periodo = 2
AND curso = 'TC20-2.0'
AND grupo = 1
AND entidad_profesor = '164944';

-- Se pasa el grupo 2 a 1
UPDATE mdl_edocente_respuesta SET grupo = 1
WHERE annio = 2026
AND periodo = 2
AND curso = 'TC20-2.0'
AND grupo = 2
AND entidad_profesor = '150868';

-- Se pasa el grupo 100 a 2
UPDATE mdl_edocente_respuesta SET grupo = 2
WHERE annio = 2026
AND periodo = 2
AND curso = 'TC20-2.0'
AND grupo = 100
AND entidad_profesor = '164944';

-- Se verifica el estado posterior de la operación
SELECT entidad_profesor, grupo, COUNT(*) FROM mdl_edocente_respuesta
WHERE annio = 2026
AND periodo = 2
AND curso = 'TC20-2.0'
GROUP BY entidad_profesor, grupo;

-- 1 154
-- 2 220

ROLLBACK;

COMMIT;

