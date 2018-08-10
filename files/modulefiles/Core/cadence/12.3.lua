help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 12.3")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "12.3"

setenv("LM_LICENSE_FILE", "1800@license.usc.edu")

setenv("SPECTRE_DEFAULTS", "-E")
setenv("CDS_Netlisting_Mode", "Analog")

setenv("CDS_INST_DIR", "/opt/cadence/ICADV123")
setenv("MMSIM_HOME", "/opt/cadence/MMSIM151")
setenv("CDSHOME", "/opt/cadence/ICADV123")
setenv("PVSHOME", "/opt/cadence/PVS151")
setenv("OA_HOME", capture("ls -d -1 /opt/cadence/ICADV123/oa_v22* | tr -d '\n'"))

prepend_path("PATH", "/opt/cadence/MMSIM151/tools/bin")
prepend_path("PATH", "/opt/cadence/ICADV123/tools/plot/bin")
prepend_path("PATH", "/opt/cadence/ICADV123/tools/dfII/bin")
prepend_path("PATH", "/opt/cadence/ICADV123/tools/bin")
prepend_path("PATH", "/opt/cadence/ICADV123/bin")
prepend_path("PATH", "/opt/cadence/PVS151/tools/bin")
