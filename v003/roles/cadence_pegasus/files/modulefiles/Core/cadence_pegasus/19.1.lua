help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 19.1")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "19.1"

setenv("PVS_HOME", "/shared/software/cadence/PEGASUS191")
prepend_path("PATH", "/shared/software/cadence/PEGASUS191/tools.lnx86/bin")
