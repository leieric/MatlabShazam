function songName = main(testOption, clipName, hashTable, songNameTable)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     load('hashTable.mat', 'hashTable')
    gs = 9;
    deltaTL = 3;
    deltaTU = 6;
    deltaF = 9;
    songName = matching(testOption, clipName, hashTable, songNameTable, gs, deltaTL, deltaTU, deltaF);
end

