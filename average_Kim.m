function ave = average_Kim(x)
ave =sum(x(:))/ numel(x);
end 

function [m,s] = stat_Kim(x)
  n =length(x);
  m = sum(x)/n;
  s = sqrt(sum((x-m).^2 /n));
end 
