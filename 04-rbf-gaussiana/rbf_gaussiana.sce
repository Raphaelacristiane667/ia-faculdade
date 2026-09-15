// Atividade 4 — RBF (função de base radial / gaussiana)
// 2 entradas → 1 centro → superfície 3D

clear
clc

dados=[0 0 0
       0 0.2 0
       1 0 0
       1 1 1];

nc=1;
ne=2;
w=[];
na=4;

for i=1:ne
    for j=1:nc
        w(i,j)=2;
    end
end

for epoca=1:100

    for am=1:na

        xn=dados(am,1:ne);

        dist=[];

        for j=1:nc
            soma=0;

            for i=1:ne
    soma=soma+(xn(i)-w(i,j))^2;
  end

 dist(j)=soma;
end

        phi=exp(-dist);

        for i=1:ne
     w(i)=w(i)+0.01*(xn(i)-w(i));
end

        unx=-2:0.1:2;
uny=-2:0.1:2;

zona=zeros(length(unx),length(uny));

        for i=1:length(unx)
            for j=1:length(uny)

px=exp(-(unx(i)-w(1))^2);
py=exp(-(uny(j)-w(2))^2);

 zona(i,j)=px*py;

   end
end

clf
 plot3d(unx,uny,zona);
 sleep(100)

    end

end
