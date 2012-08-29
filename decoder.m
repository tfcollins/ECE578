fid=fopen('R:\git~1\ECE578\hw1.txt');
txt=fread(fid);
%remove beginning txt
txt=txt(298:1968);

%Count Character Occurrances
counters=zeros(1,26);
letters=97:97+25;
for i=1:length(txt)
    if txt(i)<97%change to lowercase
        %txt(i)=txt(i)+32;
    end
    for j=1:26
        if txt(i)==letters(j)
            counters(j)=counters(j)+1;
        end
    end
end


%custom additions
%counters(int8('n')-96)=counters(int8('n')-96)+4;


[b,sorted]=sort(counters);
sorted=flipdim(sorted,2);
sorted=sorted+96;
%remove unwanted characters
sorted((sorted>=65+26)&(sorted<=96)|(sorted<65)|(sorted>97+25))=[];
disp(['Top characters: ',char(sorted),]);



txt_final=zeros(1,length(txt));
for i=1:26
    if sorted(i)>96
        disp(['Cipher: ',char(sorted(i)),' == Plaintext: ',char(freq(i)+32)]);
        %replace letter
        txt_final(txt==sorted(i))=freq(i)+32;
        
    else
        disp(['Cipher: ',char(sorted(i)),' == Plaintext: ',char(freq(i)+32)]);
        txt_final(txt==sorted(i))=freq(i);
    end

end
char(txt_final(1:30))
char(txt(1:30))'





