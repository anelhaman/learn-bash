#!/bin/bash 
exist_program(){
  if ! [ -x "$(command -v say)" ]; then
    echo 'Error: say is not installed.\r\n Try to install espeak first' >&2
    exit 1
  fi
  break;
}
clear_screen(){
  clear;
}
choose_language(){
  delay=2
  options="EN TH Time"
  select opt in $options; do
     if [ "$opt" = "EN" ]; then
       voice="Samantha"
       read_word;
       break;
     elif [ "$opt" = "TH" ]; then
       voice="Kanya"
       read_word;
       break;
     elif [ "$opt" = "Time" ]; then
       voice="Kanya"
       delay=30
       tellmetime=true;
       break;
     else
      echo "What's wrong with you?"
     fi
  done
}
loopme(){
  clear_screen;
  choose_language;
  clear_screen;
  while true; 
    do 
      if [ ! -z ${tellmetime} ]
      then
        read_time;
      fi

      echo -n "$word |"; 
      say -v ${voice} "$word"; 
      
      sleep ${delay}; 
    done;
}
read_word(){
  read -p "Your word ? : " word;
}
read_time(){
       word="ขณะนี้เวลา..,"`date +%H`" นาฬิกา ,"`date +%M`" นาที"
}
main(){
  clear_screen;
  echo "Welcome to loop me bash.."
  options="Start Quit"
  select opt in $options; do
     if [ "$opt" = "Quit" ]; then
      echo done
      exit
     elif [ "$opt" = "Start" ]; then
      loopme ;
     else
      clear
      echo bad option, try again?
     fi
  done
}
exist_program;
main;
