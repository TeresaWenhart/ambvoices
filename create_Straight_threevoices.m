%directory and paths
cd('C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha_newest/nwayMorphingProgs20151008/nwayMorphingProgs20151008')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/temporallyMorphing')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/nwayMorphingProgs20141111bu')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TandemSTRAIGHTmonolithicPackage007')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TVNmorphingGUI')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/Straight/legacy_STRAIGHT-master/morphing_src')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha_newest/nwayMorphingGUIs20131015v1/nwayMorphingGUIs20131015v1')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/Straight/legacy_STRAIGHT-master/src')

monkey=createMobject;
human=createMobject;
instrument=createMobject;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%human
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  Extract source information
% read audio
noisy=0
[x,fs]=audioread('C:\Users\Teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\m05_nov_neu_xxx_v02_TW.wav');
human=updateFieldOfMobject(human, 'waveform',x);
x = x(:,1); %   Make sure it is a comum vector.


r = exF0candidatesTSTRAIGHTGB(x,fs) % Extract F0 information
if noisy
    x = removeLF(x,fs,r.f0,r.periodicityLevel); % Low frequency noise remover
    r = exF0candidatesTSTRAIGHTGB(x,fs)
end;

rc = autoF0Tracking(r,x); % Clean F0 trajectory by tracking
rc.vuv = refineVoicingDecision(x,rc);
q = aperiodicityRatioSigmoid(x,rc,1,2,0) % aperiodicity extraction




%%  Extract spectral informatiopn

f = exSpectrumTSTRAIGHTGB(x,fs,q)

%speech parameter extraction

human=executeSTRAIGHTanalysisM(human); 


%create STRAIGHT object
STRAIGHTobject.creationDate= date
STRAIGHTobject.dataDirectory= 'C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing'
STRAIGHTobject.dataFileName='m05_nov_neu_xxx_v02_TW.wav'
STRAIGHTobject.waveform = human.waveform;
STRAIGHTobject.samplingFrequency = human.samplingFrequency;
STRAIGHTobject.currentHandles= struct
STRAIGHTobject.F0extractionDate=date;
STRAIGHTobject.originalF0Structure=struct
STRAIGHTobject.refinedF0Structure.temporalPositions = r.temporalPositions;
STRAIGHTobject.refinedF0Structure.vuv = rc.vuv;
STRAIGHTobject.refinedF0Structure.f0 = r.f0
STRAIGHTobject.AperiodicityExtractionDate=date
STRAIGHTobject.AperiodicityStructure=q
STRAIGHTobject.SpectrumExtractionDate=date
STRAIGHTobject.SpectrumStructure.spectrogramSTRAIGHT = f.spectrogramSTRAIGHT;
STRAIGHTobject.SpectrumStructure.temporalPositions = f.temporalPositions;
STRAIGHTobject.SynthesisStructure=struct
STRAIGHTobject.lastUpdate=date
STRAIGHTobject.anchor=struct('time',human.anchorTimeLocation, 'frequency',human.anchorFrequency)


save STRhuman STRAIGHTobject


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%monkey
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  Extract source information
% read audio
noisy = 0;
[x,fs]=audioread('C:\Users\Teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Audio1Furuyama_TW.wav');
monkey=updateFieldOfMobject(monkey, 'waveform',x);
x = x(:,1); %   Make sure it is a comum vector.



r = exF0candidatesTSTRAIGHTGB(x,fs) % Extract F0 information

if noisy
    x = removeLF(x,fs,r.f0,r.periodicityLevel); % Low frequency noise remover
    r = exF0candidatesTSTRAIGHTGB(x,fs)
end;

rc = autoF0Tracking(r,x); % Clean F0 trajectory by tracking
rc.vuv = refineVoicingDecision(x,rc);
q = aperiodicityRatioSigmoid(x,rc,1,2,0) % aperiodicity extraction
%%  Extract spectral informatiopn

f = exSpectrumTSTRAIGHTGB(x,fs,q)

%speech parameter extraction

monkey=executeSTRAIGHTanalysisM(monkey); 


%create STRAIGHT object
STRAIGHTobject.creationDate= date
STRAIGHTobject.dataDirectory= 'C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing'
STRAIGHTobject.dataFileName='Audio1Furuyama_TW.wav'
STRAIGHTobject.waveform = monkey.waveform;
STRAIGHTobject.samplingFrequency = monkey.samplingFrequency;
STRAIGHTobject.currentHandles= struct
STRAIGHTobject.F0extractionDate=date
STRAIGHTobject.originalF0Structure=struct
STRAIGHTobject.refinedF0Structure.temporalPositions = r.temporalPositions;
STRAIGHTobject.refinedF0Structure.vuv = rc.vuv;
STRAIGHTobject.refinedF0Structure.f0 = r.f0
STRAIGHTobject.AperiodicityExtractionDate=date
STRAIGHTobject.AperiodicityStructure=q
STRAIGHTobject.SpectrumExtractionDate=date
STRAIGHTobject.SpectrumStructure.spectrogramSTRAIGHT = f.spectrogramSTRAIGHT;
STRAIGHTobject.SpectrumStructure.temporalPositions = f.temporalPositions;
STRAIGHTobject.SynthesisStructure=struct
STRAIGHTobject.lastUpdate=date
STRAIGHTobject.anchor=struct('time',monkey.anchorTimeLocation, 'frequency',monkey.anchorFrequency)


