help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 17.1")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "17.1"

setenv("CFM_HOME", "/shared/software/cadence/CONFRML171")
prepend_path("PATH", "/shared/software/cadence/CONFRML171/tools.lnx86/bin")
