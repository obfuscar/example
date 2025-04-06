Obfuscar Example Repository
===========================

[![Build status](https://img.shields.io/appveyor/ci/lextm/obfuscar-example/master.svg?label=appveyor&style=flat-square)](https://ci.appveyor.com/project/lextm/obfuscar-example)

This repo uses Visual Studio to demonstrate how to use Obfuscar for .NET Framework release 2.2.

1. Add a NuGet package to your final project (BasiExampleExe in this case).
2. Use post build event to call Obfuscar with a configuration file (obfuscar.xml).

The obfuscated assemblies are in the output folder (`.\BasicExampleExe\bin\Debug\Obfuscator_Output` or `.\BasicExampleExe\bin\Release\Obfuscator_Output`).

Note that

* The NuGet package used in this example is packed for .NET Framework assemblies.
* **If you are working on .NET/.NET Core/.NET Standard assemblies, please [use Obfuscar Global Tool build for .NET](https://docs.lextudio.com/obfuscar/getting-started/basics#net-core-global-tools).**

Obfuscar Source Code can be found at [GitHub](https://github.com/obfuscar/obfuscar/).

The documentation can be found [here](http://docs.obfuscar.com/).
