function calculator(a, b, mode)
    if mode==0 then
        print(a,"+",b,"=",a+b)
    elseif mode==1 then
        print(a,"-",b,"=",a-b)
    elseif mode==2 then
        print(a,"*",b,"=",a*b)
    elseif mode==3 then
        print(a,"/",b,"=",a/b)
    else
        print(a,",",b,",mode==",mode)
    end
end