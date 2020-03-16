%newrb(P,T,goal,spread,MN,DF)����
%P��T�ֱ����ѵ����������������goalΪ��������Ŀ�꣬SPREEDΪ���������չ�ٶȣ�MNΪ������Ԫ������
%����Ԫ��������MN������ֹͣ����ѵ����DF��ÿ�μӽ��������������ֻ�������ʱ����
%net = newrb(p_train,t_train,0.001,1,25,5);
clear
clc
%����ѵ���������뼯
load data;
%��һ��
data1=data';
data=mapminmax(data1,0,1);
data=data';
num=2;%��Ӧ�ĸ�����
%����ѵ�������Լ�
x_train=[data(1:48,1).';data(1:48,2).';data(1:48,3).';data(1:48,4).'];
x_test=[data(49:51,1).';data(49:51,2).';data(49:51,3).';data(49:51,4).'];
y_train=[data(2:49,num).'];
y_test=[data(50:52,num).'];
%������ѵ������
net=newrb(x_train,y_train,0.001,1,25,5);

%��ѵ�����Ͳ��Լ��ϵı���
y_train_predict=sim(net,x_train);
y_test_predict=sim(net,x_test);
%��ͼ �ֱ���ѵ�����Ͳ��Լ���
figure
hold on
grid
subplot(1,2,1)
plot(1:length(y_train_predict),y_train_predict,'*',1:length(y_train_predict),y_train,'o')
title('In Train data')
subplot(1,2,2)
plot(1:3,y_test_predict,'*',1:3,y_test,'o')
title('In Test data')
%������ ѵ�����Ͳ��Լ�
train_error=sum(abs(y_train_predict- y_train))/length(y_train);
test_error=sum(abs(y_test_predict- y_test))/length(y_test);




