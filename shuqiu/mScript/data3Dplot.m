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
% 3d surf
% sin (pi*x/2)
r=data(1,5)+data(1,6);
r=r/2;
R=r;

r=R*2;
x=linspace(-r,r,1e2);
y=linspace(-r,r,1e2);
r=10*R;
ground_x=linspace(-r,r,1e2);
ground_y=linspace(-r,r,1e2);
[gX,gY]=meshgrid(ground_x,ground_y);

[X,Y]=meshgrid(x,y);
ground=zeros(size(gX));

scale_ratio=0.5;
Z=cos(scale_ratio.*sqrt(gX.^2+gY.^2)./R.*pi./2);
region=sqrt(gX.^2+gY.^2);
Z(region.*scale_ratio>R)=0;
surf(gX,gY,Z);


dx=120;
dy=160;
Z=cos(scale_ratio.*sqrt((gX+dx).^2+(gY+dy).^2)./R.*pi./2);
region=sqrt((gX+dx).^2+(gY+dy).^2);
Z(region.*scale_ratio>R)=0;

hold on;
surf(gX,gY,0.4.*Z);


