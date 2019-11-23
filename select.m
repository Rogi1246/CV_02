function[x, y] = select(img)
  figure
  imshow(img);
  [x, y] = ginput(4);
  hold on;
  plot(x,y, 'r.', 'linewidth', 5);
  hold off;
endfunction