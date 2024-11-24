cd /Users/phil/github/RokuCommunity/roku/.scripts
touch ./last_code_used

while :
  do
    echo " "
    echo " "
    echo "========================="
    echo "        Roku Projects"
    echo "========================="

    echo "Select a project to run:"

    echo favourites
    echo "lg01 layout group 01"
    echo "ll01 label list 01 02 03 04"
    
    echo "bk01 background ... bg01/2 button group ... b01/2/3/4 brighterscript ... chk01/2 checklist ... cp01/2 component ... gd01 grid"
    echo "gp01       ... grid panel 01"
    echo "hw01 .. 08 ... hello world 01 02 03 04 05 06 07 08"
    echo "kp01 .. 03  ... key-press-01 02 03"
    echo "lg01    ... layout group 01"
    echo "lg02    ... layout group 02"
    echo "ml01    ... markup list 01"
    echo "ml02    ... markup list 02"
    echo "ml03    ... markup list 03-sample"
    echo "over    ... overhang"
    echo "pg01    ... poster grid 01"
    echo "pg02    ... poster grid 02"
    echo "pg03    ... poster grid 03"
    echo "rb01    ... rooibos 01"
    echo "rect01/2   ... rectangle 01 02"
    echo "rd01       ... roku-deploy-01"
    echo "rl01/2/3   ... row list 01 02 03 (row list 02 has 150 items)"
    echo "vd01 .. 08 ... video 01 .. 08 ... 05 is the only one which works, others the feed is outdated"

    echo fix
    echo "gd01       ... grid 01 (fix)"

    echo " "

    cd /Users/phil/github/RokuCommunity/roku/.scripts

    echo " "
    last_code_used=$(cat ./last_code_used)
    echo last run this code was used $last_code_used

    script_code=$last_code_used

    if [ "$script_code" == "bk01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="background"
        project="background-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist
        echo "files moved to dist folder ready for deployment"
        echo "hit f5 to start project or command-shift-f5 to restart"
      elif [ "$script_code" == "b01" ]; then
        project="brighterscript-01"
        yes | cp ../.launch/$project.json ../.vscode/launch.json
        yes | cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/brighterscript/$project
        bsc
        echo "this is a brighterscrpt compiled project so ... to start the project"
    elif [ "$script_code" == "b02" ]; then
        project="brighterscript-02"
        yes | cp ../.launch/$project.json ../.vscode/launch.json
        yes | cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/brighterscript/$project
        bsc
        echo "this is a brighterscrpt compiled project so ... to start the project" 
    elif [ "$script_code" == "b03" ]; then
        project="brighterscript-03"
        yes | cp ../.launch/brighterscript.json ../.vscode/launch.json
        yes | cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/brighterscript/$project-classes
        bsc
        echo "this is a brighterscrpt compiled project"
    elif [ "$script_code" == "b04" ]; then
        project="brighterscript-04"
        yes | cp ../.launch/$project.json ../.vscode/launch.json
        yes | cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/brighterscript/$project
        bsc
        echo "this is a brighterscrpt compiled project so ... to start the project"



    elif [ "$script_code" == "bg01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="button-group"
        project="button-group-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist
        echo "files moved to dist folder ready for deployment"
        echo "hit f5 to start project or command-shift-f5 to restart"


    elif [ "$script_code" == "bg02" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="button-group"
        project="button-group-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist
        echo "files moved to dist folder ready for deployment"
        echo "hit f5 to start project or command-shift-f5 to restart"



    elif [ "$script_code" == "chk01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="checklist"
        project="checklist-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist
        echo "files moved to dist folder ready for deployment"
        echo "hit f5 to start project or command-shift-f5 to restart"



    elif [ "$script_code" == "chk02" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="checklist"
        project="checklist-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist
        echo "files moved to dist folder ready for deployment"
        echo "hit f5 to start project or command-shift-f5 to restart"


    elif [ "$script_code" == "cp01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="component"
        project="component-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "cp02" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="component"
        project="component-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist




    elif [ "$script_code" == "gd01" ]; then
        echo "no project present"


    elif [ "$script_code" == "gp01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="grid-panel"
        project="grid-panel-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist



    elif [ "$script_code" == "hw01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="hello-world"
        project="hello-world-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist




    elif [ "$script_code" == "hw02" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="hello-world"
        project="hello-world-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist






    elif [ "$script_code" == "hw03" ]; then
        project="hello-world-03"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/hello-world/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "hw04" ]; then
        project="hello-world-04"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/hello-world/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "hw05" ]; then
        project="hello-world-05"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/hello-world/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "hw06" ]; then
        project="hello-world-06"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/hello-world/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "hw07" ]; then
        project="hello-world-07"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/hello-world/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "hw08" ]; then
        project="hello-world-08"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/hello-world/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "kp01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="key-press"
        project="key-press-01"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R /Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project /Users/phil/github/RokuCommunity/roku/dist
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "kp02" ]; then
        project="key-press-02"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "kp03" ]; then
        project="key-press-03"
        cp ../.launch/$project.json ../.vscode/launch.json 
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ll01" ]; then
        project="label-list-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/label-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ll02" ]; then
        project="label-list-02"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/label-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ll03" ]; then
        project="label-list-03"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/label-list/$project-focus-font
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ll04" ]; then
        project="label-list-04"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/label-list/$project-focus-style
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "lg01" ]; then
        project="layout-group-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/layout-group/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "lg02" ]; then
        project="layout-group-02"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/layout-group/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ml01" ]; then
        project="markup-list-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/markup-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ml02" ]; then
        project="markup-list-02"
        cp ../.launch/$project.json ../.vscode/
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/markup-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "ml03" ]; then
        project="markup-list-03"
        cp ../.launch/$project.json ../.vscode/
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/markup-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "over" ]; then
        project="overhang"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/overhang/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "pg01" ]; then
        project="poster-grid-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/poster-grid/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "pg02" ]; then
        project="poster-grid-02"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/poster-grid/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "pg03" ]; then
        project="poster-grid-03"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/poster-grid/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "rd01" ]; then
        project="roku-deploy-01"
        yes | cp ../.launch/$project.json ../.vscode/launch.json
        yes | cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/roku-deploy/$project
        bsc
        echo "this is a brighterscrpt compiled project so ... to start the project"
    elif [ "$script_code" == "rb01" ]; then
        project="rooibos-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/rooibos/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "rect01" ]; then
        project="rectangle-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/rectangle/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "rect02" ]; then
        project="rectangle-02"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/rectangle/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "rl01" ]; then
        project="row-list-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/row-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "rl02" ]; then
        project="row-list-02"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/row-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "rl03" ]; then
        project="row-list-03"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/row-list/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd01" ]; then
        project="video-01"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd02" ]; then
        project="video-02"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd03" ]; then
        project="video-03"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd04" ]; then
        project="video-04"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd05" ]; then
        project="video-05"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd06" ]; then
        project="video-06"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd07" ]; then
        project="video-07"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"
    elif [ "$script_code" == "vd08" ]; then
        project="video-08"
        cp ../.launch/$project.json ../.vscode/launch.json
        cp ../.bsconfig/$project.json ../bsconfig.json
        cd ../projects/video/$project
        echo "hit f5 to start project or command-shift-f5 to restart"

    else
        echo "Invalid project code"
    fi

    sleep 0.5

    cd /Users/phil/github/RokuCommunity/roku/
    node ./roku-deploy.js

    sleep 3

    cd /Users/phil/github/RokuCommunity/roku/.scripts
    read -p "enter the project code: (press ENTER to use last code used [$last_code_used]): " script_code
    script_code=${script_code:-$last_code_used}
    echo $script_code > ./last_code_used


  done
