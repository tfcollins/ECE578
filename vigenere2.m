%letter shifter
fid=fopen('~/Git/ECE578/hw1.txt');
txt=fread(fid);
%remove beginning txt
txt=txt(1989:end);



shifts=[7 16 9 2 11];
txt(1)=mod((txt(1)-65)+shifts(2),26)+65;
txt(2)=mod((txt(2)-97)+shifts(3),26)+97;
txt(3)=mod((txt(3)-97)+shifts(4),26)+97;
txt(4)=mod((txt(4)-97)+shifts(5),26)+97;

j=1;
shift=0;
for i=1:length(txt)
    
    if (txt(i)>=65 && txt(i)<=65+25)||(txt(i)>=97 && txt(i)<=97+25)
        shift=shift+1;
    end
    if shift>=5 
    if (txt(i)>=65 && txt(i)<=65+25)
            %remove bias
            temp=txt(i);
            temp=temp-65;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+65;
            shift=0;
        elseif(txt(i)>=97 && txt(i)<=97+25)
            %remove bias
            temp=txt(i);
            temp=temp-97;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+97; 
            shift=0;
        end
    end
    
    
end
j=2;
%char(txt(1:30))'
shift=-1;
for i=1:length(txt)
    
    if (txt(i)>=65 && txt(i)<=65+25)||(txt(i)>=97 && txt(i)<=97+25)
        shift=shift+1;
    end
    if shift>=5 
    if (txt(i)>=65 && txt(i)<=65+25)
            %remove bias
            temp=txt(i);
            temp=temp-65;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+65;
            shift=0;
        elseif(txt(i)>=97 && txt(i)<=97+25)
            %remove bias
            temp=txt(i);
            temp=temp-97;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+97; 
            shift=0;
        end
    end
    
    
end
j=3;
%char(txt(1:30))'
shift=-2;
for i=1:length(txt)
    
    if (txt(i)>=65 && txt(i)<=65+25)||(txt(i)>=97 && txt(i)<=97+25)
        shift=shift+1;
    end
    if shift>=5 
    if (txt(i)>=65 && txt(i)<=65+25)
            %remove bias
            temp=txt(i);
            temp=temp-65;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+65;
            shift=0;
        elseif(txt(i)>=97 && txt(i)<=97+25)
            %remove bias
            temp=txt(i);
            temp=temp-97;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+97; 
            shift=0;
        end
    end
    
    
end
j=4;
%char(txt(1:30))'
shift=-3;

for i=1:length(txt)
    
    if (txt(i)>=65 && txt(i)<=65+25)||(txt(i)>=97 && txt(i)<=97+25)
        shift=shift+1;
    end
    if shift>=5 
    if (txt(i)>=65 && txt(i)<=65+25)
            %remove bias
            temp=txt(i);
            temp=temp-65;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+65;
            shift=0;
        elseif(txt(i)>=97 && txt(i)<=97+25)
            %remove bias
            temp=txt(i);
            temp=temp-97;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+97; 
            shift=0;
        end
    end
    
    
end
j=5;
%char(txt(1:30))'
shift=-4;

for i=1:length(txt)
    
    if (txt(i)>=65 && txt(i)<=65+25)||(txt(i)>=97 && txt(i)<=97+25)
        shift=shift+1;
    end
    if shift>=5 
    if (txt(i)>=65 && txt(i)<=65+25)
            %remove bias
            temp=txt(i);
            temp=temp-65;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+65;
            shift=0;
        elseif(txt(i)>=97 && txt(i)<=97+25)
            %remove bias
            temp=txt(i);
            temp=temp-97;
            temp=mod(temp+shifts(j),26);
            txt(i)=round(temp)+97; 
            shift=0;
        end
    end
    
    
end

txt_file=char(txt);
%save to file
fid2 = fopen('~/Git/ECE578/hw1_p2.txt','w');
fprintf(fid2,txt_file);


