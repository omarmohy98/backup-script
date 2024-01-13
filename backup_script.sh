#! /bin/bash

backup_files() {

    # get Destination backup directory by default its "/backups" directory
    while ((1))
    do
        read -p "Please, Enter a Backup Detination Directory Path(/backups): " des_dir
        if [ -z ${des_dir} ]
        then
            des_dir="/backups"
            break
        else
            if [ -d ${des_dir} ]
            then
                break
            else
                read -p "Directory not found want to create it (Y/N)?" check
                if [ $check = "Y" -o $check = "y" ]
                then
                    sudo mkdir ${des_dir}
                    break
                elif [ $check = "N" -o $check = "n" ]
                then
                    break
                else
                    echo "Invalid choise!"
                fi
            fi
        fi
    done

    # get wanted files/directory user want to backup
    while ((1))
    do
        read -p "Please, Enter Files/Directories paths want to backup them: " backups_files
        if [ -z "${backups_files}" ]
        then
            echo "Can not be Empty!"
        else
            pro=0
            error=""
            done_dir=""
            for ele in ${backups_files}
            do
                if [ -d ${ele} -o -f ${ele} ]
                then
                    done_dir="$done_dir $ele"
                else
                    error="$error $ele"
                fi
                if [ -n "$error" ]
                then
                    pro=1
                fi
            done
            break
        fi
    done

    # backup files Process
    echo "Prossesing..."
    sudo tar cvfz ${des_dir}/`date +%s`_`date +%F`_backup.tar.gz ${backups_files} &>> ${des_dir}/`date +%s`_`date +%F`_backup_log
    if [ $pro -eq 0 ]
    then
        echo "Backup Prosses Done Successfully!"
    else
        echo "$done_dir backup Successfully"
        echo "${error} Not Found!"
        echo "Backup Prosses has some issues, Please Check log file at ${des_dir}/`date +%s`_`date +%F`_backup_log"
    fi
}

backup_files