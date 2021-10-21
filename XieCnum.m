
% Shahab Sotudian - 94125091

%% Xie and Beni validity index



% function [] = XieCnum(data)

load fcmdata.dat
data=fcmdata;
n = size(data,1);
C=3;
[center,U] = fcm(data,C)

m=2;
Finalsum = 0;
N = size(U,2);
V_mean = sum(center) / C;


min_V = inf;
                      for t=1:C
                            for k=1:N
                                     Part1 = U(t,k)^m;
                                     Part2 = (norm(data(k,:) - center(t,:)))^m;
                                     Finalsum = Finalsum + (Part1*Part2);
                            end
                            
                            for j=1:C
                                     partV = norm(center(t) - center(j));
                                  if partV ~= 0
                                      if partV < min_V
                                          min_V = partV;
                                      end
                                  end
                            end
                            
                            
                            
                      end
          

 FS_validiy_index=(Finalsum / (N * min_V))




