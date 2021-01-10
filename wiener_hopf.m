function [ g, SNR,yEstimate ] = wiener_hopf( u,y,lengthFIR)
%WIENER_HOPF identifies the Finite Impulse Response of a black-box system
%	[FIR,SNR]=wiener_hopf(u,y,lengthFIR) with known input (u) and output (y)
%	returns the coefficients of the Impulse Response as well as the
%	Signal to noise ratio (in dB) of original vs reconstructed signals
%
%	Users are encouraged to try various response lengthes and retain the one 
%	yielding the highest noise-to-signal ratio
%
%	Reference: Karel J. Keesman "System Identification, an Introduction"
%	Author: Nicolas JOBERT 
%	Created: 2019-02-13
u=u(:);
[lengthRecord,~]=size(u);

maxlag=lengthFIR-1;
ruu=xcorr(detrend(u),maxlag);    % from -maxlag to maxlag
ruy=xcorr(detrend(u),detrend(y),maxlag);

R=zeros(lengthFIR);
for ind=1:lengthFIR,
    shift=ind-1;
    R(:,ind)=ruu(maxlag+1-shift:maxlag+lengthFIR-shift);
end

ruy=flipud(ruy(1:maxlag+1));
g=R\ruy;

yEstimate=conv(g,u);
yEstimate=yEstimate(1:lengthRecord);
modelError=y-yEstimate; 
SNR=10*log10(var(y(lengthFIR+1:end))/var(modelError(lengthFIR+1:end)));    % dB


end
