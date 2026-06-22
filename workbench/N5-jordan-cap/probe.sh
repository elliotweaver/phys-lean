#!/bin/bash
# Bounded probe harness: run `lake env lean FILE` with a wall-clock kill + peak-mem report.
# Usage: probe.sh <lean-file> <timeout-seconds>
set -u
export LAKE=/Users/elliotweaver/.elan/bin/lake
FILE="$1"; TMO="${2:-90}"
cd /Users/elliotweaver/phys-lean
START=$(date +%s)
/usr/bin/time -l "$LAKE" env lean "$FILE" >/tmp/probe_out.txt 2>/tmp/probe_err.txt &
PID=$!
( sleep "$TMO"; kill -9 "$PID" 2>/dev/null; echo "WALL-KILL at ${TMO}s" >>/tmp/probe_err.txt ) &
WATCH=$!
wait "$PID" 2>/dev/null
RC=$?
kill -9 "$WATCH" 2>/dev/null
END=$(date +%s)
echo "=== exit=$RC  wall=$((END-START))s ==="
echo "--- stdout ---"; cat /tmp/probe_out.txt
echo "--- stderr (errors + time -l) ---"; grep -E "error|WALL-KILL|peak memory|real|maximum" /tmp/probe_err.txt | head -40
