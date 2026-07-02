#!/bin/bash
cd /Users/elliotweaver/phys-lean
export LAKE=/Users/elliotweaver/.elan/bin/lake
bash scripts/gate-fast.sh > workbench/N253-select/gate.log 2>&1
echo "GATE EXIT: $?" >> workbench/N253-select/gate.log
