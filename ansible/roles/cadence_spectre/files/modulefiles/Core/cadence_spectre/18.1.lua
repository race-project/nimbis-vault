help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 18.1")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "18.1"

setenv("SPECTRE_DEFAULTS", "-E")
setenv("CDS_Netlisting_Mode", "Analog")
setenv("CDS_AUTO_64BIT", "ALL")

setenv("SPT_HOME", "/shared/software/cadence/SPECTRE181")
prepend_path("PATH", "/shared/software/cadence/SPECTRE181/tools.lnx86/bin")
