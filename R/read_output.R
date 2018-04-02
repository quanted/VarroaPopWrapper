#' Read VP results for MCMC analysis
#'
#'
#' Function to read results from a set of 10 vp runs (one for each site/neonic profile)
#' outputs a 3d array of results (dim 1 = day, dim 2 = response var, dim 3 = site)
#'
#' @param out_path Directory to look for results files in (e.g. C:/VarroaPop/output/)
#' @param out_filename Name of the VarroaPop results file to read (e.g. "myresults.txt")
#'
#' @return a dataframe of VP outputs (columns) by simulation date (rows)
#'
#' @author Jeffrey M Minucci, \email{jminucci2@@gmail.com}
#'
#' @export


read_output <- function(out_path, out_filename="vp_results.txt"){
  #requireNamespace("utils", quietly = TRUE)
  outvar<- c("Date","Colony Size","Adult Drones","Adult Workers", "Foragers", "Capped Drone Brood", "Capped Worker Brood",
             "Drone Larvae", "Worker Larvae", "Drone Eggs", "Worker Eggs", "Free Mites", "Drone Brood Mites",
             "Worker Brood Mites", "Mites/Drone Cell", "Mites/Worker Cell", "Mites Dying", "Proportion Mites Dying",
             "Colony Pollen (g)", "Pollen Pesticide Concentration", "Colony Nectar", "Nectar Pesticide Concentration",
             "Dead Drone Larvae", "Dead Worker Larvae", "Dead Drone Adults", "Dead Worker Adults", "Dead Foragers",
             "Queen Strength", "Average Temperature (celsius)", "Rain")


  # read output files
  #outputs <- array(data=NA, c(125,length(outvar)-1,Nsims))
  df <- utils::read.table(paste(out_path,out_filename, sep=""), header= FALSE, sep= "",
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL, col.names = outvar)
  #df <- df[,2:ncol(df)]
  #outputs[1:nrow(df),1:(ncol(df)-1),j] <- abind(newarray[1:nrow(df),1:(ncol(df)-1)], along=3)

  return(df)

}
