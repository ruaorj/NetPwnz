read -p "Enter the .cap file name: " cap
read -p "Enter the wordlist name: " word

if sudo aircrack-ng "$cap" -w "$word"; then
    echo "Crack attack completed."
else
    echo "Crack attack failed."
fi


read -p "Press any key to exit..." -n1 -s
echo
