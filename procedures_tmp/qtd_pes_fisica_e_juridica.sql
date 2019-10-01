-- DELIMITER  ;;;
--drop function qtd_pes_fisica_e_juridica;
CREATE OR REPLACE FUNCTION qtd_pes_fisica_e_juridica()  
RETURNS varchar AS
$body$  
declare  
    pf integer;
   	pj integer;
    p  integer;
   
   	retorno varchar(100);
   
    my_cursor1 REFCURSOR;
   	my_cursor2 REFCURSOR;
    my_cursor3 REFCURSOR;
   
   	query1 varchar;
   	query2 varchar;
    query3 varchar;
begin
	-- qtd pessoa fisica
	query1 := 'select
	count (b.id)
	from pessoas a
	inner join pessoa_fisicas b on b.pessoas_id = a.id';

	OPEN my_cursor1 FOR execute query1;
	FETCH my_cursor1 INTO pf;
	CLOSE my_cursor1;

	-- qtd pessoa juridica
	query2 := 'select
	count (b.id)
	from pessoas a
	inner join pessoa_juridicas b on b.pessoas_id = a.id';

	OPEN my_cursor2 FOR execute query2;
	FETCH my_cursor2 INTO pj;
	CLOSE my_cursor2;

	query3 := 'select count(id) from pessoas';
	OPEN my_cursor3 FOR execute query3;
	FETCH my_cursor3 INTO p;
	CLOSE my_cursor3;

	retorno := concat('Quantidade pessoas físicas: ', pf);
	retorno := concat(retorno, ' | Quantidade de pessoas jurídicas: ');
	retorno := concat(retorno, pj);
	retorno := concat(retorno, ' | Quantidade de pessoas: ');
	retorno := concat(retorno, p);
	
	return retorno;
end;
$body$
LANGUAGE 'plpgsql';

;;;
-- DELIMITER ;