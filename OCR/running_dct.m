

set=zeros(375,(64*4));
y=zeros(375,1);
prune_count=1;

inc=1;
for k=1:34
for i=16:40
    for j=1:5
        
if(k<10)       
    path = ['E:\OCR_poroject\tamil_dataset_offline\usr_' num2str(i) '\00' num2str(k) 't0' num2str(j) '.tiff'];
else
    path = ['E:\OCR_poroject\tamil_dataset_offline\usr_' num2str(i) '\0' num2str(k) 't0' num2str(j) '.tiff'];
end
   
sum1=0;
 img=imread(path);
  
  
%img=imread(path);
  img=imresize(img,[64 64]);
  img1=uint8(img);
  loco=1;
  img1(img1==1)=255;
  %dct_img=dct2(img1);
  block_img=zeros(8,8); 
  m=1;n=1;
  while(m<65)
      n=1;
      while(n<65)
           
         
         block_img=img1(m:m+7,n:n+7);
         dct_img=dct2(block_img);
         arr=zigzag(dct_img);
         pruned_arr(prune_count:prune_count+3)=arr(1:4);
         prune_count=prune_count+4;
        
         
          
          n=n+8;
          
         
          
      end
       m=m+8;
      % m
       
           
  end
 % arr=zigzag(dct_img);
  set(inc,:)=pruned_arr(1:(64*4));
  %set(inc,:)=arr(1:(64*16));
  prune_count=1;
 
  
  
  %set(inc,:)= [reshape(img,[1,3600])];
     y(inc)=k+1;
        inc=inc+1;
        
        
       
       
%       for i=1:375
%           sum1=sum1+(y1(i)==y(i));
%       end
     
    end
end
end
assignin('base','set',set);
assignin('base','y',y);
      %predictOneVsAll(all_theta,trial);
      
         
       
       