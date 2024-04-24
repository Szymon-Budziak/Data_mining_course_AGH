# Analiza ryzyka kredytowego

## Wstęp

Plik z danymi, który analizujemy zawiera następujące informacje:

- **Credit_rating** - Zdolność kredytowa: Bad, Good
- **Age** - Wiek w latach
- **Income** - Poziom dochodu Low, Medium, High
- **Credit_cards** - Liczba posiadanych kart kredytowych: Less than five, Five or more
- **Education** - Poziom wykształcenia: High school, College
- **Car_loans** - Liczba zaciągniętych kredytów samochodowych: None or one, More than two

## Analiza danych

### Histogramy

Po analizie danych wejściowych przy pomocy histograma dla zmiennych kategorycznych otrzymaliśmy następujące wykresy:

![1.png](img%2F1.png)
<center>Wykres 1. Wykres wygenerowany dla zmiennych kategorycznych</center>


Przyjrzyjmy się bliżej poszczególnym wykresom:

![2.png](img%2F2.png)
<center>Wykres 2. Wykres zmiennej Car_loans</center>

Dla zmiennej **Car_loans** możemy zaobserwować, że większość klientów posiada _2 lub więcej_ zaciągniętych kredytów
samochodowych.
Średnia dla tej zmiennej kategorycznej to 1.63.

![3.png](img%2F3.png)
<center>Wykres 3. Wykres zmiennej Age</center>

Dla zmiennej **Age** możemy zaobserwować, że wiek klientów jest zróżnicowany. Średnia wieku klientów to prawie 34 lata.
Jednak widzimy tendencję, że najwięcej klientów zaciągających kredyt, to ludzie młodzi między 20 a 40 rokiem życia.
Wraz z wiekiem liczba klientów zaciągających kredyt maleje, co jest zrozumiałe, ponieważ osoby starsze mają już
zazwyczaj zaciągnięte kredyty, a najczęściej są one już spłacone.

![4.png](img%2F4.png)
<center>Wykres 4. Wykres zmiennej Income</center>

Zmienna **Income** informuje nas o poziomie dochodu klientów. Większość klientów ma dochód na poziomie _średnim_,
następnie _wysokim_ i na końcu _niskim_. Średnia dla tej zmiennej kategorycznej to 2.01, czyli właśnie _średni_ poziom
dochodu.
Z naszych danych możemy odczytać, że ludzi ze średnim dochodem jest około 1150, z wysokim prawie 800, a z niskim około

500.

![5.png](img%2F5.png)
<center>Wykres 5. Wykres zmiennej Credit_cards</center>

Zmienna **Credit_cards** informuje nas o liczbie posiadanych kart kredytowych. Większość klientów posiada _5 lub więcej_
kart kredytowych.
Liczba ta jest 2 razy większa niż liczba klientów posiadających _mniej niż 5_ kart kredytowych. Z histogramu wynika, że
liczba osób posiadających _5 lub więcej_ kart kredytowych to około 1650, a _mniej niż 5_ kart kredytowych to około 800.

![6.png](img%2F6.png)
<center>Wykres 6. Wykres zmiennej Education</center>

W przypadku zmiennej **Education** możemy zaobserwować, najbardziej równe rozłożenie klientów pomiędzy 2 grupy, czyli
High school
i College. W naszych danych mamy około 1250 klientów z High school i około 1250 klientów z College. Średnia dla tej
zmiennej
kategorycznej to 1.5, co oznacza równy rozkład klientów pomiędzy te 2 grupy.

![7.png](img%2F7.png)
<center>Wykres 7. Wykres zmiennej Credit_rating</center>

Ostatnią zmienną, którą analizujemy jest **Credit_rating**. Zmienna ta informuje nas o zdolności kredytowej klientów.
Większość klientów
ma _dobrą_ zdolność kredytową. Liczba klientów z dobrą zdolnością kredytową to około 1450, a z _złą_ około 1000. Średnia
dla tej zmiennej
kategorycznej to 0.59, co oznacza, że większość klientów ma właśnie dobrą zdolność kredytową, bo wartość ta jest bliżej
1 niż 0.

### Zmienne przewidywalne i zależne

Następnie przyszedł czas na wybranie danych przewidywalnych i zależnych. W naszym przypadku zmienną zależną jest *
*Credit_rating**,
a zmiennymi przewidywalnymi są: **Age**, **Income**, **Credit_cards**, **Education** i **Car_loans**.

### Ogólny CHAID dla klasyfikacji

