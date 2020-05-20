help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 15.2")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "15.2"

setenv("INC_HOME", "/shared/software/cadence/INCISIVE152")
prepend_path("PATH", "/shared/software/cadence/INCISIVE152/tools.lnx86/bin")
