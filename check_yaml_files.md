---
title: "Check local yaml files"
author: "Steve Simon"
date: "Created 2024-06-29"
execute:
  echo: false
format:
  html:
    embed-resources: true
editor: source
---


```r
#> echo: false
library(glue)
library(yaml)
```

## Get file list


```r
yamls <- list.files("..", pattern="yaml$")
```

There are 61 yaml files to be checked: absorbent-paper.yaml, airline-bumping.yaml, albuquerque-housing.yaml, art-malpresentations.yaml, back-pain-runners.yaml, balance-measures-tall.yaml, balance-measures-wide.yaml, body-dimensions.yaml, breast-feeding-preterm.yaml, burger-calories.yaml, caries-detection.yaml, carotid-plaque.yaml, cholesterol-after-heart-attack.yaml, cigarette-measurements.yaml, collaborative-consumption.yaml, cracker-bloat.yaml, cracker-fiber.yaml, digital-citizenship-revised.yaml, digital-citizenship.yaml, energy.yaml, energy01.yaml, energy02.yaml, energy03.yaml, energy04.yaml, exercise-programs.yaml, fasting-turtles.yaml, fat.yaml, fev.yaml, fishing.yaml, fly1.yaml, fly2.yaml, fly3.yaml, full-moon-er-admissions.yaml, gardasil.yaml, glycyrrhizin.yaml, grace1000.yaml, heroin.yaml, hiv-intervention.yaml, leader.yaml, litter-weights.yaml, module02-datasets.yaml, moon.yaml, psychiatric-discharges.yaml, quake.yaml, rat-litter.yaml, samara-velocity.yaml, sharing.yaml, signapore-diamond-prices.yaml, sleep.yaml, swim-speeds.yaml, termites.yaml, titanic.yaml, transplant.yaml, transplant1.yaml, transplant2.yaml, transplant3.yaml, two-small-dataframes.yaml, vaccine-willingness.yaml, whas100.yaml, whas500.yaml, woodard.yaml.



## Check local files


```r
#> error: true
for (y in yamls) {
  cat("\n")
  cat(y)
  cat(": ")
  check <- read_yaml(glue("../{y}"))
  cat(check$data_dictionary)
}
```

```
## 
## absorbent-paper.yaml: absorbent-paper.csv
## airline-bumping.yaml: airline-bumping-2017.txt
## albuquerque-housing.yaml: housing.txt
## art-malpresentations.yaml: art-malpresentations.csv
## back-pain-runners.yaml: backpain.csv
## balance-measures-tall.yaml: balance2.txt
## balance-measures-wide.yaml: balance1.txt
## body-dimensions.yaml: body.txt
## breast-feeding-preterm.yaml: bf.csv
## burger-calories.yaml: burger.txt
## caries-detection.yaml: caries-detection.csv
## carotid-plaque.yaml: carotid-plaque.xls
## cholesterol-after-heart-attack.yaml: balance2.txt
## cigarette-measurements.yaml: cigarettes.csv, .sas7bdat,  .txt
## collaborative-consumption.yaml: collaborative-consumption.xlsx
## cracker-bloat.yaml: diet.txt
## cracker-fiber.yaml: fiber.txt
## digital-citizenship-revised.yaml: digital-citizenship-revised.sav
## digital-citizenship.yaml: digital-citizenship.sav
## energy.yaml: energy.txt
## energy01.yaml: energy01.csv
## energy02.yaml: energy02.tsv
## energy03.yaml: energy03.txt
## energy04.yaml: energy04.csv
## exercise-programs.yaml: exercise.sas7bdat
## fasting-turtles.yaml: fasting-turtles.txt
## fat.yaml: fat.csv, .txt
## fev.yaml: fev.txt
## fishing.yaml: fishing.txt
## fly1.yaml: fly1.txt
## fly2.yaml: fly2.txt
## fly3.yaml: fly3.txt
## full-moon-er-admissions.yaml: full-moon.txt
## gardasil.yaml: gardasil.csv, gardasil.tsv
## glycyrrhizin.yaml: glycyrrhizin.csv
## grace1000.yaml: grace1000.dat
## heroin.yaml: heroin.txt
## hiv-intervention.yaml: hiv-intervention.txt
## leader.yaml: leader.dta, RData, sas7bdat, sav, txt
## litter-weights.yaml: litter-weights.sav
## module02-datasets.yaml: module02-datasets.RData
## moon.yaml: moon.txt
## psychiatric-discharges.yaml: psychiatric-patients.txt
## quake.yaml: quake.txt
## rat-litter.yaml: rats.csv
## samara-velocity.yaml: samara.txt
## sharing.yaml: sharing.xlsx
## signapore-diamond-prices.yaml: diamonds.txt
## sleep.yaml: sleep.txt
## swim-speeds.yaml: swim-speeds
## termites.yaml: termites.txt
## titanic.yaml: titanic.txt
## transplant.yaml: transplant.txt
## transplant1.yaml: transplant1.csv
## transplant2.yaml: transplant2.csv
## transplant3.yaml: transplant3.csv
## two-small-dataframes.yaml: two-small-data-frames.RData
## vaccine-willingness.yaml: vaccine-willingness.csv
## whas100.yaml: whas100.dat
## whas500.yaml: whas500.dat
## woodard.yaml: wooodard.xls
```

