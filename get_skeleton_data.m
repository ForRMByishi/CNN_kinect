%% ��ȡ�Ǽ�ͼƬ������ѵ��
%% Ԥ��
imaqhwinfo
colorVid = videoinput('kinect',1);
depthVid = videoinput('kinect',2);
triggerconfig(depthVid,'manual');
triggerconfig(colorVid,'manual');
depthVid.FramesPerTrigger = 1;
depthVid.TriggerRepeat = inf;
set(getselectedsource(depthVid),'EnableBodyTracking','on');
j=0 %����ɼ���ʼ�ļ���
%% �ɼ�(��ʼһ�κ�ÿ��ֻ��Ҫ���нڣ�
%start(depthVid);%��ʼ��ֹͣ�ֶ�����
figure;
for i=1:4
    trigger(depthVid);
    [depthMap,~,depthMetadata] = getdata(depthVid);
    imshow(depthMap,[0 4096]);
end
%stop(depthVid);
%����
skeletonJoints = depthMetadata.DepthJointIndices(:,:,depthMetadata.IsBodyTracked);
image = imread('E:\pic\white.jpg');
image=imresize(image,[400, 500]);
%λ��ȷ�������м�
a = skeletonJoints(2,1);
b = skeletonJoints(1,2);
a = a-250;
b = b-220;
skeletonJoints = skeletonJoints - [a,b];
%��ͼ
skeletonViewer2(skeletonJoints,image,1)
%�洢
I = getframe(gcf);
img = I.cdata;%I.cdata��ͼƬ���޸Ĵ�С227*227��
img = imresize(img,[227,227]);
imwrite(img,['E:\pic\data\',int2str(j),'.jpg']);
pause(1);%ͣ��Ԥ��
close;
j=j+1;