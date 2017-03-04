num=[1,2,3,4 ,5,6,7,8,9];
perfor=[];
perfor_dct=[];
i=1;
for l=1:length(num),
    perfor=[perfor PCA_Face_Recognition(num(l))];
    perfor_dct=[perfor_dct dct_fun(i)];
    i=i+1;
end
figure
plot(num*10,perfor,num*10,perfor_dct);
legend('PCA','DCT','Location','southeast');
xlabel('% of training data');
ylabel('accuracy on test data');




