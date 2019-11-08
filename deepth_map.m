% ���ͼ���ȡ���������
%% Ԥ��
colorVid = videoinput('kinect',1);
depthVid = videoinput('kinect',2);
triggerconfig(depthVid,'manual');
triggerconfig(colorVid,'manual');
depthVid.FramesPerTrigger = 1;
depthVid.TriggerRepeat = inf;
set(getselectedsource(depthVid),'EnableBodyTracking','on')%kinect v2��v1��ͬ��
%% �����õ�10֡��ȡ���һ֡
start(depthVid);figure;
for i=1:10
    trigger(depthVid);
    [depthMap,~,depthMetadata] = getdata(depthVid);%~��Ϊ�����������
    imshow(depthMap,[0 4096]);
end
stop(depthVid);
%% ���ƹǼ�ͼƬ
skeletonJoints = depthMetadata.DepthJointIndices(:,:,depthMetadata.IsBodyTracked);
imshow(depthMap,[0 4096]);
hold on;plot(skeletonJoints(:,1),skeletonJoints(:,2),'*');