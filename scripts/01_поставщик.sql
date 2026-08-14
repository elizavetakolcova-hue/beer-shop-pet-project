CREATE TABLE "Поставщик"
(
    "Код_поставщика"     SERIAL PRIMARY KEY,
    "Название_пивоварни" VARCHAR(150) NOT NULL,
    "Город"              VARCHAR(100) NOT NULL
);
