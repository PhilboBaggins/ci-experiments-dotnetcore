#!/bin/sh

dotnet build --verbosity=quiet

dotnet test UnitTestProject1
