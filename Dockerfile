FROM ollama/ollama:latest

# 必要ファイルをコピー
COPY Modelfile.dolphin29 /tmp/Modelfile.dolphin29
COPY setup-models.sh /usr/local/bin/setup-models.sh

# スクリプトに実行権限を付与
RUN chmod +x /usr/local/bin/setup-models.sh

# デフォルトコマンドをセットアップスクリプトに設定
CMD ["/usr/local/bin/setup-models.sh"]

# ポートを公開
EXPOSE 11434