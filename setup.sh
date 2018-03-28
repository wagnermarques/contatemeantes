#!/bin/bash

#vc precisa rodar esse script usando o comando source e nao simplesmente ./setup.sh
#dessa maneira o comando export deixa a variavel PATH alterado no sua sessao do terminal

export ANDROID_HOME=/run/media/wagner/5e4f4c4f-3beb-485d-ad8f-7f090ad7b5db/wagnerdocri@gmail.com3/PROGSATIVOS/androidSdk


#########consertando o erro: Failed to find 'android' command in your 'PATH'.
#faz o download de um sdk que tem o comando e coloca a pasta tools dele no nosso sdk atual
#wget --no-clobber skip downloads that would download to existing files.
#unzip -o descompacta fazendo sobrescrevendo caso ja tiver sido descompactado antes (acontece qdo roda o script duas vezes)

ANDROID_SDK_r25_URL=https://dl.google.com/android/repository/tools_r25.2.3-linux.zip

wget --no-clobber --output-document $HOME/Downloads/sdk-tools-linux-3859397.zip $ANDROID_SDK_r25_URL

unzip -o $HOME/Downloads/sdk-tools-linux-3859397.zip -d $HOME/Downloads/

if [ ! -d $ANDROID_HOME/tools_original ]; then
    #estou perguntando se o diretorio existe, porque no caso de vc ter rodado esse
    #script mais de uma vez o tools ja foi movido pra tools_original antes
    #e nesse caso a gente nao quer tocar nesse tools_original pra que ele nao deixe de ser original
    #certo? 
    mv -f $ANDROID_HOME/tools $ANDROID_HOME/tools_original
fi

#neste ponto do script a gente sabe que o nosso tools original esta guardado
yes | cp -rf $HOME/Downloads/tools $ANDROID_HOME

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools




