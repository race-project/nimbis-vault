help([[
For detailed instructions, go to:
   https://conda.io/docs/
]])
whatis("URL: https://conda.io/docs/")
whatis("Description: Package, dependency and environment management for any language—Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, FORTRAN")

setenv("ANACONDA_PYTHON", "/opt/anaconda/bin/python")

prepend_path("PATH", "/opt/anaconda/bin")
