function __blueutil_list_paired
    blueutil --paired | sed -E 's/.*address: ([^,]*),.*name: "(.*)", rec.*/\1'\t'\2/'
end
function __blueutil_list_connected
    blueutil --connected | sed -E 's/.*address: ([^,]*),.*name: "(.*)", rec.*/\1'\t'\2/'
end
function __blueutil_list_favorites
    blueutil --favorites | sed -E 's/.*address: ([^,]*),.*name: "(.*)", rec.*/\1'\t'\2/'
end

complete -c blueutil -f
complete -c blueutil -sh -lhelp --description="Show help"
set -l state '1 on 0 off toggle'
complete -c blueutil -sp -lpower -a $state --description="Output/set power state"
complete -c blueutil -sd -ldiscoverable -a $state --description="Output/set discoverable state"
complete -c blueutil -lfavorites --description="List favorite devices"
complete -c blueutil -linquiry --description="Inquiry devices in range"
complete -c blueutil -lrecent --description="list recently used devices"
complete -c blueutil -lconnected --description="List connected devices"
complete -c blueutil -lpaired --description="List paired devices"
complete -c blueutil -lconnect \
    -f --require-parameter -a '(__blueutil_list_paired)' \
    --description="Connect to a device"
complete -c blueutil -ldisconnect \
    -f --require-parameter -a '(__blueutil_list_connected)' \
    --description="Disconnect from a device"
complete -c blueutil -lpair \
    -f --require-parameter \
    --description="Pair with device"
complete -c blueutil -lunpair \
    -f --require-parameter -a '(__blueutil_list_paired)' \
    --description="Unpair with a device"
complete -c blueutil -ladd-favorite \
    -f --require-parameter -a '(__blueutil_list_paired)' \
    --description="Add a device to favorites"
complete -c blueutil -lremove-favorite \
    -f --require-parameter -a '(__blueutil_list_favorites)' \
    --description="Remove a device from favorites"
complete -c blueutil -linfo \
    -f --require-parameter -a '(__blueutil_list_paired)' \
    --description="Show device information"
complete -c blueutil -lis-connected \
    -f --require-parameter -a '(__blueutil_list_paired)' \
    --description="Show connected state of a device"
