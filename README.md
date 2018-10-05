# VarroaPopWrapper
An R wrapper for the VarroaPop honey bee colony model
Developed by: Jeffrey Minucci (www.github.com/JeffreyMinucci)

#### To install:

1) Install the R package devtools
2) From R run: 
  `install_github("quanted/VarroaPopWrapper")`


For a server-based API which runs Varroapop see:
www.github.com/quanted/VarroaPopServer

For a python version of the wrapper see:
www.github.com/quanted/VarroaPy


#### To use VarroaPopWrapper:

    library(VarroaPopWrapper)

Create a named vector of VarroaPop inputs. Parameters that are not set here will take the default values from the VarroaPop session file found at 'VarroaPopWrapper/inst/varroapop_files/exe/default.vrp'. The VarroaPopWrapper folder will be inside the library where your R packages get installed. If you'd like to modify these defaults you can open this session file in the VarroaPop GUI, edit it, and save it. 

    params = (ICWorkerAdults = 15000, ICWorkerBrood = 10000, ICWorkerLarave = 13000, SimStart = "04/30/2015")

Also specify either a path to a valid weather file, or one of the default locations: "Columbus" (OH; default), "Sacramento", "Phoenix", "Yakima", "Eau Claire", "Jackson" (MS), or "Durham"

    weather = "Yakima"
    
Then just use the RunVarroaPopLocal function, which will return a dataframe of the VarroaPop model output:

    output <- RunVarroaPopLocal(parameters = params, weather_file = weather)
    output

There are optional parameters in the RunVarroaPopLocal function to specify a custom location to place the input, output, and log text files that VarroaPop uses. You can set these and also set save_files=TRUE if you want to keep these files. See the function documentation for details.
