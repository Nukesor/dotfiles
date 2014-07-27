function 666
	for val in (find -type f -perm 777)
        chmod 666 $val
    end
end
