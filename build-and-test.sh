#!/bin/sh

dotnet restore
dotnet build
dotnet test UnitTestProject1
