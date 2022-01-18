# Рубежный контроль №1. Вариант №3

## Задание
Реализовать следующий код, написанный в форме Бекуса-Наура, на языке Пролог:
```
<call-fred>  ::= fred <whitespace> <number> <eol>
<whitespace> ::= <space-char> | <space-char> <whitespace>
<space-char> ::= \s | \t
<number>     ::= <digit> | <digit> <number>
<digit>      ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9.
<eol>        ::= \n | <whitespace> \n
```
Текст для разбора: [fred, tab, ' ', ' ', 1, tab, nl].
