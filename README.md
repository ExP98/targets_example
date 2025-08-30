# targets_example

Minimal working example of the targets package in R, centered around an interactive presentation:
- Live presentation: https://exp98.github.io/targets_example/
- The presentation is built exclusively with R using Quarto (no other languages/tools).

## Why targets?
targets helps you build reproducible, efficient data pipelines:
- Declare a DAG of steps (targets); it runs only what changed.
- Caches intermediate results to avoid redundant work.
- Scales from local runs to parallel/backends without changing code.
- Makes pipelines inspectable (graphs, metadata, progress).

## What’s in this example
- A small pipeline that produces artifacts used in the presentation.
- A saved pipeline graph for quick inspection (targets_graph.html).
- Simple folder layout to keep code, outputs, and slides separate.

## Quick start
1) Open the project in R/RStudio.
2) Install packages:
```r
install.packages("targets")         # pipeline
# optional helpers:
# install.packages("tarchetypes")
```
3) Run the pipeline:
```r
targets::tar_make()
```
4) Explore the pipeline graph:
```r
targets::tar_visnetwork()
```
Or open the pre-rendered file: targets_graph.html

Build slides locally (optional; requires Quarto):
- Render with Quarto (from R): quarto::quarto_render("03.Presentation")
- Or via CLI: quarto render 03.Presentation

## Project layout
- _targets.R — pipeline definition
- _targets.yaml and _targets/ — targets metadata/cache
- 01.Targets/ — scripts supporting targets
- 02.Outputs/ — generated artifacts
- 03.Presentation/ — Quarto slides (rendered for the live site)
- docs/ — site output for GitHub Pages
- targets_graph.html — saved pipeline graph
