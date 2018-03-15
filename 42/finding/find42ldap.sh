ldapsearch -QLLL uid=$1 | sed '/jpegPhoto/q' | grep -v jpegPhoto | grep -v objectClass
