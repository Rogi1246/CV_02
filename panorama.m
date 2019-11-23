function panorama
  %assignment by :
  %Group F
  %Vanessa Retz(117380), Lennard Gabriel(118147), Florian Batze(119135)
  %
  %read first image (the sequence is a bit mixed up, it works the best this way)
  image = imread('img3.jpeg');
  %select points from image 
  [x,y] = select(image);
  disp(' X : '),disp(x);
  disp(' Y : '),disp(y);
  %transfer points
  p1 = [x(1), y(1), 1];
  disp('P1 : '),disp(p1');
  disp('P1.x = '),disp(p1(1));
  disp('P1.y = '),disp(p1(2));
  
  p2 = [x(2), y(2), 1];
  disp('P2 : '),disp(p2');
  
  p3 = [x(3), y(3), 1];
  disp('P3 : '),disp(p3');
  
  p4 = [x(4), y(4), 1];
  disp('P4 : '),disp(p4');
  
  %read second image
  image2 = imread('img1.jpeg');
  %select points
  [x1, y1] = select(image2);
  disp(' X1 : '),disp(x1);
  disp(' Y1 : '),disp(y1);
  %transfer
  p11 = [x1(1), y1(1), 1];
  disp('P11 : '),disp(p11');
  
  p12 = [x1(2), y1(2), 1];
  disp('P12 : '),disp(p12');
  
  p13 = [x1(3), y1(3), 1];
  disp('P13 : '),disp(p13');
  
  p14 = [x1(4), y1(4), 1];
  disp('P14 : '),disp(p14');
  
  %feed into homography function
  H = homog(p1(1), p1(2), p2(1), p2(2), p3(1), p3(2), p4(1), p4(2), p11(1), p11(2), p12(1), p12(2), p13(1), p13(2), p14(1), p14(2));
  disp(H);
  %created image is temporary 
  im_temporary = geokor(H, image, image2);
  %select corresponding points of temp image
  [x2, y2] = select(im_temporary);
  disp(' Xtemp : '),disp(x2);
  disp(' Ytemp : '),disp(y2);
  %transfer
  p21 = [x2(1), y2(1), 1];
  disp('P11 : '),disp(p21');
  
  p22 = [x2(2), y2(2), 1];
  disp('P12 : '),disp(p22');
  
  p23 = [x2(3), y2(3), 1];
  disp('P13 : '),disp(p23');
  
  p24 = [x2(4), y2(4), 1];
  disp('P14 : '),disp(p24');
  %read last image
  image3 = imread('img2.jpeg');
  [x3, y3] = select(image3);
  disp(' X3 : '),disp(x3);
  disp(' Y3 : '),disp(y3);
  %transfer
  p31 = [x3(1), y3(1), 1];
  disp('P11 : '),disp(p31');
  
  p32 = [x3(2), y3(2), 1];
  disp('P12 : '),disp(p32');
  
  p33 = [x3(3), y3(3), 1];
  disp('P13 : '),disp(p33');
  
  p34 = [x3(4), y3(4), 1];
  disp('P14 : '),disp(p34');
  %feed the homog function again with the new points
  H1 = homog(p31(1), p31(2), p32(1), p32(2), p33(1), p33(2), p34(1), p34(2), p21(1), p21(2), p22(1), p22(2), p23(1), p23(2), p24(1), p24(2));
  disp(H1);
  %create the final stitched image 
  im_final = geokor(H1, image3, im_temporary);
  imwrite(im_final, 'resulting_mosaic.jpeg');
  
  endfunction
