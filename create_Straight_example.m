%directory and paths
cd('C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha_newest/nwayMorphingProgs20151008/nwayMorphingProgs20151008')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/temporallyMorphing')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/nwayMorphingProgs20141111bu')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TandemSTRAIGHTmonolithicPackage007')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TVNmorphingGUI')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/Straight/legacy_STRAIGHT-master/morphing_src')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha_newest/nwayMorphingGUIs20131015v1/nwayMorphingGUIs20131015v1')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/Straight/legacy_STRAIGHT-master/src')

% read audio
[x,fs]=audioread('C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing\Audio1Furuyama_TW.wav');

x = x(:,1); %   Make sure it is a comum vector.
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
STRAIGHTobject.refinedF0Structure=struct
STRAIGHTobject.AperiodicityExtractionDate=date
STRAIGHTobject.AperiodicityStructure=monkey.aperiodicityIndex
STRAIGHTobject.SpectrumExtractionDate=date
STRAIGHTobject.SpectrumStructure=f
STRAIGHTobject.SynthesisStructure=struct
STRAIGHTobject.lastUpdate=date
STRAIGHTobject.anchor=struct('time',monkey.anchorTimeLocation, 'frequency',monkey.anchorFrequency)


save STRmonkey STRAIGHTobject


