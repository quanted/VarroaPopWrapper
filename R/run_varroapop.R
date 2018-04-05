#' Run the VarroaPop honey bee colony model on a local computer
#'
#' Function to run the VarroaPop honey bee colony model for a given set of parameters, with options to set and
#'  save the input, output, and log files. Path to the weather file
#'  must be set in the .vrp file, or as the input parameter 'WeatherFileName'
#'
#'
#' @return A dataframe where each column is a VarroaPop output and rows are daily values (with the first row
#'  giving initial values at time 0.)
#'
#' @param parameters Named vector of VarroaPop inputs to be written to .txt file.
#' @param exe_file = Full path to the VarroaPop exe file, e.g. 'C:/VarroaPop/exe/VarroaPop.exe' (optional)
#' @param vrp_file = Full path to the VarroaPop session file, e.g. 'C:/VarroaPop/exe/default.vrp' (optional)
#' @param in_path Full path of directory to write inputs file to, e.g. 'C:/VarroaPop/inputs/' (optional)
#' @param in_filename Name of input files which will be created e.g. 'myinput.txt' (optional)
#' @param log_path Full path of directory to write log files to e.g. 'C:/VarroaPop/logs/'(optional)
#' @param out_path Full path of directory to write outputs file to, e.g. 'C:/VarroaPop/outputs/' (optional)
#' @param out_filename Name of input files which will be created e.g. 'myoutput.txt' (optional)
#' @param save_files T/F should input, output, and log files be kept or deleted afterward?
#' @param logs T/F create VarroaPop program log files?
#' @param verbose T/F print extra details?

#' @author Jeffrey M Minucci, \email{jminucci2@@gmail.com}
#'


RunVarroaPopLocal <- function(parameters,
                              exe_file = system.file("varroapop_files","exe","VarroaPop.exe",package="VarroaPopWrapper"),
                              vrp_file = system.file("varroapop_files","exe","default.vrp",package="VarroaPopWrapper"),
                              in_path = system.file("varroapop_files","input",package="VarroaPopWrapper"),
                              in_filename = "vp_input.txt",
                              log_path = system.file("varroapop_files","logs",package="VarroaPopWrapper"),
                              out_path = system.file("varroapop_files","output",package="VarroaPopWrapper"),
                              out_filename = "vp_results.txt",
                              weather_file = system.file("varroapop_files","weather","18815_grid_39.875_lat.wea",
                                                         package="VarroaPopWrapper"),
                              save_files = FALSE,
                              logs = FALSE, verbose = FALSE){

  print(exe_file)
  write_vp_input(parameters, in_path, in_filename, weather_file,verbose)
  run_vp(exe_file, vrp_file, paste(in_path,in_filename,sep=""), out_path, out_filename, log_path, logs, verbose)
  to_return <- read_output(out_path, out_filename)
  if(!save_files){
    file.remove(paste(in_path,in_filename,sep=""), paste(log_path,"vp_log.txt",sep=""),
                paste(out_path,out_filename,sep=""))
  }
  return (to_return)


}


#' Run the VarroaPop honey bee colony model
#'
#' Function to run the VarroaPop honey bee colony model for a given set of parameters. Currently using
#' default weather from Columbus, Ohio 1990-2015.
#'
#'
#' @return A dataframe where each column is a VarroaPop output and rows are daily values (with the first row
#'  giving initial values at time 0.)
#'
#' @param parameters Named vector or list of VarroaPop inputs to be written to .txt file.
#'
#' @author Jeffrey M Minucci, \email{jminucci2@@gmail.com}
#'
#' @examples
#'  parameters <- c("ICWorkerBrood"=1000, "ICWorkerAdult"=1500)
#'  RunVarroaPop(parameters)
#' @export


RunVarroaPop <- function(parameters){
  if(is.null(names(parameters))) stop("You must supply a named vector or list of parameters")
  exe_file = system.file("varroapop_files","exe","VarroaPop.exe",package="VarroaPopWrapper")
  if(exe_file == "") stop("Cannot find exe file")
  vrp_file = system.file("varroapop_files","exe","default.vrp",package="VarroaPopWrapper")
  in_path = system.file("varroapop_files","input",package="VarroaPopWrapper")
  in_filename = "vp_input.txt"
  log_path = system.file("varroapop_files","logs",package="VarroaPopWrapper")
  out_path = system.file("varroapop_files","output",package="VarroaPopWrapper")
  out_filename = "vp_results.txt"
  weather_file = system.file("varroapop_files","weather","18815_grid_39.875_lat.wea",
                             package="VarroaPopWrapper")
  logs = TRUE
  verbose = TRUE
  write_vp_input(parameters, in_path, in_filename, weather_file,verbose)
  run_vp(exe_file, vrp_file, paste(in_path,in_filename,sep=""), out_path, out_filename, log_path, logs, verbose)
  to_return <- read_output(out_path, out_filename)
  #file.remove(paste(in_path,in_filename,sep=""),paste(out_path,out_filename,sep=""))
  return(jsonlite::toJSON(to_return, dataframe="columns"))
}

