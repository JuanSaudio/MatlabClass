function data = smaartSrfRead(fullFileName)

fid = fopen(fullFileName, 'r');
if fid < 0
    error('Could not open %s for input', fullFileName);
end

data = struct;

TZ = "America/Mexico_City";

data.header = getString(fid, 8);
d(1) = getFloat(fid);
d(2) = getInt(fid);
d(3) = getFloat(fid);
fseek(fid, 4, 0);
data.version = join(string(getInt(fid, 4)), ".");
data.name = getString(fid);
data.date = str2double(getString(fid, 13));
data.date = datetime(data.date/1000, "ConvertFrom", "posixtime", "TimeZone", TZ);
fseek(fid, 6, 0);
data.group = getString(fid);
data.measurement = getString(fid);
data.measurementDevice = getString(fid);
getString(fid);
data.measurementChannel = getString(fid);
getString(fid);
data.device = getString(fid);
getString(fid);
data.fftSize = fread(fid, 1, 'uint64');
data.avg = getString(fid);
fseek(fid, 7, 0);
data.fs = getInt(fid);
data.bitDepth = getInt(fid);
data.calOffset = getFloat(fid);
fseek(fid, 4, 0);
data.win = getString(fid);
data.comment = getString(fid, 129);
fseek(fid, 2, 0);
data.color = getFloat(fid, 3);
d(4) = getInt(fid);
fseek(fid, 40, 0);
data.pkHoldTime = getInt(fid) / 1000;
fseek(fid, 8, 0);
d(5) = getInt(fid);
fseek(fid, 12, 0);
data.pkHoldFlag = getInt(fid);
fseek(fid, 8, 0);

data.rms = fread(fid, data.fftSize/2 + 1, 'double')';
data.pk = fread(fid, data.fftSize/2 + 1, 'double')';


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