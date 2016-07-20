%% fft example to show basics and look into scaling
%
% jdv 07212016

% temporal sampling info
fs = 100;       % 100 Hz (samples/second)
dt = 1/fs;      % time step/resolution
nSecs = 5;      % number of seconds
t = 0:dt:nSecs-dt; % sample for n second
L = length(t);  % length of vector

% build time signal
a1 = 5;     % amplitude of first signal
a2 = 7;     % amplitude of second
freq1 = 11; % freq location of first signal
freq2 = 23; % freq location of second
y = a1*sin(freq1*t*2*pi) + a2*sin(freq2*t*2*pi);

% plot time series
plot(t,y);

% get frequency content
nfft = length(y);
ns = nfft/2;                % no. spectral lines (single side)
fn = fs/2;                  % nyquist freq
f = fn*linspace(0,1,ns);    % single sided frequency vector [hz]
ff = fn*linspace(-1,1,ns*2); % double sided frequnecy vector [hz]

% fft of signal, y
yy = fft(y,nfft);       

% plot log mag
figure
plot(ff,mag2db(abs(yy)),'.-') % log mag

% plot imag/real components
figure
plot(ff,real(yy),'.-');
hold on
plot(ff,imag(yy),'.-');
hold off
legend({'real'; 'imag'})

% get single sided
P2 = abs(yy/L);              % scale two sided
P1 = P2(1:ns);               % single sided
P1(2:end-1) = 2*P1(2:end-1); % double amplitude for single side

% plot single dided
figure
plot(f,P1,'.-');


% psd
[pxx,f] = pwelch(y,[],[],[],fs);
figure
plot(f,mag2db(pxx));
plot(f,pxx);








