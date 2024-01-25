i3-msg "workspace $1; exec i3-sensible-terminal;"
sleep 0.1;

i3-msg "split v;"

sleep 0.1;

i3-msg "workspace $1; exec i3-sensible-terminal;"
sleep 0.1;

i3-msg "split h;"

sleep 0.1;

i3-msg "workspace $1; exec i3-sensible-terminal;"
i3-msg "workspace $1; exec i3-sensible-terminal;"

sleep 0.1;

i3-msg "focus up;"

sleep 0.1;
i3-msg "split h;"
sleep 0.1;

i3-msg "workspace $1; exec i3-sensible-terminal;"
