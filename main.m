clear all
close all
clc
tetaMax=0.9;       
tetaMin=0.4; 
numeroParticulas = 20;
limx1 = 325;
limx2 = 434;
limx3 = 500;
c=1;
px1=rand(1,numeroParticulas)*limx1+1;
px2=rand(1,numeroParticulas)*limx2+1;
px3=rand(1,numeroParticulas)*limx3+1;
vx1=zeros(1,numeroParticulas);
vx2=zeros(1,numeroParticulas);
vx3=zeros(1,numeroParticulas);
iteracion = 1;
maxIteracion=100;
evaz=funcionObjetivo(px1,px2,px3,iteracion);
[valMax valIndMax]=max(evaz);

pbest1=px1;
pbest2=px2;
pbest3=px3;

gbest1=px1(valIndMax);
gbest2=px2(valIndMax);
gbest3=px3(valIndMax);


while iteracion<=maxIteracion
   teta=tetaMax-((tetaMax-tetaMin)/(maxIteracion))*iteracion;
   r1=rand();r2=rand();
   vx1=vx1*teta+c*r1*(pbest1-px1)+c*r2*(gbest1-px1);
   vx2=vx2*teta+c*r1*(pbest2-px2)+c*r2*(gbest1-px2);
   vx3=vx3*teta+c*r1*(pbest3-px3)+c*r2*(gbest1-px3);
   
   px1=px1+vx1;
   px2=px2+vx2;
   px3=px3+vx3;
   
   px1=min(px1,limx1);
   px1=max(px1,0);
   px2=min(px2,limx2);
   px2=max(px2,0);
   px3=min(px3,limx3);
   px3=max(px3,0);
   
   evazt=funcionObjetivo(px1,px2,px3,iteracion);
   
   for i=1:length(evaz)
       if evazt(i)>evaz(i)
           pbest1(i)=px1(i);
           pbest2(i)=px2(i);
           pbest3(i)=px3(i);
           evaz(i)=evazt(i);
       end
   end
   [valmaxtemp indmaxtemp]=max(evaz);
   if valmaxtemp>valMax
       valMax=valmaxtemp;
       valIndMax=indmaxtemp;
       gbest1=px1(indmaxtemp);
       gbest2=px2(indmaxtemp);
       gbest3=px3(indmaxtemp);
   end
   acumpx1(iteracion,:)=px1;
   acumpx2(iteracion,:)=px2;
   acumpx3(iteracion,:)=px3;
   acumz(iteracion,:)=evaz;
   %No Borrar
   iteracion=iteracion+1;
end
subplot(1,4,1)
surf(acumpx1)
xlabel("Particula")
ylabel("Iteracion")
zlabel("Valor")
subplot(1,4,2)
surf(acumpx2)
xlabel("Particula")
ylabel("Iteracion")
zlabel("Valor")
subplot(1,4,3)
surf(acumpx3) 
xlabel("Particula")
ylabel("Iteracion")
zlabel("Valor")
subplot(1,4,4)
surf(acumz)
xlabel("Particula")
ylabel("Iteracion")
zlabel("Valor")






