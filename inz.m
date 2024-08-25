clear all ; clc ; close all;

load zebranedane.mat   %za�adowanie zebranych danych

wspolczynniki=[];     %definicja cech
zera=[];
znaczniki=[];
akordT=[];
for x=1:113
    ki=zebranedane(x,:);   %za�adowanie liczby poszczeg�lnych akord�w
    maxki=max(ki);        %wyznaczenie maksymalnej liczby akord�w
    ki=(zebranedane(x,:))/maxki;     %wyznaczenie d�ugo�ci wektor�w

for i=0:11   %p�tla odpowiedzialna za wyliczenie wsp�czynnik�w BSD
    
    for j=1:5
        a=i+j;
        b=i-j;
        if a>11
            a=a-12;
        end
        if b<0
            b=b+12;
        end
        c(j)=ki(a+1);
        if ki(b+1)<ki(a+1)
            c(j)=ki(b+1);
        end
        dlugosc(j)=ki(a+1);
        
        
    end
    l=2*sum(c);
    c1=sum(dlugosc);
    
    for j=7:11
        a=i+j;
        if a>11
            a=a-12;
        end
        dlugosc2(j-6)=ki(a+1);
    end
    c2=sum(dlugosc2);
    m=c1+c2;
    BSD(i+1)=l/m;   %wyznaczenie wsp�czynnik�w BSD
    
    
end
    wspolczynniki=[wspolczynniki ; BSD];
    sumabsd(x)=sum(BSD);
    minimumbsd(x)=min(BSD);
  
    z=0;
    suma=0;
    for k=1:12   %p�tla dodaj�ca cech� badaj�c� ilo�� akord�w niewystepuj�cych w utworze
        if ki(k)==0
        z=z+1;
        end
        suma=suma+ki(k);  %zsumowanie wszystkich akord�w w utworze
    end
    wynik=suma/ki(13);    %podzielenie wszystkich akord�w w utworze przez czas trwania utworu
    akordT=[akordT ; wynik];    %cecha (akordy/czas [s])
    zera=[zera ; z];            %cecha ilo�c akord�w niewystepuj�cych
    
    znacznik=0;
    cdefgahc=ki(7)+ki(8)+ki(9)+ki(10)+ki(11);   %zbadanie ilo�ci akord�w (Fis, Cis, Gis, Dis, B)
    if cdefgahc==0                              %tworzenie wyznacznika okre�laj�cego czy takie akordy wyst�puj�
        znacznik=1;
    end
    znaczniki=[znaczniki ; znacznik];           %cecha, okre�laj�ca czy takie akordy wyst�puj� czy nie
end



test=[wspolczynniki, zera, znaczniki, akordT, zebranedane(:,14)];    %macierz wej�ciowa testowa




%% BOOTSTRAPPING

%losowa generacja liczb od 1 do k
    k=113;
randNum=randperm(k);    
randNum=randNum';

%podzielenie danych na treningowe (70%) i testowe (30%)
X = test(:,1:end-1);    
y = test(:,end);

k=round(0.7*k);
X_train=X(randNum(1:k),:);
y_train=y(randNum(1:k),:);

X_test=X(randNum(k:end),:);
y_test=y(randNum(k:end),:);

X=X(randNum(k:end),:);
y=y(randNum(k:end),:);

%stworzenie macierzy wej�ciowej "dane"
dane=[X_train,y_train];

%% Wykres

%wyliczenie sum wsp�czynnik�w BSD dla poszczeg�lnych styl�w muzycznych
index = find(zebranedane(:,14)==1);
x1=sumabsd(index);

index = find(zebranedane(:,14)==2);
x2=sumabsd(index);

index = find(zebranedane(:,14)==3);
x3=sumabsd(index);

%stworzenie wykresu sum wsp�czynnik�w BSD
plot(x1);
hold on
plot(x2);
hold on
plot(x3);
grid on
title('Wykres zale�no�ci sum wsp�czynnik�w BSD')
xlabel('Nr pr�bki')
ylabel('Sum(BSD)')
legend('kol�da','rock','jazz')
