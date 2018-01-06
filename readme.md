Obfuscar Example Repository
===========================

[![Build status](https://img.shields.io/appveyor/ci/lextm/obfuscar-example/master.svg?label=appveyor&style=flat-square)](https://ci.appveyor.com/project/lextm/obfuscar-example)

This repo uses Visual Studio 2017 to demonstrate how to use Obfuscar 2.2.11.

1. Add a NuGet package to your final project (BasiExampleExe in this case).
2. Use post build even to call Obfuscar with a configuration file (obfuscar.xml) in this case.

The obfuscated assemblies are in the output folder (`.\BasicExampleExe\bin\Debug\Obfuscator_Output` or `.\BasicExampleExe\bin\Release\Obfuscator_Output`).

Obfuscar Source Code can be found at [GitHub](https://github.com/lextm/obfuscar/).

The documentation is hosted at [ReadTheDocs](http://docs.obfuscar.com/).
