function [x] = SST(A, b)
  [N M] = size(A);
  
  x(M) = b(M) / A(M,M);
  x = x';

  for i = M-1:-1:1
    s = 0;
    for j = i+1:M
      s = s + A(i, j) * x(j);
    endfor
    x(i) = (b(i) - s) / A(i, i);
  endfor
end
    