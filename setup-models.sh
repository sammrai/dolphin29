#!/bin/bash

# 初回起動かどうかをチェック
if [ ! -f /root/.ollama/models/manifests/registry.ollama.ai/library/dolphin-llama3/8b ]; then
    echo "First run detected. Setting up models..."
    
    # Ollamaサーバーをバックグラウンドで起動
    ollama serve &
    OLLAMA_PID=$!
    
    # サーバーが起動するまで待機
    echo "Waiting for Ollama server to start..."
    sleep 15
    
    # ベースモデルをプル
    echo "Pulling base model: dolphin-llama3:8b"
    ollama pull dolphin-llama3:8b
    
    # カスタムモデルを作成
    echo "Creating custom model: dolphin29-uncensored"
    ollama create dolphin29-uncensored -f /tmp/Modelfile.dolphin29
    
    # バックグラウンドプロセスを終了
    kill $OLLAMA_PID
    wait $OLLAMA_PID 2>/dev/null
    
    echo "Model setup completed"
fi

# 通常のOllamaサーバーを起動
echo "Starting Ollama server..."
exec ollama serve