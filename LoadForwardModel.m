% load model data
switch(n)
    case 1
        homo = load('homoN100.mat');
        alphadata = load('alpha100.mat');        
    case 1.33
        homo = load('homoN133.mat');
        alphadata = load('alpha133.mat');             
    case 1.44
        homo = load('homoN144.mat');
        alphadata = load('alpha144.mat');             
end
        
        
alphadata = alphadata.alphadata;
ind = find(alphadata(:,4) ~= 0);
alphacoeffs = polyfit(alphadata(ind,2), alphadata(ind,4), 5);        


