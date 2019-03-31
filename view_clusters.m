% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
  clusters = [];
  n = rows(points);
  NC = rows(centroids);
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
  % creez o matrice de culori care contine pe linii culoarea in cod RGB
  % pentru fiecare punct
  RGB = zeros(n,3);
  for i = 1:n
    if(clusters(i) == 1)
      RGB(i, 1) = 255;
    elseif(clusters(i) == 2)
      RGB(i, 2) = 255;
    else
      RGB(i, 3) = 255;
    end
  end
  scatter3(points(:,1), points(:,2), points(:,3), [], RGB, 'filled');
  rotate3d on;  % pentru rotirea graficului 3D
  title("Vizualizarea clusterelor");
end

