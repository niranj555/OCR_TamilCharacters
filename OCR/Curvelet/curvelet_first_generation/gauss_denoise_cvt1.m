% Image denoising in CVT domain using thresholding
% 
% References:
% [1] J.L. Starck, E.J. Candes, and D.L. Donoho, "The Curvelet Transform
% for Image Denoising," IEEE Trans. on Image Proc., Vol 11, No. 6, June
% 2002.
% 
% Author: Sandeep Palakkal (sandeep.dion@gmail.com)
% Date: May 22, 2010.

tic
clear
clc
% close all

im = imread('barbara_256x256.jpg');
im = double(im);
x = addwgn( im, 20 );

J = 4;
L = [3 4 4 5];

% Noise estimation
[wca wch wcv wcd] = dwt2( x, 'db2' );
sig = median(abs( wcd(:) ))/0.6472;
disp('noise estimation finished');

y = cvt( x, J, L, 1 );
disp('cvt finished');
load cvt_th_4_3445_mean_lasl_zero.mat
cth = cvt_llas_2_lasl( cvt_th );
cth = cellmul( cth, 3*sig );
nn = length( cth );
cth{nn} = cellmul( cth{nn}, 4/3 );
y = cvt_llas_2_lasl( y );
yd = cellmul( y, cellcompare( cellabs( y ), cth ) );
yd = cvt_lasl_2_llas( yd );
disp('detection finished');
xr = icvt( yd, J, L, 1 );
disp('icvt finished');
tim = toc/60; disp('time = ');
disp(tim);
psnr_est = psnr( im, xr );


figure
subplot(221)
imshow(x,[])
xlabel 'Noisy'
subplot(222)
imshow(xr,[])
xlabel 'Reconstructed CVT'
subplot(224)
imshow(im,[])
xlabel 'Original'