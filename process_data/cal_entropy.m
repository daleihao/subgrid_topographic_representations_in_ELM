function entropy_value = cal_entropy(data)
nbins = 1000;
h1=histogram(data(:), nbins, 'Normalization', 'Probability');
p = h1.Values;
entropy_value = -sum(p.*log2(p));
