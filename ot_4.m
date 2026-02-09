% Simple Genetic Algorithm to maximize f(x) = x^2

clc;
clear;

% Parameters
populationSize = 6;
generations = 5;
mutationRate = 0.1;

% Search space
lowerBound = 0;
upperBound = 10;

% Step 1: Initialize population
population = lowerBound + (upperBound - lowerBound) * rand(populationSize, 1);

fprintf('Initial Population:\n');
disp(population);

for gen = 1:generations
    
    % Step 2: Fitness evaluation
    fitness = population .^ 2;
    
    % Step 3: Selection (best two individuals)
    [~, idx] = sort(fitness, 'descend');
    parent1 = population(idx(1));
    parent2 = population(idx(2));
    
    % Step 4: Crossover (average crossover)
    child = (parent1 + parent2) / 2;
    
    % Step 5: Mutation
    if rand < mutationRate
        child = child + randn;
    end
    
    % Step 6: Replacement (replace worst individual)
    population(idx(end)) = child;
    
    fprintf('Generation %d Best x = %.4f  Best f(x) = %.4f\n', ...
            gen, parent1, parent1^2);
end

% Final Result
bestX = population(idx(1));
bestFitness = bestX^2;

fprintf('\nFinal Best Solution:\n');
fprintf('x = %.4f\n', bestX);
fprintf('f(x) = %.4f\n', bestFitness);
