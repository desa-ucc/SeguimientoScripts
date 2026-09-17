-- *** UMCA/AVATAR
-- *** Cambio            : update
-- *** Modificado por    : Fiorella Salazar Molina 
-- *** Creado el         : 20260917
-- *** Ticket referencia : Ticket#2026091412001716 — Urge: Apoyo con LX2014, G02, Central
-- *** Descripción		 : Caiga a un curso nuevo y no al viejo 


-- Hace que el curso pueda sincronizar se puedan sincronizar
UPDATE M23ARC 
SET M23EXP = 'S' , M23CUR = null
WHERE m11cod='LX2014' and m23gru=2 and m18cod=2026 and M19COD=3


-- Hace que los profes se puedan sincronizar
update M30ARC
set M30EXP='S'
 WHERE m11cod='LX2014' and m23gru=2 and m18cod=2026 and M19COD=3

-- Hace que los estudiantes se puedan sincronizar
UPDATE M32ARC 
SET M32EXP = 'S'
WHERE m11cod='LX2014' and m23gru=2 and m18cod=2026 and M19COD=3



