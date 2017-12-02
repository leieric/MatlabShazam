function songName = main(testOption, clipName)
    gs = 9;
    deltaTL = 3;
    deltaTU = 6;
    deltaF = 9;
    load('hashTable.mat', 'hashTable');
    load('songNameTable.mat', 'songNameTable');
    songName = matching(testOption, clipName, hashTable, songNameTable, gs, deltaTL, deltaTU, deltaF);
end

