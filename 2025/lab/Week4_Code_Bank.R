#########################
# R Code Bank for Week 4 
#########################

# four #### separate each chunk

hate_crimes <- hate_crimes %>%
  mutate(
    hatecrimes_fbi = avg_hatecrimes_per_100k_fbi,
    hatecrimes_splc = hate_crimes_per_100k_splc
  )

#### 

hate_crimes$share_unemp_seas <- hate_crimes$share_unemp_seas * 100
hate_crimes$share_pop_metro <- hate_crimes$share_pop_metro * 100
hate_crimes$share_pop_hs <- hate_crimes$share_pop_hs * 100
hate_crimes$share_non_citizen <- hate_crimes$share_non_citizen * 100
hate_crimes$share_white_poverty <- hate_crimes$share_white_poverty * 100
hate_crimes$gini_index <- hate_crimes$gini_index * 100
hate_crimes$share_non_white <- hate_crimes$share_non_white * 100
hate_crimes$share_vote_trump <- hate_crimes$share_vote_trump * 100

#### 

model_fbi <- lm(hatecrimes_fbi ~ median_house_inc + 
                  share_unemp_seas + 
                  share_pop_metro + 
                  share_pop_hs + 
                  share_non_citizen + 
                  share_white_poverty + 
                  gini_index + 
                  share_non_white + 
                  share_vote_trump, 
                data = hate_crimes)

#### 

ggplot(all_models_df, aes(x = term, y = estimate_adj, color = Model)) +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin = ymin, ymax = ymax), width = 0.2, position = position_dodge(width = 0.5)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", size = 0.5) +
  scale_color_manual(values = c("Multivariate" = "#1B9E77", "Bivariate" = "#E7298A")) +
  theme_minimal() +
  theme(legend.position = "right") +
  labs(x = "Variable", y = "Coefficient Estimate", color = "Model Type") +
  coord_flip()

#### 

model_edu <- lm(hatecrimes_fbi ~ share_pop_hs, data = hate_crimes)

#### 

model_div <- lm(hatecrimes_fbi ~ share_non_white, data = hate_crimes)

#### 

datasummary_skim(hate_crimes_reordered, type="numeric", fmt=2, histogram=FALSE)

#### 

model_geo <- lm(hatecrimes_fbi ~ share_pop_metro, data = hate_crimes)

#### 

combined_plot <- fbi_histogram + hate_crimes_map + plot_layout(ncol = 2) +
  labs(caption = "Notes: Years 2010 thru 2015")
theme(plot.caption = element_text(hjust = 0, face = "italic"))

#### 

fbi_histogram <- ggplot(hate_crimes %>% 
                          filter(!is.na(hatecrimes_fbi) & is.finite(hatecrimes_fbi)),
                        aes(x = hatecrimes_fbi)) +
  geom_histogram(fill = "skyblue", bins = 30, alpha = 1) +
  geom_vline(aes(xintercept = mean(hatecrimes_fbi, na.rm = TRUE)), 
             color = "red", linetype = "dashed", size = 1) +
  labs(x = "Average Annual Hate Crimes per 100k", y = "Frequency") +
  theme_minimal()

#### 

modelsummary(model_list,
             estimate = "{estimate}{stars}",
             statistic = NULL,
             gof_omit = "IC|Log|alg|pss|F|RMSE",
             notes = "Notes: + p < 0.1, * p < 0.05, ** p < 0.01, *** p < 0.001",
             output="huxtable")

#### 

model_eco <- lm(hatecrimes_fbi ~ median_house_inc, data = hate_crimes)

#### 

model_ine <- lm(hatecrimes_fbi ~ gini_index, data = hate_crimes)

#### 

model_pol <- lm(hatecrimes_fbi ~ share_vote_trump, data = hate_crimes)

#### 

selected_vars <- hate_crimes %>% 
  select(hatecrimes_fbi,
         gini_index, 
         median_house_inc, 
         share_unemp_seas, 
         share_pop_metro, 
         share_pop_hs, 
         share_non_white, 
         share_non_citizen, 
         share_white_poverty,
         share_vote_trump)

cor_matrix <- cor(selected_vars, use = "complete.obs")

corrplot(cor_matrix, method = "circle", diag = FALSE, type = "lower",
         order = "hclust",      # Orders variables based on hierarchical clustering
         tl.srt = 45,           # Set text label angle for the top labels
         tl.offset = 0.5,       # Increase offset to move text labels closer to the grid
         tl.cex = 0.6,          # Font size of text labels
         tl.col = "black",      # Label color
         number.cex = 0.8,      # Adjust size of numbers inside circles
         addCoef.col = "black", # Color of the correlation coefficients
         cl.pos = 'n',          # Removes legend
         is.corr = TRUE)        # Ensure it interprets values as correlations for formatting

#### 

modelsummary(list("avg annual per 100,000" = model_fbi),
             estimate = "{estimate}{stars}",
             statistic = NULL,
             gof_omit = "IC|Log|alg|pss|F|RMSE",
             notes = "Notes: + p < 0.1, * p < 0.05, ** p < 0.01, *** p < 0.001",
             output="huxtable")

#### 

splc_histogram <- ggplot(hate_crimes %>% 
                           filter(!is.na(hatecrimes_splc) & is.finite(hatecrimes_splc)),
                         aes(x = hatecrimes_splc)) +
  geom_histogram(fill = "lightgreen", bins = 30, alpha = 1) +
  geom_vline(aes(xintercept = mean(hatecrimes_splc, na.rm = TRUE)), 
             color = "blue", linetype = "dashed", size = 1) +
  labs(x = "Hate Incidents per 100k (SPLC)", y = "Frequency") +
  theme_minimal()

#### 

model_splc <- lm(hatecrimes_splc ~ median_house_inc + 
                   share_unemp_seas + 
                   share_pop_metro + 
                   share_pop_hs + 
                   share_non_citizen + 
                   share_white_poverty + 
                   gini_index + 
                   share_non_white + 
                   share_vote_trump, 
                 data = hate_crimes)

#### 

modelsummary(list("FBI\n(avg annual per 100,000)" = model_fbi, "SPLC\n(hate incidents per 100,000 in 10 day period )"= model_splc),
             estimate = "{estimate}{stars}",
             statistic = NULL,
             gof_omit = "IC|Log|alg|pss|F|RMSE",
             notes = "Notes: + p < 0.1, * p < 0.05, ** p < 0.01, *** p < 0.001",
             output="huxtable")

#### END
