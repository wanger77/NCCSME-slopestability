function me = ME(Data)
% input arguments: data is a n*n dimetions matrix, column labels: [[botton,upper], internel]
[dim_0, ~] = size(Data);
me = sum(abs(eig(Data) - sum(eig(Data))/dim_0));
end


