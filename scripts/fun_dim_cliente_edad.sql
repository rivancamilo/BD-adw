DELIMITER //
CREATE FUNCTION adw.CalcularEdad(infecha_nacimiento VARCHAR(50), fecha_referencia DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
NO SQL
READS SQL DATA
BEGIN
    DECLARE edad INT;
    DECLARE categoria VARCHAR(50);
    DECLARE fecha_nacimiento DATE;
    
    IF infecha_nacimiento IS NOT NULL and infecha_nacimiento <>'' THEN
        -- convertimos de string a date
        SET fecha_nacimiento = STR_TO_DATE(infecha_nacimiento, '%Y-%m-%d');

        -- Calcular la edad en años
        SET edad = YEAR(fecha_referencia) - YEAR(fecha_nacimiento);
        
        -- Verificar el rango de edad y asignar la categoría correspondiente
        IF edad >= 16 and edad <= 40 THEN
            SET categoria = '16 - 40 Años';
        ELSEIF edad >= 41 AND edad < 60 THEN
            SET categoria = '41 - 60';
        ELSEIF edad >= 60 AND edad < 80 THEN
            SET categoria = '61 - 80';
        ELSE
            SET categoria = 'Mayor a 81';
        END IF;
        
        RETURN categoria;

    ELSE
        RETURN 'Sin Definir';
    END IF;
END;
//
DELIMITER ;