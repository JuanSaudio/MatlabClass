function [b, a] = parametricEQ(gdB, wo, Q)
    g = db2mag(gdB);
    b = [1 / (wo.^2), 1 / (Q * wo), 1];
    a = [1 / (wo.^2), 1 / (Q * wo), 1];
    if gdB > 0
        b(2) = b(2) * g;
    else
        a(2) = a(2) / g;
    end
end
