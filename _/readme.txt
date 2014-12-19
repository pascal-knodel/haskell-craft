Workaround: ghci -i flag and charset issues

create links (hard-links) and load in ghci:

--- .ghci -------------------------
:!<createLinks>
:!ghci -ignore-dot-ghci <loadLinks>
-----------------------------------