# Badanie predyktorów

## Wstęp

W badaniu predyktorów korzystamy z jednego zbioru danych o nazwie `customer_dbsave.sav`, który prezentuje się
następująco:

![1.png](img%2F1.png)
<center>Tabela 1. Zbiór danych `customer_dbsave.sav`</center>

Zbiór ten zawiera informacje o odpowiedziach na pytania ankietowe udzielonych
przez 5000 klientów firmy telefonicznej. Dane zawierają informacje o wieku klienta, zatrudnieniu,
dochodach i statystyki wykorzystania telefonu.

## Analiza danych

Analiza danych będzie polegać na analizie 3 różnych predyktorów, które są to:

- **response_01**
- **response_02**
- **response_03**

W celu analizy wszystkich trzech predyktorów wykonana została następująca architektura w programie **Statistica**:

![2.png](img%2F2.png)
<center>Rysunek 1. Architektura analizy predyktorów</center>

Architektura ta była jednakowa we wszystkich przypadkach, jedyne co zmieniało się w niej to dane w wejściowym bloku *
*Wybór zmiennych** do bloku **Dobór zmiennych** oraz wyjściowy blok **Wybór zmiennych (2)**.

### Analiza predyktora `response_01`

Po pełnym uruchomieniu otrzymano następujące raporty:

![3.png](img%2F3.png)
<center>Rysunek 2. Najlepsze predykatory dla zmiennej zależnej `response_01`</center>

![4.png](img%2F4.png)
<center>Rysunek 3. Wykres ważności zmiennej zależnej `response_01`</center>

![5.png](img%2F5.png)
<center>Rysunek 4. Drzewo dla `response_01` bez wyboru cech</center>

![6.png](img%2F6.png)
<center>Rysunek 5. Drzewo dla `response_01` z wyborem 10 cech</center>

Analizując kolejne rysunki, można zauważyć, że największą ważność ma zmienna `birthmonth`, drugą`employ` a
trzecią `address`w przypadku zmiennej `response_01`. Jeśli chodzi o drzewa decyzyjne, to w przypadku drzewa bez wyboru
cech, drzewo to posiada 23 węzły dzielone oraz 24 węzły końcowe, kiedy w przypadku drzewa z wyborem 10 cech, drzewo to
posiada 5 węzłów dzielonych oraz 6 węzłów końcowych. Widzimy, że zastosowanie wyboru cech znacząco zmniejszyło liczbę
węzłów w drzewie.

### Analiza predyktora `response_02`

Po pełnym uruchomieniu otrzymano następujące raporty:

![7.png](img%2F7.png)
<center>Rysunek 6. Najlepsze predykatory dla zmiennej zależnej `response_02`</center>

![8.png](img%2F8.png)
<center>Rysunek 7. Wykres ważności zmiennej zależnej `response_02`</center>

![9.png](img%2F9.png)
<center>Rysunek 8. Drzewo dla `response_02` bez wyboru cech</center>

![10.png](img%2F10.png)
<center>Rysunek 9. Drzewo dla `response_02` z wyborem 10 cech</center>

W przypadku zmiennej `response_02` największą ważność ma nadal zmienna `birthmonth`. Drugą największą ważność
ma `employ` a trzecią `address`. Drzewo decyzyjne dla tej zmiennej bez wyboru cech posiada 23 węzły dzielone oraz 37
węzłów końcowych, czyli więcej niż w przypadku zmiennej `response_01`. Jeśli chodzi o liczbę węzłów końcowych, to
również jest ich więcej niż w przypadku zmiennej `response_01`, bo aż 38. Jeśli chodzi o drzewo z wyborem 10 cech, to
widzimy tutaj znaczną poprawę w porównaniu do drzewa bez wyboru cech, ponieważ drzewo to posiada 5 węzłów dzielonych
oraz 17 węzłów końcowych. Jednak liczba węzłów końcowych jest dość spora, więc drzewo to nadal jest dość skomplikowane.

### Analiza predyktora `response_03`

Po pełnym uruchomieniu otrzymano następujące raporty:

![11.png](img%2F11.png)
<center>Rysunek 10. Najlepsze predykatory dla zmiennej zależnej `response_03`</center>

![12.png](img%2F12.png)
<center>Rysunek 11. Wykres ważności zmiennej zależnej `response_03`</center>

![13.png](img%2F13.png)
<center>Rysunek 12. Drzewo dla `response_03` bez wyboru cech</center>

![14.png](img%2F14.png)
<center>Rysunek 13. Drzewo dla `response_03` z wyborem 10 cech</center>

W przypadku zmiennej `response_03` największą ważność ma zmienna `birthmonth`, drugą `equipmon` a trzecią `ed`. Widzimy
tutaj zmianę w porównaniu do poprzednich zmiennych, ponieważ zmienna `birthmonth`, ponieważ na drugim oraz trzecim
miejscu zaszła zmiana. Jeśli chodzi o drzewo decyzyjne dla tej zmiennej, to drzewo bez wyboru cech posiada 19 węzłów
dzielonych oraz 20 węzłów końcowych. Drzewo z wyborem 10 cech posiada 4 węzły dzielone oraz 6 węzłów końcowych. Widzimy
tutaj znaczną poprawę w porównaniu do drzewa bez wyboru cech, ponieważ liczba węzłów w drzewie jest znacznie mniejsza.
Pozwala to na lepsze zrozumienie drzewa. Drzewo z wyborem10 cech dla tej zmiennej jest najprostszym drzewem z
pozostałych porównywanych.

## Podsumowanie

Analizując wszystkie trzy zmienne, można zauważyć, że zmienna `birthmonth` ma największą ważność w każdym przypadku.
Drzewa decyzyjne dla każdej zmiennej różnią się między sobą, jednak można zauważyć, że zastosowanie wyboru cech znacząco
zmniejsza liczbę węzłów w drzewie, co pozwala na lepsze zrozumienie drzewa. W przypadku zmiennej `response_03` drzewo z
wyborem 10 cech jest najprostszym drzewem z porównywanych. W przypadku zmiennej `response_02` drzewo z wyborem 10 cech
jest dość skomplikowane, ponieważ posiada dużo węzłów końcowych.