# Analiza skupień

## Wstęp

W analizie tej korzystamy z 2 zbiorów danych. Pierwszy, który analizujemy o nazwie `Cars.sta`,zawiera następujące
informacje:

- **CENA** - Cena samochodu
- **PRZYSP** - Przyspieszenie samochodu
- **HAMOWAN** - Długość drogi hamowania
- **WSK_TRZY** - Wskaźnik trzymania się drogi
- **ZUŻYCIE** - Zużycie paliwa

Drugi zbiór danych o nazwie `Auta_all` zawiera:

- **Pochodzenie** - Pochodzenie samochodu
- **Rok_produkcji** - Rok produkcji samochodu
- **Cylindry** - Ilość cylindrów
- **Pojemność_silnika** - Pojemność silnika
- **Konie_mechaniczne** - Moc silnika
- **Waga** - Waga samochodu
- **Przyspieszenie** - Przyspieszenie samochodu
- **Spalanie_mpg** - Spalanie paliwa

## Analiza danych - `Cars.sta`

### Analiza skupień uogólnioną metodą k-średnich

W metodzie k-średnich próbuje się podzielić zbiór danych na "k" grup, gdzie każda grupa jest reprezentowana przez
środek (centroid). Algorytm iteracyjnie przypisuje każdą obserwację do najbliższego środka (centroidu) i następnie
przelicza nowe położenie centroidów na podstawie przypisanych obserwacji, aż do momentu, gdy przypisania nie zmieniają
się lub zostaje osiągnięta maksymalna liczba iteracji.

Po wykonaniu w programie **Statistica** analizy skupień metodą k-średnich otrzymaliśmy następujące wyniki:

![1.png](img%2F1.png)
<center>Wykres 1. Wykres średnich zmiennych ilościowych</center>

Na wykresie możemy zauważyć, że dane zostały podzielone na 4 skupienia.

Dołączmy do tego tabelę wynikową, aby zobaczyć jakie marki samochodów zostały przypisane do poszczególnych skupień:

![2.png](img%2F2.png)
<center>Tabela 1. Tabela z wynikiem klasyfikacji poszczególnych marek samochodów</center>

Analizując tabelę oraz wykres możemy zauważyć, że najwięcej samochodów zostało zaklasyfikowanych do **Skupienia 1**
a najmniej do **Skupienia 2** i **Skupienia 4**. Warto zauważyć, że samochody przydzielone do **Skupienia 1**
charakteryzują się najniższą ceną, średnim przyspieszeniem ale sporym zużyciem. Nie możemy jednoznacznie stwierdzić
jakie cechy charakteryzują samochody ze **Skupienia 2** i **Skupienia 4**, ponieważ jest ich zbyt mało, a dokładniej
tylko 1 z każdego skupienia. Również całkowita liczba przypadków uczących nie jest duża bo wynosi 22. Jeśli chodzi o
samochody ze **Skupienia 3** to charakteryzują się one największą ceną.

### Metoda aglomeracji

Metoda aglomeracyjna zaczyna od traktowania każdej obserwacji jako osobnego punktu danych, a następnie iteracyjnie łączy
najbardziej podobne punkty, aż do momentu, gdy wszystkie obserwacje są połączone w jeden obszar lub spełniony zostaje
określony warunek zakończenia. Aglomeracja jest bardziej elastyczna i może być stosowana w przypadku różnych kształtów i
wielkości obszarów. Jest to szczególnie przydatne, gdy struktura obszarów nie jest dobrze określona lub gdy obszary mają
skomplikowane kształty.

W metodzie aglomeracji wybraliśmy wszystkie dane, pogrupowaliśmy przypadki oraz użyliśmy metodę Warda i miarę
odległości - euklidesową. Otrzymaliśmy następujące wyniki:

![3.png](img%2F3.png)
<center>Wykres 2. Diagram drzewa</center>

Na powyższym diagramie możemy zaobserwować, że dane zostały pogrupowane jako po 2 przypadki, następnie klastrując coraz
wyżej aż do momentu, gdy wszystkie przypadki zostały połączone w jeden obszar.

### Porównanie metod

Porównując obie metody możemy zauważyć, że metoda k-średnich podzieliła dane na 4 skupienia, natomiast metoda
aglomeracji łączyła podobne przypadki aż do momentu, gdy wszystkie przypadki zostały połączone w jeden obszar. Możemy
zauważyć, że metoda k-średnich jest bardziej przydatna w przypadku, gdy chcemy podzielić dane na określoną liczbę
skupień, natomiast metoda aglomeracji jest bardziej przydatna w przypadku, gdy chcemy pogrupować podobne przypadki.

## Analiza danych - `Auta_all`

### Analiza skupień uogólnioną metodą k-średnich

Po wykonaniu w programie **Statistica** analizy skupień metodą k-średnich oraz metodą aglomeracji otrzymaliśmy:

![4.png](img%2F4.png)
<center>Wykres 3. Wykres średnich zmiennych ilościowych</center>

![5.png](img%2F5.png)
<center>Tabela 2. Tabela z wynikiem klasyfikacji poszczególnych marek samochodów</center>

Z powyższego wykresu i tabeli, możemy zauważyć, że początkowo znaczna liczba samochodów została zaklasyfikowana do
**Skupienia 4**, które charakteryzują się średnią pojemnością silnika i średnią wagą.

![6.png](img%2F6.png)
<center>Wykres 4. Diagram drzewa</center>