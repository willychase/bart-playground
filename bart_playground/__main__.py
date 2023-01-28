from flask import Flask, request, jsonify
from transformers import AutoConfig, pipeline

app = Flask(__name__)
config = AutoConfig.from_pretrained("bart-large-cnn")
summarizer = pipeline("summarization", model="bart-large-cnn", config=config)


@app.route("/summarize", methods=["POST"])
def summarize():
    content = request.json
    return summarizer(content['text'])

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
