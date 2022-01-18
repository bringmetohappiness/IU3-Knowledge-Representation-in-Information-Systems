% Решение для https://swish.swi-prolog.org/:

% CLAUSES 

isProposition(assignment).
isProposition(increment).
isProposition(decrement).
isCondition(cmp_greater).
isCondition(cmp_less). 

% грамматика на проверку, что слово - действие
proposition(Word) --> [Word], {isProposition(Word)}.

% грамматика на проверку, что слово - условие
condition(Word) --> [Word], {isCondition(Word)}.

% грамматика на проверку предложения
statement(Result) --> proposition(Result).
statement(Result) --> [leftbrace], statements(Result), [rightbrace].
statement(Result) --> [if], condition(Condition), statement(IfStatement), {sformat(Result, 'if(~s), then(~s)', [Condition, IfStatement])}.
statement(Result) --> [if], condition(Condition), statement(IfStatement), [else], statement(ElseStatement) {sformat(Result, 'if(~s), then(~s), else(~s)', [Condition, IfStatement, ElseStatement])}.

% грамматика на проверку последовательности предложений
statements(Result) --> statement(Statement), {sformat(Result, '~s', [Statement])}.
statements(Result) --> statement(Statement), statements(RestStats), {sformat(Result, '~s,~s', [Statement, RestStats])}.


% GOAL

phrase(statements(Result), [if, cmp_greater, decrement, else, leftbrace, if, cmp_less, leftbrace, assignment, increment, rightbrace, rightbrace]).
