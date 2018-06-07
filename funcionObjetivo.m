function f=funconObjetivo(px1,px2,px3,iteracion)
alpha=2;
b=150;
a=10;
c=0.5;
z=@(x1,x2,x3)10*x1+9*x2+8*x3;
g1=@(x1,x2,x3)4*x1+3*x2+2*x3-1300;
g2=@(x1,x2,x3)3*x1+2*x2+2*x3-1000;

evaz=z(px1,px2,px3);
evag1=g1(px1,px2,px3);
evag2=g2(px1,px2,px3);

for i=1:length(evaz)
    phi1(i)=a*(1-(1/(exp(evag1(i)))))+b;
    phi2(i)=a*(1-(1/(exp(evag2(i)))))+b;
end

parmg=find(evag1<0);
evag1p=evag1;
evag1p([parmg])=0;

parmg=find(evag2<0);
evag2p=evag2;
evag2p([parmg])=0;

res1(1:length(evaz))=2;
parmg=find(evag1<=1);
res1([parmg])=1;

res2(1:length(evaz))=2;
parmg=find(evag2<=1);
res2([parmg])=1;

parametroH=phi1.*(evag1p.^res1)+phi2.*(evag2p.^res2);
parametroC=(c*iteracion)^alpha;

f=evaz-parametroC*parametroH;
