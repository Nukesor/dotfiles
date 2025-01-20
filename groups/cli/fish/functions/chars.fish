# Print out the number of total chars in the specified files/directories
function chars
    set --function total 0

    for arg in $argv
        set --function result (find $arg -type f -exec wc -m {} + | awk '{total += $1} END {print total}')
        echo "$arg: $result chars"
        set --function total (math "$total + $result")
    end

    echo ""
    echo "Total: $total chars"
end
