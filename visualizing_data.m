%% failu nuskaitymas
% kaip pakrauti skaiciu faila
% clear
a = load('duomenys_skaiciai.csv'); %sitas metodas pats greiciausas (aktulau kai turi milijona irasu)
disp(a);
%% gauti failu sarasa
files = dir('duomenys_*');
files(1)

%% klaida bandant nuskaityi tekstine informacija
a = load('duomenys_su_tekstu.csv');

%% kiti metodai
b = importdata('duomenys_su_tekstu.csv') %nuskaitys kaip eilutes teksto

%% kiti metodai
c = uiimport('duomenys_su_tekstu.csv') 

%% kiti metodai - nesupranta tekstiniu stulpeliu
c = csvread('duomenys_su_tekstu.csv') 
c = dlmread('duomenys_su_tekstu.csv',',')

c = csvread('duomenys_skaiciai.csv') 
c = dlmread('duomenys_skaiciai.csv',',')
%% nuskaityti su tekstu
fid = fopen('duomenys_su_tekstu.csv');
b = textscan(fid,'%f %f %f %s','Delimiter',',','HeaderLines',1); %,'Delimiter',','
%disp([num2cell(b{1}) num2cell(b{2}) num2cell(b{3})]);
fclose(fid);

%% xlsread - naudoja excel - turi buti instaliuotas kompiuteryje
[a,b,c] = xlsread('duomenys_su_tekstu.csv')
[a,b,c] = xlsread('duomenys_excel.xlsx')
%% yahoo failas
fid = fopen('duomenys_yahoo.csv');
b = textscan(fid,'%s %f %f %f %f %f','Delimiter',',','HeaderLines',2); %,'Delimiter',','
fclose(fid);
d = [];
b{1};
d.date = datenum(b{1,1},'dd/mm/yyyy')';
d.open = b{2}';
d.high = b{3}';
d.low = b{4}';
d.close = b{5}';
d.volume = b{6}';
disp(d);

%% daugiau textscan yra helpe
help textscan

%% nupiesti
figure(1);
plot(d.date,d.close);
datetick; 
grid on;

%% 
figure(2);
plot(d.date,d.open);
datetick; 
grid on;
