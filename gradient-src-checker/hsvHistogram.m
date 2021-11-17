function [sol] = hsvHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  Red = double(img(:,:,1));
  Green = double(img(:,:,2));
  Blue = double(img(:,:,3));
  
  for i = 0:count_bins-1
    v(i+1) = i*1.01/count_bins;
  endfor
  
  v(count_bins + 1) = 1.01;
 

  Red = Red(:)'/255;
  Green = Green(:)'/255;
  Blue = Blue(:)'/255;
  
 
  C_max = max([Red;Green;Blue]);
  C_min = min([Red;Green;Blue]);
  
  delta = C_max - C_min;
  
  H(delta == 0) = 0;
  var_1 = (delta ~= 0 & C_max == Red);
  H(var_1) = 60 * mod((Green(var_1) - Blue(var_1)) ./ delta(var_1), 6);
  
  var_2 = (delta ~= 0 & C_max == Green);
  H(var_2) = 60 * ((Blue(var_2) - Red(var_2)) ./ delta(var_2) + 2);
  
  var_3 = (delta ~= 0 & C_max == Blue);
  H(var_3) = 60 * ((Red(var_3) - Green(var_3)) ./ delta(var_3) + 4);
   
  H = H/360;
  
  S(C_max == 0) = 0;
  S(C_max ~= 0) = delta(C_max ~= 0) ./C_max(C_max ~= 0);
  
  V = C_max;

  histc_H = histc(H, v);
  histc_H(count_bins+1)=[];
  
  histc_S = histc(S, v);
  histc_S(count_bins+1)=[];
  
  histc_V = histc(V, v);
  histc_V(count_bins+1)=[];
  
  sol = [histc_H, histc_S, histc_V];
 
end