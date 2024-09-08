source("01.Targets/01.Libraries.R")
source("01.Targets/02.Functions.R")
source("01.Targets/03.List_of_targets.R")


tar_option_set(format = "qs")
tar_config_set(script = "_targets.R", store = "_targets")


list(
  data_targets,
  ANOVA_targets,
  PCA_targets
)


# tar_make()
# tar_visnetwork(targets_only = TRUE)


## При первом выполнении надо выполнить tar_make()
## При хотя бы раз выполненном tar_make() создается папка /_targets, теперь можно использовать tar_visnetwork() и без запуска tar_make()

## В папке /_targets/objects хранятся результаты каждого таргета, сохраненные в формате, указанном в tar_option_set()
## Прочитать результаты можно с помощью tar_read(название_таргета)

## В DT.03.1.PCA_model меняем флаг scale и повторяем tar_visnetwork() без запуска tar_make()
