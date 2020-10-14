%analyse F0 of human vocal sounds for morphing
cd C:\Users\teresa\Documents\UZH_Arbeit\sounds\zemov_neu_xxx
filedir='C:\Users\teresa\Documents\UZH_Arbeit\sounds\zemov_neu_xxx\'
filelist=dir('*.wav')
n1=length(filelist)


frequencies = [440.000; 415.305; 391.995; 369.994; 349.228; 329.628; 311.127; 293.665; 
    277.183; 261.626; 246.942; 233.082; 220.000; 207.652; 195.998; 184.997; 174.614;  
    164.814; 155.563; 146.832; 138.591; 130.813; 123.471; 116.541; 110.000; 
    103.826; 97.9989; 92.4986; 87.3071; 82.4069; 77.7817; 73.4162]
tones = ["A4"; "Gis4"; "G4"; "Fis4"; "F4"; "E4"; "Dis4"; "D4"; 
"Cis4"; "C4";  "B3"; "Ais3"; "A3"; "Gis3";"G3"; "Fis3"; "F3"; 
    "E3"; "Dis3"; "D3"; "Cis3"; "C3"; "B2"; "Ais2"; "A2"; 
    "Gis2"; "G2"; "Fis2"; "F2"; "E2"; "Dis2"; "D2"]
freqtable=table(frequencies, tones)

speech_freq=cell(n1,1)
speech_tone=cell(n1, 1)
tone_dev=cell(n1,1)
names=cell(n1,1)
fundamentals=cell(n1,1)

for i=1:n1
    filename=filelist(i,1).name
    [x,fs]=audioread(filename);
    fundamental = pitch(x,fs)
    fundamental=median(fundamental)
    diff= abs(frequencies - fundamental)
    dev = min(diff)
    [row, col]=find(diff==dev)
    names{i,:}=[filename]
    fundamentals{i,:}=round(fundamental,4)
    tone_dev{i,:}=round(dev,4)
    speech_tone{i,:}=tones(row)
    speech_freq{i,:}=frequencies(row)
end



voicetable=table(names, fundamentals, speech_tone, speech_freq, tone_dev)

writetable(voicetable,'fundamentals_neutral.csv', 'Delimiter',',') 


%analyse F0 of instruments for morphing
cd C:\Users\teresa\Documents\UZH_Arbeit\sounds\selected_instruments
filedir2='C:\Users\teresa\Documents\UZH_Arbeit\sounds\selected_instruments\'
filelist2=dir('*.mp3')
n2=length(filelist2)

names2=cell(n2,1)
fundamentals2=cell(n2,1)
for i=1:n2
    filename2=filelist2(i,1).name
    [x,fs]=audioread(filename2);
    fundamental = pitch(x,fs)
    fundamental=median(fundamental)
    [row, col]=find(diff==dev)
    names2{i,:}=filename2
    fundamentals2{i,:}=round(fundamental,4)
end

instrumenttable=table(names2, fundamentals2)
new = (cell2mat(instrumenttable.fundamentals2) >73.4 & cell2mat(instrumenttable.fundamentals2)<441) 

instrumenttable = instrumenttable(new,:);


writetable(instrumenttable,'fundamentals_instruments.csv', 'Delimiter',',')

%compare voices and instruments
morphing = struct([])
morphing(1).voices= voicetable
morphing(1).instruments=instrumenttable


for i=1:n1
    voice=cell2mat(voicetable.fundamentals(i))
    diff2= abs(cell2mat(instrumenttable.fundamentals2) - voice)
    deviation = diff2<0.25
    [row, col]=find(deviation==1)
    fit=(instrumenttable.names2(row))
    freq_diff=cell2mat(instrumenttable.fundamentals2(row))-voice
    mytable=table(fit,freq_diff)
    morphing(1).voices.fit{i}=mytable 
end

