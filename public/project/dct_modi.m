function  dct_per= dct_modi( x )

zz=1;
noc=40;             %no_of_classes
nots=x;                %no_of_training_set
face=imread('db\s1 (1).pgm');
[a,b]=size(face);
y_train=[];
% Reading face from the databese for training set
mask = zeros(8,8);mask(1,1)=1;
counter=0;
for i=1:noc
    for j=1:nots
        file=['db\s' int2str(i) ' (' int2str(j) ').pgm'];
        grayface=imread(file);
        grayface=imhist(grayface);
        grayface=im2double(grayface);
        T = dctmtx(8);
        B = blkproc(grayface,[8 8],'P1*x*P2',T,T');
        B2 = blkproc(B,[8 8],'P1.*x',mask);
        fun=@(block_struct) block_struct(1,1);
        B2 = blkproc(B2,[8,8],fun);
        vector_face=zigzag(B2);
        vector_face=vector_face(:);
        counter=counter+1;
        Covar_train(:,counter)=vector_face;
    end
end

% Reading face from the databese for test set
counter=0;
for i=1:noc
    for j=nots+1:10
        file=['db\s' int2str(i) ' (' int2str(j) ').pgm'];
        grayf=imread(file);
        grayf=imhist(grayf);
        grayf=im2double(grayf);
        T = dctmtx(8);
        B = blkproc(grayf,[8 8],'P1*x*P2',T,T');
        B2 = blkproc(B,[8 8],'P1.*x',mask);
        fun=@(block_struct) block_struct(1,1);
        B2 = blkproc(B2,[8,8],fun);
        vector_face=zigzag(B2);
        vector_face=vector_face(:);
        counter=counter+1;
        Covar_test(:,counter)=vector_face;
    end
end
clear memory
counter=0;

for i=1:noc*(10-nots)
    error=[];
    for j=1:noc*nots
        temp=(Covar_test(:,i)-Covar_train(:,j))';
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
    if ceil(holder/nots)==ceil(i/(10-nots))
        counter=counter+1;
    end
end

dct_per=(counter/(noc*(10-nots)))*100

end

