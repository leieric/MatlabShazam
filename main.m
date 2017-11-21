function songName = main(testOption, clipName, hashTable)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     load('hashTable.mat', 'hashTable')
    gs = 9;
    deltaTL = 3;
    deltaTU = 6;
    deltaF = 9;
    songName = matching(clipName, hashTable, gs, deltaTL, deltaTU, deltaF);
    if (songName < 10)
        songName = strcat(num2str(0), num2str(songName));
    else
        songName = num2str(songName);
    end
    songName = strcat(songName, '.mat');
end

