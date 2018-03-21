function discriminant = find_MED_Discriminant(z1, z2)
    syms x1 x2 x real
    x = [x1 x2]';
    discriminant = simplify((x-z1)'*(x-z1) - (x-z2)'*(x-z2));
end