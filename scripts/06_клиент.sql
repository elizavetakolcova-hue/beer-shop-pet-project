CREATE TABLE "Клиент"
(
    "Код_клиента"                  SERIAL PRIMARY KEY,
    "ФИО"                          VARCHAR(150) NOT NULL,
    "Дата_рождения"                DATE NOT NULL,
    "Код_уровня"                   INT NOT NULL,
    "Код_предыдущего_уровня"       INT NULL,

    CONSTRAINT "FK_Клиент_Уровень_лояльности"
        FOREIGN KEY ("Код_уровня")
        REFERENCES "Уровень_лояльности"("Код_уровня"),

    CONSTRAINT "FK_Клиент_Предыдущий_уровень_лояльности"
        FOREIGN KEY ("Код_предыдущего_уровня")
        REFERENCES "Уровень_лояльности"("Код_уровня")
);
