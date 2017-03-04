clear all
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('M:\FaceRecognitionSystem\ProjectImages\img1.jpg');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
imgS=imcrop(I,BB);
figure,
imshow(imgS); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;