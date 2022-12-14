function op=position_control(u)
global m g
xdes=u(1);
dxdes=u(2);
ddxdes=u(3);
ydes=u(4);
dydes=u(5);
ddydes=u(6);
zdes=u(7);
dzdes=u(8);
ddzdes=u(9);
psides=u(10);
x=u(11);
dx=u(12);
y=u(13);
dy=u(14);
z=u(15);
dz=u(16);
Kpz=25;Kdz=10;
Kpx=4;Kdx=4;
Kpy=4;Kdy=4;
ddxc=ddxdes+Kdx*(dxdes-dx)+Kpx*(xdes-x);
ddyc=ddydes+Kdy*(dydes-dy)+Kpy*(ydes-y);
ddzc=ddzdes+Kdz*(dzdes-dz)+Kpz*(zdes-z);
phic=(1/g)*(ddxc*sin(psides)-ddyc*cos(psides));
phic=atan2(sin(phic),cos(phic));
thtc=(1/g)*(ddxc*cos(psides)+ddyc*sin(psides));
thtc=atan2(sin(thtc),cos(thtc));
psic=psides;
psic=atan2(sin(psic),cos(psic));
u1=m*(g+ddzc);
op=[u1;phic;thtc;psic];
end