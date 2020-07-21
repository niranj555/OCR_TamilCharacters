

function im=crop(im2,row,col)
%assert(nargin==3,'Number of arguments should be 3');


for i=1:row
    b=im2(i,1:col);
    if sum(b)>2
       % pause
        row1=i-9;break;
    end
    
end

for i=row:-1:1
    b=im2(i,1:col);
   
    %c=find(b);
    if sum(b)>2
        row2=i+9;break;
    end
    
end

row1

row2


im=imcrop(im2,[1 row1 col row2-row1]);