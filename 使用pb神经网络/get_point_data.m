%�ɼ����洢����������������ֱ������ѵ��net
colorVid = videoinput('kinect',1);
depthVid = videoinput('kinect',2);
triggerconfig(depthVid,'manual');
triggerconfig(colorVid,'manual');
depthVid.FramesPerTrigger = 1;
depthVid.TriggerRepeat = inf;
set(getselectedsource(depthVid),'EnableBodyTracking','on')%v2
start(depthVid);
% data=zeros(26,200);
%% ÿ�ද���ɼ�50��������data��
i=1;%ÿ�θ�һ��1-50��51-100...
while i<51
    trigger(depthVid);
    [~,~,depthMetadata] = getdata(depthVid);
    if sum(depthMetadata.IsBodyTracked) > 0
        skeletonJoints = depthMetadata.DepthJointIndices(:,:,depthMetadata.IsBodyTracked);
        sj=skeletonJoints([1 2 4 5 6 8 9 10 12 14 15 18 19],:);%��ȡ��Ҫ������
        sj=my_normalization(sj);%��һ��
        data(1:13,i)=sj(:,1);
        data(14:26,i)=sj(:,2);
        i=i+1
    end
end
%% �ɼ���ɺ�ͣ��
stop(depthVid);
%% ���ǩ
lebal=zeros(4,200);
for j=0:3
    for i=1+50*j:50+50*j
        lebal(j+1,i)=1;
    end
end
