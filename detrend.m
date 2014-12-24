function [output_args] = detrend(input_args)
    N = length(input_args);
    lambda = 200;
    I = speye(N);
    D2 = spdiags(ones(N-2,1)*[1 -2 1],[0 1 2],N-2,N);
    trend = (I+lambda^2*(D2'*D2))\input_args;
    output_args = input_args-trend;
end

