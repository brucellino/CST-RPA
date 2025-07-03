# CST Robotic Procedure Automation

This is the repository contianing task definitions for procedures relevant to the 
EGI Community Support Team.

## Creating and Running Procedures

Procedures are contained in the [procedures](procedures) directory.

Typically write one procedure per file, re-using libraries or resources as appropriate.

Call a procedure by its name:

`robot -t '<procedure name>' .`

_e.g._

robot -t 'Make A New Weekly Report Page'

## Tooling

Tools required to execute these tasks are managed by Mise.
Libraries typically used are the `robotframework` and `robotframework-browser` libraries.
If other robot framework or python libraries are required, adad them to [the requirements file](procedures/requirements.txt)

Where functionanlity or keywords are required that are not provided by these 
upstream packages, you can write your own keywords in python.
See the [`procedures/libraries`](procedures/libraries/) directory.

## Automation

There is no automation yet, since we don't have an agreed-upon scheduler.
This could be added to system tasks in the EGI Collaboration Tools Platform orchestrator though.