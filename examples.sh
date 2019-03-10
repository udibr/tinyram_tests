#!/bin/bash
set -e
mkdir -p libsnark/build
cd libsnark/build
cmake ..
make demo_ram_ppzksnark
cd ../..
if yes '' | libsnark/build/libsnark/demo_ram_ppzksnark --assembly simple.s --processed_assembly simple.proc --architecture_params simple.params --computation_bounds simple.bounds --primary_input simple.input --auxiliary_input simple.input | grep "The verification result is: FAIL"; then
    echo "Unexpected fail!" >&2
elif yes '' | libsnark/build/libsnark/demo_ram_ppzksnark --assembly simple.s --processed_assembly simple.proc --architecture_params simple.params --computation_bounds simple.bounds --primary_input simple.input --auxiliary_input simple.false_input | grep "The verification result is: PASS"; then
    echo "Unexpected success!" >&2
else
    echo "All clear!"
fi
