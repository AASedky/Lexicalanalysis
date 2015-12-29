# Lexicalanalysis
 #!/bin/bash
#Amr Ashraf 5312161
printf "Enter file name\t"
read fileName
 
function readFile()
{
while IFS='' read -r line || [[ -n "$line" ]];
do 
      ##numOfwords="$( echo $line  | wc -w )"
      ##  echo $numOfwords
       echo $line >>List
      splitWords
done < $fileName
}
 function splitWords()
{
     
    IFS='' read -a myarray <<< "$line" ##splite line to words
   i=0
###############################################
      for index  in ${myarray[@]}
do
       flag=0 ## in case ID
    printf "\n$i-%s\n " $index 
         index=${index,,} ##convert to lowercase
        checkIsnum 
        checkIskey
        checkIsSympol
         if  [[ $flag = 0 ]];then
           printf "id\t$index\n">>List
             fi  
        let i+=1
      flag=0
done
     i=0
    echo "-----------------------------------------"
    echo "-------------------------------------------" >>List
}
function checkIsnum()
{ re='^[0-9]+$'
if   [[ $index =~ $re ]] ; then
   printf  "num \t $index\n" >>List 
    let flag+=1
   
fi 
}
function checkIskey()
{
     case $index in
    'if' ) printf "key\tif symbol\n">>List
         let flag+=1
    ;;
    'do' ) printf "key\tdo symbol\n">>List
          let flag+=1
      ;;
    'then' ) printf "key\tthen symbol\n">>List
             let flag+=1
     ;;
     'else' ) printf "key\telse symbol\n">>List
         let flag+=1
     ;;
     'while' ) printf "key\twhile symbol\n">>List
          let flag+=1
       ;;
     'for'  ) printf "key\tfor symbol\n">>List
         let flag+=1
esac
}
 function checkIsSympol()
{
          case $index in
        "'*'"  ) printf "sympol\tmultiply operator\n">>List
                let flag+=1
       ;;
      '.' ) printf "sympol\tdot\n">>List
           let flag+=1
    ;;
      ',' ) printf "sympol\tcomma\n">>List
         let flag+=1
    ;;
    ';' ) printf "sympol\tsemicolon\n">>List
        let flag+=1
    ;;
     '{' ) printf "sympol\tleft brace\n">>List
              let flag+=1
    ;;
       '}' ) printf "sympol\tright brace\n">>List
            let flag+=1
    ;;
      '(' ) printf "sympol\tleft parenthesis\n">>List
             let flag+=1
    ;;
      ')' ) printf "sympol\tright parenthesis\n">>List
            let flag+=1
    ;; 
      '+' ) printf "sympol\tplus operator\n">>List
          let flag+=1
    ;; 
      '-' ) printf "sympol\tminus opeartor\n">>List
           let flag+=1
    ;; 
      '/' ) printf "sympol\tdivide opeartor\n">>List
           let flag+=1
    ;;
      '=' ) printf "sympol\tequal opeartor\n">>List
         let flag+=1
    ;;  
          '>' ) printf "sympol\tgreater than operatorr\n">>List
               let flag+=1
    ;; 
         '<' ) printf "sympol\tless than operator\n">>List
                let flag+=1
    ;; 
           '>=' ) printf "sympol\tgreater than or equal operator\n">>List
                let flag+=1
    ;; 
          '<=' ) printf "sympol\tless than or equal operator\n">>List
          let flag+=1
    ;; 
           '<>' ) printf "sympol\tnot equal operator\n">>List
           let flag+=1
    ;; 
        ':' ) printf "sympol\tcolon\n">>List
            let flag+=1
    ;; 
           ':=' ) printf "sympol\tassignment operator\n">>List
           let flag+=1
    ;; 
esac
}
 rm List
  readFile
  #Main ^
       #!
