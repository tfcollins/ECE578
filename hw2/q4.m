%Question 4
initial=[0 1];
taps=[1 1];

initial2=[0 0 1];
taps2=[1 0 1];

initial3=[0 0 0 0 1];
taps3=[0 1 0 0 1];

output=[];
output2=[];
output3=[];

total=xor(initial2(end),initial3(end));
for i=1:(31*7*3)*4-1
    %LFSR1
    output=[output initial(end)];
    new=mod(sum(initial.*taps),2);
    initial(2:length(initial))=initial(1:length(initial)-1);
    initial(1)=new;
    
    %LFSR2
    if output(end)==1
        output2=[output3 initial2(end)];
        new=mod(sum(initial2.*taps2),2);
        initial2(2:length(initial2))=initial2(1:length(initial2)-1);
        initial2(1)=new;
    else%LFSR3
        output3=[output3 initial3(end)];
        new=mod(sum(initial3.*taps3),2);
        initial3(2:length(initial3))=initial3(1:length(initial3)-1);
        initial3(1)=new;
    end
    
    total=[total xor(initial3(end),initial2(end))];
    
end
%Check
col=reshape(total,(31*7*3),4);
col=sum(col(:,1)==col(:,2)==col(:,3)==col(:,4));
if (col==length(total)/4)
    disp('Correct Length');
end
    