clear all
% function data = smaartTrfRead(fullFileName)

fclose('all');
path = "/Users/juans/Documents/Smaart v8/Traces/Transfer Function/Session Data/*.trf";
files = dir(path);

numFile = 1;

fullFileName = strcat(files(numFile).folder, '/', files(numFile).name);


fid = fopen(fullFileName, 'r');
if fid < 0
    error('Could not open %s for input', fullFileName);
end

version = string(fread(fid, 8, '*char')');
d(1) = fread(fid, 1, 'float')';
d(2) = fread(fid, 1, 'int32')';
d(3) = fread(fid, 1, 'float')';
nop(1) = string(fread(fid, 4, '*char')');
VersionCode = fread(fid, 4, 'int32')';
Name = deblank(string(fread(fid, 33, '*char')'));
date = str2double(fread(fid, 13, '*char')');
date = datetime(date/1000, "ConvertFrom", "posixtime", "TimeZone","America/Mexico_City");
nop(2) = string(fread(fid, 6, '*char')');
group = deblank(string(fread(fid, 33, '*char')'));
measurement = deblank(string(fread(fid, 33, '*char')'));
MeaDevice = deblank(string(fread(fid, 33, '*char')'));
RefDevice = string(fread(fid, 33, '*char')');
MeaCh = deblank(string(fread(fid, 33, '*char')'));
RefCh = string(fread(fid, 33, '*char')');
MeaDevice2 = deblank(string(fread(fid, 33, '*char')'));
RefDevice2 = deblank(string(fread(fid, 33, '*char')'));
fftSize = fread(fid, 1, 'int')';
magThreshold = fread(fid, 1, 'float')';
Average = deblank(string(fread(fid, 33, '*char')'));
avgFlag = string(fread(fid, 1, 'int')');
nop(3) = string(fread(fid, 3, '*char')');
sampleRate = fread(fid, 1, 'int32')';
bitDetph = fread(fid, 1, 'int32')';
calOffset = fread(fid, 1, 'float')';
delay = string(fread(fid, 1, 'float')');
win = deblank(string(fread(fid, 33, '*char')'));
comment = deblank(string(fread(fid, 129, '*char')'));
nop(4) = string(fread(fid, 2, '*char')');
color = fread(fid, 3, 'float')';
d(4) = fread(fid, 1, 'int');
irFFTSize = fread(fid, 1, 'int');
irAvgs = string(fread(fid, 33, '*char')');
nop(5) = string(fread(fid, 3, '*char')');
pkHold = fread(fid, 1, 'int')/1000.0;
d(5) = fread(fid, 1, 'int')';
MTWFlag = fread(fid, 1, 'int');
d(6:7) = fread(fid, 2, 'int')';
d(8:9) = fread(fid, 2, 'int')';
pkHoldFlag = fread(fid, 1, 'int')';
d(10:11) = fread(fid, 2, 'int')';

ftell(fid)
% buf = fread(fid, 'double'); 




if fftSize == 1
%     numPoints = 992;
    numPoints = 441;
else
    numPoints = fftSize/2;
end
    


mag = fread(fid, numPoints, 'double')';
re = fread(fid, numPoints, 'double')';
im = fread(fid, numPoints, 'double')';
cohe = fread(fid, numPoints, 'double')';
cohe2 = fread(fid, numPoints, 'double')';
cohe3 = fread(fid, numPoints, 'double')';
cohe4 = fread(fid, numPoints, 'double')';
cohe5 = fread(fid, numPoints, 'double')';
cohe6 = fread(fid, numPoints, 'double')';
% fread(fid, 1, 'double');

ftell(fid)
% 32432
%%
ir = fread(fid, irFFTSize, 'double');
etc = fread(fid, irFFTSize, 'double');
feof(fid)


fax = linspace(0, sampleRate, numPoints + 1);
fax = fax(1:end-1);

H = re + 1j * im;
Hmag = dB(H);
Hang = deg(H);

scale = "Lin";

subplot 211
plot(mag)
set(gca, "XScale", scale);
yyaxis right
plot(cohe)
set(gca, "XScale", scale);
yyaxis left


subplot 212
plot(Hmag)
set(gca, "XScale", scale);
yyaxis right 
plot(Hang)
set(gca, "XScale", scale);
yyaxis left

% subplot 313
% plot(fftshift(ir))
% yyaxis right
% % plot(dB(fftshift(etc)))
% % yyaxis left



% 1          16           2         882        4208       11264       18320           0


% end
% Captured: 12 Dec 2019 2:29:04pm
% Group: Default Tab
% Measurement: TF(2)
% FFT: 32k
% Average: 3 Sec
% Average Form: Polar
% Window: Hann
% Delay: 0.00
% Mag Threshold: -120.00
% LIR: None
% LIR Average: None
% Sample Rate: 44100
% Bit Depth: 24
% Device: CoreAudio: Soundflower (2ch)
% Mea Ch: Input 1-1
% Ref Ch: Input 2-1
% Version: 8.4.1.2