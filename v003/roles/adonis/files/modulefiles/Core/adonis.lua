help([[
For detailed instructions, go to:
   https://www.cadence.com/
]])
whatis("Version: 1.0")
whatis("URL: https://silicontechnologiesinc.com")
whatis("Adonis is a flow supported by Silicon Technologies Inc as part of the DARPA CRAFT program")

load("cadence_base")
load("cadence_virtuoso")
load("cadence_spectre")
load("cadence_pegasus")
load("cadence_ext")

setenv("CDSHOME", "/shared/software/cadence/ICADV123")
prepend_path( "PATH", "/shared/software/adonis/bin")

execute {cmd="/shared/software/adonis/bin/adonis_tsmc_setup.sh", modeA={"load"}}
