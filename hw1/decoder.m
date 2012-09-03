fid=fopen('~/Git/ECE578/hw1.txt');
txt=fread(fid);
%remove beginning txt
txt=txt(1989:end);

%Count Character Occurrances
counters=zeros(1,26);
letters=97:97+25;
shift=0;
for i=1:length(txt)
    shift=shift+5;
    if txt(i)<97%change to lowercase
        txt(i)=txt(i)+32;
    end
    temp=txt(i)-97;
    txt(i)=mod(temp+shift,26)+97;
    
    for j=1:26
        if txt(i)==letters(j)
            counters(j)=counters(j)+1;
        end
    end
end

%full=sum(counters);

%q=counters/full;

%Ij=sum(freq_num.*q')
%break
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






