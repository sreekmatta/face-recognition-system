function class_label=PCA_gui(grayf)

zz=1;
noc=40;             %no_of_classes
nots=9;                %no_of_training_set
[face,MAP]=imread('db\s1 (1).pgm');
[a,b]=size(face);
% Reading face from the databese for training set
counter=0;
for i=1:noc
    for j=1:nots
        file=['db\s' int2str(i) ' (' int2str(j) ').pgm'];
        grayface=imread(file);
        vector_face=reshape(grayface,a*b,1);
        counter=counter+1;
        Covar_train(:,counter)=vector_face;
    end
end
Covar_train=double(Covar_train)/255;
% Reading face from the databese for test set
vector_face=reshape(grayf,a*b,1);
Covar_test(:,1)=vector_face;

clear memory
Covar_test=double(Covar_test)/255;
AVERAGE=mean(Covar_train')';
Average_Matrix=(ones(noc*nots,1)*AVERAGE')';
clear memory

Difference=double(Covar_train)-double(Average_Matrix);
[V,D]=eig(Difference'*Difference);
Eigen_train=Difference*V;
[A,B]=size(Covar_train);

Pro_train=Eigen_train'*double(Difference);
clear Average_Matrix

Average_Matrix=(ones((10-nots),1)*AVERAGE')';

At_test=Eigen_train'*double(double(Covar_test)-Average_Matrix);
clear temp
counter=0;

    error=[];
    for j=1:noc*nots
        temp=(At_test(:,1)-Pro_train(:,j))';
        distance=sqrt(temp*temp');
        error=[error distance];
    end
    Minimum_Error=max(error);
    for k=1:noc*nots
        if error(k)<Minimum_Error
            Minimum_Error=error(k);
            holder=k;
        end
    end 
   class_label=ceil(holder/nots); 
end