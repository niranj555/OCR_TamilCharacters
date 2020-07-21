
file_name='ganesh_image.jpg';
assert(exist(file_name,'file')~=0,'File %s not found!',file_name);


img5=imread(file_name);

imshow(img5);
assert(size(img5,3)==3,'Input image should be in RGB Format');
img=rgb2gray(img5);
img=img5
charCount=0;
characters=zeros(10,(64*4));
prun_count=1;
figure,
imshow(img);
% img=not(img);
[row col]=size(img);
assert(and(row>20,col>20),'Number of rows and number of columns should be at least 20!')

%otsuthreshold=graythresh(img);
img=im2bw(img,0.7);%otsuthreshold);

imshow(img);
figure,

disp(col);

[row col]=size(img);
row
col



insid=0;
iter=ones(row,1);
col=col-1;
i=1;
img=bwareaopen(img,20);
figure,
imshow(img);

img=bwmorph(img,'majority');
imshow(img);
while i<=col
    i
    check=isequal(img(:,i),iter);
    check=~check;
    insid=0;
    if check
        
        start=i;
        start
        stop=i;
        
        width=1;
        j=i;
       
        while and(check,j<=col) 
           
            insid=1;
          stop=stop+1;
          width=width+1;
          j=j+1;
           check=isequal(img(:,j),iter);
           check=~check;
        end
        
        if width >= 10
        figure,
        stop
        width
        letter=imcrop(img,[start 1 width row]);
        
%         add=ones(row,40);
%         letter=[add letter];
%         letter=[letter add];
        [r c]=size(letter);
       letter=not(crop(not(letter),r,c));
           
       imshow(letter);
        
        %        letter=bwmorph(letter,'erode');
%         letter=bwmorph(letter,'erode');
        st=imresize(letter,[64,64]);
        st1=uint8(st);
        st1(st1==1)=255;
       % dct_st1=dct2(st1);
        block_img=zeros(8,8); 
        for m=1:8:57
            for n=1:8:57
               % block_img=dct_st1(m:m+7,n:n+7);
                block_img=st1(m:m+7,n:n+7);
                dct_st1=dct2(block_img);
              % arr=zigzag(block_img);
                arr=zigzag(dct_st1);
                pruned_arr(prun_count:prun_count+3)=arr(1:4);
                prun_count=prun_count+4;
         
            end
         end
         %arr=zigzag(dct_st1);
        
        charCount=charCount+1;
        characters(charCount,:)=pruned_arr(1:(64*4));
        
        prun_count=1;
        
        
        
        end
    end
  if insid==0
      i=i+1;
  else
      i=i+width;
  end
end

            