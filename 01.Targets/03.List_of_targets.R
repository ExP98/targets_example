data_targets <- list(
  tar_target(DT.01.1.Get_data,
             get_data(data = iris, slice_n = NULL)),

  tar_target(DT.01.2.Plot_pairs,
             plot_pairs(DT.01.1.Get_data))
)


ANOVA_targets <- list(
  tar_target(DT.02.1.ANOVA_model,
             calculate_anova_model(DT.01.1.Get_data))
)


PCA_targets <- list(
  tar_target(DT.03.1.PCA_model,
             calculate_PCA_model(DT.01.1.Get_data, scale = TRUE)),

  tar_target(DT.03.2.PCA_summary,
             pca_summary(DT.03.1.PCA_model)),

  tar_target(DT.03.3.PCA_loadings,
             pca_loadings(DT.03.1.PCA_model)),

  tar_target(DT.03.4.PCA_plot,
             plot_to_pdf(DT.03.1.PCA_model, "PCA_components")),

  tar_target(DT.03.5.PCA_less_dim,
             pca_plot_lesser_dim(DT.01.1.Get_data, "Species"))
)
