function mtsla_data = tick_data_conversion(file_location, interval)
    
    % Initialazing data structure and reading from file
    mtsla_data = [];
    ttsla_data = read_file(file_location, 'MM/dd/yyyy HH:mm:ss');
   
    % Splitting time into hours, minutes
    time_split = regexp(ttsla_data.time, ':', 'split');
    time_vert = vertcat(time_split{:});
    hours = time_vert(:, 1);
    minutes = time_vert(:, 2);

    % Check if it's minute conversion or hour
    if strcmp(interval, 'minute')
        func = @(date, hour, minute, open, close, high, low) {date{1}, hour{1}, minute{1}, open(1), close(end), max(high), min(low)};
        [index_group,~] = findgroups(ttsla_data.datesimple, hours, minutes);
        minute_data = splitapply(func, ttsla_data.datesimple, hours, minutes, ttsla_data.open, ttsla_data.close, ttsla_data.high, ttsla_data.low, index_group);
        
        % Showing only hours and minutes differences, seconds aren't important
        date_time = strcat(minute_data(:, 1), {' '}, minute_data(:, 2), {':'}, minute_data(:, 3), {':00'});
        
        % Filling data struct and returning
        mtsla_data.datetime = datetime(date_time, 'InputFormat', 'MM/dd/yyyy HH:mm:ss');
        mtsla_data.open = cell2mat(minute_data(:, 4));
        mtsla_data.close = cell2mat(minute_data(:, 5));
        mtsla_data.high = cell2mat(minute_data(:, 6));
        mtsla_data.low = cell2mat(minute_data(:, 7));
        
    elseif strcmp(interval, 'hour')
        func = @(date, hour, open, close, high, low) {date{1}, hour{1}, open(1), close(end), max(high), min(low)};
        [index_group,~] = findgroups(ttsla_data.datesimple, hours);
        hour_data = splitapply(func, ttsla_data.datesimple, hours, ttsla_data.open, ttsla_data.close, ttsla_data.high, ttsla_data.low, index_group);
        % Only showing hour difference, minutes and seconds aren't important
        date_time = strcat(hour_data(:, 1), {' '}, hour_data(:, 2), {':00:00'});
        
        % Filling data structure and returning
        mtsla_data.datetime = datetime(date_time, 'InputFormat', 'MM/dd/yyyy HH:mm:ss');
        mtsla_data.open = cell2mat(hour_data(:, 3));
        mtsla_data.close = cell2mat(hour_data(:, 4));
        mtsla_data.high = cell2mat(hour_data(:, 5));
        mtsla_data.low = cell2mat(hour_data(:, 6));
        
    else
        return
    end

end