
function biggest_gap(gap_number)

disp('Didziausiu pertrauku duomenyse buvo (HH:MM:SS): ');

%reading data from file
fid = fopen('tick_bar_tesla.csv');
b = textscan(fid,'%s %s %f %f %f %f %f %f','Delimiter',',','HeaderLines',1);
fclose(fid); % closing resource file

% saving data to structure
ttsla_data.datetime = strcat(b{1}, {' '}, b{2});
ttsla_data.date = datenum(b{1},'mm/dd/yyyy')';  % converting data to number
ttsla_data.laikas = datetime(ttsla_data.datetime,'InputFormat','MM/dd/yyyy HH:mm:ss');
%descending_time = sort(difference_time, 1, 'descend');

% selects 10 longest intervals
difference_time = diff(ttsla_data.laikas);
[sortedValues,sortIndex] = sort(difference_time(:),'descend'); %#ok<ASGLU>
maxIndex = sortIndex(1:gap_number);

fprintf('\n Kada Vyko \n');
disp(ttsla_data.laikas(maxIndex));
fprintf('\n Kiek laiko truko: \n');
disp(difference_time(maxIndex));

end