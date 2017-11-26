# Vaja 2: Filtriranje, detekcija robov, kotov, črt, krogov

## Naloga 1: Konvolucija in filtriranje

### b)

- Jedro je gaussova krivulja, vsota vseh elementov jedra je 1.

### c)

- `Ig=conv(I, g, 'same')` parameter `same` poskrbi, da je rezulat po konvoluciji enako dolg kot `I`,  privzeto je dolžina rezultata `full` ; `len(I) + len(n) - 1`

