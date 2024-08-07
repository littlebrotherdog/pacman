#!/bin/bash
#pip install requrements.txt
cd src/
mkdir logs
END=6

echo "Playing against baseline team"
for ((i=1;i<=$END;i++));do
    map=$((1 + $RANDOM % 100000));
    echo "Running seed ${map}";
    python capture.py -n 300 -x 300  -r myTeam -b baselineTeam -q -l RANDOM${map}
    python capture.py -n 300 -x 300  -b myTeam -r baselineTeam -q -l RANDOM${map}
done

echo "Playing against heuristic team "
for ((i=1;i<=$END;i++));do
    map=$((1 + $RANDOM % 100000));
    echo "Running seed ${map}";

    python capture.py -n 300 -x 300  -r myTeam -b heuristicTeam -q -l RANDOM${map}
    python capture.py -n 300 -x 300  -b heuristicTeam -r myTeam  -q -l RANDOM${map}
done
