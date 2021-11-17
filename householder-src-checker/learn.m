function [w] = learn(X, y)
  [N M] = size(X);
  
  X_bias = X;
  NewCol = ones(N,1);
  X_bias(:, M+1) = NewCol;
  
  [Q, R] = Householder(X_bias);
  
  w = SST(R, Q' * y);
end