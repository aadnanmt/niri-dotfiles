# optional: auto-start niri on TTY1 login (no display manager / simple)
# Uncomment if youu use TTY-only
# if status is-login
#     if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
#         reset && exec niri
#     end
# end
