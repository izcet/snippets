YOUID=$(whoami)
echo $YOUID
NAME=$(ldapsearch -QLLL uid=$YOUID | grep givenName | sed s/givenName\:\ //)
echo $NAME
say "stop that $NAME. It won't work" -v zarvox