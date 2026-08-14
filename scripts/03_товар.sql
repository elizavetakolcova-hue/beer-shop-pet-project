CREATE TABLE "Товар"
(
    "Код_товара"             SERIAL PRIMARY KEY,
    "Название"               VARCHAR(150) NOT NULL,
    "Код_поставщика"         INT NOT NULL,
    "Остаток_на_складе"      INT NOT NULL DEFAULT 0,
    "Остаток_в_магазине"     INT NOT NULL DEFAULT 0,
    "Цена"                   DECIMAL(10, 2) NOT NULL,

    CONSTRAINT "CHK_Товар_Остаток_на_складе"
        CHECK ("Остаток_на_складе" >= 0),

    CONSTRAINT "CHK_Товар_Остаток_в_магазине"
        CHECK ("Остаток_в_магазине" >= 0),

    CONSTRAINT "CHK_Товар_Цена"
        CHECK ("Цена" > 0),

    CONSTRAINT "FK_Товар_Поставщик"
        FOREIGN KEY ("Код_поставщика")
        REFERENCES "Поставщик"("Код_поставщика")
);
