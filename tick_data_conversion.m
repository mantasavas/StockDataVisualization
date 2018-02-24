function mtsla_data = tick_data_conversion(file_location, interval)
    
    % Initialazing data structure and reading from file
    mtsla_data = [];
    ttsla_data = read_file(file_location, 'MM/dd/yyyy HH:mm:ss');
   
    % Splitting time into hours minutes
    time_split = regexp(ttsla_data.time, ':', 'split');
    D = vertcat(time_split{:});
    hours = D(:, 1);
    minutes = D(:, 2);

    % Check if it's minute conversion or hour
    if strcmp(interval, 'minute')
        func = @(date, hour, minute, open, close, high, low) {date{1}, hour{1}, minute{1}, open(1), close(end), max(high), min(low)};
        [G,~] = findgroups(ttsla_data.datesimple, D(:, 1), D(:, 2));
        varBP = splitapply(func, ttsla_data.datesimple, hours, minutes, ttsla_data.open, ttsla_data.close, ttsla_data.high, ttsla_data.low, G);
        
        % Showing only hours and minutes differences, second aren't important
        date_time = strcat(varBP(:, 1), {' '}, varBP(:, 2), {':'}, varBP(:, 3), {':00'});
        
        % Filling data struct and returning
        mtsla_data.datetime = datetime(date_time, 'InputFormat', 'MM/dd/yyyy HH:mm:ss');
        mtsla_data.open = cell2mat(varBP(:, 4));
        mtsla_data.close = cell2mat(varBP(:, 5));
        mtsla_data.high = cell2mat(varBP(:, 6));
        mtsla_data.low = cell2mat(varBP(:, 7));
        
    elseif strcmp(interval, 'hour')
        func = @(date, hour, open, close, high, low) {date{1}, hour{1}, open(1), close(end), max(high), min(low)};
        [G,~] = findgroups(ttsla_data.datesimple, D(:, 1));
        varBP = splitapply(func, ttsla_data.datesimple, hours, ttsla_data.open, ttsla_data.close, ttsla_data.high, ttsla_data.low, G);
        % Only showing hour difference, minutes and seconds aren't important
        date_time = strcat(varBP(:, 1), {' '}, varBP(:, 2), {':00:00'});
        
        % Filling data structure and returning
        mtsla_data.datetime = datetime(date_time, 'InputFormat', 'MM/dd/yyyy HH:mm:ss');
        mtsla_data.open = cell2mat(varBP(:, 3));
        mtsla_data.close = cell2mat(varBP(:, 4));
        mtsla_data.high = cell2mat(varBP(:, 5));
        mtsla_data.low = cell2mat(varBP(:, 6));
        
    else
        return
    end

end