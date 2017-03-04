clear all
clear memory
clc
zz=1;
noc=40;             %no_of_classes
nots=10;                %no_of_training_set
[face,MAP]=imread('db\s1 (1).pgm');
[a,b]=size(face);
% Reading face from the databese for training set
counter=0;
y_train=[];

for i=1:noc
    for j=1:nots
        file=['db\s' int2str(i) ' (' int2str(j) ').pgm'];
        grayface=imread(file);
        vector_face=reshape(grayface,a*b,1);
        counter=counter+1;
        Covar_train(:,counter)=vector_face;
        d=(zeros(noc,1));d(i)=1;
        y_train=[y_train d];
    end
end
Covar_train=double(Covar_train)/255;
clear memory

AVERAGE=mean(Covar_train')';
Average_Matrix=(ones(noc*nots,1)*AVERAGE')';
clear memory

Difference=double(Covar_train)-double(Average_Matrix);
[V,D]=eig(Difference'*Difference);

s=sum(sum(D,2));
y=0;
for i=1:max(size(D)),
    y=y+D(i,i);
    if((1-(y/s))<=0.01)
        index=i;
        break;
    end
end


