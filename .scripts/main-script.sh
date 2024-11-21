touch ./last_code_used
while :
  do

    echo "========================="
    echo "        Roku Projects"
    echo "========================="

    echo "Select a project to run:"
    echo "b03 ... brighterscript-03"
    echo "k01 ... key-press-01"
    echo "k02 ... key-press-02"
    echo "k03 ... key-press-03"
    echo " "

    last_code_used=$(cat ./last_code_used)
    echo last run this code was used $last_code_used

    read -p "enter the project code: [$last_code_used]: " script_code
    script_code=${script_code:-$last_code_used}

    echo $script_code > ./last_code_used

    if [ "$script_code" == "b03" ]; then
        yes | cp ../.launch/brighterscript-03.json ../.vscode/launch.json
        yes | cp ../.bsconfig/brighterscript-03.json ../bsconfig.json
        cd ../projects/brighterscript/brighterscript-03-classes
        bsc
    elif [ "$script_code" == "k01" ]; then
        cp ../.launch/key-press-01.json ../.vscode/launch.json
        cp ../.bsconfig/key-press-01.json ../bsconfig.json
        cd ../projects/key-press/key-press-01
    elif [ "$script_code" == "k02" ]; then
        cp ../.launch/key-press-02.json ../.vscode/launch.json
        cp ../.bsconfig/key-press-02.json ../bsconfig.json
        cd ../projects/key-press/key-press-02
        echo "hit f5 to start project"
    elif [ "$script_code" == "k03" ]; then
        cp ../.launch/key-press-03.json ../.vscode/launch.json
        cp ../.bsconfig/key-press-03.json ../bsconfig.json
        cd ../projects/key-press/key-press-03
        echo "hit f5 to start project"
    fi



    sleep 0.5
  done

