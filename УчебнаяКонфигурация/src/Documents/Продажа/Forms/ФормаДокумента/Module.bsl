

#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

// Код процедур и функций



#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	ПересчитатьСуммуВСтроке("Количество")
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	ПересчитатьСуммуВСтроке("Цена")
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПересчитатьСуммуВСтроке(ПредметПересчета)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	ИзмененоКоличество = (ПредметПересчета = "Количество");
	НовоеЗначение      = ?(ИзмененоКоличество, ТекущиеДанные.Количество, ТекущиеДанные.Цена);
	
	МассивСтрок = Элементы.Товары.ВыделенныеСтроки;
	Для Каждого ИДСтроки Из МассивСтрок Цикл
		
		СтрокаДокумента = Объект.Товары.НайтиПоИдентификатору(ИДСтроки);
		Если СтрокаДокумента <> Неопределено Тогда
			
			Если ИзмененоКоличество Тогда
				СтрокаДокумента.Количество = НовоеЗначение;
			Иначе
				СтрокаДокумента.Цена = НовоеЗначение;
			КонецЕсли; 
						
			Если СтрокаДокумента.Количество <> 0 И СтрокаДокумента.Цена = 0 И ИзмененоКоличество Тогда
				СтрокаДокумента.Цена = СтрокаДокумента.Сумма / СтрокаДокумента.Количество;
			ИначеЕсли СтрокаДокумента.Количество = 0 И СтрокаДокумента.Цена <> 0 Тогда
				Если ИзмененоКоличество Тогда
					СтрокаДокумента.Цена = 0;
				Иначе
					СтрокаДокумента.Количество = СтрокаДокумента.Сумм / СтрокаДокумента.Цена;
				КонецЕсли;
			Иначе
				СтрокаДокумента.Сумма = СтрокаДокумента.Количество * СтрокаДокумента.Цена;
			КонецЕсли;
			
		КонецЕсли; 
		
	КонецЦикла;
КонецПроцедуры

#КонецОбласти
