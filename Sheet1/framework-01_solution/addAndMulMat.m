% <solution>
function [Sum,Prod] = addAndMulMat(M,N)
    Prod = 0;
    
    if (size(M) == size(N))
        Sum = M + N;
        if (nargout > 1)
            Prod = M * N;
        end
    else
        error('Matrix size does not match');
    end
end
% </solution>
