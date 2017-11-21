songs = [];
tic
for i=1:50
    clipname = 'songDatabase/';
    if i < 10
        n = strcat(num2str(0), num2str(i));
    else
        n = num2str(i);
    end
    clipname = strcat(clipname, n, '.mat');
    songs = [songs; main(1, clipname)];
end
time = toc;
