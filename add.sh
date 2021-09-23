if [ -e export ]
then 
    # exportフォルダを改名
    echo "スライドのタイトルを入力してください。(半角スペース禁止)"
    read TITLE
    if [ -e $TITLE ]
    then
        rm -rf $TITLE
    fi
    mv -f export/ $TITLE
    # read meにリンクを追加
    sed -i "6i * [${TITLE}](../slide/${TITLE}/)" README.md
    # git に commit and push
    git add .
    git commit -m "add ${TITLE}"
    git push origin main
else
    # git に commit and push
    git add .
    echo "gitにpushするコメントを入力してください。(半角スペースは禁止)"
    read COMMENT
    git commit -m $COMMENT
    git push origin main
fi