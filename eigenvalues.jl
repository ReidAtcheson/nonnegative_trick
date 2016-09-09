using Gadfly;
include("main.jl");


b=rand(5);
A=diagm(-ones(4),-1)+diagm(2*ones(5))+diagm(-ones(4),1);
(B,c)=nonnegative_trick(A,b);
ea=eigvals(A);
eb=eigvals(B);



draw(
  PDF("ea.pdf",5inch,5inch),
  plot(
    layer(x=real(ea),y=imag(ea),Geom.point,Theme(default_color=colorant"orange")),
    layer(x=real(eb),y=imag(eb),Geom.point,Theme(default_color=colorant"red"))
    )
  );


