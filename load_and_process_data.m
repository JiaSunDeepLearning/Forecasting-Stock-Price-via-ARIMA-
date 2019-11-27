function data = load_and_process_data(path_and_file_name)
% load and process data
% input : path_and_file_name
% return : data in matrix, blank elemant(xxxxx) will be set to -1
disp(['Loading ' path_and_file_name]);
fileID = fopen(path_and_file_name);

data_temp = textscan(fileID,'%s%s%s%s%s','delimiter', '\t','headerlines',1);
fclose(fileID);

data_temp_x = data_temp{1,1};
len = max(size(data_temp_x));
    
data = 0 - ones(len,5);

for i = 1:5
    data_temp_x = data_temp{1,i};
    len = max(size(data_temp_x));
    
    for ii = 1:len
        data_x_i = data_temp_x{ii,1};
        try
            if data_x_i == "xxxxx"
                % disp(['xxxxx  ' num2str(ii)])
            else
                data_x_i = string(data_x_i);
                data_x_i = str2double(data_x_i);
                data(ii,i)=data_x_i;
            end
        catch
            disp(['number starts from: ' num2str(ii+1)])
            break;
        end
        
    end

end
return;
end
