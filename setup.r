# Setup.r

# =============================================================
# R environment
# =============================================================
options( stringsAsFactors=FALSE )
default.stringsAsFactors()
# Formerly was set in .Rprofile file

# ==========================================================
# Directories -- Local
# ==========================================================

homestart.dir        = "/Users/timothywyant/Dropbox/Homestart"
homestart.docs.dir   = paste( homestart.dir, 'Homestart-docs', sep='/')

analysis.dir         = homestart.dir
functions.dir        = paste( analysis.dir, 'Functions', sep='/')
output.dir           = paste( analysis.dir, 'Rdata', sep='/')
schools.dir          = paste( analysis.dir, "Homestart - Schools", sep='/')
schools.by.grade.dir = paste( schools.dir, "Portland enrollments, by grade level")

# ==========================================================
# Directories -- Dropbox, accessible from web
# ==========================================================

# This is from when I was thinking of putting my Homestart documents as a web page in Dropbox
# I ditched that for various reasons, though could pick it up again in the future
# Instead, the documents page is on github 4/29/16
# See Evernotes
homestart.link      = "https://www.dropbox.com/sh/010g78d365gpwsh/AABcHt9z6_PmbQsBR_yAwjM_a?dl=0"
homestart.docs.link = "https://www.dropbox.com/sh/y0s50a023wzpb5q/AAB9MDhKfbPMHwctWjLHuZ6Fa?dl=0"


# ==========================================================
# Packages
# ==========================================================

hadley.packs     = c( 'magrittr', 'plyr', 'dplyr', 'stringr', 'lubridate', 'reshape2', 'tidyr', 'testthat', 'readxl')
ggplot.packs     = c( 'ggplot2', 'grid', 'gridExtra', 'scales', 'RColorBrewer', 'plotly')
utility.packs    = c( 'knitr', 'DT', 'xtable', 'Hmisc', 'zoo', 'formattable', 'stringi', 'DiagrammeR')
data.manip.packs = c( 'data.table')
survival.packs   = c( 'survival', 'mstate', 'msSurv', 'randomSurvivalForest')
import.packs     = c( 'XLConnect', 'RJSONIO') # xlsx. RODBC
impute.packs     = c( 'Amelia')

mapping.packs    = c( 'sp', 'maptools', 'rgdal', 'rgeos', 'RgoogleMaps', 'raster', 'rasterVis', 'ggmap')
# One of the mapping packs masks dplyr::select))

scraping.packs   = c( 'XML', 'xml2')
my.packs         = c( 'asbestos')
paper.pack       = 'paper'

install = function(x) { 
  for (i in 1:length(x)) {
    require( x[i], character.only=TRUE, quietly=TRUE) }
}

install( hadley.packs)
install( ggplot.packs)
install( import.packs)
install( impute.packs)
install( utility.packs)
install( scraping.packs)
install( paper.pack)

# Install mapping packs only if needed -- masks some commonly used functions
# install( mapping.packs)  # Has a select() function that masks the one from dplyr

# =============================================================
# Functions loaded via source()
# =============================================================

curr.dir = getwd()
if (!is.null( functions.dir)) {
  setwd(functions.dir)
  func.names = dir()
  nf         = length(func.names)
  if (nf > 0) {
    for (i in 1:nf) {
      source( func.names[i])
      # Use option local=TRUE for caching functions in knitr
    }
  }
  func.names
}
setwd(curr.dir)