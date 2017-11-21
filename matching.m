function songName = matching(clip, hashTable, gs, deltaTL, deltaTU, deltaF)
    clipTable = make_table(clip, gs, deltaTL, deltaTU, deltaF);
    clipTable = [clipTable ones(length(clipTable), 1)];
    clipHash = hash(clipTable);
    matchMatrix = [];
    for i=1:length(clipHash(:,1))
        matchInd = find(hashTable(:,1) == clipHash(i,1));
        %loop through matchInd, if tSong-tClip match add it to match matrix
        for j = 1:length(matchInd)
            t0 = hashTable(matchInd(j),2) - clipHash(i, 2);
            matchMatrix = [matchMatrix; t0 hashTable(matchInd(j), 3)];
        end
    end
    modeT0 = mode(matchMatrix(:,1));
    answer = matchMatrix(:,1) == modeT0;
    findMode = matchMatrix(answer, 2);
    songName = mode(findMode);
    %find the most commonly seen songID using mode
end