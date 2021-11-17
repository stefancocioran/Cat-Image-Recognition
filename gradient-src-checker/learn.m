function [w] = learn(X, y, lr, epochs)
  [N M] = size (X);
  batch_size = 64;
  
  X(:,1:M) = (X(:,1:M) - mean(X(:,1:M))) ./ std(X(:,1:M));
  
  NewCol = ones(N,1);
  X(:, M + 1) = NewCol;
 
  
  w = -0.1 + (0.1+0.1) .* rand(M+1, 1);
  
  for it = 1:epochs
    idx = randperm(size(X,1));
    X_batch = X(idx(1:batch_size),:);
    y_batch = y(idx(1:batch_size));
    s = 0;
    for j = 1:batch_size
      s = s + (X_batch(j,:) * w - y_batch(j)) .* X_batch(j, 1:M+1);     
    endfor
    w(1:M+1) = w(1:M+1) - (lr * 1/N) * s(:);
  endfor
  
end
