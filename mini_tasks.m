%% 1. suma 2 vektoriu
a = randn(1, 10);
b = randn(1, 10);
c = 0;

for i = 1:length(a)
   c = c + a(i) + a(i);
end

without = sum(2 * a);

fprintf('Su ciklu : %.2f \n', c);
fprintf('Be ciklo : %.2f \n', without);

%% 2. anuliavimas teigiamu elementu
a = randn(1, 10);
b = a;  % Make another array to fill up..

b(b > 0) = 0; % logical indexing

for i = 1:length(a)
    if a(i) > 0
        a(i) = 0;
    end
end

fprintf('Su ciklu:');
disp(a);

fprintf('Be ciklo:');
disp(b);

%% 3. ismetimas > 6
a = randi(10, 1, 10);
b = [];
c = [];
for i = 1:length(a)
    if a(i) <= 6
        b = [b a(i)];
    end
end

c = a(a <= 6);

disp(a);
disp(b);
disp(c);

%% 4. dvieju vienodu salia esanciu radimas
disp('--------')
a = randi(5, 1, 10)
for i = 2:length(a)
    if a(i) == a(i - 1)
        disp(i);
    end
end

i = (diff(a) == 0);
indexes = find(i == 1) + 1;
disp(indexes);

%% 5. elementu kur a elementai didesni uz b elementus radimas
disp('------------');
a = randn(1, 10)
b = randn(1, 10)
for i = 1:length(a)
    if a(i) > b(i)
        disp(i);
    end
end

s = a > b;
indexes = find(s == 1);
disp(indexes);

%% 6. elementu perstumimas vektoriuje pakartojant paskutini
disp('------------');
a = randi(10, 1, 10);
b = a;
k = zeros(size(a));
n = 1; %Per kiek poziciju paslinkti
disp(a);
for i = 2:length(a)
    a(i-1) = a(i);
end
disp(a);

b(1:end - 1) = b(2:end);
disp(b);

%% 7. sukeitimas elementu eiles tvarka
disp('------------');
a = randi(10, 1, 10);
c = a;
disp(a);
for i = 1:length(a) / 2
    b = a(i);
    a(i) = a(length(a) - i + 1);
    a(length(a) - i + 1) = b;
end
disp(a);

l = fliplr(c);
disp(l);

%% 8. kas antro elemento uznulinimas
disp('------------');
a = randi(10, 1, 10);
b = a;
disp(a);
for i = 1:2:length(a)
    a(i) = 0;
end
disp(a);

b(1:2:end) = 0;
disp(b);

%% 9. rasti matricos eiluciu vidurkius, rasti matricos stulpeliu vidurkius
disp('------------');
a = randn(10, 20)
for i = 1:size(a, 1)
    disp(mean(a(i, :)));
end

%https://se.mathworks.com/help/matlab/ref/mean.html
row = mean(a, 2);
column = mean(a);

disp('Eiluciu vidurkis: ');
disp(row);
disp('Stulpeliu vidurkis: ');
disp(column);

%% 10. gauti matricos diagonalinius elementus - negalima panaudoti diag
disp('------------');
a = randi(10, 10)
b = a;
for i = 1:size(a, 1)
    disp(a(i,i));
end

diagnol = b(1:size(b,1)+1:end);
disp(diagnol);

