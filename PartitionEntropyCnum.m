
% Shahab Sotudian - 94125091

%% Partition entropy  validity index
function [] = PartitionEntropyCnum(data)

Cmin = 2;
n = size(data,1);
Cmax = floor(sqrt(n));
Vd = zeros(Cmax,1);

     for i=Cmin:Cmax,
    [center, U, obj_fcn] = fcm(data,i);
Finalsum = 0;
N = size(U,2);

                      for t=1:i,
                            for k=1:N
                                 Finalsum = Finalsum + log(U(t,k)) * U(t,k);
                            end
                      end

Vd(i,1)=(-Finalsum/N);
     end
 
Vd(1,1) = inf;
Vd
[Y,I] = min(Vd);
cluster_num = I





end

