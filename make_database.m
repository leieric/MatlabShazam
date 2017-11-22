function make_database(gs, deltaTL, deltaTU, deltaF)
    Files = what('songDatabase');
    matFiles = Files.mat;
    filename = matFiles{1};
    toRead = ['songDatabase/', filename];
    songDatabase = []; % 5 column table, applied make_table to all songs
    songNameTable = [];
    for i = 1:length(matFiles)
        filename = matFiles{i};
        toRead = ['songDatabase/', filename];
        tempMatrix = make_table(toRead, gs, deltaTL, deltaTU, deltaF);
        tempMatrix = [tempMatrix i*ones(length(tempMatrix), 1)];
        songDatabase = [songDatabase; tempMatrix];
        songName = i;
        if (songName < 10)
            songName = strcat(num2str(0), num2str(songName));
        else
            songName = num2str(songName);
        end
        songName = strcat(songName, '.mat');
        songNameTable{i} = songName;
    end
    hashTable = hash(songDatabase);
    save('hashTable.mat', 'hashTable', '-mat');
    save('songNameTable.mat', 'songNameTable', '-mat');
end