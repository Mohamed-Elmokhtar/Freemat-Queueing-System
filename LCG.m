function y = LCG(n,x)
    a = 47;
    c = 53;
    m = 97;
    for i=1:n
        y(i) = ceil(mod(((a*x)+c),m));
        x = y(i);
    end
    