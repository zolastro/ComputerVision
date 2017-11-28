function [m00,m10,m01,m11,m20,m02,m21,m12,m30,m03] = momentos(im) 
    m00 = 0;
    m10 = 0;
    m01 = 0;
    m11 = 0;
    m20 = 0;
    m02 = 0;
    m21 = 0;
    m12 = 0;
    m30 = 0;
    m03 = 0;
    [c, r] = size(im);
    for i = 1: c
        for j = 1: r
        m00 = m00 + im(i, j);
        m01 = m01 + i*im(i,j);
        m10 = m10 + j*im(i,j);
        m11 = m11 + i*j*im(i,j);
        m20 = m20 + (j^2)*im(i,j);
        m02 = m02 + (i^2)*im(i,j);
        m21 = m21 + (j^2)*i*im(i,j);
        m12 = m12 + j*(i^2)*im(i,j);
        m30 = m30 + (j^3)*im(i,j);
        m03 = m03 + (i^3)*im(i,j);
        end
    end
end