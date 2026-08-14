CREATE TABLE "Товары_в_поставке"
(
    "Код_поставки"       INT NOT NULL,
    "Код_товара"         INT NOT NULL,
    "Количество"         INT NOT NULL,

    CONSTRAINT "PK_Товары_в_поставке"
        PRIMARY KEY ("Код_поставки", "Код_товара"),

    CONSTRAINT "CHK_Товары_в_поставке_Количество"
        CHECK ("Количество" > 0),

    CONSTRAINT "FK_Товары_в_поставке_Поставка"
        FOREIGN KEY ("Код_поставки")
        REFERENCES "Поставка"("Код_поставки")
        ON DELETE CASCADE,

    CONSTRAINT "FK_Товары_в_поставке_Товар"
        FOREIGN KEY ("Код_товара")
        REFERENCES "Товар"("Код_товара")
);
