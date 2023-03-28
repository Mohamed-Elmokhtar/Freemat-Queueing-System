function y = RVG(n,a,b)
    for i=1:n
        x(i) = rand();
    end
    
    for i=1:n
        y(i) = ceil((a+(b-a)*x(i)));
        if (y(i)<0)
            y(i) = y(i)*-1;
        end
        
        while (y(i) > 100)
            y(i) = y(i) - 100;
            if (y(i)<0)
                y(i) = y(i)*-1;
            end
        end
    end
    
    