## Check github files


```r
#> error: true
f0 <- "https://raw.githubusercontent.com"
f1 <- "/pmean/datasets/master"
for (y in yamls) {
  cat("\n")
  cat(y)
  cat(": ")
  check <- read_yaml(glue("{f0}/{f1}/{y}"))
  cat(check$data_dictionary)
}
```

```
## 
## absorbent-paper.yaml: absorbent-paper.csv
## airline-bumping.yaml: airline-bumping-2017.txt
## albuquerque-housing.yaml: housing.txt
## art-malpresentations.yaml: art-malpresentations.csv
## back-pain-runners.yaml: backpain.csv
## balance-measures-tall.yaml: balance2.txt
## balance-measures-wide.yaml: balance1.txt
## body-dimensions.yaml: body.txt
## breast-feeding-preterm.yaml: bf.csv
## burger-calories.yaml: burger.txt
## caries-detection.yaml: caries-detection.csv
## carotid-plaque.yaml: carotid-plaque.xls
## cholesterol-after-heart-attack.yaml: balance2.txt
## cigarette-measurements.yaml: cigarettes.csv, .sas7bdat,  .txt
## collaborative-consumption.yaml: collaborative-consumption.xlsx
## cracker-bloat.yaml: diet.txt
## cracker-fiber.yaml: fiber.txt
## digital-citizenship-revised.yaml: digital-citizenship-revised.sav
## digital-citizenship.yaml: digital-citizenship.sav
## energy.yaml: energy.txt
## energy01.yaml: energy01.csv
## energy02.yaml: energy02.tsv
## energy03.yaml: energy03.txt
## energy04.yaml: energy04.csv
## exercise-programs.yaml: exercise.sas7bdat
## fasting-turtles.yaml: fasting-turtles.txt
## fat.yaml: fat.csv, .txt
## fev.yaml: fev.txt
## fishing.yaml: fishing.txt
## fly1.yaml: fly1.txt
## fly2.yaml: fly2.txt
## fly3.yaml: fly3.txt
## full-moon-er-admissions.yaml: full-moon.txt
## gardasil.yaml: gardasil.csv, gardasil.tsv
## glycyrrhizin.yaml: glycyrrhizin.csv
## grace1000.yaml: grace1000.dat
## heroin.yaml: heroin.txt
## hiv-intervention.yaml: hiv-intervention.txt
## leader.yaml: leader.dta, RData, sas7bdat, sav, txt
## litter-weights.yaml: litter-weights.sav
## module02-datasets.yaml: module02-datasets.RData
## moon.yaml: moon.txt
## psychiatric-discharges.yaml: psychiatric-patients.txt
## quake.yaml: quake.txt
## rat-litter.yaml: rats.csv
## samara-velocity.yaml: samara.txt
## sharing.yaml: sharing.xlsx
## signapore-diamond-prices.yaml: diamonds.txt
## sleep.yaml: sleep.txt
## swim-speeds.yaml: swim-speeds
## termites.yaml: termites.txt
## titanic.yaml: titanic.txt
## transplant.yaml: transplant.txt
## transplant1.yaml: transplant1.csv
## transplant2.yaml: transplant2.csv
## transplant3.yaml: transplant3.csv
## two-small-dataframes.yaml: two-small-data-frames.RData
## vaccine-willingness.yaml: vaccine-willingness.csv
## whas100.yaml: whas100.dat
## whas500.yaml: whas500.dat
## woodard.yaml: wooodard.xls
```
