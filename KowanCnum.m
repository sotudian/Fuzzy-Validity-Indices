
% Shahab Sotudian - 94125091

%% Kowan validity index
% function [] = KowanCnum(data)

load fcmdata.dat
data=fcmdata;
n = size(data,1);
C=5;
[center,U] = fcm(data,C)
m=2;
Finalsum = 0;
N = size(U,2);
V_mean = sum(data) / N;

min_V = inf;
                      for t=1:C
                            for k=1:N
                                     Part1 = U(t,k)^m;
                                     Part2 = (norm(data(k,:) - center(t,:)))^2;
                                     Finalsum = Finalsum + (Part1*Part2);
                            end
                            
                                                       
                            for j=1:C
                                     partV = norm(center(t) - center(j))^2;
                                  if partV ~= 0
                                  if partV < min_V
                                      min_V = partV;
                                  end
                                  end
                            end
                        
                      end
                      Part3=0;
                      for p=1:C
                                     Part3 =Part3+ (norm(center(p,:) - V_mean))^2;
                      end
 
 KOWAN_validiy_index=((Finalsum+(1/C)*Part3)/min_V)