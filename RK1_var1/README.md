# Рубежный контроль №1. Вариант №1

## Задание
Реализовать следующий код, написанный в форме Бекуса-Наура, на языке Пролог:
```
time         ::=  time-of-day zone
time-of-day  ::=  hour ":" minute [ ":" second ]
hour         ::=  2DIGIT
minute       ::=  2DIGIT
second       ::=  2DIGIT
zone         ::=  FWS "uts" FWS ( "+" | "-" ) 2DIGIT
2DIGIT       ::=  digit digit
digit        ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
FWS          ::= ' '
```
Текст для разбора: [1, 3, ':', 5, 0, ' ', utc, ' ', '+', 0, 3].
