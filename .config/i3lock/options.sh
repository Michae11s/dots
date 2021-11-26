# Start flavours
main_fg=b5c5cc
secondary_fg=3680a2
main_bg=384655
borders=192637
sec_bg=576573
error=976e6e
select=96a5ae
fail_main=5872d2
fail_sec=2a80a8
# End flavours

alias echo="echo -n"

#color and transparency
echo " -c "$main_bg"80"

#ignore empty password
echo " --ignore-empty-password"

#show faile attempts
#OPTIONS=$OPTIONS" --show-failed-attempts"

#sigma, blurs screen using given radius
#OPTIONS=$OPTIONS" -B 5"

#Normal Circle color
echo " --ring-color="$secondary_fg"FF"
echo " --inside-color="$borders"40"

#Verifying Ring Color
echo " --ringver-color="$secondary_fg"FF"
echo " --insidever-color="$borders"FF"

#Wrong Ring Color
echo " --ringwrong-color="$error"FF"
echo " --insidewrong-color="$error"8i"

#key highlight color
echo " --keyhl-color="$select"FF"

#backspace highlight color
echo " --bshl-color="$error"FF"

#text color
echo " --verif-color="$main_fg"FF"
echo " --wrong-color="$main_fg"FF"
echo " --modif-color="$main_fg"FF"
echo " --layout-color="$main_fg"FF"
echo " --time-color="$main_fg"FF"
echo " --date-color="$secondary_fg"FF"
echo " --greeter-color="$main_fg"FF"
