@echo off
echo Setting up directories
if not exist build\ (
mkdir build\debug
mkdir build\release
) else (
if not exist build\debug\ mkdir build\debug
if not exist build\release\ mkdir build\release
)
