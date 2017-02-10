function attractor2(a0,b0,c0,t_max,x0)
	% This code is based on the Rossler attractor code found here http://www.academia.edu/4504330/R%C3%B6ssler_system
    % a0, b0, c0 are beta, alpha, and gamma respectively
    % to is tspan parameter of ode45 function of matlab
    % x0 is the initial condition of the given system

	syms x y z t a b c; % here a,b,c are alpha, beta, and gamma respectively
	A = [y-c x 0 ; -1 0 -1 ; 0 1 a]; % Jacobian matrix for the given syfptem
	[V D] = eig(A); % eigenvectors and eigenvalues of A

	%x, y, z co-ordinates of fixed points 
	xfp = [(c+sqrt(c^2-4*a*b))/(2*a) (c-sqrt(c^2-4*a*b))/(2*a)];
	yfp = [(c+sqrt(c^2-4*a*b))/2 (c-sqrt(c^2-4*a*b))/2];
	zfp = -[(c+sqrt(c^2-4*a*b))/(2*a) (c-sqrt(c^2-4*a*b))/(2*a)];

	% eigenvalues of the Jacobian matrix 
	lam1 = [subs(D(1,1), {'x' 'y' 'z'}, {xfp(1) yfp(1) zfp(1)}) subs(D(1,1), {'x' 'y'  'z'}, {xfp(2) yfp(2) zfp(2)})];
	lam2 = [subs(D(2,2), {'x' 'y' 'z'}, {xfp(1) yfp(1) zfp(1)}) subs(D(2,2), {'x' 'y'  'z'}, {xfp(2) yfp(2) zfp(2)})];
	lam3 = [subs(D(3,3), {'x' 'y' 'z'}, {xfp(1) yfp(1) zfp(1)}) subs(D(3,3), {'x' 'y'  'z'}, {xfp(2) yfp(2) zfp(2)})];
	lambda = [lam1 ; lam2 ; lam3];

	%eigenvectors of the Jacobian matrix 
	eigv1 = [subs(V(:,1), {'x' 'y' 'z'}, {xfp(1) yfp(1) zfp(1)}) subs(V(:,1), {'x' 'y'  'z'}, {xfp(2) yfp(2) zfp(2)})];
	eigv2 = [subs(V(:,2), {'x' 'y' 'z'}, {xfp(1) yfp(1) zfp(1)}) subs(V(:,2), {'x' 'y'  'z'}, {xfp(2) yfp(2) zfp(2)})];
	eigv3 = [subs(V(:,3), {'x' 'y' 'z'}, {xfp(1) yfp(1) zfp(1)}) subs(V(:,3), {'x' 'y'  'z'}, {xfp(2) yfp(2) zfp(2)})];
    
    % compute the eigenvectors and eigenvalues by substituting the values
    % of a, b, c
	lambda1 = subs(lambda, {a b c}, {a0 b0 c0});
	vector1 = subs(eigv1, {a b c}, {a0 b0 c0});
	vector2 = subs(eigv2, {a b c}, {a0 b0 c0});
	vector3 = subs(eigv3, {a b c}, {a0 b0 c0});
	
    % compute the values of fixed points by substituting the values
    % of a, b, c
	xfp1 = subs(xfp, {a b c}, {a0 b0 c0});
	yfp1 = subs(yfp, {a b c}, {a0 b0 c0});
	zfp1 = subs(zfp, {a b c}, {a0 b0 c0});
	 
	% Plot this on a 3-D graph
	a = a0; b = b0; c = c0;
	t = [0 t_max];
	xinit = x0;
	f = @(t, x) [x(1)*x(2) - x(1)*c + b; -(x(1) + x(3)); a*x(3) + x(2)]; %x(1)=x, x(2)=y, x(3)=z
	[T, X] = ode45(f, t, xinit);
	figure; 
    %subplot(4,1,1);
	plot3(X(:,1), X(:,2), X(:,3), 'r-'); hold on
	plot3(xfp1(1), yfp1(1), zfp1(1),'k*');
	plot3(xfp1(2), yfp1(2), zfp1(2),'b*');
	title('Attractor with fixed points in 3D plane','FontSize', 13);
	xlabel('X','FontSize', 13); ylabel('Y','FontSize', 13); zlabel('Z','FontSize', 13);
    hold off
	
	figure;
    subplot(3,1,1);
	plot(X(:,1), X(:,2), 'r-'); hold on
	plot(xfp1(1), yfp1(1),'k*');
	plot(xfp1(2), yfp1(2),'b*');
	title('Attractor with fixed points in XY plane');
	xlabel('X');
	ylabel('Y');
    hold off
	 
	subplot(3,1,2);
	plot(X(:,1), X(:,3), 'r-'); hold on
	plot(xfp1(1), zfp1(1),'k*'); 
	plot(xfp1(2), zfp1(2),'b*');
	title('Attractor with fixed points in XZ plane');
	xlabel('X');
	ylabel('Z');
    hold off
	
	subplot(3,1,3);	
	plot(X(:,2), X(:,3), 'r-'); hold on
	plot(yfp1(1), zfp1(1),'k*');
	plot(yfp1(2), zfp1(2),'b*');
	title('Attractor with fixed points in YZ plane');
	xlabel('Y');
	ylabel('Z');
    hold off
end