# Start flavours
main_fg=cacbcb
secondary_fg=697992
main_bg=3e4949
borders=1b2929
sec_bg=616a6a
error=b16446
select=a7abab
fail_main=5c7e7e
fail_sec=767979
# End flavours

alias echo="echo -n"

#brief options
echo " -k"
echo " --indicator"

#ring options
echo " --ring-width 14.0"
echo " --radius 180"

#blur
echo " -B 9"

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
