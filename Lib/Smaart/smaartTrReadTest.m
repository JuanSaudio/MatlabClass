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
fftSize = round(fread(fid, 1, 'int')');
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

ftell(fid);
% buf = fread(fid, 'double'); 

if fftSize ~= 1
    numPoints = fftSize/2;
    freqs = linspace(0, sampleRate/2, numPoints + 2);
    freqs = freqs(1:end-1);
    magdB = fread(fid, numPoints+1, 'double');
    Hreal = fread(fid, numPoints+1, 'double');
    Himag = fread(fid, numPoints+1, 'double');
    coher = fread(fid, numPoints+1, 'double');
else
    numPoints = 881;
    freqs = fread(fid, numPoints+1, 'float');
    magdB = fread(fid, numPoints+1, 'double');
    Hreal = fread(fid, numPoints+1, 'double');
    Himag = fread(fid, numPoints+1, 'double');
    coher = fread(fid, numPoints+1, 'double');
    
end
 
ir = fread(fid, irFFTSize, 'double');
etc = fread(fid, irFFTSize, 'double');
buf = fread(fid, '*char')
feof(fid)

[~, idx] = max(magdB);
freqs(idx-1)
freqs(idx)
freqs(idx+1)




H = Hreal + 1j * Himag;
Hmag = dB(H);
Hang = deg(H);

scale = "Lin";

subplot 211
plot(freqs, magdB)
set(gca, "XScale", scale);
yyaxis right
plot(freqs, coher)
set(gca, "XScale", scale);
ylim([0, 1])
yyaxis left


figure(1)
subplot 212
plot(freqs, Hmag)
set(gca, "XScale", scale);
yyaxis right 
plot(freqs, Hang)
set(gca, "XScale", scale);
yyaxis left

figure(2)
subplot 211
plot(fftshift(ir))

subplot 212
plot(dB(fftshift(etc)))
