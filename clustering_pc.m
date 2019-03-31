% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
	centroids = [];
  [n, m] = size(points);
  %n este numarul de linii
  %m va fi 3, adica numarul de coloane (3 coordonate), dar nu il folosesc
  %generez NC numere random
	X = randperm(n, NC);
  for i = 1:NC
    centroids(i, :) = points(X(i), :);
  end
  
  clusters = []; %matrice in care retin clusterul de care apartine
                 %fiecare punct
  ok = 1; % cu ok verific daca centroidul nou gasit este diferit
          % de cel anterior
  while ok
    %creez clusterele
    for i = 1:n
      min = norm(points(i, :) - centroids(1, :));
     for j = 2:NC
       new_norm = norm(points(i, :) - centroids(j, :));
       if(new_norm < min)
         min = new_norm;
       end
     end
     for j = 1:NC
        new_norm = norm(points(i, :) - centroids(j, :));
        if(new_norm == min)
          clusters(i) = j;
          break;
        end
     end
    end
    % pentru fiecare cluster calculez noul centroid
    for j = 1:NC
      k = 0;
      x = 0;
      y = 0;
      z = 0;
      for i = 1:n
        if (clusters(i) == j)
          x += points(i,1);
          y += points(i,2);
          z += points(i,3);
          k++;
        end
      end
      % calculez centrul de greutate al clusterului
      if(k != 0)
        x = x/k;
        y = y/k;
        z = z/k;
        if((x != centroids(j, 1)) || (y != centroids(j, 2)) 
                                  || (z != centroids(j, 3)))
          centroids(j, 1) = x;
          centroids(j, 2) = y;
          centroids(j, 3) = z;  
          ok = 0; 
        end
      end
    end
    if(ok) % s-au gasit centroizii
      break;
    else   % repeta aceiasi pasi
      ok = 1;
    end
  end
end
