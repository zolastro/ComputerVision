function [x_ y_] = calcular_centroide(im)
    [m00,m10,m01,m11,m20,m02,m21,m12,m30,m03] = momentos(im);
    x_ = m10/m00;
    y_ = m01/m00;
end