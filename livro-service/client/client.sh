#!/bin/bash

# Com as configurações atuais, o client faz uma requisição por segundo,
# Para aumentar o número de requisições por segundo, descomente as linhas 
# 14 e 32 e comente a linha 33, você terá que remover tanto a imagem como
# o container client-forum-api e subir a stack novamente para o rebuild.

HOST='proxy-forum-api'

while true
    do
	ENDP=`expr $RANDOM % 10 + 1`
	NUMB=`expr $RANDOM % 100 + 1`
	#TEMP=`expr 1 + $(awk -v seed="$RANDOM" 'BEGIN { srand(seed); printf("%.4f\n", rand()) }')`
        
	if [ $NUMB -le 55 ]; then
	    curl --silent --output /dev/null http://${HOST}/v1/api/livros
        elif [ $NUMB -ge 56 ] && [ $NUMB -le 85 ] ; then
	    curl --silent --output /dev/null http://${HOST}/v1/api/livros/$ENDP
        elif [ $NUMB -ge 86 ] && [ $NUMB -le 95 ] ; then
      curl --silent --output /dev/null http://${HOST}/v1/api/autores
        elif [ $NUMB -ge 96 ] && [ $NUMB -le 98 ] ; then
	    curl --silent --output /dev/null http://${HOST}/v1/api/autores/$ENDP
	else
	    curl --silent --output /dev/null http://${HOST}/v1/api/autores/0
        fi

	#sleep $TEMP
	sleep 0.75
done

