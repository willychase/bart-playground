FROM alpine/git as git
RUN git lfs install
RUN git clone --depth 1 https://huggingface.co/facebook/bart-large-cnn /tmp/bart-large-cnn


FROM python:3.8-slim
ENV TRANSFORMERS_OFFLINE=1

COPY --from=git /tmp/bart-large-cnn bart-large-cnn
COPY bart_playground bart_playground
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "-m", "bart_playground"]