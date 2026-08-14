CREATE TABLE "Поставка"
(
    "Код_поставки"       SERIAL PRIMARY KEY,
    "Код_поставщика"     INT NOT NULL,
    "Дата"               DATE NOT NULL,

    CONSTRAINT "FK_Поставка_Поставщик"
        FOREIGN KEY ("Код_поставщика")
        REFERENCES "Поставщик"("Код_поставщика")
);
