%ѵ������
skeleton_ds = imageDatastore('E:\pic\data','IncludeSubfolders',true,'LabelSource','foldernames');%ѵ��ͼƬ��ַ
trainImgs = skeleton_ds;
numClasses = numel(categories(skeleton_ds.Labels));
net = alexnet;
layers = net.Layers;
layers(end-2) = fullyConnectedLayer(numClasses);
layers(end) = classificationLayer;
options = trainingOptions('sgdm','InitialLearnRate', 0.001);
[skeletonnet,info] = trainNetwork(trainImgs, layers, options);%������skeletonnet
