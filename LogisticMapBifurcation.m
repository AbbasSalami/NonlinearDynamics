% Animated bifurcation diagram for logistic map 
function output = LogisticMapBifurcation(x0, rinterval, rstep, n, k)
% Inputs:
%        x0: initial condition
%        [rmin rmax]: interval of the logistic map parameter
%        rstep: parameter increase step
%        n: number of iterations 
%        k: number of transient samples to remove
% output:
%        output: contains parameter of the the logistic map and
%        corresponding steady state conditions
c = 0;
rmin = min(rinterval);
rmax = max(rinterval);
for r = rmin:rstep:rmax
    c = c+1;
    iteration = [x0];
    currentx = x0;
    for i = 1:n
        currentx = r*currentx*(1-currentx);
        iteration = [iteration; currentx];
    end
    iteration(1:k+1) = [];
    output{c,1} = iteration;
    output{c,2} = r;
end
figure;
curve = animatedline('Color','k','Marker','.','Linestyle','none');
set(gca,'Xlim',[rmin rmax],'Ylim',[0 1])
grid on;
title('Bifurcation Diagram of the logistic map')
xlabel('r')
ylabel('x')
for i = 1:size(output,1)
    for j = 1:length(output{i,1})
        addpoints(curve,output{i,2},output{i,1}(j));
        drawnow limitrate
    end
end
end
