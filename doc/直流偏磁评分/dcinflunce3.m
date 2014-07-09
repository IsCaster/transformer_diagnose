function [Id,Ie,P1,P2,U1,U2,T,S]=dcinflunce3()
Input_data=xlsread('data_dc.xlsx','B1:B8');%
Id=Input_data(1);%读取中性点直流电流值
In=Input_data(4);%额定电流值
Id=Id/In;
Ie=(0.007+0.131*Id+167.578*Id^2-604.9*Id^3);%根据文献数据拟合出来的励磁电流与中性点直流关系（标幺值）
P1=8.034+1.378*log(Ie);%励磁电流与正半周功率的关系
P2=exp(-1.294+0.01/Ie);%励磁电流与负半周功率的关系
Sn=Input_data(2);%额定容量
Un=Input_data(3);%额定电压值
Pn=Input_data(5);%额定负载损耗
P0n=Input_data(6);%额定空载损耗
%————转换为有名值
P1=P1*Sn;
P2=P2*Sn;
%——————计算损耗
%铁心损耗增量
P0=(P1+P2)/2-P0n;
PL=Pn*((1+Id/In)^2-1)/2;%负载损耗增量
P=P0+PL;%变压器偏磁下总损耗增量
%只考虑损耗增量造成的温升，正常损耗下的温升可以通过冷却装置控制
%——————计算温升
s=Input_data(7);%直流偏磁时间（单位：小时）
s=s*3600;
Tn=Input_data(8);%额定负载下的顶层油温升
Q=P*s;
T1=Q/(2.06*46.5*1000);%直流偏磁下顶层油温升的增量
T=T1+Tn;%直流偏磁下顶层油温升值
%——————计算温升的影响
if T<60
    s(1)=exp(-T^2/1800);
else s(1)=0;
end
S=s(1)*100;%得到状态分值
xlswrite('dcinfluence.xlsx',T1,'sheet1','A2:A2');
xlswrite('dcinfluence.xlsx',S,'sheet1','B2:B2');
end