%% script to analyse morphed stimuli

cd 'C:/Users/teresa/Documents/UZH_Arbeit/Test_threedimensional_morphing/Sounds/Preselection/similar2/Set_2/'



%1
[human,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2_f07_nov_neu_xxx_v04.wav');

[f0_human,idx_human] = pitch(human,fs);


%2
[animal,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2_ani_mam_fel_s23.wav');

[f0_animal,idx_animal] = pitch(animal,fs);


%3
[instrument,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2_V1_NEUTRAL(IMI).wav');

[f0_instrument,idx_instrument] = pitch(instrument,fs);


%morphing example

%human-animal
[morphed_HA_6_4,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHA_0.6_0.4.wav');

[f0_morphed_HA_6_4,idx_morphed_HA_6_4] = pitch(morphed_HA_6_4,fs);

[morphed_HA_4_6,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHA_0.4_0.6.wav');

[f0_morphed_HA_4_6,idx_morphed_HA_4_6] = pitch(morphed_HA_4_6,fs);

[morphed_HA_2_8,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHA_0.2_0.8.wav');

[f0_morphed_HA_2_8,idx_morphed_HA_2_8] = pitch(morphed_HA_2_8,fs);

[morphed_HA_8_2,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHA_0.8_0.2.wav');

[f0_morphed_HA_8_2,idx_morphed_HA_8_2] = pitch(morphed_HA_8_2,fs);

%human-instrument

[morphed_HI_6_4,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHI_0.6_0.4.wav');

[f0_morphed_HI_6_4,idx_morphed_HI_6_4] = pitch(morphed_HI_6_4,fs);

[morphed_HI_4_6,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHI_0.4_0.6.wav');

[f0_morphed_HI_4_6,idx_morphed_HI_4_6] = pitch(morphed_HI_4_6,fs);

[morphed_HI_2_8,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHI_0.2_0.8.wav');

[f0_morphed_HI_2_8,idx_morphed_HI_2_8] = pitch(morphed_HI_2_8,fs);

[morphed_HI_8_2,fs]=audioread('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Sounds\Preselection\similar2\Set_2\S2b_SpecificationHI_0.8_0.2.wav');

[f0_morphed_HI_8_2,idx_morphed_HI_8_2] = pitch(morphed_HI_8_2,fs);

%plots

subplot(5,5,1)
plot(human)
ylabel('Amplitude')
title('human')

subplot(5,5,2)
plot(idx_human,f0_human)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('human')
%
subplot(5,5,3)
plot(animal)
ylabel('Amplitude')
title('animal')

subplot(5,5,4)
plot(idx_animal,f0_animal)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('animal')
%
subplot(5,5,5)
plot(instrument)
ylabel('Amplitude')
title('instrument')

subplot(5,5,6)
plot(idx_instrument,f0_instrument)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('instrument')
%
subplot(5,5,7)
plot(morphed_HA_6_4)
ylabel('Amplitude')
title('morphedHA64')

subplot(5,5,8)
plot(idx_morphed_HA_6_4,f0_morphed_HA_6_4)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHA64')
%
subplot(5,5,9)
plot(morphed_HA_4_6)
ylabel('Amplitude')
title('morphedHA46')

subplot(5,5,10)
plot(idx_morphed_HA_4_6,f0_morphed_HA_4_6)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHA46')
%
subplot(5,5,11)
plot(morphed_HA_2_8)
ylabel('Amplitude')
title('morphedHA28')

subplot(5,5,12)
plot(idx_morphed_HA_2_8,f0_morphed_HA_2_8)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHA28')
%
subplot(5,5,13)
plot(morphed_HA_8_2)
ylabel('Amplitude')
title('morphedHA82')

subplot(5,5,14)
plot(idx_morphed_HA_8_2,f0_morphed_HA_8_2)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHA82')

%%%%

subplot(5,5,15)
plot(morphed_HI_6_4)
ylabel('Amplitude')
title('morphedHI64')

subplot(5,5,16)
plot(idx_morphed_HI_6_4,f0_morphed_HI_6_4)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHI64')
%
subplot(5,5,17)
plot(morphed_HI_4_6)
ylabel('Amplitude')
title('morphedHI46')

subplot(5,5,18)
plot(idx_morphed_HI_4_6,f0_morphed_HI_4_6)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHI46')
%
subplot(5,5,19)
plot(morphed_HI_2_8)
ylabel('Amplitude')
title('morphedHI28')

subplot(5,5,20)
plot(idx_morphed_HI_2_8,f0_morphed_HI_2_8)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHI28')
%
subplot(5,5,21)
plot(morphed_HI_8_2)
ylabel('Amplitude')
title('morphedHI82')

subplot(5,5,22)
plot(idx_morphed_HI_8_2,f0_morphed_HI_8_2)
ylabel('Pitch (Hz)')
xlabel('Sample Number')
title('morphedHI82')

%else plots

x = x(:,1);

dt = 1/fs;
t = 0:dt:(length(x)*dt)-dt;
plot(t,x); xlabel('milliseconds'); ylabel('Amplitude');
figure
plot(psd(spectrum.periodogram,x,'Fs',fs,'NFFT',length(x)));
