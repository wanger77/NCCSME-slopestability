function a = CNNCS(phi,data)
% input: phi is a confidence level, data is a matrix of n*1 size.
% output :an arrar with dimention 1*3 
r_k = size(data(:,1),1);
h_m1k = mean(data);
Sig_1k = std(data);
lb = h_m1k-phi*Sig_1k/sqrt(r_k);
lu = h_m1k+phi*Sig_1k/sqrt(r_k);
a = [lb,lu,h_m1k];
end

