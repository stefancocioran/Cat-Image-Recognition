function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  
  path_to_cats = strcat( path_to_dataset, 'cats/*.jpg');
  path_to_not_cats = strcat( path_to_dataset, 'not_cats/*.jpg');
  
  nr_cats = numel(dir(path_to_cats));
  nr_not_cats = numel(dir(path_to_not_cats));
  
  M = count_bins * 3;
  N = nr_cats + nr_not_cats;

  X = zeros(N, M);
  y = zeros(1, N);
  
  path_to_cats = strcat( path_to_dataset, 'cats/');
  path_to_not_cats = strcat( path_to_dataset, 'not_cats/');
  
  cat_pics = getImgNames(path_to_cats);
  not_cat_pics = getImgNames(path_to_not_cats);
  
  it = 1;
  for i = 1:nr_cats
    if strcmp(histogram, 'RGB') == 1
      path_to_file = strcat(path_to_cats, cat_pics(i,:));
      X(it,:) = rgbHistogram(path_to_file, count_bins);
      y(it) = 1;  
      it++;
    else
      path_to_file = strcat(path_to_cats, cat_pics(i,:));
      X(it,:) = hsvHistogram(path_to_file, count_bins);
      y(it) = 1;  
      it++;
    endif
  endfor
  
  for i = 1:nr_not_cats
    if strcmp(histogram, 'RGB') == 1
      path_to_file = strcat(path_to_not_cats, not_cat_pics(i,:));
      X(it,:) = rgbHistogram(path_to_file, count_bins);
      y(it) = -1;  
      it++;
    else
      path_to_file = strcat(path_to_not_cats, not_cat_pics(i,:));
      X(it, :) = hsvHistogram(path_to_file, count_bins);
      y(it) = -1;  
      it++;
    endif
  endfor
  y = y';
endfunction
