function data = smaartTxtRead(fullFileName)
    % Get a file Id To open a file
    fid = fopen(fullFileName, 'r');
    if fid < 0
        error('Could not open %s for input', fullFileName);
    end

    % Read file into buffer
    buf = fread(fid, '*char')';
    fclose(fid);
    % Separate buffer in lines
    lines = textscan(buf, '%s', 'delimiter', newline, 'multipleDelimsAsOne', 1);
    lines = lines{:};
    
    % Get name
    name = string(erase(lines{1}, char(9)));
    
    % Drop line 1 (name) and line 2 (header of table)
    lines([1,2]) = [];
    
    % Convert numeric data to numeric matrix
    lines = cellfun(@str2num, lines, 'UniformOutput', false);
    lines = cell2mat(lines);
    
    % Create struct to hold data
    data = struct;
    
    % fill struct with relevant data
    data.name = name;
    data.freq = lines(:,1);
    data.mags = lines(:,2);
    data.angs = lines(:,3);
    data.cohe = lines(:,4);
end