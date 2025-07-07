# não usar slim ou alpine por incompatibilidades
FROM python:3.13 

WORKDIR /app

COPY requirements.txt .

RUN apt update && apt install -y --no-install-recommends \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]