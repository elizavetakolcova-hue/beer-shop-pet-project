CREATE TABLE "Товары_в_продаже"
(
    "Код_продажи"       INT NOT NULL,
    "Код_товара"        INT NOT NULL,
    "Количество"        INT NOT NULL,

    CONSTRAINT "PK_Товары_в_продаже"
        PRIMARY KEY ("Код_продажи", "Код_товара"),

    CONSTRAINT "CHK_Товары_в_продаже_Количество"
        CHECK ("Количество" > 0),

    CONSTRAINT "FK_Товары_в_продаже_Продажи"
        FOREIGN KEY ("Код_продажи")
        REFERENCES "Продажи"("Код_продажи")
        ON DELETE CASCADE,

    CONSTRAINT "FK_Товары_в_продаже_Товар"
        FOREIGN KEY ("Код_товара")
        REFERENCES "Товар"("Код_товара")
);

ALTER TABLE "Товары_в_продаже"
ADD COLUMN "Цена_за_единицу" NUMERIC(10,2) NOT NULL DEFAULT 0;
