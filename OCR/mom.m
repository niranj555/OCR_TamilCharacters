charCount=0;
prun_count=1;
letter=imread('b.tiff');   
st=imresize(letter,[64,64]);
        st1=uint8(st);
        st1(st1==1)=255;
        dct_st1=dct2(st1);
        block_img=zeros(8,8); 
        for m=1:8:57
            for n=1:8:57
                block_img=dct_st1(m:m+7,n:n+7);
                arr=zigzag(block_img);
                pruned_arr(prun_count:prun_count+7)=arr(1:8);
                prun_count=prun_count+8;
         
            end
         end
         %arr=zigzag(dct_st1);
        
        charCount=charCount+1;
        characters(charCount,:)=pruned_arr(1:(64*8));
        
       