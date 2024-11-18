% Fatos: empresa(nome).
empresa('Empresa A').
empresa('Empresa B').
empresa('Empresa C').

% Fatos: funcionario(nome, cargo, salario, empresa).
funcionario('Lucas', 'Desenvolvedor', 5000, 'Empresa A').
funcionario('Mateus', 'Gerente', 7000, 'Empresa A').
funcionario('Marco', 'Analista', 4500, 'Empresa A').
funcionario('Ana', 'Desenvolvedor', 4800, 'Empresa B').
funcionario('João', 'Analista', 4700, 'Empresa B').
funcionario('Maria', 'Gerente', 8000, 'Empresa B').
funcionario('Paulo', 'Estagiário', 2000, 'Empresa C').
funcionario('Clara', 'Desenvolvedor', 5100, 'Empresa C').

% Regra para calcular a média salarial dos funcionários de uma empresa.
soma_salarios_empresa(Empresa, Soma, Contagem) :-
    findall(Salario, funcionario(_, _, Salario, Empresa), Salarios),
    sumlist(Salarios, Soma),
    length(Salarios, Contagem).

media_salarial(Empresa, Media) :-
    soma_salarios_empresa(Empresa, Soma, Contagem),
    Contagem > 0, % Evitar divisão por zero
    Media is Soma / Contagem.

% Regra para listar os cargos disponíveis em uma empresa.
cargos_empresa(Empresa, Cargos) :-
    findall(Cargo, funcionario(_, Cargo, _, Empresa), ListaCargos),
    sort(ListaCargos, Cargos). % Remove duplicatas

% Regra para listar todos os funcionários de um cargo em uma empresa.
funcionarios_por_cargo(Empresa, Cargo, Funcionarios) :-
    findall(Nome, funcionario(Nome, Cargo, _, Empresa), Funcionarios).
