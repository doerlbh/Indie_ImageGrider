% developed by Baihan Lin
% June 2016

prompt = 'Where is your pixel folder?: ';
disp('e.g.  /Users/DoerLBH/Dropbox/git/Indie_imageGrider/test');
path = input(prompt,'s');

% /Users/DoerLBH/Dropbox/git/Indie_imageGrider/test

disp(path);
disp(date);

pathPix = strcat(path, '/pixel');
pathKey = strcat(path, '/key');
pathOut = strcat(path, '/out-', date);

[~,pixList] = system(['find ' pathPix ' -type f -name "*.jpg"']);
pixs = strsplit(pixList);
pixs = unique(pixs);
pixs = pixs(~cellfun('isempty',pixs));
pixNum = length(pixs);

[~,keyList] = system(['find ' pathKey ' -type f -name "*.jpg"']);
keys = strsplit(keyList);
keys = unique(keys);
keys = keys(~cellfun('isempty',keys));
keyNum = length(keys);

pixw = 100;
pixh = 100;
keyw = 1000;
keyh = 1000;

pixspace = zeros(pixNum, 3);

for pindex = 1 : pixNum

origin = imread(pixs{pindex});
I = imresize(origin,[pixw pixh],'bilinear');
avgrgb = mean(mean(I));
avgr = avgrgb(:,:,1);
avgg = avgrgb(:,:,2);
avgb = avgrgb(:,:,3);
pixspace(pindex,:) = [avgr, avgg, avgb];

end

for kindex = 1 : length(keys)

    origin = imread(keys{pindex});


end
