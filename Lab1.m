clear,clc,clf;
%讀音檔，原始波形，原始頻譜==================================================
[x, fs]=audioread('E:\Course\DSP\Lab1\happy_stop.wav'); %讀取音檔
sound(x, fs); %播放音檔
time = (1:length(x))/fs
figure(1);
subplot(1,2,1),plot(time, x); %畫出音檔時域圖
subplot(1,2,2);
spectrogram(x,1024,1000,[],fs,'yaxis'); %畫出音檔頻譜圖
%最大，平均，最小===========================================================
a = max(x); %找最大值
b = mean(x); %找平均值
c = min(x); %找最小值
%調整振幅，波形圖，頻譜圖====================================================
audiowrite('E:\Course\DSP\Lab1\happy_big.wav',x*2,fs); %原始檔案振幅*2並儲存
audiowrite('E:\Course\DSP\Lab1\happy_small.wav',x/2,fs);%原始檔案振幅/2並儲存
figure(2);
subplot(2,2,1),plot(time, x*2); %畫出振幅*2時域圖
subplot(2,2,2);
spectrogram(x*2,1024,1000,[],fs,'yaxis'); %畫出振幅*2頻譜圖
subplot(2,2,3),plot(time, x/2); %畫出振幅/2時域圖
subplot(2,2,4);
spectrogram(x/2,1024,1000,[],fs,'yaxis'); %畫出振幅/2頻譜圖
%調整頻率，波形圖，頻譜圖====================================================
audiowrite('E:\Course\DSP\Lab1\happy_fast.wav',x,fs*2);%原始檔案頻率*2並儲存
audiowrite('E:\Course\DSP\Lab1\happy_slow.wav',x,fs/2);%原始檔案頻率/2並儲存
figure(3);
subplot(2,2,1),plot(time/2, x);%畫出頻率*2時域圖
subplot(2,2,2);
spectrogram(x,1024,1000,[],fs*2,'yaxis');%畫出頻率*2頻譜圖
subplot(2,2,3),plot(time*2, x); %畫出頻率/2時域圖
subplot(2,2,4);
spectrogram(x,1024,1000,[],fs/2,'yaxis'); %畫出頻率/2頻譜圖
%Amplitude Modulation======================================================
t=0:1/fs:(length(x)-1)/fs;
AM=(x'+0.1).*cos(2*pi*4000*t); %Amplitude Modulation
figure(4);
subplot(1,2,1),plot((1:length(AM))/fs,AM); %畫出AM時域圖
subplot(1,2,2);
spectrogram(AM,1024,1000,[],fs,'yaxis'); %畫出AM頻譜圖
audiowrite('E:\Course\DSP\Lab1\happy_stop_AM.wav',AM,fs); %儲存調幅後音檔
%Frequency Modulation======================================================
y=cumsum(x)
FM=cos(2*pi*4000*t+y'); %Frequency Modulation
figure(5);
subplot(1,2,1),plot((1:length(FM))/fs,FM); %畫出FM時域圖
subplot(1,2,2);
spectrogram(FM,1024,1000,[],fs,'yaxis'); %畫出FM頻譜圖
audiowrite('E:\Course\DSP\Lab1\happy_stop_FM.wav',FM,fs); %儲存調頻後音檔





