CREATE TABLE "Бонусные_операции"
(
    "Код_операции"      SERIAL PRIMARY KEY,
    "Код_клиента"       INT NOT NULL,
    "Код_продажи"       INT NOT NULL,
    "Сумма_баллов"      INT NOT NULL,
    "Тип_операции"      VARCHAR(20) NOT NULL,
    "Дата"              DATE NOT NULL,

    CONSTRAINT "CHK_Бонусные_операции_Сумма_баллов"
        CHECK ("Сумма_баллов" <> 0),

    CONSTRAINT "CHK_Бонусные_операции_Тип_операции"
        CHECK ("Тип_операции" IN ('начисление', 'списание')),

    CONSTRAINT "FK_Бонусные_операции_Клиент"
        FOREIGN KEY ("Код_клиента")
        REFERENCES "Клиент"("Код_клиента"),

    CONSTRAINT "FK_Бонусные_операции_Продажи"
        FOREIGN KEY ("Код_продажи")
        REFERENCES "Продажи"("Код_продажи")
);
ALTER TABLE "Бонусные_операции"
ADD CONSTRAINT chk_знак_соответствует_типу CHECK (
    ("Тип_операции" = 'начисление' AND "Сумма_баллов" > 0)
    OR
    ("Тип_операции" = 'списание' AND "Сумма_баллов" < 0)
);
