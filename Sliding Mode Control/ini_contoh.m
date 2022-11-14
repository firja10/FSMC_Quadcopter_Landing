clear all;

A = [1;2;3;4];
B = [1;2;5;6];

s = A == B;

similarity = sum(s)/numel(s);

if(find(s,1))
    fprintf('Ada Yang Sama');
else 
    fprintf('Tidak Ada yang Sama');
end


