function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)

  [X, y] = preprocess(path_to_testset, histogram, count_bins);
  [N M] = size(X);
  
  NewCol = ones(N,1);
  X(:, M + 1) = NewCol;

  path_to_cats = strcat( path_to_testset, 'cats/*.jpg');
  nr_cats = numel(dir(path_to_cats));
  path_to_not_cats = strcat( path_to_testset, 'not_cats/*.jpg');
  nr_not_cats = numel(dir(path_to_not_cats));
  nr = 0;
  y = w' * X';
  for i = 1:nr_cats
    if y(i) >= 0
      nr++;
    endif
  endfor
  for i = nr_cats + 1:N
    if y(i) < 0
      nr++;
    endif
  endfor

  percentage = nr / N;
endfunction