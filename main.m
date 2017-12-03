function songName = main(testOption, clipName)
    gs = 9;
    deltaTL = 3;
    deltaTU = 6;
    deltaF = 9;
    load('hashTable.mat', 'hashTable');
    load('songNameTable.mat', 'songNameTable');
    
    if testOption == 2
        Fs=44100;
        bitsPerSample=24;
        channel=1;
        recordTime=15;
        
        recorder = audiorecorder(Fs,bitsPerSample,channel); % Declare recorder variable with some defined properties
        recordblocking(recorder,recordTime);                % Record audio for the amount of "recordTime"
        clipName = getaudiodata(recorder);                  % Getting the audio date recorded by the variable "recorder"
        songName = matching(testOption, clipName, hashTable, songNameTable, gs, deltaTL, deltaTU, deltaF);
    else   
        songName = matching(testOption, clipName, hashTable, songNameTable, gs, deltaTL, deltaTU, deltaF);
    end
%     soundsc(clipName, Fs)
end

