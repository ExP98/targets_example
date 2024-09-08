# 1. Getting data           ####
get_data <- function(data = iris, slice_n = NULL) {
  if (!is.null(slice_n)) {
    return(data[slice_n,])
  } else {
    return(data)
  }
}


# 2. Models                 ####
# 2.1 ANOVA model           ####
calculate_anova_model <- function(data_ = iris) {
  r <- aov(lm(data_[, 1] ~ ., data = data_[-1]))
  return(summary(r))
}


# 2.2 PCA model             ####
calculate_PCA_model <- function(data_, scale = TRUE) {
  pca_data <- data_ %>%
    as.data.table() %>%
    copy()
  pca_data <- if (scale) {
    pca_data[, scale(.SD), .SDcols = is.numeric]
  } else {
    pca_data[, .SD, .SDcols = is.numeric]
  }
  return(pca_data %>% princomp())
}


pca_summary <- \(pca_res) pca_res %>% summary()
pca_loadings <- \(pca_res) pca_res %>% loadings()

plot_to_pdf <- function(pca_res, file_name = "my_plot") {
  pdf(paste0("02.Outputs/", file_name, ".pdf"))
  pca_res %>% plot()
  dev.off()
  return(invisible(NULL))
}


# 2.3 Another PCA model      ####
pca_plot_lesser_dim <- function(data_, factor_var, file_name = "PCA_less_dim") {
  pca_res <- data_ %>%
    as.data.table() %>%
    copy() %>%
    .[, scale(.SD), .SDcols = is.numeric] %>%
    ade4::dudi.pca(scannf=FALSE)

  pdf(paste0("02.Outputs/", file_name, ".pdf"))
  ade4::s.class(pca_res$li, data_[, factor_var])
  dev.off()

  return(invisible(NULL))
}


# 2.4 Another plot functions        ####
plot_pairs <- \(data_, file_name = "pairs_plot") {
  pdf(paste0("02.Outputs/", file_name, ".pdf"))
  data_ %>% pairs()
  dev.off()
  return(invisible(NULL))
}
