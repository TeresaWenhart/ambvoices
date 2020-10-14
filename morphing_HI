% morphing human instrument

%directory and paths
cd('C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\STRAIGHT3')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha_newest/nwayMorphingProgs20151008/nwayMorphingProgs20151008')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/temporallyMorphing')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/nwayMorphingProgs20141111bu')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TandemSTRAIGHTmonolithicPackage007')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TVNmorphingGUI')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/Straight/legacy_STRAIGHT-master/morphing_src')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/straight_new/4Sascha_newest/nwayMorphingGUIs20131015v1/nwayMorphingGUIs20131015v1')
addpath('C:/Users/teresa/Documents/UZH_Arbeit/Straight/legacy_STRAIGHT-master/src')

%read in audio files and create STRAIGHT objects

cd C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\sounds3\final
filedir='C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\sounds3\final'
STRAIGHTdir='C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\STRAIGHT3\'
filelist=dir('*.wav')
n=length(filelist)
noisy = 0;
for i=1:n
    cd C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\sounds3\final
    filename=filelist(i,1).name
    [x,fs]=audioread(filename);
    newname= char(regexprep(filename,'.wav',''))
    object=createMobject;
    object=updateFieldOfMobject(object, 'waveform',x);
    x = x(:,1); %   Make sure it is a comum vector.
    r = exF0candidatesTSTRAIGHTGB(x,fs) % Extract F0 information
    if noisy
        x = removeLF(x,fs,r.f0,r.periodicityLevel); % Low frequency noise remover
        r = exF0candidatesTSTRAIGHTGB(x,fs)
    end;
    rc = autoF0Tracking(r,x); % Clean F0 trajectory by tracking
    rc.vuv = refineVoicingDecision(x,rc);
    q = aperiodicityRatioSigmoid(x,rc,1,2,0)
    f = exSpectrumTSTRAIGHTGB(x,fs,q)
    object=executeSTRAIGHTanalysisM(object); 
    STRAIGHTobject.creationDate=date
    STRAIGHTobject.dataDirectory=filedir
    STRAIGHTobject.dataFileName=filename
    STRAIGHTobject.waveform = object.waveform;
    STRAIGHTobject.samplingFrequency = object.samplingFrequency;
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
    STRAIGHTobject.anchor=struct('time',object.anchorTimeLocation, 'frequency',object.anchorFrequency)
    cd 'C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\STRAIGHT3\'
    save(newname, 'STRAIGHTobject')
end


%anchor with GUIS
referenceEditorGUIv3 %Reference Editor
targetEditorGUIv3 %Target Editor


%create specification files
%morphing example
%aa=temporallyStaticBatchMorphingR2('SpecificationTEST0.333.txt')
%test=aa.synthStructure.synthesisOut
%audiowrite('TEST0.333.wav',test,44100,'BitsPerSample',16);

%morphing rates
mrate = 0:0.20:1.0;
reverse=flip(mrate)
rate_combinations=[mrate; reverse]

%morphing
pairs=readtable('C:/Users/teresa/Documents/UZH_Arbeit/Human_instrument_morphing/reference_target_pairs.txt')
STRAIGHTDirectory= 'C:/Users/teresa/Documents/UZH_Arbeit/Human_instrument_morphing/STRAIGHT3/'
referenceObject=pairs.referenceObject
targetObject=pairs.targetObject
anchorStructDirectory= 'C:/Users/teresa/Documents/UZH_Arbeit/Human_instrument_morphing/STRAIGHT3/'
referenceAnchors= pairs.referenceAnchor
targetAnchors= pairs.targetAnchor

cd 'C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\STRAIGHT3\'
for i=1:length(referenceObject)
    STRobject1=char(referenceObject(i))
    STRobject2=char(targetObject(i))
    referenceAnchor=char(referenceAnchors(i))
    targetAnchor=char(targetAnchors(i))
    for j=1:length(mrate) %%%%%modify according to objects
        this_rate= rate_combinations(:,j)
        txtname=horzcat(char(regexprep(STRobject1,'.mat','')),'_',char(regexprep(STRobject2,'.mat','')),'_',num2str(this_rate(1)), '_',num2str(this_rate(2)),'.txt')%%%%
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
end


cd 'C:\Users\teresa\Documents\UZH_Arbeit\Human_instrument_morphing\STRAIGHT3\'
filelist=dir('*.txt')
for i=1:length(dir)
    name=filelist(i,1).name
    aa=temporallyStaticBatchMorphingR2(filelist(i,1).name)
    test=aa.synthStructure.synthesisOut
    newname= regexprep(name,'.txt','.wav')
    audiowrite(newname,test,44100,'BitsPerSample',16);
end
