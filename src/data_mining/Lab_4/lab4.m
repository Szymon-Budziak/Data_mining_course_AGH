% Wczytanie danych
data = readtable('Szeregi/Ukraine Explorer Inputs Prod - RefugeesSeries.csv');

% Dane wejciowe
dates = data.RefugeesDate;
refugees = data.NoRefugees;

% 1. Oblicz przyrosty bezwzględne, względne i logarytmiczne.
absolute_changes = diff(refugees);
relative_changes = diff(refugees) ./ refugees(1:end-1);
log_changes = diff(log(refugees));

% Oblicz średnią i odchylenie standardowe
mean_absolute_change = mean(absolute_changes);
std_absolute_change = std(absolute_changes);
disp(['Średnia dla przyrostu bezwzględnego: ' num2str(mean_absolute_change)]);
disp(['Odchylenie standardowe dla przyrostu bezwzględnego: ' num2str(std_absolute_change)]);

mean_relative_change = mean(relative_changes);
std_relative_change = std(relative_changes);
disp(['Średnia dla przyrostu względnego: ' num2str(mean_relative_change)]);
disp(['Odchylenie standardowe dla przyrostu względnego: ' num2str(std_relative_change)]);

mean_log_change = mean(log_changes);
std_log_change = std(log_changes);
disp(['Średnia dla przyrostu logarytmicznego: ' num2str(mean_log_change)]);
disp(['Odchylenie standardowe dla przyrostu logarytmicznego: ' num2str(std_log_change)]);

% Wykres
figure;
subplot(3,1,1);
plot(dates(2:end), absolute_changes);
title('Przyrosty bezwzględne');

subplot(3,1,2);
plot(dates(2:end), relative_changes);
title('Przyrosty względne');

subplot(3,1,3);
plot(dates(2:end), log_changes);
title('Przyrosty logarytmiczne');

% 2. Dokonaj aproksymacji trendu liniowego.
dates_numeric = datenum(dates);
p = polyfit(dates_numeric, refugees, 1);
trend = polyval(p, dates_numeric);

% Oblicz błąd aproksymacji
residuals = refugees - trend;
fit_error = norm(residuals);

% Wykres
figure;
subplot(2,1,1);
plot(dates, refugees, 'b', dates, trend, 'r');
title('Aproksymacja trendu liniowego');
legend('Dane', 'Trend');

subplot(2,1,2);
plot(dates, residuals);
title('Reszty aproksymacji');

% 3. Wygładź dane z wykorzystaniem metody średniej ruchomej
k1 = 10; % Stała wygładzania
k2 = 20; % Stała wygładzania
smoothed_data_k1 = movmean(refugees, k1);
smoothed_data_k2 = movmean(refugees, k2);

% Wykres
figure;
plot(dates, refugees, 'b', dates, smoothed_data_k1, 'r', dates, smoothed_data_k2, 'g');
title('Wygładzone dane');
legend('Dane', 'k=10', 'k=20');

% 4. Dokonaj aproksymacji danych z wykorzystaniem wielomianu stopnia 4
p4 = polyfit(dates_numeric, refugees, 4);
poly_trend = polyval(p4, dates_numeric);

% Wykres
figure;
plot(dates, refugees, 'b', dates, poly_trend, 'r');
title('Aproksymacja wielomianem stopnia 4');
legend('Dane', 'Wielomian stopnia 4');

% 5. Porównaj i opisz skuteczność metod w p.3 oraz p. 4
% Metoda średniej ruchomej k=10
fit_error_k1 = mean(refugees - smoothed_data_k1);
% Metoda średniej ruchomej k=20
fit_error_k2 = mean(refugees - smoothed_data_k2);
% Aproksymacja wielomianem stopnia 4
fit_error_poly = mean(refugees - poly_trend);

disp(['Błąd aproksymacji metody średniej ruchomej k=10: ' num2str(fit_error_k1)]);
disp(['Błąd aproksymacji metody średniej ruchomej k=20: ' num2str(fit_error_k2)]);
disp(['Błąd aproksymacji wielomianem stopnia 4: ' num2str(fit_error_poly)]);
disp(['Wniosek: Najmniejszy bład aproksymacji ma metoda sredniej ruchomej k=20,' ...
    ' nastepnie metoda sredniej ruchomej k=10, a najwiekszy blad ma aproksymacja wielomianem stopnia 4.']);