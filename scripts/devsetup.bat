@echo off
echo Setting up directories
if not exist bin\ (
mkdir bin\debug
mkdir bin\release
) else (
if not exist bin\debug\ mkdir bin\debug
if not exist bin\release\ mkdir bin\release
)
