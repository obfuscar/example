Obfuscar Example Repository
===========================
This repo uses Visual Studio 2017 to demonstrate how to use Obfuscar 2.2.8.

1. Add a NuGet package to your final project (BasiExampleExe in this case) as package reference (if you use packages.config, then the obfuscar tool path needs to change accordingly).
2. Compile the binaries to the input folder.
3. Call the obfuscar tool with a configuration file (obfuscar.xml) in this case.

The obfuscared result is in the output folder.