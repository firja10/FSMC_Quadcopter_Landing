function op=attitude_control(u)

global I tuning_parameter

Ix=I(1,1);
Iy=I(2,2);
Iz=I(3,3);

dphi=u(1);
dtht=u(2);
dpsi=u(3);

s1=u(4);
s2=u(5);
s3=u(6);


%k1_fuzzy=u(7);
%k2_fuzzy=u(8);
%k3_fuzzy=u(9);


dang=[dphi;dtht;dpsi];
alpha=[(Iy-Iz)*dpsi*dtht/Ix;(Iz-Ix)*dpsi*dphi/Iy;(Ix-Iy)*dphi*dtht/Iz]+tuning_parameter*dang;
beta=inv(I);
k1=55;
k2=55;
k3=55;
%op=inv(beta)*(-alpha+[-k1_fuzzy*sign(s1);-k2_fuzzy*sign(s2);-k3*sign(s3)]);

y_s1 = max(-1, min(1, s1));
y_s2 = max(-1, min(1, s2));
y_s3 = max(-1, min(1, s3));




%op=inv(beta)*(-alpha+[-k1_fuzzy*sign(s1);-k2_fuzzy*sign(s2);-k3_fuzzy*sign(s3)]);

op=inv(beta)*(-alpha+[-k1*sign(s1);-k2*sign(s2);-k3*sign(s3)]);
%op=inv(beta)*(-alpha+[-k1*y_s1;-k2*y_s2;-k3*y_s3]);
end

