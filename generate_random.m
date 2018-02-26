
% Function which generates random data for Tesla Stocks
function random_data = generate_random(start_datetime, end_datetime)

    %Data structore to store random data
    random_data = [];

    % Generating date interval in hours
    date_interval = datenum({start_datetime, end_datetime});
    random_data.date = date_interval(1):1/24:date_interval(2);
    
    % Generates random data between 5 and 7, high and low values 
    number_of_dates = size(random_data.date, 2);
    massive = 5 + (2)*rand(number_of_dates,2);
    difference = massive(:, 1) - massive(:, 2);
    
    % Genrates random open close values in between randomly generated
    % values of high and close
    open = massive(:, 2) + rand(number_of_dates, 1) .* difference;
    close = massive(:, 2) + rand(number_of_dates, 1) .* difference;
    [maxvals, ~] = sort(massive, 2, 'descend');
    random_data.high = maxvals(:, 1);
    random_data.low = maxvals(:, 2);
    random_data.open = open;
    random_data.close = close;

    % Return randomly generated values
    random_data.date;

end

