function nonnegative_trick(A,b)
  n=size(A,1);
  m=size(A,1);
  mm=length(A);
  for i=1:mm
    if A[i]<0
      m=m+1;
    end
  end

  B=zeros(m,m);

  k=n+1;
  for i=1:n
    for j=1:n
      B[i,j]=abs(A[i,j]);
      if A[i,j]<0
        B[i,j]=0.0;
        B[i,k]=abs(A[i,j]);
        B[k,i]=1.0;
        B[k,k]=1.0;
        k=k+1;
      end
    end
  end

  z=zeros(m);
  z[1:n]=b;


  return (B,z);

end



#A=diagm(-ones(4),-1) + diagm(2*ones(5)) + diagm(-ones(4),1);
A=rand(5,5)-rand(5,5);
b=rand(5);



(B,c)=nonnegative_trick(A,b);
println(A);
println();
println(B);
