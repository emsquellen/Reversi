function fulladder(x, y, carry_in)
    and3 = !x && !y && carry_in
    and4 = !x && y && !carry_in
    and5 = x && !y && !carry_in
    and6 = x && y && carry_in

    and7 = !x && y && carry_in
    and8 = x && !y && carry_in
    and9 = x && y && !carry_in
    and10 = x && y && carry_in

    sum = and3 || and4 || and5 || and6
    carry_out = and7 || and8 || and9 || and10
    return sum, carry_out
end

function vermenigvuldiger_4(bit4, bit3, bit2, bit1, factor)
    and11 = bit4 && factor
    and12 = bit3 && factor
    and13 = bit2 && factor
    and14 = bit1 && factor
    return and11, and12, and13, and14
end

function riple_carry_adder(y3, y2, y1, y0, x3, x2, x1, x0)
    sum0, c0 = fulladder(x0, y0, false)
    sum1, c1 = fulladder(x1, y1, c0)
    sum2, c2 = fulladder(x2, y2, c1)
    sum3, sum4= fulladder(x3, y3, c2)
    return sum0, sum1, sum2, sum3, sum4
end

function four_bit_multiplier(x0, x1, x2, x3, y0, y1, y2, y3)
    f1 = vermenigvuldiger_4(y0, y1, y2, y3, x3)
    f2 = vermenigvuldiger_4(y0, y1, y2, y3, x2)
    f3 = vermenigvuldiger_4(y0, y1, y2, y3, x1)
    f4 = vermenigvuldiger_4(y0, y1, y2, y3, x0)
    r1 = riple_carry_adder(f3..., false, f4[begin:end-1]...)
    r2 = riple_carry_adder(f2..., r1[2:end]...)
    r3 = riple_carry_adder(f1..., r2[2:end]...)
    z0, z1, z2, z3, z4, z5, z6, z7 = f2[end], r1[end], r2[end], r3...
    return z7, z6, z5, z4, z3, z2, z1, z0
end

function bool_to_string(bool)
    return join([b ? "1" : "0" for b in bool])
end

function string_to_bool(s)
    return [parse(Bool, i) for i in s]
end

bool_to_string(four_bit_multiplier(string_to_bool("1011")..., string_to_bool("0001")...))