Po wybraniu zmiennych przewidywalnych i zależnych przyszedł czas na zastosowanie algorytmu CHAID. W naszym przypadku
otrzymaliśmy drzewo decyzyjne, które przedstawia się następująco:

![8.png](img%2F8.png)
<center>Wykres 8. Drzewo decyzyjne dla klasyfikacji</center>

Możemy sprawdzić, że najważniejsze zmienne dla zmiennej predykcyjnej to kolejno **Credit_cards**, **Income** i **Age**.
Wiemy to, ponieważ są to zmienne, które znajdują się na początku drzewa decyzyjnego, czyli mają największy wpływ na
zdolność kredytową klientów.
Liczba węzłów dzielonych w tym drzewie to 9 a liczba węzłów końcowych to 17.

### Wykres ważności

Jeszcze lepiej, ważność poszczególnych zmiennych możemy zobaczyć na wykresie ważności:

![9.png](img%2F9.png)
<center>Wykres 9. Wykres ważności zmiennych</center>

Z wykresu możemy jednak zaobserwować, że kolejność ważności zmiennych jest to: **Income**, **Credit_cards**, **Age**, *
*Car_loans** i **Education**.
Wartości te są prawie zgodne z drzewem decyzyjnym, które otrzymaliśmy wcześniej, jedyna różnica jest taka, że nasze
drzewo
decyzyjne, które otrzymaliśmy wcześniej, ma na pierwszym miejscu **Credit_cards**, a na drugim **Income**. Oznacza, to
że zdecydowała,
że ta zmienna da mu największy zysk informacyjny, inaczej **Information Gain**.

Analizując wykres ważności zmiennych, możemy zauważyć, że **Income** ma największy wpływ na zdolność kredytową klientów,
co jest zrozumiałe,
ponieważ im wyższy dochód, tym większa zdolność kredytowa. Następnie **Credit_cards**, co również jest zrozumiałe, bo im
więcej kart kredytowych
posiada klient, tym większa zdolność kredytowa. Na końcu, z najmniejszą ważnością mamy **Education**. Jest to
zrozumiałe, ponieważ zdolność kredytowa
nie zależy od poziomu wykształcenia, a bardziej od dochodu i liczby kart kredytowych. Ludzie z niższym wykształceniem
mogą zarabiać więcej niż ludzie
z wyższym wykształceniem, a co za tym idzie, mogą mieć większą zdolność kredytową.

### Usunięcie Education z analizy

Po usunięciu Education z analizy, otrzymaliśmy nowe drzewo decyzyjne, które przedstawia się następująco:

![10.png](img%2F10.png)
<center>Wykres 10. Drzewo decyzyjne dla klasyfikacji po usunięciu Education</center>

Możemy zauważyć, że drzewo decyzyjne po usunięciu zmiennej **Education** nie zmieniło się drastycznie.
Wciąż najważniejsze zmienne to **Credit_cards**, która jako pierwsza dzieli drzewo. Następnie **Income** i **Age**.
Liczba węzłów dzielonych w tym drzewie spadła z 9 do 7, a liczba węzłów końcowych spadła z 17 do 13.

Przeanalizujmy jeszcze wykres ważności zmiennych po usunięciu zmiennej **Education**:

![11.png](img%2F11.png)
<center>Wykres 11. Wykres ważności zmiennych po usunięciu Education</center>

Na wykresie ważności zmiennych po usunięciu zmiennej **Education** widzimy, że **Income** nadal ma największy wpływ na
zdolność kredytową klientów.
Następnie **Credit_cards** i **Age**. **Car_loans**, z racji usunięcia **Education** ma najmniejszy wpływ na zdolność
kredytową klientów.

### Podsumowanie

Podsumowując, analiza ryzyka kredytowego pozwala nam na określenie zdolności kredytowej klientów na podstawie kilku
zmiennych.
Z naszych danych i z analizy wynika, że najważniejsze zmienne dla zdolności kredytowej klientów to **Income**, *
*Credit_cards** i **Age**.
Zmienna **Education** nie ma dużego wpływu na zdolność kredytową klientów, dlatego po usunięciu jej z analizy, drzewo
decyzyjne
nie zmieniło się drastycznie. Warto zauważyć, że **Income** ma największy wpływ na zdolność kredytową klientów, co jest
zrozumiałe,
ponieważ im wyższy dochód, tym większa zdolność kredytowa. Następnie **Credit_cards**, co również jest zrozumiałe, bo im
więcej kart kredytowych
posiada klient, tym większa zdolność kredytowa.