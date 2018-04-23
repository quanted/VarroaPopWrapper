##
# Write VarroaPop Inputs
# code by Jeff Minucci
#
##



#' Write a VarroaPop input file from a named list or vector
#'
#' Function to create a single input file from a set of parameters in the form of
#' a one row dataframe, where columns are named.
#'
#' @param params Named vector of VarroaPop inputs to be written to .txt file.
#' @param in_path Directory to write vp_input.txt file to (optional).
#' @param in_filename Filename of the written input file. Defaults to 'vp_input.txt'.
#' @param weather_file Full path to the weather file e.g. C:/VarroaPop/weather.wea (must be .wea/.dvf/.wth) OR
#'  one of either 'Columbus' (default), 'Sacramento', 'Phoenix', 'Yakima', 'Eau Claire', 'Jackson', or 'Durham'
#' @param verbose T/F print extra details?
#'
#' @return None... writes inputs to a .txt file in in_path for VarroaPop
#'
#' @author Jeffrey M Minucci, \email{jminucci2@@gmail.com}
#'
#' @examples
#'  parameters <- c("foo"=15,"bar"=4)
#'  write_vp_input(parameters, in_path = "d:/path/to/inputdir")
#'
#' @export

write_vp_input <- function(params, in_path = system.file("varroapop_files","input",package="VarroaPopWrapper"),
                           in_filename = 'vp_input.txt',
                           weather_file = 'Columbus',
                           verbose=F){
  weather_locs <- c("columbus" = system.file("varroapop_files","weather","18815_grid_39.875_lat.wea",package="VarroaPopWrapper"),
                    "sacramento" = system.file("varroapop_files","weather","17482_grid_38.375_lat.wea",package="VarroaPopWrapper"),
                    "phoenix" = system.file("varroapop_files","weather","12564_grid_33.375_lat.wea",package="VarroaPopWrapper"),
                    "yakima" = system.file("varroapop_files","weather","25038_grid_46.375_lat.wea",package="VarroaPopWrapper"),
                    "eau claire" = system.file("varroapop_files","weather","23503_grid_44.875_lat.wea",package="VarroaPopWrapper"),
                    "jackson" = system.file("varroapop_files","weather","11708_grid_32.375_lat.wea",package="VarroaPopWrapper"),
                    "durham" = system.file("varroapop_files","weather","15057_grid_35.875_lat.wea",package="VarroaPopWrapper"))
  if(tolower(weather_file) %in% names(weather_locs)) weather_file <- weather_locs[weather_file]
  if(verbose){
    print(paste("Printing input file to:",in_path))
    print(paste("Weather file location:", weather_file))
  }
  inputs <- paste(names(params),as.character(params),sep="=")
  inputs <- c(inputs, paste("WeatherFileName",weather_file,sep="="))
  write(inputs, file = paste(in_path, in_filename, sep = ""), sep="")
}


#' Write a VarroaPop input file where each named parameter is to be written (except in_path or verbose)
#'
#' function to create a single input file from a set of parameters in the form of
#' a one row dataframe, where columns are named
#'
#' @param in_path Directory to write vp_input.txt file to
#' @param ... Initial parameters to be passed to VarroaPop
#' @param in_filename Filename of the written input file. Defaults to 'vp_input.txt'.
#' @param verbose T/F print extra details?
#'
#' @return None... writes inputs to a .txt file in in_path for VarroaPop
#'
#' @examples
#'  parameters <- c()
#'  write_vp_input(in_path = "d:/path/to/inputdir",foo=15,bar=4)
#'
#' @export

write_vp_input_long <- function(in_path = paste(system.file(package="VarroaPopWrapper"),
                                 "/varroapop_files/input",sep=""), ... ,
                                in_filename = 'vp_input.txt', verbose=F){
  dots = list(...)
  if(verbose){
    print(paste("Printing input file to:",in_path))
  }
  inputs <- paste(names(dots),as.character(dots),sep="=")
  write(inputs, file = paste(in_path, in_filename, sep = ""), sep="")
}



