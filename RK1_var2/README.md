# Рубежный контроль №1. Вариант №2

## Задание
Реализовать следующий код, написанный в форме Бекуса-Наура, на языке Пролог:
```
<statement> ::= <assignment> | <if>
<assignmment> ::= <variable> = <expression>
<if> ::= if (<expression>) <statement>
<expression> ::= <variable> | <variable> + <variable> | <variable> - <variable>
<variable> ::= x | y | z
```
Текст для разбора: [if, '(', y, '+', z, ')', x, '=', y].
