import subprocess

# https://stackoverflow.com/questions/3277503/how-to-read-a-file-line-by-line-into-a-list
with open("requirements.vcpkg.txt") as f:
    libs = f.readlines()
libs = [x.strip() for x in libs]

subprocess.check_call(["vcpkg", "install", "--triplet", "x64-windows-static"] + libs)
