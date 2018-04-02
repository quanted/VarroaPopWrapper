
#' Run VarroaPop simulations
#'
#' Wrapper code to run the VP exe for MCMC analysis.
#'
#'
#' @param exe_file Full path to the VarroaPop.exe file (e.g. 'C:/VarroaPop/bin/VarroaPop.exe').
#' @param vrp_file Full path to the .vrp file (e.g. 'C:/VarroaPop/bin/default.vrp').
#' @param in_file Full path to the input file (e.g. 'C:/VarroaPop/input/myfile.txt').
#' @param out_path Full path to the output folder, with trailing slash (e.g. 'C:/VarroaPop/output/).
#' @param out_filename Optional: custom file name for the output file.
#' @param log_path path to the log folder (e.g. 'C:/VarroaPop/logs).(can be omitted if logs=F)
#' @param logs T/F, should VP write a log file to the log_path folder?
#' @param verbose T/F, print extra details?
#'
#' @return None - VP writes output to the out_path directory
#'
#' @author Jeffrey M Minucci, \email{jminucci2@@gmail.com}
#'
#' @export


run_vp<- function(exe_file, vrp_file, in_file,out_path, out_filename = "vp_results.txt",
                  log_path=NULL,logs=T,verbose=F){
  log_filename <- "vp_log.txt"
  if(logs){
    if(is.null(log_path)) stop("If logs=TRUE, a log path must be specified")
    vpdir_command <- paste(vrp_file,
                           " /b /or ", out_path, out_filename,
                           " /i ", in_file, " /ol ", log_path, log_filename, sep="")
  } else {
    vpdir_command <- paste(vrp_file,
                           " /b /or ", out_path, out_filename,
                           " /i ", in_file, sep="")
  }
  if(verbose) print(paste(exe_file, vpdir_command, sep=" "))
  system2(exe_file, vpdir_command)
}

