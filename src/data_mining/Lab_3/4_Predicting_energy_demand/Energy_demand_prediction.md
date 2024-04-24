# Przewidywanie zapotrzebowania na energię

## Wstęp

W naszej analizie korzystać będziemy z 2 zbiorów danych. Pierwszy, który analizujemy o nazwie `prognoza.sta`,
zawiera następujące kolumny:

- **Nr** - Unikalny numer rekordu
- **Miesiąc** - Miesiąc
- **DzMies** - Dzień miesiąca
- **Godzina** - Godzina
- **DTS** - Dzień tygodnia
- **Temperatura** - Temperatura
- **Zachmurzenie** - Zachmurzenie
- **Z** - Przewidywane zapotrzebowanie na energię
- **Z_wczoraj** - Przewidywane zapotrzebowanie na energię z dnia poprzedniego

Drugi zbiór danych o nazwie `prognoza_ok.sta` zawiera te same dane co `prognoza.sta`, tylko niektóre wartości, które są
ouliersami zostały zmienione.

## Analiza danych

### Wygląd zbioru danych

Poniżej przedstawiony jest zbioru danych `prognoza.sta`:

![1.png](img%2F1.png)
<center>Tabela 1. Zbiór danych część 1 `prognoza.sta`</center>

![2.png](img%2F2.png)
<center>Tabela 2. Zbiór danych część 2 `prognoza.sta`</center>

### Histogramy

Po wczytaniu danych i dokonaniu przekształcenia zmiennych, sprawdzona została ogólna charakterystyka danych przy pomocy
histogramów:

![3.png](img%2F3.png)
<center>Wykres 1. Histogramy zmiennych</center>

![4.png](img%2F4.png)
<center>Wykres 2. Histogram godzina</center>

![5.png](img%2F5.png)
<center>Wykres 3. Histogram DTS</center>

![6.png](img%2F6.png)
<center>Wykres 4. Histogram Temperatura</center>

![7.png](img%2F7.png)
<center>Wykres 5. Histogram Zachmurzenie</center>

![8.png](img%2F8.png)
<center>Wykres 6. Histogram Z</center>

Z powyższych wykresów możemy zauważyć, że:

- Wykres "Godzina" wszędzie wygląda tak samo, więc jest ok
- Wykres "DTS" jest równomiernie rozłożony, więc jest ok
- Wykres "Temperatura" jest dość mocno zróżnicowany
- Wykres "Zachmurzenie", gdzie mamy problem, bo mamy B/D co jest stałą, więc trzeba będzie ją usunąć
- Wykres "Z", gdzie na pierwszy rzut oka jest ok. Jednak pierwszy słupek jest wyższy niż następny, co jest podejrzane,
  dlatego trzeba się temu przyjrzeć

### Zależność między zmienną opóźnioną a bieżącą wartością

W celu sprawdzenia zależności między zmienną opóźnioną a bieżącą wartością, stworzony został wykres rozrzutu:

![9.png](img%2F9.png)
<center>Wykres 7. Zależność między zmienną opóźnioną a bieżącą wartością</center>

Widzimy, że jednego dnia, wartości były żle zakodowane, był użyty zły separator dziesiętny co poskutkowało błędem przy
wprowadzaniu albo błędem w eksporcie/imporcie danych.

![10.png](img%2F10.png)
<center>Wykres 8. Błędne dane dla 2 listopada</center>

W tym celu ładujemy drugi zbiór danych `prognoza_ok.sta`.

### Histogramy

Po wczytaniu nowego zbioru danych, znowu sprawdzona została ogólna charakterystyka danych przy pomocy histogramów:

![11.png](img%2F11.png)
<center>Wykres 9. Histogram Godzina w nowym zbiorze danych</center>

![12.png](img%2F12.png)
<center>Wykres 10. Histogram DTS w nowym zbiorze danych</center>

![13.png](img%2F13.png)
<center>Wykres 11. Histogram Temperatura w nowym zbiorze danych</center>

![14.png](img%2F14.png)
<center>Wykres 12. Histogram Zachmurzenie w nowym zbiorze danych</center>

![15.png](img%2F15.png)
<center>Wykres 13. Histogram Z w nowym zbiorze danych</center>

### Zależność między zmienną opóźnioną a bieżącą wartością

![16.png](img%2F16.png)
<center>Wykres 14. Zależność między zmienną opóźnioną a bieżącą wartością w nowym zbiorze danych</center>

Możemy zauważyć, że na nowym wykresie rozrzutu Z względem Z_wczoraj, nie ma już obserwacji odstających. Widać, że
obserrwacje są bardziej skupione wokół prostej regresji.

### Ocena jakości danych

Po dokonaniu oceny jakości danych i otworzeniu "Raport z badania jakości danych", możemy zauważyć, że wcześniej
wspomniana kolumna **Zachmurzenie** została usunięta, ponieważ zawierała stałą wartość B/D.

![17.png](img%2F17.png)
<center>Wykres 15. Usunięta kolumna Zachmurzenie</center>

### Zbiór uczący i testowy

Dokonany został podział zbioru danych na zbiór uczący i testowy.

### Modelowanie

Do modelowania zostały wykorzystane 2 modele:

- **Wzmacnianie drzewa regresyjnego**
- **Siec neuronowe regresji**

Przy pomocy "Szybkiego wdrażania", mogliśmy sprawdzić dokładność naszych modeli. Warto dodać żę w przypadku obydwu
modeli, generacja kodu odbywała się tylko w PMML. PO odpaleniu modelu, otrzymaliśmy następujące :

![18.png](img%2F18.png)
<center>Wykres 16. Błędy modeli</center>

Kolejnym krokiem była zmiana parametrów dla modelu drzewa regresyjnego. Po zmianie parametrów, otrzymaliśmy następujące
wyniki:

![19.png](img%2F19.png)
<center>Wykres 17. Błędy modeli po zmianie parametrów</center>

### Sprawdzenie zależności między wartościami obserwowanymi a przewidywanymi

W tym celu został wygenerowany wykres rozrzutu z R kwadrat Statystyką.

### Sprawdzenie czy model oddał wzorce przebiegu szeregu

W tym celu został wygenerowany wykres liniowy z wartościami obserwowanymi i przewidywanymi.

## Podsumowanie

Po przeprowadzeniu analizy danych, stworzeniu modeli i sprawdzeniu ich jakości, możemy stwierdzić, że model sieci
neuronowej regresji jest lepszy od modelu wzmacniania drzewa regresyjnego. Warto zauważyć, że w przypadku modelu sieci
neuronowej regresji, wartość R kwadrat jest większa niż w przypadku modelu wzmacniania drzewa regresyjnego. Warto
również zauważyć, że w przypadku modelu sieci neuronowej regresji, wartość błędu średniokwadratowego jest mniejsza niż w
przypadku modelu wzmacniania drzewa regresyjnego.

