function songNameTable = make_database(gs, deltaTL, deltaTU, deltaF)
    Files = what('songDatabase');
    matFiles = Files.mat;
    filename = matFiles{1};
    toRead = ['songDatabase/', filename];
    songNameTable = []; % 5 column table, applied make_table to all songs
    
    for i = 1:length(matFiles)
        filename = matFiles{i};
        toRead = ['songDatabase/', filename];
        tempMatrix = make_table(toRead, gs, deltaTL, deltaTU, deltaF);
        tempMatrix = [tempMatrix i*ones(length(tempMatrix), 1)];
        songNameTable = [songNameTable; tempMatrix];
    end
    size(songNameTable)
end