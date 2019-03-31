function view_cost_vs_nc(file_points)
  cost = [];
  % citesc punctele din fisier
  load(file_points, 'points')
	for i = 1:10
    % determin 1 - 10 centroizi si calculez constul pentru fiecare caz
    centroids = clustering_pc(points, i);
    cost(i) = compute_cost_pc(points, centroids);
  end
  plot(cost);
  title("cluster count");
end

