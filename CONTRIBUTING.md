# Contributing

1. Install the .NET 10 SDK (see `global.json`).
2. `dotnet build` and `dotnet test` must both pass with no warnings: warnings are treated as errors.
3. New behaviour needs tests: conversion maths in `UnitConversion.Domain.Tests`, HTTP behaviour in `UnitConversion.Api.Tests`.
4. New units must use **exact** published conversion factors (cite the definition in a comment if it isn't obvious)
   and must not reuse an existing id, symbol or alias; the catalog validation will fail the build if they do.
5. Follow `.editorconfig`. Run `dotnet format` before pushing.
6. Keep the domain project free of ASP.NET dependencies.
