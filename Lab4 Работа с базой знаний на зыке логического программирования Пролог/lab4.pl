% МГТУ им Н. Э. Баумана, факультет «Информатика и системы управления»,
% кафедра ИУ-3 «Информационные системы и телекоммуникации», 
% Магистрарута, 1 курс, 2 семестр, 2021 год.
% Лабораторная работа №4
% по курсу «Представление знаний в информационных системах»
% на тему «Работа с базой знаний на языке логического программирования Пролог».
% Выполнил Шевченко Михаил, студент группы ИУ3-22М.
%
% ЛР4-Запрос-4
% «Какое событие произошло после блокирования пути камнем?»

% CLAUSES

:- use_module(library(sparqlprog)).
:- use_module(library(semweb/rdf11)).
:- use_module(library(sparqlprog/ontologies/owl), [label/2]).

% Здесь 192.168.31.50 - это IP-адрес компьютера с работающим приложением ClioPatria
:- sparql_endpoint(dbm, 'http://192.168.31.50:3020/sparql').
:- rdf_prefixes:rdf_register_prefix(rdfs,'http://www.w3.org/2000/01/rdf-schema#').


findEvent(Event):- dbm ??
  rdf(Event, _, Action),
  rdf(Action, rdfs:'label', literal('blocked by')).


findNextEvent(PrevEvent, CurrentEvent):- dbm ??
  rdf(CurrentEvent, rdf:type, EventClass),
  rdf(EventClass, rdfs:'label', literal('Event')),
  rdf(PrevEvent, EventProperty, CurrentEvent),
  rdf(EventProperty, rdfs:'label', literal('next')).


findSmth(Event, SmthLabel):- dbm ??
  rdf(Event, _, Smth),
  rdf(Smth, rdf:type, SmthClass),
  rdf(SmthClass, rdfs:'label', X),
  rdf(Smth, rdfs:'label', SmthLabel).


% GOAL

findEvent(Event), findNextEvent(Event, CurrentEvent), findSmth(CurrentEvent, SmthLabel)