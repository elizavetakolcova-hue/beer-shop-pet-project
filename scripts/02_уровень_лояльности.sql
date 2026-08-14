CREATE TABLE "Уровень_лояльности"
(
    "Код_уровня"        SERIAL PRIMARY KEY,
    "Название"          VARCHAR(50) NOT NULL UNIQUE,
    "Порог_суммы"       DECIMAL(10, 2) NOT NULL,
    "Процент_бонусов"   DECIMAL(5, 2) NOT NULL,

    CONSTRAINT "CHK_Уровень_лояльности_Порог_суммы"
        CHECK ("Порог_суммы" >= 0),

    CONSTRAINT "CHK_Уровень_лояльности_Процент_бонусов"
        CHECK ("Процент_бонусов" BETWEEN 0 AND 100)
);