save STRmonkey STRAIGHTobject

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%instrument
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Extract source information
% read audio
noisy = 0;
[x,fs]=audioread('C:\Users\Teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\C6_NEUTRAL(IMP)_TW.wav');
instrument=updateFieldOfMobject(instrument, 'waveform',x);
x = x(:,1); %   Make sure it is a comum vector.


r = exF0candidatesTSTRAIGHTGB(x,fs) % Extract F0 information

if noisy
    x = removeLF(x,fs,r.f0,r.periodicityLevel); % Low frequency noise remover
    r = exF0candidatesTSTRAIGHTGB(x,fs)
end;

rc = autoF0Tracking(r,x); % Clean F0 trajectory by tracking
rc.vuv = refineVoicingDecision(x,rc);
q = aperiodicityRatioSigmoid(x,rc,1,2,0) % aperiodicity extraction
%%  Extract spectral informatiopn

f = exSpectrumTSTRAIGHTGB(x,fs,q)

%speech parameter extraction

instrument=executeSTRAIGHTanalysisM(instrument); 


%create STRAIGHT object
STRAIGHTobject.creationDate= date
STRAIGHTobject.dataDirectory= 'C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing'
STRAIGHTobject.dataFileName='C6_NEUTRAL(IMP)_TW.wav'
STRAIGHTobject.waveform = instrument.waveform;
STRAIGHTobject.samplingFrequency = instrument.samplingFrequency;
STRAIGHTobject.currentHandles= struct
STRAIGHTobject.F0extractionDate=date
STRAIGHTobject.originalF0Structure=struct
STRAIGHTobject.refinedF0Structure.temporalPositions = r.temporalPositions;
STRAIGHTobject.refinedF0Structure.vuv = rc.vuv;
STRAIGHTobject.refinedF0Structure.f0 = r.f0
STRAIGHTobject.AperiodicityExtractionDate=date
STRAIGHTobject.AperiodicityStructure=q
STRAIGHTobject.SpectrumExtractionDate=date
STRAIGHTobject.SpectrumStructure.spectrogramSTRAIGHT = f.spectrogramSTRAIGHT;
STRAIGHTobject.SpectrumStructure.temporalPositions = f.temporalPositions;
STRAIGHTobject.SynthesisStructure=struct
STRAIGHTobject.lastUpdate=date
STRAIGHTobject.anchor=struct('time',instrument.anchorTimeLocation, 'frequency',instrument.anchorFrequency)


save STRinstrument STRAIGHTobject




%%%%%%%%%%%
%Reference Editor
%%%%%%%%%%%
referenceEditorGUIv3

%%%%%%%%%%%
%Target Editor
%%%%%%%%%%%
targetEditorGUIv3

threeWayMorphingFileSelector
TemporallyStaticTiedAspect3wayMorphing

%%%%%%%%%%%%
%create specification text file
%%%%%%%%%%%%
%morphing example
aa=temporallyStaticBatchMorphingR2('SpecificationTEST0.333.txt')
test=aa.synthStructure.synthesisOut
audiowrite('TEST0.333.wav',test,44100,'BitsPerSample',16);

%morphing rates
mrate = 0:0.10:1.0;
reverse=flip(mrate)
rate_combinations=[mrate; reverse]



%morphing file loop
%specification text files

%%%%%modify according to objects!!!
STRAIGHTDirectory= 'C:/Users/Teresa/Documents/UZH_Arbeit/Test_threedimensional_morphing/'
STRobject1='STRhuman.mat'
STRobject2='STRinstrument.mat'
STRobject3='STRmonkey.mat'
anchorStructDirectory= 'C:/Users/Teresa/Documents/UZH_Arbeit/Test_threedimensional_morphing/'
referenceAnchor= 'referenceAnchorSTRhuman20191101T1157.mat'
targetAnchor= 'targetAnchorStrinstrument20191101T1203.mat'
targetAnchor2='targetAnchorStrmonkey20191101T1204.mat'

for i=1:length(mrate) %%%%%modify according to objects
    this_rate= rate_combinations(:,i)
    txtname=horzcat('SpecificationHI','_',num2str(this_rate(1)), '_',num2str(this_rate(2)),'.txt')%%%%
    fileID= fopen(txtname, 'w');
    fprintf(fileID,'mRate %f %f\n',this_rate);
    fprintf(fileID, [ 'STRAIGHTDirectory' ' ' STRAIGHTDirectory '\n']);
    fprintf(fileID, [ STRobject1 '\n']); %%%%%
    fprintf(fileID, [ STRobject2 '\n']); %%%%%
    fprintf(fileID, [ 'anchorStructDirectory' ' ' anchorStructDirectory '\n']);
    fprintf(fileID, [ referenceAnchor '\n']);%%%%%
    fprintf(fileID, [ targetAnchor '\n']);%%%%%
    fclose(fileID);
end


cd C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Morph_two_191105
filelist=dir('Specification*.txt')
for i=1:length(dir)
    name=filelist(i,1).name
    aa=temporallyStaticBatchMorphingR2(filelist(i,1).name)
    test=aa.synthStructure.synthesisOut
    newname= regexprep(name,'.txt','.wav')
    audiowrite(newname,test,44100,'BitsPerSample',16);
end
    
