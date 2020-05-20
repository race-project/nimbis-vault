help([[
ISI Example Flow
]])
whatis("ISI Example Flow")
whatis("Version: 1.0")

load("anaconda")
load("cadence_base")
load("cadence_incisive")
load("cadence_innovus")
load("cadence_confrml")
load("synopsys")

setenv("NCSU_PDK_DIR", "/shared/software/isi/PDK/FreePDK45")
setenv("WORK_HOME", capture("echo $PWD | tr -d '\n' | tr -d '[:space:]'"))
setenv("DESIGN_NAME", "sync_mult")
setenv("CLOCK_PERIOD", "10")
