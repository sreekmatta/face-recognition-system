function [ LoadImgs ] = LoadImgs( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
b=vision.CascadeObjectDetector;
temp=imread('M:\FaceRecognitionSystem\ProjectImages\img1.jpg');
l=rgb2gray(temp);
BB=step(b,l);
hold on
imgS=imcrop(l,BB);
imshow(imgS);
%imresize(imgS);
imwrite(imgS,'newfile.jpg');
end

