cd /Users/phil/github/RokuCommunity/roku/.scripts
touch ./last_code_used

deploy_code_to_roku_device () {
    sleep 0.5
    cd /Users/phil/github/RokuCommunity/roku/
    node ./roku-deploy.js
}

get_project_code_from_user () {
    sleep 2
    cd /Users/phil/github/RokuCommunity/roku/.scripts
    read -p "enter the project code: (press ENTER to use last code used [$last_code_used]): " script_code
    script_code=${script_code:-$last_code_used}
    echo $script_code > ./last_code_used
}

display_list_of_projects () {
        echo "Select a project to run:"

    echo favourites
    echo "ll01 label list 01 02 03 04"
    echo "ml01 markup list 01 02 03"
    
    echo "bk01 background ... bg01/2 button group ... b01/2/3/4 brighterscript ... chk01/2 checklist ... cp01/2 component ... gd01 grid"
    echo "gp01 grid panel ... hw 01 ... 04  hello world ... kp 01 2 3 key press  ml01 02 03 markup list 01 02 03 ... oh01 overhang ... "
    echo "pg01 02 03 poster grid 01 02 03   rb01 rooibos ... rect01/2 rectangle ... rd01 roku deploy ... rl01/2/3 row list ... vd01 .. 08 video"
    echo "vb01 variables ...  vd01 .. 08 ... video 01 .. 08 ... 05 is the only one which works, others the feed is outdated"

    echo fix
    echo "gd01       ... grid 01 (fix)"

    echo " "
}

obtain_last_project_code_used () {
    echo " "
    last_code_used=$(cat ./last_code_used)
    echo last run this code was used $last_code_used
    script_code=$last_code_used
}

    

while :
  do
    echo " "
    echo " "
    echo "========================="
    echo "        Roku Projects"
    echo "========================="

    display_list_of_projects

    cd /Users/phil/github/RokuCommunity/roku/.scripts

    obtain_last_project_code_used   

    valid_code=true
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
        
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="hello-world"
        project="hello-world-03"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist





    elif [ "$script_code" == "hw04" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="hello-world"
        project="hello-world-04"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist





    elif [ "$script_code" == "kp01" ]; then
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="key-press"
        project="key-press-01"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R /Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project /Users/phil/github/RokuCommunity/roku/dist
        echo "hit f5 to start project or command-shift-f5 to restart"



    elif [ "$script_code" == "kp02" ]; then

    
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="key-press"
        project="key-press-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist




    elif [ "$script_code" == "ll01" ]; then



        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="label-list"
        project="label-list-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "ll02" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="label-list"
        project="label-list-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "ll03" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="label-list"
        project="label-list-03"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist       

    elif [ "$script_code" == "ll04" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="label-list"
        project="label-list-04"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    

    elif [ "$script_code" == "ml01" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="markup-list"
        project="markup-list-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist



    elif [ "$script_code" == "oh01" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="overhang"
        project="overhang-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist






    elif [ "$script_code" == "pg01" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="poster-grid"
        project="poster-grid-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist




    elif [ "$script_code" == "pg02" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="poster-grid"
        project="poster-grid-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "pg03" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="poster-grid"
        project="poster-grid-03"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist



    elif [ "$script_code" == "rl01" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="row-list"
        project="row-list-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    elif [ "$script_code" == "rl02" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="row-list"
        project="row-list-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist
        

    elif [ "$script_code" == "rl03" ]; then
        
        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="row-list"
        project="row-list-03"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "vb01" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="variables"
        project="variables-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    
    elif [ "$script_code" == "vd01" ]; then

        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-01"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "vd02" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-02"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "vd03" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-03"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist


    elif [ "$script_code" == "vd04" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-04"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    
    elif [ "$script_code" == "vd05" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-05"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    elif [ "$script_code" == "vd06" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-06"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    elif [ "$script_code" == "vd07" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-07"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    elif [ "$script_code" == "vd08" ]; then


        cp ../.launch/brighterscript.json ../.vscode/launch.json
        projectFolder="video"
        project="video-08"
        projectPath="/Users/phil/github/RokuCommunity/roku/projects/$projectFolder/$project"
        cp ../.bsconfig/$project.json ../bsconfig.json
        rm -rf /Users/phil/github/RokuCommunity/roku/dist
        cp -R $projectPath /Users/phil/github/RokuCommunity/roku/dist

    else
        valid_code=false
        echo "Invalid project code"
    fi

    if [ "$valid_code" == true ]; then
        deploy_code_to_roku_device
    fi

    get_project_code_from_user

  done
