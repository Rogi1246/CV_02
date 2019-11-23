function H = homog(x1,y1,x2,y2,x3,y3,x4,y4 , xb1,yb1,xb2,yb2,xb3,yb3,xb4,yb4)

A=[
-x1  -y1  -1   0    0    0   x1*xb1   y1*xb1   xb1;
 0    0    0 -x1   -y1  -1   x1*yb1   y1*yb1   yb1;
-x2  -y2  -1   0    0    0   x2*xb2   y2*xb2   xb2;
 0    0    0 -x2   -y2  -1   x2*yb2   y2*yb2   yb2;
-x3  -y3  -1   0    0    0   x3*xb3   y3*xb3   xb3;
 0    0    0 -x3   -y3  -1   x3*yb3   y3*yb3   yb3;
-x4  -y4   -1  0    0    0   x4*xb4   y4*xb4   xb4;
 0    0    0  -x4  -y4  -1   x4*yb4   y4*yb4   yb4];
 
[U,S,V] = svd(A);
H = transpose(reshape(V(:, 9), [3, 3]));
#H=V(:,end); 
#H=reshape(H,3,3);

endfunction