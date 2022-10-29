clear all;
close all;
clc;
 srcFiles = dir('D:\matlabproject\Training\*.png'); % takes all jpg image from this location
j=length(srcFiles);% check the lenghth of total images    
D=cell(j,2);%  a cell array having one column and rows equal to number of images
T =  zeros(386,1);

 k=3;
%  for training
for i=1:length(srcFiles)
    filename = strcat('D:\matlabproject\Training\',srcFiles(i).name);%pick image one by one
    I = imread(filename);%read image
    numrows=256;
    numcols=256;
    I = imresize(I,[numrows numcols]);
    gsImg = rgb2gray(I);% convert it into gray
    points = detectSURFFeatures(gsImg);% use sift detector
 [features, valid_points] = extractFeatures(gsImg, points); % extract feature points
 [m,n]=size(features);% calculate the  m and n based on feature size
D(i)=mat2cell(zeros(m,n,j),m,n,j);
 D{i} = features;% one by one feature matrix are saving at this location 
 A={'Golf-Swing-Back','Diving-side','Kicking-Front','Riding-Horse','Skate-boarding','walking','Lifting','Run-Side'};
 if(i<=60)
  D{i,2}= A{1};
 end
 if (i > 60) && (i <= 125)
  D{i,2}= A{2};
 end
  if (i > 125) && (i <= 148)
  D{i,2}= A{3};
  end
  if (i > 148) && (i <= 200)
  D{i,2}= A{4};
  end
 if (i > 200) && (i <= 250)
  D{i,2}= A{5};
 end
 if (i > 250) && (i <= 300)
  D{i,2}= A{6};
 end
 if (i > 300) && (i <= 350)
  D{i,2}= A{7};
 end
  if (i > 350) && (i <= 400)
  D{i,2}= A{8};
  end

 if(i<=60)
  T(i)= 1;
 end
 if (i > 60) && (i <= 125)
  T(i)= 2;
 end
  if (i > 125) && (i <= 148)
   T(i)= 3;
  end
  if (i > 148) && (i <= 200)
  T(i)= 4;
  end
 if (i > 200) && (i <= 250)
  T(i)= 5;
 end
 if (i > 250) && (i <= 300)
  T(i)= 6;
 end
 if (i > 300) && (i <= 350)
    T(i)= 7;
 end
  if (i > 350) && (i <= 400)
    T(i)= 8;
  end
%    figure; imshow(gsImg); hold on;
%    plot(valid_points.selectStrongest(50),'showOrientation',true);
%       path=strcat('D:\matlabproject\TrainingGrayImage\',srcFiles(i).name);
%        imwrite(gsImg,path);

end
G = cell(j,1);
  for s = 1 : length(D)
    X = D{s}; % Extract double array from cell.
     yourvector = X(:); %convert single feature as a  vector 
    yourvector =transpose(yourvector);%by taking transpose we convert it row vector
    G{s} =  yourvector;
  end
 M = max(cellfun(@numel, G));
 Q_Vic1_out = cellfun(@(x) [x zeros(1, M - numel(x))], G, 'un', 0);
 out =cell2mat(Q_Vic1_out);
 out=double(out);
 Z = linkage(out,'average','chebychev');
c = cluster(Z,'maxclust',8);
cutoff = median([Z(end-2,3) Z(end-1,3)]);
dendrogram(Z,'ColorThreshold',cutoff)
 
% [Acc,rand_index,match]=AccMeasure(T,idx);
% mac=[7,4,6,8,5,2,1,3];
% bar(mac);