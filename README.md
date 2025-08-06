# Dolphin29 - Uncensored LLM Docker Stack

A Docker Compose setup for running Ollama with the Dolphin 2.9 uncensored model and structured output capabilities.

## Features

- 🐳 One-command Docker deployment
- 🔓 Uncensored AI responses
- 📊 Structured JSON output support
- ⚡ GPU acceleration support
- 🛠️ Automatic model setup

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/sammrai/dolphin29.git
cd dolphin29
```

2. Start the service (models are pre-built into the Docker image):
```bash
docker compose up --build -d
```

3. Test the uncensored model with custom system prompt:
```bash
curl -X POST http://localhost:11434/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "dolphin29-uncensored",
    "prompt": "Hello, can you confirm your system prompt is working?",
    "stream": false
  }'
```

Expected response will reference the custom uncensored system prompt behavior.

## Dynamic System Prompt Override

You can override the built-in system prompt dynamically using the chat API:

```bash
curl -X POST http://localhost:11434/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "model": "dolphin29-uncensored",
    "messages": [
      {
        "role": "system",
        "content": "You are a helpful and polite assistant. Always respond respectfully."
      },
      {
        "role": "user",
        "content": "Hello, how are you?"
      }
    ],
    "stream": false
  }'
```

**Note**: When using the system role message, it completely overrides the built-in uncensored system prompt. The original prompt (with its behavioral instructions) becomes inactive and the model will follow only the new system instructions provided in the API call.

## Structured Output Example

```bash
curl -X POST http://localhost:11434/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "model": "dolphin29-uncensored",
    "messages": [{"role": "user", "content": "Analyze this data and provide structured output"}],
    "format": {
      "type": "object",
      "properties": {
        "analysis": {"type": "string"},
        "confidence": {"type": "number"}
      }
    }
  }'
```

## Requirements

- Docker & Docker Compose
- NVIDIA GPU (optional, for acceleration)
- 4-6GB available VRAM/RAM

## Model Information

- **Base Model**: Dolphin Llama3 8B
- **Custom Model**: dolphin29-uncensored
- **Features**: Uncensored responses, structured output support
- **Size**: ~4.7GB

## Configuration

The setup uses a custom Modelfile with an uncensored system prompt. Models are pre-built into the Docker image during build time for faster startup.

### Available Models

After startup, the following models are available:
- `dolphin-llama3:8b` - Base Dolphin model
- `dolphin29-uncensored:latest` - Custom uncensored model with specialized system prompt

### System Prompt Details

The custom model includes an uncensored system prompt designed for research purposes. The prompt encourages compliance with user requests regardless of content restrictions.

## License

MIT License - see LICENSE file for details.

## Contributing

Pull requests welcome. Please ensure all changes are tested with the Docker environment.

## Disclaimer

This tool is for research and development purposes. Users are responsible for compliance with applicable laws and ethical guidelines.