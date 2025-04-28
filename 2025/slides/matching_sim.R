# Propensity-score matching demo  ──────────────────────────────────────────────
# Simulates data, estimates scores, does 1-1 matching within quintile strata,
# then visualises which units were kept (alpha) vs. dropped (faded).
# -----------------------------------------------------------------------------
library(tidyverse)      # dplyr + ggplot2
library(MatchIt)        # matching routines
set.seed(14850)

# 1. Simulate data -------------------------------------------------------------
n  <- 500
dat <- tibble(
    id    = 1:n,
    x1    = rnorm(n),            # continuous
    x2    = rbinom(n, 1, .4),    # binary
    x3    = runif(n, -1, 1)      # unobserved – drives hidden bias
) |>
    mutate(
        true_ps   = plogis(-0.5 + .8*x1 + 1.2*x2 - .9*x3),
        treat     = rbinom(n, 1, true_ps),
        pscore_hat = predict(glm(treat ~ x1 + x2, family = binomial), type = "response")
    )

# 2. Quick look: score distribution by treatment -------------------------------
ggplot(dat, aes(pscore_hat, fill = factor(treat), colour = factor(treat))) +
    geom_dotplot(binaxis = "x", stackdir = "up", binwidth = .02, dotsize = .8) +
    scale_fill_manual(values = c("steelblue", "tomato"), labels = c("Control", "Treated")) +
    scale_colour_manual(values = c("steelblue", "tomato"), guide = "none") +
    labs(x = "Estimated propensity score", y = NULL, fill = "Group",
         title = "Propensity-score distribution") +
    theme_minimal()

# 3. Five equal-frequency strata & exact 1-1 matching -------------------------
cuts        <- quantile(dat$pscore_hat, probs = 0:5/5)
dat$stratum <- cut(dat$pscore_hat, breaks = cuts, include.lowest = TRUE)

m.out <- matchit(treat ~ x1 + x2,
                 data  = dat,
                 method = "nearest",
                 ratio  = 1,
                 exact  = ~ stratum)

# Flag who was actually matched (kept) -----------------------------------------
mm                <- m.out$match.matrix        # rows = treated units
dat$matched       <- FALSE
treated_rows      <- as.numeric(rownames(mm))
control_rows      <- as.numeric(mm)
dat$matched[treated_rows[!is.na(control_rows)]] <- TRUE
dat$matched[control_rows[!is.na(control_rows)]] <- TRUE

# 4. Final plot: colour = treatment, alpha = matched, strata lines -------------
ggplot(dat, aes(pscore_hat,
                fill   = factor(treat),
                colour = factor(treat),
                alpha  = matched)) +
    geom_dotplot(binaxis = "x", stackdir = "up", binwidth = .02, dotsize = .75) +
    geom_vline(xintercept = cuts, linetype = "dashed", colour = "grey70") +
    scale_fill_manual(values = c("steelblue", "tomato"),
                      labels = c("Control", "Treated"),
                      name   = "Group") +
    scale_colour_manual(values = c("steelblue", "tomato"), guide = "none") +
    scale_alpha_manual(values = c(`TRUE` = 1, `FALSE` = .25), guide = "none") +
    labs(x = "Estimated propensity score  (dashed lines = quintiles)",
         y = NULL,
         title = "1-1 nearest-neighbour matches within strata") +
    theme_minimal()
