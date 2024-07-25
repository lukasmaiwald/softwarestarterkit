sudo apt update upgrade
apt install rclone
mkdir OneDrive 
rclone config 
rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive & 
echo "rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive &" >> ~/.profile
