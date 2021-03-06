
% Function which finds biggest break between datetime
function biggest_gap(gap_number, file_name)
    disp('Didziausiu pertrauku duomenyse buvo (HH:MM:SS): ');
    
    % Reading data from file
    ttsla_data = read_file(file_name, 'MM/dd/yyyy HH:mm:ss');

    % selects 10 longest intervals
    difference_time = diff(ttsla_data.laikas);
    [sortedValues,sortIndex] = sort(difference_time(:),'descend'); %#ok<ASGLU>
    maxIndex = sortIndex(1:gap_number);

    % Printing the result
    fprintf('\n Kada Vyko \n');
    disp(ttsla_data.laikas(maxIndex));
    fprintf('\n Kiek laiko truko: \n');
    disp(difference_time(maxIndex));
end