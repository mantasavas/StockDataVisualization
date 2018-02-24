%% reading <<day>> data from file
dtsla_data = read_file('day_tsla.csv', 'MM/dd/yyyy HH:mm');

%% plotting <<day>> data
display_candles(dtsla_data.high, dtsla_data.low, dtsla_data.close, dtsla_data.open, 'r', dtsla_data.laikas, 'TSLA Daily Tesla Inc');


%% loading <<minute>> data from file
mtsla_data = read_file('one_minute_tsla.csv', 'MM/dd/yyyy HH:mm');


%% plotting <<minute>> graph
display_candles(mtsla_data.high, mtsla_data.low, mtsla_data.close, mtsla_data.open, 'r', mtsla_data.laikas, 'TSLA Minute Tesla Inc');


%% reading <<tick>> data from file
ttsla_data = read_file('tick_bar_tesla.csv', 'MM/dd/yyyy HH:mm:ss');

findgroups(ttsla_data.date);

%% plotting <<tick>> graph

display_candles(ttsla_data.high, ttsla_data.low, ttsla_data.close, ttsla_data.open, 'r', ttsla_data.laikas, 'TSLA Tic 100 Candles Tesla Inc');


%% generating random data

random_data = generate_random('17-Feb-2018 00:00:00','17-Feb-2018 23:00:00');

display_candles(random_data.high, random_data.low, random_data.close, random_data.open, 'b', random_data.date', 'Random Data Generated');


%% find biggest gap in data
biggest_gap(10);


%% calculate hour or minute bars

%meanBMIfcn = @(p)max(p);
%BMI = splitapply(meanBMIfcn, p, G)

mtsla_data = [];
ttsla_data = read_file('tick_bar_tesla.csv', 'MM/dd/yyyy HH:mm:ss');

ttsla_data.time;
time_split = regexp(ttsla_data.time, ':', 'split');
D = vertcat(time_split{:});

hours = D(:, 1);
minutes = D(:, 2);




func = @(date, hour, minute, open, close, high, low) {date{1}, hour{1}, minute{1}, open(1), close(end), max(high), min(low)};
[G,smokers] = findgroups(ttsla_data.datesimple, D(:, 1), D(:, 2));
varBP = splitapply(func, ttsla_data.datesimple, hours, minutes, ttsla_data.open, ttsla_data.close, ttsla_data.high, ttsla_data.low, G);


date_time = strcat(varBP(:, 1), {' '}, varBP(:, 2), {':'}, varBP(:, 3), {':00'})
mtsla_data.datetime = datetime(date_time, 'InputFormat', 'MM/dd/yyyy HH:mm:ss');

mtsla_data.open = cell2mat(varBP(:, 4));
mtsla_data.close = cell2mat(varBP(:, 5));
mtsla_data.high = cell2mat(varBP(:, 6));
mtsla_data.low = cell2mat(varBP(:, 7));

display_candles(mtsla_data.high, mtsla_data.low, mtsla_data.close, mtsla_data.open, 'r', mtsla_data.datetime, 'TSLA Minute Tesla Inc');


