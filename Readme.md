# Bash Backup Script

This Bash script automates the process of creating backups for specified files or directories. It prompts the user to set the backup destination and select the files/directories to be backed up.

## Usage

1. Run the script:

   ```bash
   ./backup_script.sh
   ```

2. Enter the desired backup destination directory when prompted. Press Enter to use the default directory (`/backups`) or specify a custom path.

3. Enter the paths of files or directories you want to backup when prompted.

4. The script will create a timestamped backup archive (`tar.gz`) and a log file in the specified backup destination directory.

## Script Details

### Function: `backup_files`

The script defines a function called `backup_files` which performs the following steps:

1. **Backup Destination Directory:**

   - Prompts the user to enter the backup destination directory path.
   - If left empty, it defaults to `/backups`.
   - If the directory does not exist, it asks the user if they want to create it.

2. **Files/Directories to Backup:**

   - Prompts the user to enter paths of files/directories to be backed up.
   - Checks if each specified path is a valid file or directory.
   - If any invalid paths are encountered, the script logs errors.

3. **Backup Process:**

   - Creates a timestamped backup archive using `tar`.
   - Logs the backup process and any encountered errors to a log file.

4. **Output:**
   - Displays a success message if the backup process completes without errors.
   - If errors are encountered, it informs the user of successful backups and displays the paths that were not found.

## Considerations

- Run the script with appropriate permissions, e.g., using `sudo`.
- Test the script in a safe environment before using it for critical data.
- Customize and enhance the script based on specific requirements.
