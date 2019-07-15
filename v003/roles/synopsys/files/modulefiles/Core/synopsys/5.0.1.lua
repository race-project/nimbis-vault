help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 5.0.1")
whatis("URL: https://www.cadence.com/")
whatis("Cadence is a leading EDA and System Design Enablement provider delivering tools, software, and IP")

local version = "5.0.1"

prepend_path("LM_LICENSE_FILE", "@@SYNOPSYS_LICENSE_FILE@@")

setenv("SYNBASE", "/shared/software/synopsys")
setenv("SYN_HOME", "/shared/software/synopsys/syn/O-2018.06-SP5-3")
setenv("PTS_HOME", "/shared/software/synopsys/pts/O-2018.06-SP5-1")

prepend_path("PATH", "/shared/software/synopsys/syn/O-2018.06-SP5-3/bin")
prepend_path("PATH", "/shared/software/synopsys/pts/O-2018.06-SP5-1/bin")
