function res = compose(fg, bg, mask)
    sf = size(fg);
    sb = size(bg);
    
    fg = double(fg);
    bg = double(bg);
    mask = double(mask);

    assert(sf(1) <= sb(1) && sf(2) <= sb(2));

    ys = floor((sb(1) - sf(1)) / 2)+1;
    ye = ys + sf(1) - 1;

    xs = floor((sb(2) - sf(2)) / 2)+1;
    xe = xs + sf(2) - 1;

    res = bg;
    res(ys:ye, xs:xe, :) = (1 - mask) .* res(ys:ye, xs:xe, :) + mask .* fg;
    res = uint8(res);
end