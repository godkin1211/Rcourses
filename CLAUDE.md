# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an R courses repository containing educational materials, R Markdown documents, and Shiny applications for teaching R programming and data science concepts. The repository includes both static course materials and interactive applications.

## Key Components

### Course Materials
- **R.Rmd**: Comprehensive R programming tutorial (v3.2) covering basics, installation, package management, and development tools
- **Bioconductor_shiny.Rmd**: Interactive presentation on building Shiny applications with Bioconductor packages
- **R.html**: Rendered HTML version of the R tutorial
- **img/**: Directory containing course images and diagrams

### Shiny Applications
- **BlasterJS/**: A golem-based Shiny application package using BlasterJS components
  - Uses the golem framework for production-ready Shiny apps
  - Includes proper package structure with DESCRIPTION, NAMESPACE, and man/ directories
  - Contains JavaScript integration with BlasterJS and html2canvas libraries
- **chemmineR_app/**: Appears to be a ChemmineR-based application (files not present in current structure)

### Data Files
- **SDF/**: Chemical structure data files in SDF format (testsdf01_01.sdf through testsdf10_10.sdf)
- **homework.csv**: Course assignment data
- **sdfsample.sdf**: Sample chemical structure file

## Development Commands

### For BlasterJS Shiny Application
- **Run development server**: `Rscript BlasterJS/dev/run_dev.R` 
- **Check package**: `devtools::check()` (from BlasterJS/dev/03_deploy.R)
- **Build package**: `devtools::build()` (from BlasterJS/dev/03_deploy.R)
- **Add tests**: `usethis::use_test("app")` (from BlasterJS/dev/02_dev.R)
- **Document and reload**: `golem::document_and_reload()` (from BlasterJS/dev/run_dev.R)

### For R Markdown Documents
- Render R.Rmd using standard R Markdown knitting process
- The Bioconductor_shiny.Rmd uses `runtime: shiny` for interactive presentations

## Architecture Notes

### BlasterJS Application Structure
- Built using the golem framework for robust, production-ready Shiny applications
- Follows R package conventions with proper DESCRIPTION file and dependencies
- UI defined in `R/app_ui.R`, server logic in `R/app_server.R`
- External JavaScript resources managed through golem's resource system
- Uses htmlTemplate for integrating BlasterJS components

### Course Content Structure
- Educational materials focus on R basics, package management, and Bioconductor
- Includes practical examples with chemical informatics (ChemmineR package)
- Interactive elements built with Shiny for hands-on learning

## Dependencies
- **Core R packages**: shiny, golem, config
- **Bioconductor**: ChemmineR (for chemical data processing)
- **JavaScript libraries**: BlasterJS, html2canvas (located in BlasterJS/inst/app/www/js/)

## File Conventions
- R project uses spaces for indentation (4 spaces per tab)
- UTF-8 encoding throughout
- Standard R package documentation with roxygen2