python3 - << EOF
import os
import subprocess
import sys

working_dir = os.getcwd()

TRASH_DIR = os.path.join(os.path.expanduser("~"), ".local", "share", "Trash", "files")

if not os.path.exists(TRASH_DIR):
    print("The trash directory is not valid.")
    sys.exit(0)

def move_to_trash(file_args):
    for f in file_args.split(" "):
        if not os.path.exists(f):
            print(f"'{f}' is not a valid directory or file.")
            continue
        subprocess.run(["mv", f"{working_dir}/{f}", TRASH_DIR])

if __name__ == "__main__":
    file_args = "$@"
    if file_args == "":
        print("Please provide some arguments.")
        sys.exit(0)
    move_to_trash(file_args)
EOF
