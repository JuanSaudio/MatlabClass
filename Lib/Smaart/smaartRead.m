function data = smaartRead(fullFileName)

cleanUpFlag = true;

fullFileName = string(fullFileName);
fid = fopen(fullFileName, 'r');
if fid < 0
    error('Could not open %s for input', fullFileName);
end

% Be careful with timezones as this script changes with it
curDate = datetime;
TZ = string(curDate.TimeZone);

data = struct;

data.header = getString(fid, 8);
d(1) = getFloat(fid);
d(2) = getInt(fid);
d(3) = getFloat(fid);

fseek(fid, 4, 0);

data.versionCode = join(string(getInt(fid, 4)), ".");
data.name = getString(fid);
data.date = str2double(getString(fid, 13));
data.date = datetime(data.date/1000, "ConvertFrom", "posixtime", "TimeZone", TZ);

fseek(fid, 6, 0);

data.group = getString(fid);
data.measurement = getString(fid);
data.meaDevice = getString(fid);
data.refDevice = getString(fid);
data.meaCh = getString(fid);
data.refCh = getString(fid);
data.meaAD = getString(fid);
data.refAD = getString(fid);

data.fftSize = getInt(fid);
data.magThreshold = getFloat(fid);
data.avg = getString(fid);
data.avgType = getInt(fid);

fseek(fid, 3, 0);

data.sampleRate = getInt(fid);
data.bitDepth = getInt(fid);
data.calOffset= getFloat(fid);
data.delay = getFloat(fid);

data.window = getString(fid);
data.comment = getString(fid, 129);

fseek(fid, 2, 0);

data.color = getFloat(fid, 3);

d(4) = getInt(fid);

data.irSize = getInt(fid);
data.irAvgs = getString(fid);

fseek(fid, 3, 0);

data.pkHoldTime = getInt(fid)/1000;

d(5) = getInt(fid);

data.MTWFlag = getInt(fid);

d(6) = getInt(fid);
d(7) = getInt(fid);
d(8) = getInt(fid);
d(9) = getInt(fid);

data.pkHoldFlag = getInt(fid);

d(10) = getInt(fid);
d(11) = getInt(fid);

[~, ~, extension] = fileparts(fullFileName);

if extension == ".trf"
    if data.fftSize ~= 1
        numPoints = data.fftSize/2 + 1;
        data.freqs = linspace(0, data.sampleRate/2, numPoints + 1);
        data.freqs = data.freqs(1:end-1);
    else
        numPoints = 882;
        data.freqs = fread(fid, numPoints, 'float');
    end
    
    data.magdB     = fread(fid, numPoints, 'double');
    Hreal          = fread(fid, numPoints, 'double');
    Himag          = fread(fid, numPoints, 'double');
    data.H         = Hreal + 1j * Himag;
    data.coherence = fread(fid, numPoints, 'double');
    
    if cleanUpFlag
        data.freqs     = data.freqs(2:end);
        data.magdB     = data.magdB(2:end);
        data.H         = data.H(2:end);
        data.coherence = data.coherence(2:end);
    end
    
    data.ir = fread(fid, data.irSize, 'double');
    data.etc = fread(fid, data.irSize, 'double');
    
elseif extension == ".srf"
    numPoints = data.fftSize/2 + 1;
    data.freqs = linspace(0, data.sampleRate/2, numPoints + 1);
    data.freqs = data.freqs(1:end-1);
    data.rms = fread(fid, numPoints, 'double')';
    data.pk = fread(fid, numPoints, 'double')';
else
    error("File extension %s not recognized", extension);
end

buf = fread(fid, '*char');
feof(fid);

    function str = getString(fid, numChars)
        if nargin < 2
            numChars = 33;
        end
        str = deblank(string(fread(fid, numChars, '*char')'));
    end

    function flt = getFloat(fid, numFloats)
        if nargin < 2
            numFloats = 1;
        end
        flt = fread(fid, numFloats, 'float')';
    end

    function it  = getInt(fid, numInts)
        if nargin < 2
            numInts = 1;
        end
        it = fread(fid, numInts, 'int')';
    end

end