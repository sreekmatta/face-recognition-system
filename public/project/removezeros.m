function op = removezeros(v)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

op=[];
for i=1:length(v),
    if(v(i)~=0)
        op=[op v(i)];
    end
end

end

