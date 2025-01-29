#!/bin/bash
set -x   # <--- Turn on debugging
echo "Restarting InfernoMOO..." | tee -a /opt/InfernoMOO/moo_startup.log

# Navigate to the InfernoMOO directory
cd /opt/InfernoMOO || { echo "Error: Failed to cd to /opt/InfernoMOO" | tee -a /opt/InfernoMOO/moo_startup.log; exit 1; }

# Ensure the MOO server binary is executable
chmod +x InfernoMOOSource/moo

# Log startup
echo "Starting MOO server on port 7779..." | tee -a /opt/InfernoMOO/moo_startup.log

# Correctly format command arguments
exec ./InfernoMOOSource/moo -l "moo.log" "Databases/hell2010.db" "Databases/hell2010-save.db" 7779