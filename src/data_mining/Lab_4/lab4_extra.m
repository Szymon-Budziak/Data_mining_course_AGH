% Wczytanie danych
data = readtable('Szeregi/Ukraine Explorer Inputs Prod - RefugeesSeries.csv');

% Dane wejciowe
dates = data.RefugeesDate;
refugees = data.NoRefugees;

% 1. Generowanie pseudolosowych danych z rozkładu normalnego
random_data = randn(size(refugees));

% 2. Obliczenie korelacji szeregów
correlation = corr(refugees, random_data);
disp(['Korelacja szeregow wynosi: ', num2str(correlation)])

% 3. Obliczenie podobieństwa szeregów z wykorzystaniem metryki Euklidesowej oraz Minkowskiego
euclidean_distance = norm(refugees - random_data);
minkowski_distance = norm(refugees - random_data, 3); % Minkowski z p = 3
disp(['Podobieństwo szeregów (metryka Euklidesowa): ', num2str(euclidean_distance)])
disp(['Podobieństwo szeregów (metryka Minkowskiego): ', num2str(minkowski_distance)]);

% 4. Znajdowanie wzorców
% a) Pojawienia się w szeregu co najmniej 3 kolejnych skokowych wartości, których amplituda jest
% większa niż 1.5 krotność bieżącej średniej szeregu (liczonej w oknie o długości 22 próbek).
function pattern_indices = find_jump_patterns(data)
    window_size = 22;
    mean_series = movmean(data, window_size);
    amplitude_threshold = 1.5 * mean_series;

    jump_pattern = data(2:end) - data(1:end-1);
    jump_indices = find(abs(jump_pattern) > amplitude_threshold(1:end-1));

    pattern_indices = [];
    for i = 1:length(jump_indices)-2
        if jump_indices(i+1) == jump_indices(i) + 1 && jump_indices(i+2) == jump_indices(i) + 2
            pattern_indices = [pattern_indices, jump_indices(i), jump_indices(i+1), jump_indices(i+2)];
        end
    end
end

ref_pattern_indices = find_jump_patterns(refugees);
rand_pattern_indices = find_jump_patterns(random_data);
disp(['Indeksy dla wzorca dla danych .csv a): ', num2str(ref_pattern_indices)]);
disp(['Indeksy dla wzorca dla danych losowych a): ', num2str(rand_pattern_indices )]);

% b) Pojawienia się w szeregu sekwencji (wzorca) o długości 4 próbek, charakteryzującej się dla
% każdej kolejnej próbki zmianą wartości znaku skokowej zmiany (+/+/–/– lub /+/–/+/–).
function sign_change_pattern_indices = find_sign_patterns(data)
    window_size = 22;
    mean_series = movmean(data, window_size);
    amplitude_threshold = 1.5 * mean_series;

    jump_pattern = data(2:end) - data(1:end-1);
    jump_indices = find(abs(jump_pattern) > amplitude_threshold(1:end-1));

    sign_change_pattern_indices = [];
    for i = 1:length(jump_indices)-3
        if sign(jump_pattern(i)) ~= sign(jump_pattern(i+1)) && sign(jump_pattern(i+1)) == sign(jump_pattern(i+2)) && sign(jump_pattern(i+2)) ~= sign(jump_pattern(i+3))
            sign_change_pattern_indices = [sign_change_pattern_indices, jump_indices(i), jump_indices(i+1), jump_indices(i+2), jump_indices(i+3)];
        end
    end
end

ref_pattern_indices = find_sign_patterns(refugees);
rand_pattern_indices = find_sign_patterns(random_data);
disp(['Indeksy dla wzorca dla danych .csv a): ', num2str(ref_pattern_indices)]);
disp(['Indeksy dla wzorca dla danych losowych a): ', num2str(rand_pattern_indices )]);