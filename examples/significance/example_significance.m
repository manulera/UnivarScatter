

% Create some data
data = table();

% Categorical variable
data.condition = cell(150,1);
data.condition(1:50) = {'condition A'};
data.condition(51:100) = {'condition B'};
data.condition(101:150) = {'condition C'};
data.condition = categorical(data.condition);

% Numerical variable
data.value = zeros(150,1);
data.value(1:50) = randn([50,1]);
data.value(51:100) = rand([50,1]);
data.value(101:150) = randn([50,1]);

% Statistical significance
categ_values = categories(data.condition);
reference_category = 'condition A';
p_vals = zeros(1,numel(categ_values));

for i = 1:numel(categ_values)
    condition_data = data.value(data.condition==categ_values{i});
    control_data = data.value(data.condition==reference_category);
    [~,p_vals(i)] = kstest2(condition_data,control_data);
end

% Draw the plot with stars
figure()
[x,y]=UnivarScatter(data);
xtickangle(45)
drawStars(y,p_vals,[0.05,0.005],1,[],[],{'FontSize',20})

% Draw the plot with p-values
figure()
[x,y]=UnivarScatter(data);
xtickangle(45)
drawStars(y,p_vals,[0.05,0.005],1,[],false,{'FontSize',10})

