using Gadfly;

include("main.jl");
A(n)=diagm(-ones(n-1),-1)+diagm(2*ones(n))+diagm(-ones(n-1),1);
b(n)=rand(n);


ns=4:100
xs=Float64[];
ys=Float64[];

for n in ns 
  (B,c)=nonnegative_trick(A(n),b(n));
  (S,V,e)=schur(B);
  push!(xs,norm(S-diagm(diag(S))));
  push!(ys,norm(B*B'-B'*B));
end

draw(
  PDF("normality.pdf",5inch,5inch),
  plot(
    layer(x=ns,y=ys,Geom.line,Theme(default_color=colorant"orange")),
    layer(x=ns,y=xs,Geom.line,Theme(default_color=colorant"blue"))
  )
);
