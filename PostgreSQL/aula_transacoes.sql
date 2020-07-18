select numero,
	nome,
	ativo
from banco
order by numero;

update banco set ativo =  false
	where numero = 0;
	
--=================================

begin;
	update banco set ativo = true
		where numero = 0; -- Muda o status para true
rollback; -- volta para falso


begin;
	update banco set ativo = true
		where numero = 0;
commit; -- voltou a ser true

--==================================

begin;
	update funcionarios set gerente = 2
		where id = 3;
savepoint sf_func;
	update funcionarios set gerente = null; -- erro
rollback to sf_func;
	update funcionarios set gerente = 3
		where id = 5;
commit;
