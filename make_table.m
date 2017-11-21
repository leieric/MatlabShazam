function table = make_table(songName, gs, deltaTL, deltaTU, deltaF)     
    %Step 1 Preprocessing
    load(songName, '-mat');
    ch1 = y(:,1);
    ch1 = resample(ch1, 8000, 44100);
    % length(ch1)
    %Step 2 Spectrogram
    [S, F, T] = spectrogram(ch1, 512, 256, 512, 8000);
    log_S = log10(abs(S) + 1);

%     figure
%     imagesc(T, F, 20*log10(abs(S)));
%     axis xy;
%     xlabel('Time (s)')
%     ylabel('Frequency (Hz)')
%     title('Spectrogram')
% 
%     colormap jet
%     c = colorbar;
%     set(c);
%     ylabel(c, 'Power (dB)', 'FontSize', 14);

    %Step 3 Feature Extraction

    shiftAmt = floor(gs/2);
    % log_S = [1 1 1 3; 1 10 1 2; 1 3 1 5; 2 11 1 2];
    localPeak = ones(length(log_S(:,1)), length(log_S(1,:)));

    for r = -shiftAmt:shiftAmt
        for c = -shiftAmt:-1
            CS = circshift(log_S, [r, c]);
            localPeak = localPeak & ((log_S - CS) > 0);
        end
    end
    for r = -shiftAmt:shiftAmt
        for c = 1:shiftAmt
            CS = circshift(log_S, [r, c]);
            localPeak = localPeak & ((log_S - CS) > 0);
        end
    end
    for r = -shiftAmt:-1
        CS = circshift(log_S, [r, 0]);
        localPeak = localPeak & ((log_S - CS) > 0);
    end
    for r = 1:shiftAmt
        CS = circshift(log_S, [r, 0]);
        localPeak = localPeak & ((log_S - CS) > 0);
    end

    %Step 4 Thresholding
    log_S = log_S.*localPeak;
    log_S = log_S(:);
    totalPeaks = 30 * T(length(T));
    [B, I1] = sort(log_S, 'descend');
    log_S(I1((totalPeaks+1):end)) = 0;
    localPeak(I1((totalPeaks+1):end)) = 0;
    log_S = reshape(log_S, [length(log_S(:,1)), length(log_S(1,:))]); 

    %Step 5 Constructing Table
    table = [];
    [I2, J] = find(localPeak);
    for i = 1:length(I2)
        y1 = max(1, I2(i)-deltaF);
        y2 = min(length(F), I2(i) + deltaF);
        x1 = min(length(T), J(i) + deltaTL);
        x2 = min(length(T), J(i) + deltaTU);
        submatrix = localPeak((y1:y2), (x1:x2));
        [subI, subJ] = find(submatrix, 3);
        for j = 1:length(subI)
            table = [table; I2(i) I2(i)-deltaF+subI(j)-1 J(i) subJ(j)+deltaTL-1];
        end
    end
    size(table);
end







