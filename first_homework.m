%% reading <<day>> data from file
dtsla_data = read_file('day_tsla.csv', 'MM/dd/yyyy HH:mm');

%% plotting <<day>> data
display_candles(dtsla_data.high, dtsla_data.low, dtsla_data.close, dtsla_data.open, 'r', dtsla_data.laikas, 'TSLA Daily Tesla Inc', 0);


%% loading <<minute>> data from file
mtsla_data = read_file('one_minute_tsla.csv', 'MM/dd/yyyy HH:mm');


%% plotting <<minute>> graph
%display_candles(mtsla_data.high, mtsla_data.low, mtsla_data.close, mtsla_data.open, 'r', mtsla_data.laikas, 'TSLA Minute Tesla Inc', 0);
display_tick_data(mtsla_data);

%% reading <<tick>> data from file
%ttsla_data = read_file('100_tick_tsla.csv', 'MM/dd/yyyy HH:mm:ss');
ttsla_data = read_file('tick_bar_tesla.csv', 'MM/dd/yyyy HH:mm:ss');

%% plotting <<tick>>graph
%display_candles(ttsla_data.high, ttsla_data.low, ttsla_data.close, ttsla_data.open, 'r', ttsla_data.laikas, 'TSLA Tic 100 Candles Tesla Inc', 0);
display_candles(ttsla_data.high, ttsla_data.low, ttsla_data.close, ttsla_data.open, 'r', ttsla_data.laikas, 'TSLA 1 Tic Candles Tesla Inc', 1);


%% generating random data
random_data = generate_random('17-Feb-2018 00:00:00','17-Feb-2018 23:00:00');
display_candles(random_data.high, random_data.low, random_data.close, random_data.open, 'b', random_data.date', 'Random Data Generated', 0);


%% find biggest gap in data
% (m, n) => m - number of breaks n - file name of tesla stocks from
% metatrader
biggest_gap(10, 'tick_bar_tesla.csv');

%% calculate hour or minute bars

% more data in file tick_bar_tesla.csv
mtsla_data = tick_data_conversion('tick_bar_tesla.csv', 'minute');

mtsla_data.datetime

% If generated any hour or minute data, if true display graph
if ~isempty(mtsla_data)
    display_candles(mtsla_data.high, mtsla_data.low, mtsla_data.close, mtsla_data.open, 'r', mtsla_data.datetime, 'TSLA Minute Tesla Inc', 0);
end
