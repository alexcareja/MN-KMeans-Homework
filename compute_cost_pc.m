% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
  n = rows(points);
  NC = rows(centroids);
  % costul este calculat ca o suma de distante de la fiecare punct
  % la cel mai apropiat centroid de respectivul punct.
  for i = 1:n
    min = norm(points(i, :) - centroids(1, :));
    for j = 2:NC
      new_norm = norm(points(i, :) - centroids(j, :));
      if(new_norm < min)
        min = new_norm;
      end
    end
    cost += min;
  end
end

