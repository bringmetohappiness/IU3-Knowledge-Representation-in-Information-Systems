% Решение для https://swish.swi-prolog.org/:

% CLAUSES

time --> time-of-day, zone.
time-of-day --> hour, [':'], minute.
time-of-day --> hour, [':'], minute, [':'], second.
hour --> twodigit.
minute --> twodigit.
second --> twodigit.
zone --> fws, ['utc'], fws, ['+'], twodigit.
zone --> fws, ['utc'], fws, ['-'], twodigit.
twodigit --> digit, digit.
digit --> [0] ; [1] ; [2] ; [3] ; [4] ; [5] ; [6] ; [7] ; [8] ; [9].
fws --> [' '].

% GOAL

length(Result, _), phrase(time, Result).