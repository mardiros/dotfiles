# the agent is not gcr and is started using systemd
# systemctl start --user gcr-ssh-agent.service
eval $(gnome-keyring-daemon -r) && export GNOME_KEYRING_CONTROL
