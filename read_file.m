

% Function which reads stock data from file
function tsla_data = read_file(file_name, date_format)

% reading data from file and closing resources
fid = fopen(file_name);
b = textscan(fid,'%s %s %f %f %f %f %f %f','Delimiter',',','HeaderLines',1);
fclose(fid); % closing resource file

% saving data to structure
tsla_data = [];
tsla_data.datetime = strcat(b{1}, {' '}, b{2});
tsla_data.laikas = datetime(tsla_data.datetime,'InputFormat', date_format);
tsla_data.date = datenum(b{1},'mm/dd/yyyy')';  % converting data to number
tsla_data.datesimple = b{1};
tsla_data.time = b{2};
tsla_data.open = b{3};
tsla_data.high = b{4};
tsla_data.low = b{5};
tsla_data.close = b{6};
tsla_data.volume = b{7};
tsla_data.oi = b{8};

end