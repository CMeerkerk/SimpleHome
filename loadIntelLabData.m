function [D] = loadIntelLabData()
% Load data from the Intel Lab Dataset
%
% Origional source: http://db.csail.mit.edu/labdata/labdata.html
%
% <p>
% <a href="data.txt.gz">This file</a> includes a log of about 2.3 million readings collected
% from these sensors.  The file is 34MB gzipped, 150MB uncopressed.  The schema is as follows:
% 
% <p>
% <table border=1>
% <tr>
% <td>date:yyyy-mm-dd</td>
% <td>time:hh:mm:ss.xxx</td>
% <td>epoch:int</td>
% <td>moteid:int</td>
% <td>temperature:real</td>
% <td>humidity:real</td>
% <td>light:real</td>
% <td>voltage:real</td>
% </tr></table>
% <p>
% 
% In this case, epoch is a monotonically increasing sequence number from
% each mote.  Two readings from the same epoch number were produced from
% different motes at the same time.  There are some missing epochs in
% this data set.  Moteids range from 1-54; data from some motes may be
% missing or truncated. Temperature is in degrees Celsius.  Humidity is
% temperature corrected relative humidity, ranging from 0-100%.  Light
% is in Lux (a value of 1 Lux corresponds to moonlight, 400 Lux to a bright 
% office, and 100,000 Lux to
% full sunlight.)  Voltage is expressed in volts, ranging from 2-3; the
% batteries in this case were lithium ion cells which maintain a fairly
% constant voltage over their lifetime; note that variations in voltage
% are highly correlated with temperature.
%
% CMPT 419 loadUnicefData used as reference for code

FNAME = ['DataSet' filesep 'data.txt'];
NCOLUMNS = 8;

% Open and read the file as cell array of strings.
fp = fopen(FNAME);
C = textscan(fp, '%s','Delimiter',' ');
fclose(fp);

% Extract feature names and rest of data.
Data = C{1}(1:end);
D = reshape(Data,NCOLUMNS,[]);