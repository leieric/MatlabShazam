function songName = matching(testOption, clip, hashTable, songNameTable, gs, deltaTL, deltaTU, deltaF)
    
    clipTable = make_table(testOption, clip, gs, deltaTL, deltaTU, deltaF);
    clipTable = [clipTable ones(length(clipTable), 1)];
    clipHash = hash(clipTable);
    
    matchMatrix = [];
    for i=1:length(clipHash(:,1))
        matchInd = find(hashTable(:,1) == clipHash(i,1));
        t0 = hashTable(matchInd,2) - clipHash(i, 2);
        matchMatrix = [matchMatrix; t0 hashTable(matchInd, 3)];
    end
    modeT0 = mode(matchMatrix(:,1));
    answer = matchMatrix(:,1) == modeT0;
    findMode = matchMatrix(answer, 2);
    [songIndex, freq] = mode(findMode);
    
    tabulate(findMode)
    freq/length(findMode)
    
    % Confidence testing
    if freq/length(findMode) > 0.5
        songName = songNameTable(songIndex);
    else
        songName = 'no-decision';
    end
end