
% Shahab Sotudian

%% Fukuyama - Sugeno validity index
function [] = FukuyamaCnum(data)

Cmin = 2;
n = size(data,1);
Cmax = 7;
Vd = zeros(Cmax,1);

     for i=Cmin:Cmax,
         [center,U,obj_fcn] = fcm(data, i);
   
m=2;
Finalsum = 0;
N = size(U,2);
V_mean = sum(center) / i;

                      for t=1:i,
                            for k=1:N,
                                     Part1 = U(t,k)^m;
                                     Part2 = (norm(data(k,:) - center(t,:)))^2;
                                     Part3 = (norm(center(t,:) - V_mean))^2;
                                     Finalsum = Finalsum + Part1 * (Part2 - Part3);
                            end
                      end

Vd(i,1)=Finalsum;
     end
 
Vd(1,1) = inf;
Vd
[Y,I] = min(Vd);
cluster_num = I


