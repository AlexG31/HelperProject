%% 从xls读取数据
filepath='G:\新建文件夹\shuqiu\shuqiu\2015\';
filelist=dir(filepath);
if length(filelist)<3
    msgbox(filepath,'空文件夹！！');
end
xlsname=strcat(filepath,filelist(3).name);
data=xlsread(xlsname,'sheet1');

%% Try to disp data
dataLen=size(data,1);
area=zeros(1,dataLen);
volumn=zeros(1,dataLen);

for ind=1:dataLen
    area(ind)=data(ind,5)*data(ind,6);
    volumn(ind)=data(ind,5)*data(ind,6)*data(ind,7);
end
plot(area);
figure;
plot(data(:,2),area);


