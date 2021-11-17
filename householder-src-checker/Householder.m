function [Q, R] = Householder(A)
  [M N] = size(A);
  Q = eye(M);

  for i = 1 : min(M-1, N)
    sum = -norm(A(i:M, i));
    if A(i, i) < 0
      sum = -sum;
    end;

    # calcularea reflectorului Householder
    v(1:M, 1) = 0;
    v(i) = A(i, i) + sum;
    v(i + 1:M) = A(i + 1:M, i);

    beta = sum * v(i);

    if beta != 0
      # transformare coloana i din A_i
      A(i, i) = -sum;
      A(i + 1:M, i) = 0;

      # transformare coloanele i+1:N din A_i
      for j = i + 1:N
        trans = v(i:M)' * A(i:M, j) / beta;
        A(i:M, j) = A(i:M, j) - trans * v(i:M);
      end;

      # transformare coloanele 1:N din H
      for j = 1:M
        trans = v(i:M)' * Q(i:M, j) / beta;
        Q(i:M, j) = Q(i:M, j) - trans * v(i:M); 
      end;
     end
  end;

  R = A;
  Q = Q';
endfunction