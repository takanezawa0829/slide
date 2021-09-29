if [ -e export ]
then 
    echo "スライドのタイトルを入力してください。(半角スペース禁止)"
    read TITLE
    if [ -e $TITLE ]
    then
        rm -rf $TITLE
    else
        # read meにリンクを追加
        sed -i "6i * [${TITLE}](https://takanezawa0829.github.io/slide/${TITLE}/)" README.md
    fi
    # exportフォルダを改名
    mv -f export/ $TITLE
    # git に commit and push
    git add .
    git commit -m "${TITLE}"
    git push origin main
else
    # git に commit and push
    git add .
    echo "gitにpushするコメントを入力してください。(半角スペースは禁止)"
    read COMMENT
    git commit -m $COMMENT
    git push origin main
fi