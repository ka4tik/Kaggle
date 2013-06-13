num_pixels = 28;
input_layer_size  = num_pixels * num_pixels;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
printf('Loading and Visualizing Data ...\n');
%fflush();

fid = fopen('train.csv', 'r');
header = fgetl(fid);
y = zeros(1,1);
X = zeros(1,num_pixels * num_pixels);
counter = 0;
while (!feof(fid))
    eachLine = fgetl(fid);
    [label, imagedata] = parseLine(eachLine, num_pixels);
    if (counter == 0)
        y = label;        
        X = imagedata;
    else    
        y = [y; label];
        X = [X; imagedata];
    endif
    counter++;
endwhile
fclose(fid);
