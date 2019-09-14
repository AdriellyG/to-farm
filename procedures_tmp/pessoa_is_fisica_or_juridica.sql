-- DELIMITER  ;;;
--drop function pessoa_is_fisica_or_juridica;
CREATE OR REPLACE FUNCTION pessoa_is_fisica_or_juridica(p_id integer)  
RETURNS varchar AS
$body$  
declare  
    pf integer;
   	pj integer;
BEGIN
  	select 1 from pessoa_fisicas where id = p_id into pf;
  	select 1 from pessoa_juridicas where id = p_id into pj;
  
  	if (pf > 0) then
  		return 'fisica';
   	else
   		return 'juridica';
   	end if;
end;
$body$
LANGUAGE 'plpgsql';

;;;
-- DELIMITER ;