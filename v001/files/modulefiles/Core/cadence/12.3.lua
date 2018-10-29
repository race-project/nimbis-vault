help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 12.3")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "12.3"

setenv("LM_LICENSE_FILE", "1800@license.usc.edu")
setenv("CDS_INST_DIR", "/shared/software/cadence")

setenv("SPECTRE_DEFAULTS", "-E")
setenv("CDS_Netlisting_Mode", "Analog")

setenv("OA_HOME", capture("ls -d -1 /shared/software/cadence/oa_v22* | tr -d '\n'"))

prepend_path("PATH", "/shared/software/cadence/tools/plot/bin")
prepend_path("PATH", "/shared/software/cadence/tools/dfII/bin")
prepend_path("PATH", "/shared/software/cadence/tools/bin")
prepend_path("PATH", "/shared/software/cadence/bin")
