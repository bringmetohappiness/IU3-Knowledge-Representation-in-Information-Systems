% Решение для https://swish.swi-prolog.org/:

% CLAUSES

statement --> assigment.
statement --> if.
assigment --> variable, ['='], expression.
if --> [if], ['('], expression, [')'], statement.
expression --> variable.
expression --> variable, ['+'], variable.
expression --> variable, ['-'], variable.
expression --> variable, ['*'], variable.
variable --> [x] ; [y] ; [z].

% GOAL

length(Result, _), phrase(statement, Result).
