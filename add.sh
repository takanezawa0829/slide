git add .
echo "gitにpushするコメントを入力してください。(半角スペースは禁止)"
read COMMENT
git commit -m $COMMENT
git push origin main