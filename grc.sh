if [[ "$TERM" != dumb ]] && command -v grc &> /dev/null ; then

  # Supported commands
  cmds=(
    cc \
    configure \
    cvs \
    df \
    diff \
    dig \
    gcc \
    gmake \
    ifconfig \
    last \
    ldap \
    ls \
    make \
    mount \
    mtr \
    netstat \
    ping \
    ping6 \
    ps \
    traceroute \
    traceroute6 \
    wdiff \
    whois \
    iwconfig \
  );

  # Set alias for available commands.
  for cmd in "${cmds[@]}"; do
    if command -v $cmd &> /dev/null ; then
      unalias $cmd 2>/dev/null
      alias $cmd="grc --colour=auto $(command -v $cmd)"
    fi
  done

  # Clean up variables
  unset cmds cmd
fi
