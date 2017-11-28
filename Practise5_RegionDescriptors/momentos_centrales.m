function [mu00,mu10,mu01,mu11,mu20,mu02,mu21,mu12,mu30,mu03] = momentos_centrales(im)
[m00,m10,m01,m11,m20,m02,m21,m12,m30,m03] = momentos(im);
x_ = m10/m00; 
y_ = m01/m00;

mu00 = m00;
mu01 = 0;
mu10 = 0;
mu20 = m20 - m00*(x_^2);
mu11 = m11 - m00*x_*y_;
mu02 = m02 - m00*(y_^2);
mu30 = m30 - 3*m20*x_+2*m00*(x_^3);
mu21 = m21 - m20*y_-2*m11*x_+2*m00*(x_^2)*y_;
mu12 = m12 - m02*x_-2*m11*y_+2*m00*(y_^2)*x_;
mu03 = m03 - 3*m02*y_+2*m00*(y_^3);
end