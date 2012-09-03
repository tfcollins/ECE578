%letter shifter
fid=fopen('~/Git/ECE578/hw1.txt');
txt=fread(fid);
%remove beginning txt
txt=txt(1989:end);
j=1;
shift=0;
column=zeros(1,ceil(length(txt)/5));
for i=1:length(txt)
    
    if (txt(i)>=65 && txt(i)<=65+25)||(txt(i)>=97 && txt(i)<=97+25)
        shift=shift+1;
    end
    if shift>=5
    if (txt(i)>=65 && txt(i)<=65+25)
        %remove bias
        column(j)=txt(i)+32;
        j=j+1;
        shift=0;
    elseif(txt(i)>=97 && txt(i)<=97+25)
        %remove bias
        column(j)=txt(i);
        j=j+1;
        shift=0;
    end
    end
    
    
end
column(column==0)=[];
char(column)



%Count Character Occurrances
counters=zeros(1,26);
letters=97:97+25;
shift=0;
for i=1:length(column)
    shift=shift+5;
    if column(i)<97%change to lowercase
        column(i)=txt(i)+32;
    end
    temp=column(i)-97;
    column(i)=mod(temp+shift,26)+97;
    
    for j=1:26
        if column(i)==letters(j)
            counters(j)=counters(j)+1;
        end
    end
end

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
