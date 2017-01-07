base_plot <- plot_som_hm(
  saved_elec_som, 
  1, 
  Y = T, 
  title = "Votes for HRC", 
  scale_label_high = "More votes for HRC", 
  scale_label_low = "More votes for Trump"
)

base_plot_w_annotation <-
  base_plot + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

base_hs_diploma <- 
  plot_som_hm(
  saved_elec_som, 
  2,
  title = "At Least an HS Diploma", 
  scale_label_high = "More HS Graduates", 
  scale_label_low = "Fewer HS Graduates"
)

base_hs_diploma_w_annotation <- 
  plot_som_hm(
  saved_elec_som, 
  2,
  title = "At Least an HS Diploma", 
  scale_label_high = "More HS Graduates", 
  scale_label_low = "Fewer HS Graduates"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

uninsured <-
  plot_som_hm(
  saved_elec_som, 
  "Uninsured",
  title = "Uninsurance Rate", 
  scale_label_high = "Higher Uninsurance Rate", 
  scale_label_low = "Lower Uninsurance Rate"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

adult_obesity <-
  plot_som_hm(
  saved_elec_som, 
  "Adult.obesity",
  title = "Adult Obesity", 
  scale_label_high = "Higher Obesity Rate", 
  scale_label_low = "Lower Obesity Rate"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

diabetes <-
  plot_som_hm(
  saved_elec_som, 
  "Diabetes",
  title = "Diabetes", 
  scale_label_high = "Higher Diabetes Incidence", 
  scale_label_low = "Lower Diabetes Incidence"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 
  
unemployment <-
  plot_som_hm(
  saved_elec_som, 
  "Unemployment",
  title = "Unemployment", 
  scale_label_high = "Higher Unemployment Rate", 
  scale_label_low = "Lower Unemployment Rate"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

earnings <-
  plot_som_hm(
  saved_elec_som, 
  "Median.Earnings.2010.dollars",
  title = "Median Earnings", 
  scale_label_high = "Higher Income", 
  scale_label_low = "Lower Income"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

whiteness <-
  plot_som_hm(
  saved_elec_som, 
  "White",
  title = "Whiteness", 
  scale_label_high = "Higher Percentage White", 
  scale_label_low = "Lower Percentage White"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 

homogeneity <-
  plot_som_hm(
  saved_elec_som, 
  "SIRE_homogeneity",
  title = "Ethnic Homogeneity", 
  scale_label_high = "Higher Homogeneity", 
  scale_label_low = "Lower Homogeneity"
) + 
  geom_path(
    data = data.frame(x = c(0, 0, 30.5, 30.5, 0), y = c(30.5, 20, 25, 30.5, 30.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 1, y = 31.1, label = "Trump-land", family = "Consolas", 
           hjust = 0) + 
  geom_path(
    data = data.frame(x = c(2, 3, 20, 30.5, 30.5, 2), y = c(-.5, 3, 11, 13, -.5, -.5)),
    aes(x = x, y = y, group = 1, fill = 1, alpha = 0.7)
  ) + 
  annotate("text", x = 25, y = -1.1, label = "HRC-land", family = "Consolas", 
           hjust = 0) + 
  scale_alpha_continuous(guide = "none") 
