CREATE TABLE "Продажи"
(
    "Код_продажи"       SERIAL PRIMARY KEY,
    "Код_клиента"       INT NOT NULL,
    "Дата"              DATE NOT NULL,

    CONSTRAINT "FK_Продажи_Клиент"
        FOREIGN KEY ("Код_клиента")
        REFERENCES "Клиент"("Код_клиента")
);
