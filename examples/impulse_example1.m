%% impulse signal processing example 1
%
% example loads an impulse (force) and driving point (acceleration) record
% from a tab deliminated text file. time and frequency information are
% found (and plotted) along with the usable frequency content of the 
% impulse signal.
% 
% note: 
% * data is from rutgers instrumented sledge. impact was located mid span 
% on the exterior girder of the rutgers demo slab. driving point was 
% measured.
% 
% jdv 07222016


%% load data 
%  note
%       chan1 - force signal
%       chan2 - driving point accel

% load from file
data = dlmread('impulse.txt');

% channel labels
chan = {'Impulse Signal'; 'Driving Point Response'};


%% temporal info
fs = 10240;                     % sampling frequency [hz]
dt = 1/fs;                      % time step/resolution
t = 0:dt:length(data)*dt-dt;    % form time vector


%% plot to view records time records

xbnds = [0 .1]; % time range to plot [seconds]

figure
% plot impulse signal
    subplot(2,1,1)
    plot(t, data(:,1))
    xlim(xbnds);
    xlabel('Time [seconds]')
    ylabel('Force [lbs]')
    legend(chan(1))
    grid minor
% format line size
    lh = findobj(gca,'Type','line'); % find all line handles
    set(lh,'LineWidth',2);           % increase line widths

% plot driving point free-decay
    subplot(2,1,2)
    plot(t, data(:,2))
    xlim(xbnds);
    xlabel('Time [seconds]')
    ylabel('Acceleration [g]')
    legend(chan(2))
    grid minor
% format line size
    lh = findobj(gca,'Type','line'); % find all line handles
    set(lh,'LineWidth',2);           % increase line widths


%% frequency info
nfft = 2^nextpow2(length(data)); % default to 2^n nfft lines - this zero pads a little
ns = nfft/2;                     % number of freq samples
fn = fs/2;                       % nuquist freq
f = fn*linspace(0,1,ns);         % single (positive) frequency vector [hz]


%% get single sided fft
dataFreq = fft(data,nfft);      % get double sided fft
dataFreq = dataFreq(1:ns,:);    % index left side 


%% get power/freq
dataFreqDB = mag2db(abs(dataFreq));


%% get usable frequency content of impulse
% usable freq content is generally taken to be 20 dB roll-off (i.e. the 
% frequency at 20dB less than the max dB)

% find max of freq logmag 
% note: don't need true scaling
[Y,I] = max(dataFreqDB(:,1));

% find 20dB roll-off amplitude
dropAmp = Y - 20;

% find index when amplitude drops below roll-off amplitude
% note: 
% * need to index to the right side of max freq location to guarentee its
% found
% * we'll then add in the missing indices to the left of the max freq
% location to be consistent
freqDropInd = find(dataFreqDB(I:end,1)<dropAmp,1,'first');
freqDropInd = freqDropInd + I;

% index freq vector to find usable frequency content
freqUsableContent = f(freqDropInd); % hz


%% plot fft log magnitude

xbnds = [0 700]; % frequency range to plot

figure
% plot impulse signal - absolute value and display in decibels 
    subplot(2,1,1)
    plot(f,dataFreqDB(:,1))
% insert line
    hold on
    % get x and y line values
    xx = [f(1) f(freqDropInd)];                                
    yy = [dataFreqDB(freqDropInd,1) dataFreqDB(freqDropInd,1)]; 
    % draw line
    lh = line(xx,yy);
    set(lh,'Color','r');
    hold off
% format
    xlim(xbnds)
    xlabel('Frequency [Hz]')
    ylabel('Power [dB]')
    lineLabel = {'Usable Freq'};
    legend([chan(1); lineLabel])
    grid minor
% format line size
    lh = findobj(gca,'Type','line'); % find all line handles
    set(lh,'LineWidth',2);           % increase line widths

% plot driving point free-decay - absolute value and display in decibels 
    subplot(2,1,2)
    plot(f,dataFreqDB(:,2))
% format
    xlim([0 1000])
    xlabel('Frequency [Hz]')
    ylabel('Power [dB]')
    legend(chan(2))
    grid minor
% format line size
    lh = findobj(gca,'Type','line'); % find all line handles
    set(lh,'LineWidth',2);           % increase line widths


