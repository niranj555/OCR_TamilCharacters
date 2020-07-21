% img=imread('a.jpg');
% 
% 
% %%
% gray=rgb2gray(img);
% img=im2bw(gray);
str='      ';
   fid=fopen('files.txt','w');
   fclose(fid);
  charCount=4
 for i=1:charCount
 img=characters(i,:);
 
 display(['Image ',num2str(i)]);
  fid=fopen('files.txt','a');
 pred = predictOneVsAll(all_theta, img);
 if pred==1
     write_in_file('0B85',fid);
 elseif pred==2
     write_in_file('0B86',fid);
 elseif pred==3
     write_in_file('0B87',fid);
 elseif pred==4
     write_in_file('0B88',fid);
 elseif pred==5
     write_in_file('0B89',fid);
 end 
 fprintf(fid,'%s',str);
  fclose(fid);
 end

 