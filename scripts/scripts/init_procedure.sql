create procedure init_beer_shop_data ()
language plpgsql
as $$
begin

INSERT INTO "Поставщик" (
    "Код_поставщика",
    "Название_пивоварни",
    "Город"
)
SELECT
    p.id,
    'Пивоварня ' || p.id,
    CASE p.id % 5
        WHEN 0 THEN 'Казань'
        WHEN 1 THEN 'Москва'
        WHEN 2 THEN 'Санкт-Петербург'
        WHEN 3 THEN 'Новосибирск'
        WHEN 4 THEN 'Екатеринбург'
    END
FROM generate_series(1, 15) AS p(id);


INSERT INTO "Уровень_лояльности" (
    "Код_уровня",
    "Название",
    "Порог_суммы",
    "Процент_бонусов"
)
SELECT
    l.id,
    'Уровень ' || l.id,
    ((l.id - 1) * 1000)::numeric(10, 2),
    (5 + (l.id - 1) * 3)::numeric(5, 2)
FROM generate_series(1, 15) AS l(id);


INSERT INTO "Товар" (
    "Код_товара",
    "Название",
    "Код_поставщика",
    "Остаток_на_складе",
    "Остаток_в_магазине",
    "Цена"
)
SELECT
    t.id,
    'Товар ' || t.id,
    ((t.id - 1) % 15) + 1,
    t.id * 3,
    t.id * 2,
    (100 + t.id * 15.5)::numeric(10, 2)
FROM generate_series(1, 30) AS t(id);


INSERT INTO "Поставка" (
    "Код_поставки",
    "Код_поставщика",
    "Дата"
)
SELECT
    s.id,
    ((s.id - 1) % 15) + 1,
    DATE '2026-01-01' + (s.id - 1)
FROM generate_series(1, 30) AS s(id);


INSERT INTO "Товары_в_поставке" (
    "Код_поставки",
    "Код_товара",
    "Количество"
)
SELECT
    s.supply_id,
    ((s.supply_id + o.offset_id - 1) % 30) + 1,
    5 + o.offset_id * 3 + (s.supply_id % 7)
FROM generate_series(1, 30) AS s(supply_id)
CROSS JOIN generate_series(0, 1) AS o(offset_id);


INSERT INTO "Клиент" (
    "Код_клиента",
    "ФИО",
    "Дата_рождения",
    "Код_уровня",
    "Код_предыдущего_уровня"
)
SELECT
    c.id,
    'Клиент ' || c.id,
    DATE '1985-01-01' + (c.id * 37),
    ((c.id - 1) % 15) + 1,
    CASE
        WHEN ((c.id - 1) % 15) = 0 THEN NULL
        ELSE ((c.id - 2) % 15) + 1
    END
FROM generate_series(1, 30) AS c(id);


INSERT INTO "Продажи" (
    "Код_продажи",
    "Код_клиента",
    "Дата"
)
SELECT
    sale.id,
    sale.id,
    DATE '2026-02-01' + (sale.id - 1)
FROM generate_series(1, 30) AS sale(id);


INSERT INTO "Товары_в_продаже" (
    "Код_продажи",
    "Код_товара",
    "Количество"
)
SELECT
    sale.sale_id,
    ((sale.sale_id + o.offset_id - 1) % 30) + 1,
    1 + o.offset_id + (sale.sale_id % 4)
FROM generate_series(1, 30) AS sale(sale_id)
CROSS JOIN generate_series(0, 1) AS o(offset_id);


INSERT INTO "Бонусные_операции" (
    "Код_операции",
    "Код_клиента",
    "Код_продажи",
    "Сумма_баллов",
    "Тип_операции",
    "Дата"
)
SELECT
    b.id,
    b.id,
    b.id,
    CASE
        WHEN b.id % 3 = 0 THEN -(100 + b.id)
        ELSE 100 + b.id
    END,
    CASE
        WHEN b.id % 3 = 0 THEN 'списание'
        ELSE 'начисление'
    END,
    DATE '2026-02-01' + b.id
FROM generate_series(1, 30) AS b(id);

end;
$$;
