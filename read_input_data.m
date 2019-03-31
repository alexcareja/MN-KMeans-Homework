% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
	
	points = [];
  
  NC = load(file_params);
  load(file_points, 'points');
	%disp(points);
  %disp(NC);
end

