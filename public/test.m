b=vision.CascadeObjectDetector;
temp=imread('M:\FaceRecognitionSystem\ProjectImages\Album\a.jpg');
l=rgb2gray(temp);
imshow(l);
BB=step(b,l);
hold on
for i=1:size(BB,1)
rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end