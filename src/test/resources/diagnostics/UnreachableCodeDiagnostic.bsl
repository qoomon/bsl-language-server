Процедура Пример1()
    Для каждого Строка Из Строки Цикл
        Если Условие Тогда
            Продолжить;;; // <-- Ошибка нет
        КонецЕсли;
    КонецЦикла;
КонецПроцедуры

Процедура Пример1()
    Для каждого Строка Из Строки Цикл
        Если Условие Тогда
            Продолжить;
            Метод();    // <-- Ошибка: после продолжить
        КонецЕсли;
    КонецЦикла;
КонецПроцедуры

Процедура Пример2()
    Для каждого Строка Из Строки Цикл
        Если Условие Тогда
            Возврат;
            Метод();    // <-- Ошибка: после Возврат
        КонецЕсли;
    КонецЦикла;
КонецПроцедуры

Процедура Пример3()
    Для каждого Строка Из Строки Цикл
        Если Условие2 Тогда
            Прервать;
            Метод();    // <-- Ошибка: после Прервать
        КонецЕсли;
    КонецЦикла;
КонецПроцедуры

Процедура Пример4()
    Возврат;
    Для каждого Строка Из Строки Цикл   // <-- Ошибка: после Возврат
        Если Условие2 Тогда
            Метод();
        КонецЕсли;
    КонецЦикла;
КонецПроцедуры

Функция Пример5()
    Возврат 1;
    Возврат 2; // <-- Ошибка: после Возврат
    Для каждого Строка Из Строки Цикл  // <-- Ошибка нет: второй Возврат не ловим
        Если Условие2 Тогда
            Метод();
        КонецЕсли;
    КонецЦикла;
КонецФункции

Функция Пример6()
    Для каждого Строка Из Строки Цикл
        Если Условие2 Тогда
            ВызватьИсключение "Ошибка";
            Метод();    // <-- Ошибка: После ВызватьИсключение
        КонецЕсли;
    КонецЦикла;
КонецФункции

Функция Пример7()
    Для каждого Строка Из Строки Цикл
        Если Условие2 Тогда
            ВызватьИсключение "Ошибка";
            Метод();    // <-- Ошибка: После ВызватьИсключение
            Прервать;   // не анализируем
            Метод2();   // ошибки нет, относится к блоку выше
        КонецЕсли;
    КонецЦикла;
КонецФункции

Функция Пример8()
    #Если Сервер Тогда
        Возврат;
    #Иначе
        // ошибки здесь нет
        Для каждого Строка Из Строки Цикл
            Если Условие2 Тогда
                ВызватьИсключение "Ошибка";
                Метод();    // <-- Ошибка: После ВызватьИсключение
                Прервать;   // не анализируем
                Метод2();   // ошибки нет, относится к блоку выше
            КонецЕсли;
        КонецЦикла;
     #КонецЕсли
КонецФункции

Функция Пример9()
    #Если Сервер Тогда
        Возврат;
        Метод(); // <-- Ошибка: После Возврат
    #ИначеЕсли Не Сервер Тогда
        Метод();
        #Если Сервер Тогда
            Метод3();
            Возврат;
        #КонецЕсли
        Метод4(); // ошибки нет
        Возврат;
        Метод5(); // <-- Ошибка: После возврат
    #Иначе
        // ошибки здесь нет
        Для каждого Строка Из Строки Цикл
            Если Условие2 Тогда
                ВызватьИсключение "Ошибка";
                #Если Клиент Тогда // <-- Ошибка: После ВызватьИсключение
                    Метод();    // не анализируем
                    Прервать;   // не анализируем
                    Метод2();   // ошибки нет, относится к блоку выше
                #КонецЕсли
            КонецЕсли;
        КонецЦикла;
     #КонецЕсли
КонецФункции

Функция Пример10()
    #Если Сервер Тогда
        Возврат;
    #Иначе
        ВызватьИсключение "";
     #КонецЕсли

     Метод2();   // <-- Ошибка: ренее были Возврат и Вызватьисключение, ка не ловим

КонецФункции

#Если Сервер Тогда
   Возврат;
#Иначе
    Метод();
    Возврат;
    Метод2();   // <-- Ошибка: После Возврат
#КонецЕсли

Если Условие2 Тогда
    ВызватьИсключение "Ошибка";
    Метод();    // <-- Ошибка: После ВызватьИсключение
    Возврат;   // не анализируем
    Метод2();   // ошибки нет, относится к блоку выше
КонецЕсли;

Возврат;
Метод2();   // Ошибка: После Возврат