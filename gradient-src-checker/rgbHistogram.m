function [sol] = rgbHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  Red = img(:,:,1);
  Green = img(:,:,2);
  Blue = img(:,:,3);
  
  for i = 0:count_bins-1
    v(i+1) = i*256/count_bins;
  endfor
  
  v(count_bins + 1) = 256;
 
  Red = Red(:)';
  Green = Green(:)';
  Blue = Blue(:)';
  
  histc_Red = histc(Red, v);
  histc_Green = histc(Green, v);
  histc_Blue = histc(Blue, v);
  
  histc_Red(count_bins+1)=[]; 
  histc_Green(count_bins+1)=[];  
  histc_Blue(count_bins+1)=[];
  
  sol = [histc_Red, histc_Green, histc_Blue];
  
end