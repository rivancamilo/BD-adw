/********************************************************************************
***************   FUNCION PARA VALIDAR EL SEMESTRE DE UNA FECHA   ***************
*******************************************************************************/
DELIMITER //
CREATE FUNCTION adw.DeterminarSemestre(fecha DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
READS SQL DATA
BEGIN
    DECLARE semestre VARCHAR(20);
    DECLARE anio VARCHAR(4);
    
    SET anio = YEAR(fecha);
    
    IF MONTH(fecha) BETWEEN 1 AND 6 THEN
        SET semestre = CONCAT('Primer Semestre ', anio);
    ELSE
        SET semestre = CONCAT('Segundo Semestre ', anio);
    END IF;
    
    RETURN semestre;
END;
//
DELIMITER ;