%affine decoder
fid=fopen('R:\git~1\ECE578\hw1.txt');
txt=fread(fid);
%remove beginning txt
txt=txt(298:1968);

%F=a*m+b
%a=7,b=13
%a=1:2:15;

txt_saved=txt;
for a=[7]
for b=0:25
    txt=txt_saved;
    for i=1:length(txt) 
        if (txt(i)>=65 && txt(i)<=65+25)
            %remove bias
            temp=txt(i);
            temp=temp-65;
            a_temp=mod(26-a,26);
            temp=mod(round(a_temp*(temp-b)),26);
            txt(i)=round(temp)+65;
        elseif(txt(i)>=97 && txt(i)<=97+25)
            %remove bias
            temp=txt(i);
            temp=temp-97;
            a_temp=mod(26-a,26);
            temp=mod(round(a_temp*(temp-b)),26);
            txt(i)=round(temp)+97;
        end       
    end
    char(txt(1:30))'
    pause
end
end