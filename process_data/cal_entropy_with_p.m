function entropy_value = cal_entropy_with_p(data, probability)
data = data(:);
probability = probability(:);
data(probability<=0) = nan;

nbins = 1000;
h1=histogram(data(:), nbins, 'Normalization', 'Probability');
p = h1.Values;
entropy_value = -sum(p.*log2(p));
