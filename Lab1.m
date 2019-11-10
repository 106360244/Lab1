clear,clc,clf;
%Ū���ɡA��l�i�ΡA��l�W��==================================================
[x, fs]=audioread('E:\Course\DSP\Lab1\happy_stop.wav'); %Ū������
sound(x, fs); %������
time = (1:length(x))/fs
figure(1);
subplot(1,2,1),plot(time, x); %�e�X���ɮɰ��
subplot(1,2,2);
spectrogram(x,1024,1000,[],fs,'yaxis'); %�e�X�����W�й�
%�̤j�A�����A�̤p===========================================================
a = max(x); %��̤j��
b = mean(x); %�䥭����
c = min(x); %��̤p��
%�վ㮶�T�A�i�ιϡA�W�й�====================================================
audiowrite('E:\Course\DSP\Lab1\happy_big.wav',x*2,fs); %��l�ɮ׮��T*2���x�s
audiowrite('E:\Course\DSP\Lab1\happy_small.wav',x/2,fs);%��l�ɮ׮��T/2���x�s
figure(2);
subplot(2,2,1),plot(time, x*2); %�e�X���T*2�ɰ��
subplot(2,2,2);
spectrogram(x*2,1024,1000,[],fs,'yaxis'); %�e�X���T*2�W�й�
subplot(2,2,3),plot(time, x/2); %�e�X���T/2�ɰ��
subplot(2,2,4);
spectrogram(x/2,1024,1000,[],fs,'yaxis'); %�e�X���T/2�W�й�
%�վ��W�v�A�i�ιϡA�W�й�====================================================
audiowrite('E:\Course\DSP\Lab1\happy_fast.wav',x,fs*2);%��l�ɮ��W�v*2���x�s
audiowrite('E:\Course\DSP\Lab1\happy_slow.wav',x,fs/2);%��l�ɮ��W�v/2���x�s
figure(3);
subplot(2,2,1),plot(time/2, x);%�e�X�W�v*2�ɰ��
subplot(2,2,2);
spectrogram(x,1024,1000,[],fs*2,'yaxis');%�e�X�W�v*2�W�й�
subplot(2,2,3),plot(time*2, x); %�e�X�W�v/2�ɰ��
subplot(2,2,4);
spectrogram(x,1024,1000,[],fs/2,'yaxis'); %�e�X�W�v/2�W�й�
%Amplitude Modulation======================================================
t=0:1/fs:(length(x)-1)/fs;
AM=(x'+0.1).*cos(2*pi*4000*t); %Amplitude Modulation
figure(4);
subplot(1,2,1),plot((1:length(AM))/fs,AM); %�e�XAM�ɰ��
subplot(1,2,2);
spectrogram(AM,1024,1000,[],fs,'yaxis'); %�e�XAM�W�й�
audiowrite('E:\Course\DSP\Lab1\happy_stop_AM.wav',AM,fs); %�x�s�մT�᭵��
%Frequency Modulation======================================================
y=cumsum(x)
FM=cos(2*pi*4000*t+y'); %Frequency Modulation
figure(5);
subplot(1,2,1),plot((1:length(FM))/fs,FM); %�e�XFM�ɰ��
subplot(1,2,2);
spectrogram(FM,1024,1000,[],fs,'yaxis'); %�e�XFM�W�й�
audiowrite('E:\Course\DSP\Lab1\happy_stop_FM.wav',FM,fs); %�x�s���W�᭵��





