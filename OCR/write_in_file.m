function write_in_file(uni_code,fid)
%fid = fopen('files.txt', 'r+');

bytes1 = unicode2native(char(hex2dec(uni_code)),'UTF-8');
fwrite(fid, bytes1);

end

